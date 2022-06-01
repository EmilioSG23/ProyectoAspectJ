package com.bank;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.time.LocalTime;

public aspect Logger {
	pointcut success() : call(* create*(..) );
    after() : success() {
    //Aspecto ejemplo: solo muestra este mensaje después de haber creado un usuario 
    	System.out.println("**** User created ****");
    }
    
   pointcut successTransaction() : call(* moneyMake*(..) );
   after():successTransaction(){
	   //Muestra el mensaje después de realizar una transacción
	   System.out.println("**** Transaction successful ****");
   }
   
   pointcut successWithdrawal() : call(* moneyWith*(..) );
   after():successWithdrawal(){
	   //Muestra el mensaje después de retirar dinero
	   System.out.println("**** Withdrawal successful ****");
   }
   
   public static String crearString(String tipo) {
	   LocalTime time=LocalTime.now();
	   String hora=Integer.valueOf(time.getHour())+":"+Integer.valueOf(time.getMinute());
	   return "Tipo: "+tipo+" - "+"Hora: "+hora;
   }
   
   public static void writeFile(String cadena) {
	   try {
		   FileWriter fw=new FileWriter("log.txt",true);
		   BufferedWriter bw=new BufferedWriter(fw);
		   bw.write(cadena);
		   bw.newLine();
		   bw.close();
		   fw.close();
	   }catch(IOException e) {
		   System.err.println(e.getMessage());
		   e.printStackTrace();
	   }
   }
}
