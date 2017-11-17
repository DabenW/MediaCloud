<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.io.*, java.util.*" %>
<%@ page import="Form.Constants" %>
<%@ page import="service.*" %>
<%@ page import="javax.xml.parsers.*" %>
<%@ page import="org.w3c.dom.Document,org.w3c.dom.NamedNodeMap,org.w3c.dom.Node,org.w3c.dom.NodeList" %>
<%@ page import="org.xml.sax.SAXException" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show the Track</title>
       <link href="css/homepage.css" rel="stylesheet">
       <link href="css/navi.css" rel="stylesheet" type="text/css"/>
       <link href="css/bootstrap.min.css" rel="stylesheet"/>
       <link href="css/track_list.css" rel="stylesheet"/>
	   <script src="js/jquery.min.js"></script>
	   <script src="js/bootstrap.min.js"></script>
	   <script src="js/homepage.js"></script>
	   <script src="js/list.js" type="text/javascript" charset="utf-8"></script>
	   <script src="js/albumlist.js"></script>
</head>
<body>
<div class="border" style="background:url('picture/96.jpg'); position:fixed; overflow:auto; left:0px; top:0px; width:100%; height:100%;">
</div>

      <div style="position:relative;left:0px; top:0px;width:100%;">
			<!-- 
          the Navigation
         -->
		<div class="navi_body"onMouseOver="NaviOver()" onMouseOut="Navi()">
			<div class="navi_head">
				<div style="width:80%; margin-left:auto; margin-right:auto;">
					<span>
						<p class="navi_title">HOME</p>
						<p><a href="HomePage.html">HOME</a></p>
					</span>
					<span>
						<p class="navi_title">LIBRARY</a></p>
						<p><a href="File.html">FILES</a></p>
						<p><a href="allFiles.jsp">All Files</a></p>
						<p><a href="CategoryMedia.html">Category Files</a></p>
						
					</span>
					<span>
						<p class="navi_title">UPLOAD</p>
						<p><a href="Upload.jsp">Upload</a></p>
					</span>
					<span>
						<p class="navi_title">CHOICE</p>
						<p><a href="Music.jsp">Music</a></p>
						<p><a href="tv_show.jsp">TV Show</a></p>
					</span>
					<span>
						<p class="navi_title">ABOUT</p>
						<p><a href="">Team</a></p>
					</span>
					<span>
						<p class="navi_title">CONTRIBUTE</p>
						<p><a href="">DONATE(KIDDING)</a></p>
						
					</span>
					<span>
					    <p><a href="#"><img id="navigation" src="picture/Naviglist.JPG" style="position:absolute;right:10px;width:40px; height:36px;top:10px;" onMouseOver="NaviOver()" onMouseOut="Navi()"/></a></p>
					</span>
				</div>
			</div>
		</div>
		</div>
		
		
		<!-- 
		the Album part
		 -->
		<div id="container" style="position:relative; ">
          <br/> 
           <div id="main" >
           
           <div id="Album">
           <ul class="list">
           <% 
           int id = Integer.parseInt(request.getParameter("Acategory"));
           
           String[] result = QueryService.queryAlbumByID(id);
           
           String aname=result[0];
	       String genre=result[1];
	       String singer=result[2];
	       String adesc=result[3];
	       String athumb=result[4]; 
           String anumber=result[5];
           %>
           <span style="display: none" id="path"><%= anumber %></span>
		   <span style="display: none" id="num"></span>
             <li>
             <p class="stroke">----------   THE ALBUM   ----------</p>
                  <img src=<%=athumb %>  class="thumb" style="width:350px;height:100%"/>
                  <h1>
                     <span class="vintage"   id="text_aname"><%=aname %></span><br/><br/>
                     <p1>Category:</p1><p1 class="category" id="text_genre">Genre: <%=genre %></p1><br/>
                     <p1 id="text_singer">Singer: <%=singer %></p1>
                     <div style="border:1px solid black; width: 100%; height: 80px; float: center; margin-top: 20px;">
					
						<!-- Short introduce to album -->
						<p style="color: black; padding: 10px; text-align: center;" id="text_adesc">
							<%=adesc %>
						</p>
				     </div><br/>
				     <img alt="" src="picture/Edit.png" width="50" height="40" class="big_edit_icon" onClick="edit()" title="edit the Album" style="cursor:pointer"/>
                  </h1>
              </li>
  		     </ul>
  		     </div>
           </div>
        </div>
		
		
		<!-- 
		the track part
		 -->
		<div  id="container" style="position:relative; ">
         
           <div id="main" style="background-color:#FFF;">
              <%
              List<String[]> tracks = QueryService.queryTrack(id);
              
              int count = 0;
			  for(int i = 0; i < tracks.size(); i++) {
					String[] track = tracks.get(i);
					
					//give the html the attributes
		    		String ttitle = track[0];
		    		String tnumber = track[1];
					String tduration = track[2];
					String tthumb = track[3];
					String musicFile = track[4];
					String filename=musicFile.replaceAll("\\\\", "/");
              %>
              <div>
                 <img  src=<%=tthumb %>  width="375"> <br/>
                 <p id=<%= "tt_" + i %>><%=tnumber + " " + ttitle %></p>
		         <strong id=<%= "tduration_" + i %>><%=tduration %> </strong>
		         <div >
		            <a href=<%=musicFile %>><img src="picture/play2.png" width="31" height="26" /></a>
		            <img type="submit" src="picture/download.png"  onclick="window.open('Download.jsp?fileName=<%=filename %>')">
		            <img src="picture/edit_s.png" style="width: 40px; height: 40px; margin-bottom: 1px;  cursor: pointer;" title="change the track Info" onclick="edit_track(<%=i %>)">
		         </div>
		      </div>
            <%
   		    }   
            %>
           </div>
        </div>
        
        <!-- 
        the form group of Album
         -->
                  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
					    <div class="modal-dialog modal-lg" role="document">
					      <div class="modal-content">
					        <div class="modal-header">
					          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">Close—</span></button>
					          <h4 class="modal-title" id="myModalLabel" class="show_bubble_text">Edit</h4>
					        </div>
					        <div class="modal-body">
					        
					          <div class="form-group">
					            <label for="sname" class="show_bubble_text">Name</label>
					            <input type="text" name="sname" class="form-control" id="aname" disabled="false" value=<%=result[0]%>>
					          </div>
					          <div class="form-group">
					            <label for="orig" class="show_bubble_text">Genre</label>
					            <input type="text" name="orig" class="form-control" id="genre" value=<%=result[1] %>>
					          </div>
					          <div class="form-group">
					            <label for="prod" class="show_bubble_text">Singer</label>
					            <input type="text" name="prod" class="form-control" id="singer" value=<%=result[2] %>>
					          </div>
					          <div class="form-group">
					            <label for="desc" class="show_bubble_text">Description</label>
					            <input type="text" name="desc" class="form-control" id="adesc" value=<%=result[3] %>>
					          </div>
					        </div>
					        <div class="modal-footer">
					          <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true">Cancel</span></button>
					          <button type="button" id="btn_submit" class="btn btn-primary" data-dismiss="modal" onclick="submit()"><span  aria-hidden="true"></span>Super Sure</button>
					        </div>
					      </div>
					    </div>
					  </div>
        
        
        <!-- 
        the form group of the track ,here youcan see the result of track
        you can submit to the js file to use aJax to send data to server
         -->
        
                <div class="modal fade" id="track_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
					    <div class="modal-dialog modal-lg" role="document">
					      <div class="modal-content">
					        <div class="modal-header">
					          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">Close</span></button>
					          <h4 class="modal-title" id="myModalLabel">Edit</h4>
					        </div>
					        <div class="modal-body">
					        
					          <div class="form-group">
					            <label for="sname" class="show_bubble_text">Title</label>
					            <input type="text" name="sname" class="form-control" id="ttitle" disabled="false" value=<%=result[0]%>>
					          </div>
					          <div class="form-group">
					            <label for="orig" class="show_bubble_text">Number</label>
					            <input type="text" name="orig" class="form-control" id="tnumber" value=<%=result[1] %>>
					          </div>
					          <div class="form-group">
					            <label for="prod" class="show_bubble_text">Duration</label>
					            <input type="text" name="prod" class="form-control" id="tduration" value=<%=result[2] %>>
					          </div>
					        </div>
					        <div class="modal-footer">
					          <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true">Cancel</span></button>
					          <button type="button" id="btn_submit" class="btn btn-primary" data-dismiss="modal" onclick="track_submit()"><span  aria-hidden="true"></span>Super Super Sure</button>
					        </div>
					      </div>
					    </div>
					  </div>
				</div>
	
		
        <div style="position:fixed; left:0px;top:5px;">
	       <a href="javascript:;" onClick="javascript :history.back(-1);"><img src="picture/back.png" border="0" title="back"></a>
	    </div>
	    
	    
</body>
</html>