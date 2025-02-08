#include "debug.h"

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

#define SAVETOP 0x08008000
uint8_t save_bas(uint16_t fpno, uint32_t lbeg, uint32_t lend, int16_t opt){
    uint32_t src, dst, lsize;
    uint16_t npage;
    uint32_t FPSIZE = 256;
    uint32_t dbuf[256/4];
    uint8_t  inif = 0, rc = 0;

    lsize = lend - lbeg; npage = (lsize+4+255)>>8;
    src = lbeg - 4; dst = SAVETOP + fpno*1024;
    if(opt!=1) opt = 0;
    printf("%08x -> %08x  %04X  %d\r\n", lbeg, dst, lsize+4, opt);
    lsize = (lsize << 16) | opt;
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
    uint32_t src, dst, lsize;
    uint16_t opt;
    src = SAVETOP + fpno*1024; dst = lbeg;
    lsize = *(u32 *)src; opt = lsize & 0xffff; lsize = lsize >> 16;
    src = src + 4;
    if(lsize>0 && lsize<8192-4){
        printf("%08x <- %08X  %04X  %d\r\n", lbeg, src-4, lsize+4, opt);
        for(int i=0; i<((lsize+3)/4); i++) *(u32 *)(dst + 4 * i) = *(u32 *)(src + 4 * i);
    }
    return opt;
}

uint8_t auto_bas(){
    uint32_t src = SAVETOP;
    uint16_t opt = *(u32 *)src & 0xffff;
    return opt;
}
/*
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
*/
