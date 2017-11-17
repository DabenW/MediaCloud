package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbutil.Dbutil;

/**
 * Servlet implementation class EditAlbum to provide
 * edit albums' information
 */
@WebServlet("/EditAlbum")
public class EditAlbum extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getParameter("path");
		String aname = request.getParameter("aname");
		String genre = request.getParameter("genre");
		String singer = request.getParameter("singer");
		String adesc = request.getParameter("adesc");
		
		String update = "UPDATE album SET genre='"+genre+"', singer='"+singer+"', adesc='"+adesc+"' WHERE id="+path;
		
		//execute update option to album table
		Dbutil util = new Dbutil();
		util.update(update);
	    util.releaseConnection();
	    
	    //return json data
	    response.setContentType("text/json" + ";charset=UTF-8");
	    PrintWriter pw = response.getWriter();
	    pw.write("{\"aname\":\""+aname+"\","+"\"genre\":\""+genre+"\","+"\"singer\":\""+singer+"\","+"\"adesc\":\""+adesc+"\"}");
	    pw.close();
	}

}