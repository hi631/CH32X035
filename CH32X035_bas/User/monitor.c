#include "debug.h"
#include <ctype.h>

int save_flash();
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

