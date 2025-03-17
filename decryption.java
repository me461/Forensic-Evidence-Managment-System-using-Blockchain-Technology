/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Dna.Sources;

/**
 *
 * @author java2
 */
import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Scanner;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import javax.swing.JOptionPane;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class decryption {
//public static void main(String args[])
//{
//           Scanner s=new Scanner(System.in);
//            System.out.println("Enter encrypted Text and key");
//            String text=s.next();
//            String key=s.next();
//	new decryption().decrypt(text,key);
//}

    public ArrayList<String> decrypt(String[] encypteddata) {
        String[] decryptedtext = new String[4];
        ArrayList<String> FinalList=new ArrayList<>();
         HashMap<String, String> add_elements = new HashMap<String, String>();
        try {
            
             int  i ;
           Connection con = Dbconnection.getConnection();
            Statement st = con.createStatement();
            ResultSet rt = st.executeQuery("select * from datavalues");
           while( rt.next()){
               add_elements.put(rt.getString("quaternary"), rt.getString("alphabets"));
           }
           
            System.out.println("dddddddddddddddd" +add_elements.get(encypteddata[0]));
           FinalList.add((String)add_elements.get(encypteddata[0]));
            FinalList.add((String)add_elements.get(encypteddata[1]));
             FinalList.add((String)add_elements.get(encypteddata[2]));
              FinalList.add((String)add_elements.get(encypteddata[3]));
            System.out.println("Decrypted Text:" + FinalList);
            add_elements.clear();
        } catch (Exception e) {
            System.out.println(e);
        }
        return FinalList;
    }

    String decrypt(String str, SecretKey sec) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    String decrypt(String toString, String privatekey) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
