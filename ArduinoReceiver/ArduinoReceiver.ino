
#define PRET 'R'
#define ENDDATA 'E'
#define BEGINDATA 'B'
#define NEXTDATA 'N'

#include <AFMotor.h>

AF_Stepper motor2(200, 2);
AF_Stepper motor1(200, 1);

const int sizex=300;

int data[sizex];
int defx=0;
int defy=0;
int oldx=0;
int par=0;
boolean initial=false;
boolean homing= false;
int sizeused;



void setup(){
    
    motor1.setSpeed(120);  // 10 rpm
    motor2.setSpeed(60);
    motor1.release(); // 10 rpm
    motor2.release();
    pinMode(3, OUTPUT);
    digitalWrite(3, LOW);
    Serial.begin(9600);
    Serial.println("Splinter Running");
    
    
    while(Serial.available()<=0){
        delay(1000);
        Serial.print( PRET);
    }
    
    while(initial==false){
        if (Serial.available() > 0) {
            char ch= Serial.read();
            if(ch>='0' && ch<='9'){
                defx=defx*10+(ch-'0'); 
            }
            if( ch== NEXTDATA && defy==0){
                defy=defx;
                defx=0;
            }
            if( ch== ENDDATA && defy !=0){
                initial= true;
                Serial.println( defx);
                Serial.println( defy);
                
                Serial.print(PRET); 
            }
            
        }
        
    }
    
}

void loop(){
    
    int i=0;
    boolean finished= false;
    while( finished==false){
        if (Serial.available() > 0) {
            char ch=Serial.read();
            if(ch>='0' && ch<='9'){
                data[i]=data[i]*10+(ch-'0'); 
            }
            if( ch== NEXTDATA){
                i=i+1;
            }
            if( ch== ENDDATA ){
                finished= true;
                Serial.print(ENDDATA);
                sizeused=i+1;
                data[i+1]=0;
            }
        }
    }
    
    
    if(par==0){
        for(int j=0; j<sizeused; j++){
            if (data[j] !=0){
                if(data[j] != oldx){
                    Motor1goto(data[j]);
                    Punch();
                }
            } 
        }
        
        
        memset(data,0,sizeof(data));
        
        
        par=0;
    }
    else{
        for(int j=0; j<sizeused; j++){
            
            if (data[sizeused-1-j] !=0){
                Motor1goto(data[sizeused-1-j]+3);
                Punch();
            }
        }
        
        
        memset(data,0,sizeof(data));
        
        
        
        par=0;
    }
    
    
    
    Motor2nextline();
    Serial.print (PRET);
    
    
}






void Motor1goto (int aim){
    int dist=aim-oldx;
    if(dist>0){
        motor1.step(dist, FORWARD, DOUBLE); 
    }
    else{
        motor1.step(-dist, BACKWARD, DOUBLE);
    }
    oldx=aim;
    
}



void Motor2nextline (){
    delay(5);
    motor2.step(defy, FORWARD,DOUBLE);
    //motor1.step(oldx, BACKWARD,DOUBLE);
    //oldx=0;
}

void Punch(){
    
    digitalWrite(3, HIGH);
    delay(80);
    digitalWrite(3, LOW);
    delay(60);
    
}

