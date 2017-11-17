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
	<meta charset="UTF-8">
    <title>Upload</title>
	<link href="css/upload.css" rel="stylesheet"/>
	<link href="css/bootstrap.min.css" rel="stylesheet"/>
	<link href="css/navi.css" rel="stylesheet"/>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery-form.js"></script>
	<script src="js/upload.js"></script>
</head>
<body>	
<div class="border" style="background: url('picture/blue.jpg'); position:fixed; overflow:auto; left:0px; top:0px; width:100%; height:100%;">
</div>
<!-- 
    the Navigation
     -->
	<div style="position:relative; overflow:auto; left:0px; top:0px; width:100%; height:100%">
	   <div class="navi_body"onMouseOver="NaviOver()" onMouseOut="Navi()">
			<div class="navi_head">
				<div style="width:80%; margin-left:auto; margin-right:auto;">
					<span>
						<p class="navi_title">HOME</a></p>
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
					    <p><a href="#"><img id="navigation" src="picture/Naviglist.JPG" style="position:absolute;right:10px;width:40px; height:36px;top:11px;" onMouseOver="NaviOver()" onMouseOut="Navi()"/></a></p>
					</span>
				</div>
			</div>
		</div>
	
			
	<!-- 
		The buttons are used to choose create tv show files and upload show files 
		or create music files and upload music files.
	 -->
	<div class="container" style="height:150px;location:relative;">
		<div class="button" style="left:15%">
			<img class="image" id="upload_tv" src="picture/upload_tv.png" onMouseOver="tvOver()" onMouseOut="tvOut()" onClick="tvForm()"/>
		</div>
		<div class="button" style="right:15%">
			<img class="image" id="upload_music" src="picture/upload_music.png" onMouseOver="musicOver()" onMouseOut="musicOut()" onClick="musicForm()"/>
		</div>
	</div>
	
	<%
		Map<Integer, String> shows = QueryService.queryShowList();
		Map<Integer, String> albums = QueryService.queryAlbumList();
	%>
	
	<!-- 
		The div has two forms that one of them is hidden first, by clicking button to 
		show different form.
	 -->
	<div class="container">
		<div id="music" style="display:none">
			<hr/>
			<br/><br/>
			<form action="CreateAlbum" class="form-horizontal" style="text-align:center" id="create_album" method="post" enctype="multipart/form-data" onSubmit="return isAlbumEmpty()">
 	  			<div class="form-group">
 	  				<label for="aname" class="col-sm-2 control-label" style="font-size:20px">Album name</label>
            		<div class="col-sm-10">
     	    			<input type="text" class="form-control" id="aname" name="aname" placeholder="Please input the name of album">
    	 			</div>
   	  			</div>
   	  			<br/>
   	  			<br/>
   	  			<div class="form-group">
      				<label for="mgenre" class="col-sm-2 control-label" style="font-size:20px">Genre</label>
         			<div class="col-sm-10">
            			<input type="text" class="form-control" id="mgenre" name="mgenre" placeholder="Please input the genre">
      	 			</div>
   	  			</div>
   	  			<br/>
   	  			<br/>
   	  			<div class="form-group">
      				<label for="singer" class="col-sm-2 control-label" style="font-size:20px">Singer</label>
         			<div class="col-sm-10">
            			<input type="text" class="form-control" id="singer" name="singer" placeholder="Please input the singer">
      	 			</div>
   	  			</div>
   	  			<br/>
   	  			<br/>
   				<div class="form-group">
   					<label for="adesc" class="col-sm-2 control-label" style="font-size:20px">Description</label>
      				<div class="col-sm-10">
         				<textarea class="form-control" rows="4" id="adesc" name="adesc" placeholder="Please input the description of the album"></textarea>
      				</div>
   				</div>
   				<br/>
   				<br/>
   				<div class="form-group">
      				<label class="col-sm-2 control-label" for="athumb" style="font-size:20px">Album Picture</label>
      				<div class="col-sm-10">
         				<input type="file" class="form-control" id="athumb" name="athumb" accept=".png, .jpg">
      				</div>
   				</div>
   				<br/>
   				<div class="form-group">
      				<div class="col-sm-offset-2 col-sm-10">
         				<button type="submit" class="btn btn-primary btn-lg btn-bloc">Create Album</button>
      				</div>
   				</div>
			</form>
			<br/>
			<hr/>
			<br/><br/>
			<form action="UploadTrack" class="form-horizontal" style="text-align:center" id="submit_music" method="post" enctype="multipart/form-data" onSubmit="return isTrackEmpty()">
				<div class="form-group">
      				<label for="albumLists" class="col-sm-2 control-label" style="font-size:20px">Choose Album</label>
         			<div class="col-sm-10">
            			<select id="albumLists" name="albumLists" class="form-control">
  							<% for(int key : albums.keySet()){ %>
  									<option value=<%=key+"_"+albums.get(key)%>><%=albums.get(key)%></option>
  							<% }%>
						</select>
      	 			</div>
   	  			</div>
   	  			<br/>
   	  			<br/>
   	  			<div class="form-group">
      				<label for="ttitle" class="col-sm-2 control-label" style="font-size:20px">Track Title</label>
         			<div class="col-sm-10">
            			<input type="text" class="form-control" id="ttitle" name="ttitle" placeholder="Please input the title of track">
      	 			</div>
   	  			</div>
   	  			<br/>
   	  			<br/>
   	  			<div class="form-group">
      				<label for="tnumber" class="col-sm-2 control-label" style="font-size:20px">Track Number</label>
         			<div class="col-sm-10">
            			<input type="text" class="form-control" id="tnumber" name="tnumber" placeholder="Please input the number of track">
      	 			</div>
   	  			</div>
   	  			<br/>
   	  			<br/>
   	  			<div class="form-group">
      				<label for="tduration" class="col-sm-2 control-label" style="font-size:20px">Track Duration</label>
         			<div class="col-sm-10">
            			<input type="text" class="form-control" id="tduration" name="tduration" placeholder="Please input the duration of track">
      	 			</div>
   	  			</div>
   	  			<br/>
   	  			<br/>
   	  			<div class="form-group">
      				<label class="col-sm-2 control-label" for="tthumb" style="font-size:20px">Track Picture</label>
      				<div class="col-sm-10">
         				<input type="file" class="form-control" id="tthumb" name="tthumb" accept=".png, .jpg">
      				</div>
   				</div>
   				<br/>
   				<br/>
   	  			<div class="form-group">
      				<label class="col-sm-2 control-label" for="musicfile" style="font-size:20px">Upload Track</label>
      				<div class="col-sm-10">
         				<input type="file" class="form-control" id="musicfile" name="musicfile" accept=".mp3">
      				</div>
   				</div>
				<br/>
   	  			<div class="form-group">
      				<div class="col-sm-offset-2 col-sm-10">
         				<button type="submit" class="btn btn-primary btn-lg btn-bloc">Upload Track</button>
      				</div>
   				</div>
   				<br/>
   				<br/>
			</form>	
		</div>
		<div id="tv">
			<hr/>
			<br/><br/>
			<form action="CreateShow" class="form-horizontal" style="text-align:center" id="create_show" method="post" enctype="multipart/form-data" onSubmit="return isShowEmpty()">
 	  			<div class="form-group">
 	  				<label for="sname" class="col-sm-2 control-label" style="font-size:20px">Show name</label>
            		<div class="col-sm-10">
     	    			<input type="text" class="form-control" id="sname" name="sname" placeholder="Please input the name of tv show">
    	 			</div>
   	  			</div>
   	  			<br/>
   	  			<br/>
   	  			<div class="form-group">
 	  				<label for="genre" class="col-sm-2 control-label" style="font-size:20px">Genre</label>
            		<div class="col-sm-10">
     	    			<input type="text" class="form-control" id="genre" name="genre" placeholder="tvshow or music">
    	 			</div>
   	  			</div>
   	  			<br/>
   	  			<br/>
   	  			<div class="form-group">
      				<label for="orig" class="col-sm-2 control-label" style="font-size:20px">Director</label>
         			<div class="col-sm-10">
            			<input type="text" class="form-control" id="orig" name="orig" placeholder="Please input the director">
      	 			</div>
   	  			</div>
   	  			<br/>
   	  			<br/>
   	  			<div class="form-group">
      				<label for="prod" class="col-sm-2 control-label" style="font-size:20px">Producer</label>
         			<div class="col-sm-10">
            			<input type="text" class="form-control" id="prod" name="prod" placeholder="Please input the producer">
      	 			</div>
   	  			</div>
   	  			<br/>
   	  			<br/>
   				<div class="form-group">
   					<label for="sdesc" class="col-sm-2 control-label" style="font-size:20px">Description</label>
      				<div class="col-sm-10">
         				<textarea class="form-control" rows="4" id="sdesc" name="sdesc" placeholder="Please input the description of the show"></textarea>
      				</div>
   				</div>
   				<br/>
   				<br/>
   				<div class="form-group">
      				<label class="col-sm-2 control-label" for="sthumb" style="font-size:20px">Show Thumb</label>
      				<div class="col-sm-10">
         				<input type="file" class="form-control" id="sthumb" name="sthumb" accept=".png, .jpg">
      				</div>
   				</div>
   				<br/>
   				<div class="form-group">
      				<div class="col-sm-offset-2 col-sm-10">
         				<button type="submit" class="btn btn-primary btn-lg btn-bloc">Create Show</button>
      				</div>
   				</div>
			</form>
			<br/>
			<hr/>
			<br/><br/>
			<form action="UploadShow" class="form-horizontal" style="text-align:center" id="submit_episode" method="post" enctype="multipart/form-data" onSubmit="return isEpisodeEmpty()">
				<div class="form-group">
      				<label for="showLists" class="col-sm-2 control-label" style="font-size:20px">Choose show</label>
         			<div class="col-sm-10">
            			<select id="showLists" name="showLists" class="form-control">
 							<% for(int key : shows.keySet()){ %>
  									<option value=<%=key+"_"+shows.get(key)%>><%=shows.get(key)%></option>
  							<% }%>	
						</select>
      	 			</div>
   	  			</div>
   	  			<br/>
   	  			<br/>
   	  			<div class="form-group">
      				<label for="epname" class="col-sm-2 control-label" style="font-size:20px">Episode Name</label>
         			<div class="col-sm-10">
            			<input type="text" class="form-control" id="epname" name="epname" placeholder="Please input the name of episode">
      	 			</div>
   	  			</div>
   	  			<br/>
   	  			<br/>
   	  			<div class="form-group">
      				<label for="slabel" class="col-sm-2 control-label" style="font-size:20px">Season Number</label>
         			<div class="col-sm-10">
            			<input type="text" class="form-control" id="slabel" name="slabel" placeholder="Please input the season number of episode">
      	 			</div>
   	  			</div>
   	  			<br/>
   	  			<br/>
   	  			<div class="form-group">
      				<label for="elength" class="col-sm-2 control-label" style="font-size:20px">Episdoe Length</label>
         			<div class="col-sm-10">
            			<input type="text" class="form-control" id="elength" name="elength" placeholder="Please input the length of episode">
      	 			</div>
   	  			</div>
   	  			<br/>
   	  			<br/>
   	  			<div class="form-group">
      				<label class="col-sm-2 control-label" for="epthumb" style="font-size:20px">Episode Thumb</label>
      				<div class="col-sm-10">
         				<input type="file" class="form-control" id="epthumb" name="epthumb" accept=".png, .jpg">
      				</div>
   				</div>
				<br/>
				<br/>
   	  			<div class="form-group">
      				<label class="col-sm-2 control-label" for="showfile" style="font-size:20px">Upload Episode</label>
      				<div class="col-sm-10">
         				<input type="file" class="form-control" id="showfile" name="showfile">
      				</div>
   				</div>
				<br/>
   	  			<div class="form-group">
      				<div class="col-sm-offset-2 col-sm-10">
         				<button type="submit" class="btn btn-primary btn-lg btn-bloc">Upload Episode</button>
      				</div>
   				</div>
   				<br/>
   				<br/>
			</form>	
		</div>
	</div>
	
	
	<!-- 
		The representation of copyright.
	 -->
	<div style=" background-color:#000; text-align:center">
			<hr/>
			<br/><br/><br/>
			<font color="white" size="4">Questions? Call 225-2225-2225</font><br/>
			<font color="white" size="4">Copyright © 2017 MCloud, Inc.</font><br/>
			<font color="white" size="4">MCloud and the SIMSAM logo are registered trademarks of MCloud, Inc.</font><br/>
			<br/>
			<br/>
		</div>
</body>
</html>