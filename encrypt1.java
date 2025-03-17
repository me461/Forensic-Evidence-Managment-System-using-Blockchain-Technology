/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dna.Sources;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author java2
 */
public class encrypt1 extends HttpServlet {

    //private static java.sql.Date getCurrentDate() //{
        //java.util.Date today = new java.util.Date();
        //return new java.sql.Date(today.getTime());
    //}

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            Connection con;
            PreparedStatement pstm = null;
             String filename = "";
             String owner = "";
             
             String pid = "";
             String date = "";
             String privatekey = "";
              ArrayList<String> Cipherdata=new ArrayList<>();
             String Verify_DNAdata[] = new String [4];
           // String cd = "";
           // String a = (String) request.getSession().getAttribute("username");
           // System.out.println("User Name : " + a);
            try {
                boolean isMultipartContent = ServletFileUpload.isMultipartContent(request);
                if (!isMultipartContent) {
                    return;
                }
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                try {
                    List<FileItem> fields = upload.parseRequest(request);
                    Iterator<FileItem> it = fields.iterator();
                    if (!it.hasNext()) {
                        return;
                    }
                    
                    while (it.hasNext()) {
                        FileItem fileItem = it.next();
                       
                          
                          if (fileItem.getFieldName().equals("privatekey")) {
                            privatekey = fileItem.getString();
                            System.out.println("File Name" + privatekey);
                        
                        }
                          
                            if (fileItem.getFieldName().equals("pid")) {
                            pid = fileItem.getString();
                            System.out.println("File pid" + pid);
                        
                        }
                            
                              if (fileItem.getFieldName().equals("date")) {
                            date = fileItem.getString();
                            System.out.println("File date" + date);
                        
                        }
                              
                                if (fileItem.getFieldName().equals("dna1")) {
                            Verify_DNAdata[0] = fileItem.getString();
                            System.out.println("File Verify_DNAdata[0]" + Verify_DNAdata[0]);
                        
                        }
                                
                                  if (fileItem.getFieldName().equals("dna2")) {
                            Verify_DNAdata[1] = fileItem.getString();
                            System.out.println("File Verify_DNAdata[1]" + Verify_DNAdata[1]);
                        
                        }
                        
                        if (fileItem.getFieldName().equals("dna3")) {
                            Verify_DNAdata[2] = fileItem.getString();
                            System.out.println("File Verify_DNAdata[2]" + Verify_DNAdata[2]);
                        
                        }
                        if(fileItem.getFieldName().equals("dna4")) {
                           Verify_DNAdata[3] = fileItem.getString();
                            System.out.println("File Verify_DNAdata[3]" + Verify_DNAdata[3]);
                            
                        
                        }
                       
                        
                       }
                        
                    
                  
       
                    
                    
                            try {
                                con = Dbconnection.getConnection();
                                pstm = con.prepareStatement("insert into upload (filename, data, owner,skey,policy,time,exp,branch)values(?,?,?,?,?,?,?,?)");
                               
                               
                               byte[] bs = Base64.decode(privatekey);
                               //SecretKey secretKey = new SecretKeySpec(bs, "AES");
            
                               encryption obj_enc = new encryption();
                               Cipherdata= obj_enc.encrypt(Verify_DNAdata);
                                System.out.println("resuult of finalistlistccccccccccccccccc" + Cipherdata);    
                   
                                pstm.setString(1, pid);
                               
                                
                              //  pstm.setString(2, cipher);
                              
                                 pstm.setString(3, date);
                                  pstm.setString(4, privatekey);
                                   pstm.setString(5, Cipherdata.get(0));
                                  pstm.setString(6, Cipherdata.get(1));
                                   pstm.setString(7, Cipherdata.get(2));
                                  pstm.setString(8, Cipherdata.get(3));
                                /*Cloud Start*/
                                File f = new File("C:\\Documents and Settings\\Administrator\\Desktop\\input"+pid);
                                FileWriter fw = new FileWriter(f);
                              //  fw.write(cipher);
                              //  fw.close();
                             //   Ftpcon ftpcon = new Ftpcon();
                              //  ftpcon.upload(f, filename);
                                /*Cloud End*/
                                int i = pstm.executeUpdate();
                                if (i == 1) {
                                    response.sendRedirect("viewkeys.jsp?msg1=success");
                                } else {
                                    response.sendRedirect("viewfiles1.jsp?msgg=failed");
                                }
                                con.close();
                            } catch (Exception e) {
                                out.println(e.toString());
                            }
                    
                    
                } catch (FileUploadException e) {
                } catch (Exception ex) {
                    Logger.getLogger(encrypt1.class.getName()).log(Level.SEVERE, null, ex);
                }
            } finally {
                out.close();
            }
        }
    }

    private static String getStringFromInputStream(InputStream is) {
        BufferedReader br = null;
        StringBuilder sb = new StringBuilder();
        String line;
        try {
            br = new BufferedReader(new InputStreamReader(is));
            while ((line = br.readLine()) != null) {
                sb.append(line + "\n");
            }
        } catch (IOException e) {
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                }
            }
        }
        return sb.toString();
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
