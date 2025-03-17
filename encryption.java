/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Dna.Sources;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.Vector;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import javax.swing.JOptionPane;
import sun.misc.BASE64Encoder;

public class encryption {

    public ArrayList<String> encrypt(String[] PlainData ) {
     
        int i = 0;
        int j = 0;
        int count =0 ;
      String[] Final = new String[4];
          ArrayList<String> list=new ArrayList<>();
           ArrayList<String> FinalList=new ArrayList<>();
           
        try {
          String Dna_data[] = new String[26];
           Connection con = Dbconnection.getConnection();
            Statement st = con.createStatement();
            ResultSet rt = st.executeQuery("select * from datavalues");
                while ( rt.next())
                {
                             Dna_data[count] =  rt.getString("alphabets");
                            count++;
                }
       
               for ( i=0;i<PlainData.length;i++)    
               {
                   for ( j =0; j<Dna_data.length;j++)
                   {
                        if ( PlainData[i].equals(Dna_data[j]) ) {
                            list.add("1");
                        }
                        else {
                             list.add("0");
                            
                        }
                   }
                   System.out.println("resuult of list" + list);
                StringBuilder listString = new StringBuilder();
 
                     for (String s : list)
                     {
                         listString.append(s);
                         System.out.println("resuult of xxxxxxxxxxxxxxxxx" + listString  );
                     }
                     FinalList.add(listString.toString());
                     list.clear();
                     
               }
               //System.out.println("resuult of finalistlist" + FinalList);    
                      

        } catch (Exception e) {
            System.out.println(e);
        }
         return FinalList;
    }

    

}
