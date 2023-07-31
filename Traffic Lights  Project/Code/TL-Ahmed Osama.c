int counter = 0;
int color = 0;
int number[] ={0x00,0x01,0x02,0x03,0x04,0x05,0x06,0x07,0x08,0x09,0x10
             ,0x11,0x12,0x13,0x14,0x15,0x16,0x17,0x18,0x19
             ,0x20,0x21,0x22,0x23};
void display_Auto(int timer, int color){
  for(counter = timer; counter >= 0 ;--counter){
  if(portc.b2 == 1){
  color = 0;
  break;
  }
  portb = number[counter];
  if(counter == 3 && color == 0){
  portd.b7=0;
  portd.b6=1;
  }
  if(counter == 3 && color == 1){
  portd.b3=1;
  portd.b4=0;
  }
  delay_ms(100);

  }

}

int display_Manual(int color){
    portc.b2 = 0;

    if(portc.b2 != 0){

    while(porta.b4 == 1 && portc.b2 != 0);

    for(counter = 3;counter>=0;--counter){

                if(portc.b2 != 0){

                            if(color == 0){
                            portd.b7=0;
                            portd.b6=1;
                            }
                            if(color == 1){
                            portd.b4 = 0;
                            portd.b3 = 1;
                            }

                            portb = number[counter];

                            delay_ms(100);
                            portc.b2 = 0;
                            }else{
                            break;
                            }

                            }
                            }else{
                            return;
                            } 
                            while(porta.b4 == 0);
                            }






void Auto(int color){
   while(portc.b2 != 1){

  //Red Light

        if (color == 0){
        portd.b2=1;
        portd.b7=1;
        display_Auto(23,color);
        if(portc.b2 == 1){
        return;
        }
        portd.b2 = 0;
        portd.b6 = 0;
        color++;
        }

  //Green Light

          if(color == 1){
          portd.b4 = 1;
          portd.b5 = 1;
          display_Auto(15,color);
          if(portc.b2 == 1){
          return;
          }
          portd.b4=0;
          portd.b5=0;
          color++;
          }

  //Yellow Light

           if(color == 2 && portc.b2 != 1){
           portd.b3 = 0;
           portd.b2 = 1;
           portd.b7 = 1;
           portd.b4 = 0;
           portd.b2 = 0;
           color = 0;
           }
  }
}

void Manual(int color){

     while(portc.b2 == 1){
        //Red light
        if(color == 0){
        portd.b4 = 0;

        portd.b3 = 0;

        portd.b2=1;

        portd.b7=1;

        display_Manual(color);

        portd.b5 = 1;

        portd.b2 = 0;

        portd.b4=1;

        portd.b6 = 0;

        color++;
        }
        //Green Light

        if(color == 1){
        display_Manual(color);

        portd.b5 = 0;

        portd.b4 = 1;

        portb.b2 = 1;

        color = 0;
        }
           portb =0;

           portc.b2=0;
     }
}

void main() {
  ADCON1 = 0x07;
  trisb = 0x00;
  trisd = 0x00;
  trisc = 0x00;
  porta = 0;
  trisa.b4 = 1;
  portd = 0;
  portb = 0;
  portc = 0;
  portc.b0 = 1;
  while(1){
           portd = 0;
           portb = 0;
          if(portc.b2 != 1){
                      Auto(color);
          }else{

                      Manual(color);
          }

  }
}