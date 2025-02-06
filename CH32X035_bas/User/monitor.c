#include "debug.h"
#include <ctype.h>

void Option_Byte_CFG(void)
{
    FLASH_Status status = FLASH_COMPLETE;
    status = FLASH_UserOptionByteConfig(OB_IWDG_SW, OB_STOP_NoRST, OB_STDBY_NoRST, OB_RST_EN_DT12ms);
    if(status == FLASH_RDP) printf("MCU in read protected state, user option byte cannot be configured. Need to use WCHISPTool or WCH-LinkUtility for configuration ");
    else{
        printf("0x1FFFF800-%08x\r\n", *(u32*)0x1FFFF800);
        printf("0x1FFFF804-%08x\r\n", *(u32*)0x1FFFF804);
        printf("0x1FFFF808-%08x\r\n", *(u32*)0x1FFFF808);
        printf("0x1FFFF80C-%08x\r\n", *(u32*)0x1FFFF80C);
    }
}
//
void Test_Flash(void)
{
    uint32_t Fadr  = 0x08008000;
    uint32_t Fsize = (256>>2);
    uint32_t Dsize = 8;
    uint32_t buf[256>>2];
    uint32_t i;
    uint8_t  Verify_Flag = 0;
    FLASH_Status s;

    printf("\r\nRead flash    adr:%08x - \r\n", Fadr);
    for(i=0; i<Dsize; i++){ printf("%08x ", *(u32*)(Fadr +4*i)); }
    s = FLASH_ROM_ERASE(Fadr, Fsize*4);
    if(s != FLASH_COMPLETE) { printf("FLASH_ALIGN/RANGE_ERROR\r\n"); return; }
    printf("\r\nErase flash   adr:%08x - \r\n", Fadr);
    for(i=0; i<Dsize; i++){ printf("%08x ", *(u32*)(Fadr +4*i)); }

    for(i = 0; i < Fsize; i++){ buf[i] = i; }
    s = FLASH_ROM_WRITE(Fadr,  buf, Fsize*4);
    if(s != FLASH_COMPLETE) { printf("FLASH_RANGE/ALIGN/OP_RANGE_ERROR\r\n"); return; }
    printf("\r\nWrite flash   adr:%08x - \r\n", Fadr);
    for(i=0; i<Dsize; i++){ printf("%08x ",  *(u32*)(Fadr +4*i)); }

    printf("\n\rVerify flash  adr:%08x - \r\n", Fadr);
    for(i=0; i<Dsize; i++){ printf("%08x ", *(u32*)(Fadr +4*i)); }
    for(i = 0; i < Fsize; i++){
        if(buf[i] == *(u32 *)(Fadr + 4 * i)){ Verify_Flag = 0; }
        else                                { Verify_Flag = 1;   break; }
    }
    if(Verify_Flag) printf("\r\n%d Byte Verify Fail\r\n", (Fsize*4));
    else            printf("\r\n%d Byte Verify Success\r\n", (Fsize*4));
}

//void move_flash(uint32_t b_adr[], uint32_t f_adr, uint16_t w_len){
uint8_t move_flash(uint32_t dbuf[], uint32_t f_adr, uint16_t w_len){
    uint8_t i;
    uint8_t Verify_Flag = 0;
    FLASH_Status s;

    //for(int i = 0; i < w_len/4; i++) dbuf[i] = *(u32 *)(b_adr + 4 * i);
    s = FLASH_ROM_ERASE(f_adr, 256);
    if(s != FLASH_COMPLETE) { printf("FLASH_ALIGN/RANGE_ERROR\r\n"); return 1; }

    s = FLASH_ROM_WRITE(f_adr,  (uint32_t *)dbuf, w_len);
    if(s != FLASH_COMPLETE) { printf("FLASH_RANGE/ALIGN/OP_RANGE_ERROR\r\n"); return 1; }
    for(i = 0; i < w_len/4; i++){
        if(dbuf[i] == *(u32 *)(f_adr + 4 * i))
            { Verify_Flag = 0; }
        else {
            uint32_t rd = *(u32 *)(f_adr + 4 * i);
            printf("%08X: %08X %08X\r\n", (u32 *)(f_adr + 4 * i), dbuf[i], rd);
            Verify_Flag = 1;   break;
        }
    }

    if(Verify_Flag) printf("\r\n[NG]\r\n"); else printf(".");
    fflush(stdout);
    return Verify_Flag;
}

uint8_t save_flash(uint32_t src, uint32_t dst, uint16_t msize){
    uint16_t npage = (msize+255)>>8;
    uint32_t FPSIZE = 256;
    uint32_t dbuf[256/4];
    int rc = 0;
    for(int pl=0; pl<npage; pl++){
        for(int i = 0; i < FPSIZE/4; i++) dbuf[i] = *(u32 *)(src + 4 * i);
        rc = rc + move_flash( dbuf, dst, FPSIZE);
        src = src + FPSIZE; dst = dst + FPSIZE;
    }
    return rc;
}

uint8_t save_bas(uint16_t fpno, uint32_t lbeg, uint32_t lend){
    uint32_t src, dst, lsize;
    uint16_t npage;
    uint32_t FPSIZE = 256;
    uint32_t dbuf[256/4];
    uint8_t  inif = 0, rc = 0;

    lsize = lend - lbeg;
    printf("%08X %08x -> %08x\r\n", lsize, lbeg, lend);
    npage = (lsize+4+255)>>8;
    src = lbeg - 4;
    dst = 0x08008000 + fpno*1024;
    for(int pl=0; pl<npage; pl++){
        for(int i = 0; i < FPSIZE/4; i++)
            if(inif==0) { dbuf[i] = lsize; inif = 1;}
            else        dbuf[i] = *(u32 *)(src + 4 * i);
        rc = rc + move_flash( dbuf, dst, FPSIZE);
        src = src + FPSIZE; dst = dst + FPSIZE;
    }
    if(rc==0) return 0;
    else      return 23; // Error
}

uint8_t load_bas(uint8_t fpno, uint32_t lbeg){
    uint32_t src, dst, lsize, tmp;
    src = 0x08008000 + fpno*1024;
    dst = lbeg;
    lsize = *(u32 *)src; src = src + 4;
    printf("%08X %08x <- %08x\r\n", lsize, lbeg, src);
    for(int i=0; i<lsize/4; i++) { tmp = *(u32 *)(src + 4 * i); *(u32 *)(dst + 4 * i) = tmp;}
    return 0; // 23;
}

//----------------------------------
//--// Monitor
//----------------------------------
#define F_BASE 0x08000000   // CODEFLASH 62KB
#define S_BASE 0x1fff0000   // SYSFLASH  3KB+256B
#define M_BASE 0x20000000   // SRAM      20KB
#define FPSIZE 256          // FLASH PAGE SIZE
#define CMDBFL 64

#define UINT unsigned int
#define DINT uint16_t // default system
char cmdbf[CMDBFL];
uint32_t parmbf[4];

void m_putch(char ch){
    while(1){
      if(USART_GetFlagStatus(USART2, USART_FLAG_TXE) == ENABLE){
          USART_SendData(USART2, ch); break;
      }
    }
}
char m_getch(){
    char ch = 0;
    while(1){
        if(USART_GetFlagStatus(USART2, USART_FLAG_RXNE) == ENABLE){
            ch = USART_ReceiveData(USART2); break;
        }
    }
    return ch;
}

void m_puts(char *s) {while(*s) m_putch(*s++);}
void m_gets(char buf[]){
    short bp=0; buf[0] = 0;
    while(1){
        char ch = m_getch(); m_putch(ch);
        if(ch>='a' && ch<='z') ch = ch - 0x20;
        if(ch==13) ch = 0;
        buf[bp++] = ch;
        if(ch==0 || bp>=CMDBFL-1) break;
    }
}

uint32_t conv_hex(char cbf[], uint8_t *cp){
    char ch; uint8_t hd;
    uint32_t ans = 0;
    while(!isxdigit(cbf[*cp])) (*cp)++;
    while(1){
        ch = cbf[*cp];
        if(ch==0) break;
        if(isxdigit(ch)){
            if(ch<='9') hd = ch - 0x30;
            else        hd = ch - 0x37;
            ans = (ans<<4) + hd;
        } else break;
        (*cp)++;
    }
    return ans;
}
uint8_t get_parm(char cbf[], uint32_t pbf[]){
    uint8_t cp = 0; // cbf pointer
    uint8_t pp = 0; // pbf pointer
    uint32_t ans;
    while(1){
        if(cbf[cp]==0) break;
        ans = conv_hex(cbf, &cp);
        pbf[pp++] = ans;
    }
    return pp;
}

void monitor(void)
{
    uint32_t bs_adr, m_adr, d_adr;
    uint16_t nparm, m_len;
    uint8_t  bs_byte;
    uint8_t *bmp;
    uint8_t bhd;
    uint8_t bcd;

    //uint8_t dbuf[FPSIZE];

    printf("\r\nmon X035\r\n");
    //Flash_Test_Fast();
    //Option_Byte_CFG();

    bs_adr = 0; bs_byte = 1; m_adr = bs_adr;
    while(1){
        printf("\r\n>"); fflush(stdout); m_gets(cmdbf);
        nparm = get_parm(&cmdbf[1], parmbf);
        if(cmdbf[0]=='Q') break;
        switch(cmdbf[0]){
          case 'B': // B(set_baseadr)(Byte_len)
              if(nparm>=1) bs_adr  = parmbf[0];
              if(nparm>=2) bs_byte = parmbf[1];
              break;
          case 'D' :    // dump
              if(nparm>0)  m_adr = bs_adr + parmbf[0];
              if(nparm==2) m_len = parmbf[1];
              else         m_len = 128;
              for(uint16_t i=0; i<m_len; i++){
                  d_adr = m_adr + i;
                  if((i & 0x0f)==0) printf("\r\n%08X: ", (uint32_t)d_adr);
                      bmp = (uint8_t *)d_adr;
                      uint8_t dt = *bmp; printf("%02X ", dt);
              }
              printf("\r\n");
              m_adr = m_adr + m_len;
              break;
          case 'F':     // Fill
              if(nparm==3){
                  for(uint16_t i=0; i<parmbf[1]; i++){
                      bmp = (uint8_t *)(bs_adr + parmbf[0] + i);
                      *bmp = parmbf[2];
                  }
              }
              break;
          case 'M':     // Memory Check
              m_adr = bs_adr + parmbf[0];
              while(1){
                  bmp = (uint8_t *)m_adr;  bhd = *bmp;
                  printf("%08X:%02X ", m_adr, bhd); fflush(stdout); m_gets(cmdbf);
                  if(cmdbf[0]=='.') break;
                  if(cmdbf[0]!=13){
                      uint8_t cp = 0;
                      bhd = conv_hex(cmdbf, &cp);
                      *bmp = bhd; bcd = *bmp;
                      if(bcd==bhd) m_adr =m_adr + 1;
                  } else m_adr = m_adr + bs_byte;
              }
              break;
          case 'T':     // T<SRC> <DST> <size> // move program(FLASH Write)
              if(nparm==0){ parmbf[0] = 0x08000000; parmbf[1] = 0x08008000; parmbf[2] = 1024;}
              printf("Move_Flash %X -> %X %XKB\r\n", parmbf[0], parmbf[1], parmbf[2]/1024);
              int rc = save_flash( parmbf[0], parmbf[1], parmbf[2]);
              if(rc==0) printf("\r\nSave Verify Success\r\n");
              break;
        }
    }
}

