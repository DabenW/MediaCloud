<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.io.OutputStream"%> 
<%@page import="java.io.PrintWriter"%> 
<%@page import="java.io.FileNotFoundException"%> 
<%@page import="java.io.File"%> 
<%@page import="java.io.FileInputStream"%>  
<% 
// 

String fileName = new String(request.getParameter("fileName").getBytes("ISO-8859-1"),"UTF-8"); 
System.out.println(fileName);
String Name=fileName.substring(fileName.lastIndexOf("/")+1,fileName.length());
String basePath = request.getSession().getServletContext().getRealPath("/");
FileInputStream fs = null; 
File file=new File(basePath+fileName);
try { 
fs = new FileInputStream(file); 
if (!file.exists()) {
    System.out.println(file.getAbsolutePath() + " file not exist!");
       return;
   }
}catch(FileNotFoundException e) { 
e.printStackTrace(); 
return; 
} 
//设置响应头和保存文件名 
response.reset(); 
response.setContentType("application/x-download;charset=UTF-8"); 
response.setHeader("Content-Disposition", "inline; filename=\"" + Name + "\""); 
//写出流信息 
int b = 0; 
try { 
OutputStream ops = response.getOutputStream(); 
while((b=fs.read())!=-1) { 
ops.write(b); 
} 
fs.close(); 
out.clear(); 
out = pageContext.pushBody(); 
}catch(Exception e) { 
e.printStackTrace(); 
System.out.println("下载文件失败!"); 
} 

%> 
