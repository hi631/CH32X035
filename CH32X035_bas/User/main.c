//////////////////
// pd sink      //
// 2024-6 myoko //
//////////////////
#include "debug.h"
#include "usbpd_def.h"
#include "usbpd_sink.h"

void basic();
void monitor();
void Test_Flash();

void GPIO_Toggle_INIT(void)
{
    GPIO_InitTypeDef GPIO_InitStructure = {0};
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB, ENABLE);
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_12;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOB, &GPIO_InitStructure);
}

void Delay_LED(int dlyt)
{
    GPIO_WriteBit(GPIOB, GPIO_Pin_12, Bit_SET);
    Delay_Ms(dlyt/2);
    GPIO_WriteBit(GPIOB, GPIO_Pin_12, Bit_RESET);
    Delay_Ms(dlyt/2);
}

void test_LED(int tt){
    for(int i=0; i<tt; i++){
        Delay_LED(i*i*10);
    }
}

void test_IO(){
    while(1)
    {
        int ch;
        while(1){   // RX
            if(USART_GetFlagStatus(USART2, USART_FLAG_RXNE) == ENABLE){
                ch =USART_ReceiveData(USART2); break;
            }
        }
        while(1){   // TX
            if(USART_GetFlagStatus(USART2, USART_FLAG_TXE) == ENABLE){
                USART_SendData(USART2, ch); break;
            }
        }
    }
}

void test_PD(){
    while(1)
    {
         if(!usbpd_sink_get_ready()){printf( "PD No Connect\r\n" ); Delay_LED(100);}
         if(usbpd_sink_get_ready()){usbpd_sink_set_request_fixed_voltage(REQUEST_9v) ;Delay_LED(2000);}
         if(usbpd_sink_get_ready()){usbpd_sink_set_request_fixed_voltage(REQUEST_12v);Delay_LED(2000);}
         if(usbpd_sink_get_ready()){usbpd_sink_set_request_fixed_voltage(REQUEST_15v);Delay_LED(2000);}
         if(usbpd_sink_get_ready()){usbpd_sink_set_request_fixed_voltage(REQUEST_20v);Delay_LED(2000);}
         if(usbpd_sink_get_ready()){usbpd_sink_set_request_fixed_voltage(REQUEST_5v) ;Delay_LED(2000);}
    }
}
void test_PDV(uint16_t set_volt){
    int req_volt;
    switch(set_volt){
      case  5: req_volt = REQUEST_5v; break;
      case  9: req_volt = REQUEST_9v; break;
      case 12: req_volt = REQUEST_12v; break;
      case 15: req_volt = REQUEST_15v; break;
      case 20: req_volt = REQUEST_20v; break;
      default: req_volt = 0;
    }
    if(req_volt!=0){
        for(int i=0; i<10; i++){
            if(usbpd_sink_get_ready()) { usbpd_sink_set_request_fixed_voltage(req_volt) ; }
            else Delay_LED(200);
        }
    } else printf("req.volt error\r\n");
}

int main(void)
{
    NVIC_PriorityGroupConfig(NVIC_PriorityGroup_1);
    SystemCoreClockUpdate();
    Delay_Init();
    GPIO_Toggle_INIT();
    USART_Printf_Init(115200);    printf("start\r\n");
    usbpd_sink_init();

    basic();
    //monitor();

}

































