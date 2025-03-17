package Dna.Sources;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import javax.servlet.http.HttpSession;
 
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import com.oreilly.servlet.MultipartRequest; 
import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
 import Dna.Sources.Ftpcon;
import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import java.io.FileWriter;
import java.util.ArrayList;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
/**
 *
 * @author java4
 */
public class Upload_b extends HttpServlet {
final String filepath="C:/";
   // private Object DbConnection;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        MultipartRequest m=new MultipartRequest(request,filepath);
          //String DI="DOCUMENT_INFIRMATION";
           DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    Date date = new Date();
             String time= dateFormat.format(date); 
             
             ArrayList<String> Cipherdata=new ArrayList<>();  
             String Verif_DNAdata[] = new String [4];
             
              String pid1 = m.getParameter("pid");
             String date1 = m.getParameter("date");
             String privatekey1 =m.getParameter("privatekey");
              Verif_DNAdata[0]=m.getParameter("dna1");
             Verif_DNAdata[1]=m.getParameter("dna2");
            Verif_DNAdata[2]=m.getParameter("dna3");
             Verif_DNAdata[3]=m.getParameter("dna4");
            
             
             
             
             
             
            System.out.println("--------->>>>"+pid1+date1+privatekey1+Verif_DNAdata[0]+Verif_DNAdata[1]+Verif_DNAdata[2]+Verif_DNAdata[3] );
        HttpSession session = request.getSession(true);
        Object sss = session.getAttribute("MyAttribute");
        DocumentBuilderFactory icFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder icBuilder;
        try {
            icBuilder = icFactory.newDocumentBuilder();
            Document doc = icBuilder.newDocument();
            Element mainRootElement = doc.createElementNS("http://www.Hospital_B.com", "Companies");
            doc.appendChild(mainRootElement);
             encryption obj_enc = new encryption();
                    Cipherdata= obj_enc.encrypt(Verif_DNAdata);
                    System.out.println("resuult of finalistlistccccccccccccccccc" + Cipherdata); 
            // append child elements to root element
            mainRootElement.appendChild(getCompany(doc,pid1,date1,privatekey1, Cipherdata.get(0), Cipherdata.get(1), Cipherdata.get(2), Cipherdata.get(3)));
            // output DOM XML to console 
            Transformer transformer = TransformerFactory.newInstance().newTransformer();
            transformer.setOutputProperty(OutputKeys.INDENT, "yes"); 
            DOMSource source = new DOMSource(doc);
            StreamResult console = new StreamResult(new File("C://XML/"+pid1+".xml/"));
            transformer.transform(source, console); 
            // file reading in BR
        BufferedReader br=new BufferedReader(new FileReader("C://XML/"+pid1+".xml/"));
        StringBuffer sb=new StringBuffer();
        String temp=null;
        while(( temp=br.readLine())!=null){
               sb.append(temp);              
           }   
          FileWriter fw=new FileWriter(new File("C://XML/"+pid1+".xml/"));
            fw.write(sb.toString());
            fw.close();

       
                       
           boolean status=new Ftpcon().upload(new File("C://XML/"+pid1+".xml/")); 
        
          
            System.out.println(new File("C:\\XML/"+pid1+".xml/"));
            Connection con;
            con = Dbconnection.getConnection();
            Statement st=con.createStatement();
       int i=st.executeUpdate("insert into encfile(pid,date,privatekey,dna1,dna2,dna3,dna4)values('"+pid1+"','"+date1+"','"+privatekey1+"','"+Cipherdata.get(0)+"','"+Cipherdata.get(1)+"','"+Cipherdata.get(2)+"','"+Cipherdata.get(3)+"')");
       if(i!=0){
                   out.println("success");
                   response.sendRedirect("hospital1home.jsp?g='upload_Successfully'");
                    
               }
               else{
                   out.println("error while uploading additional informations");
              }
        } catch (Exception e) {
            e.printStackTrace();
             response.sendRedirect("hospital1home.jsp?msgg='This_file_Already_uploaded'");
        }
    }
 
    private static Node getCompany(Document doc, String pid, String date, String privatekey, String dna1, String dna2, String dna3, String dna4) {
        Element company = doc.createElement("HOSPITAL_1");
        company.setAttribute("pid", pid);
        company.appendChild(getCompanyElements(doc, company, "pid", pid));
        company.appendChild(getCompanyElements(doc, company, "date", date));
        company.appendChild(getCompanyElements(doc, company, "privatekey", privatekey));
        company.appendChild(getCompanyElements(doc, company, "dna1", dna1));
        company.appendChild(getCompanyElements(doc, company, "dna2", dna2));
        company.appendChild(getCompanyElements(doc, company, "dna3", dna3));
        company.appendChild(getCompanyElements(doc, company, "dna4", dna4));
        
        return company;
    }
 
    // utility method to create text node
    private static Node getCompanyElements(Document doc, Element element, String name, String value) {
        Element node = doc.createElement(name);
        node.appendChild(doc.createTextNode(value));
        
        return node;
    
}
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
