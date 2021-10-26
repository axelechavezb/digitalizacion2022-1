char var[5];

void setup() {
  //Inicializamos la comunicación serial
  Serial.begin(115200);

}

void loop() {
  // Se escribe en el serial la lectura hecha en el puerto A0
  //Serial.println(analogRead(A0));

  // Hacemos la prueba también con otro puerto. Ponemos un tabulador primero
  //Serial.print("\t");
  //Serial.print(analogRead(A1));

  // Guardamos la variable númerica (de A0) en la variable "var"
  // que es un char de "ancho fijo". Se utiliza %04d para decir:
  // % variable que se va a utilizar
  // d, es un entero
  // 04, se va a guardar el entero con 4 cifras,
  // si el número fuera 1020, se guarda como 1020
  // si el número fuera 3, se guarda como 0003
  sprintf(var,"%04d",analogRead(A0));

  // Imprimimos la variable var
  Serial.println(var);
  
  

  //Generamos un delay
  delay(100);

}
