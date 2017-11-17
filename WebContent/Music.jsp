<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*, java.util.*" %>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="Form.*" %>
<%@ page import="service.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View the Music</title>
      <link href="css/navi.css" rel="stylesheet" type="text/css"/>
	  <link href="css/musicstyle.css" rel="stylesheet" media="screen"/>
	  <link href="css/hoverstyle.css" rel="stylesheet" type="text/css"/>
	  <script src="js/homepage.js"></script>
	  <script type="text/javascript"src="js/jquery.min.js"></script> 
	  <script type="text/javascript"src="js/jquery.lazyload.min.js"></script>
	  <script type="text/javascript"src="js/blocksit.min.js"></script>
	  
</head>
<body>
<div class="border" style="background: url('picture/96.jpg'); position:fixed; overflow:auto; left:0px; top:0px; width:100%; height:100%;">
</div>		
		<div style="position:relative;left:0px; top:0px;width:100%;">
			<!-- 
          the Navigation
         -->
        <div class="navi_body"onMouseOver="NaviOver()" onMouseOut="Navi()">
			<div class="navi_head">
				<div style="width:100%; margin-left:auto; margin-right:auto;">
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
					
				</div>
			</div>
		</div>
      </div>

		
		<!-- 
		background
		 -->
		 <div id="wrapper" style="position:relative;">
		 <div id="container">
		   
		   <%
		   List<String[]> albums = QueryService.queryAlbum();
		   int count = 0;
			for(int i = 1; i <= albums.size(); i++) {
				++count;					
				
				List<String[]> tracks = QueryService.queryTrack(i);
				
				int tcount = 0;
				for(int j = 0; j < tracks.size(); j++) {
					String[] track = tracks.get(j);
					
					String ttitle = track[0];
					String tnumber = track[1];
					String tduration = track[2];
					String tthumb = track[3];
					String musicFile = track[4];
					String filename=musicFile.replaceAll("\\\\", "/");
					++tcount;
			%>
		   
		    <div class="grid">
		        <div class="imgholder">
		           <div class="box">
		              <div class="box-img">
		                 <img class="lazy" src="picture/pixel.gif" data-original=<%=tthumb %>  width="375"> 
		              </div>
		              <div class="box-content">
		                  <h4 class="title"><%=tnumber + " " + ttitle %></h4>
		                  <p class="description">this song is for the best people.they belive in love.</p>
		              </div>
		           </div>
		        </div>
		        <strong><%=tnumber + " " + ttitle %></strong>
		        <p><%=tduration %> </p>
		        <div class="meta">
		           <a href=<%=musicFile %>><img src="picture/play2.png" width="31" height="26"  /></a>
		           <img type="submit" src="picture/download.png"  onclick="window.open('Download.jsp?fileName=<%=filename %>')">
		        </div>
		    </div>
		    <% 
				  }
				}
			%>

		  </div>
		 </div>
		 
		 <!-- 
		 hide util the page is down
		  -->
		 <div id="test" style="display:none;">
		     <%
		   List<String[]> albums2 = QueryService.queryAlbum();

		   int count2 = 0;
			for(int i = 1; i <= albums2.size(); i++) {
				++count2;						
				
				List<String[]> tracks2 = QueryService.queryTrack(i);
				
				int tcount2 = 0;
				for(int j = 0; j < tracks2.size(); j++) {
					String[] track2 = tracks2.get(j);
					
					String ttitle2 = track2[0];
					String tnumber2 = track2[1];
					String tduration2 = track2[2];
					String tthumb2 = track2[3];
					String musicFile2 = track2[4];
					String filename2=musicFile2.replaceAll("\\\\", "/");
					++tcount2;
			%>
		   
		    <div class="grid">
		        <div class="imgholder">
		           <div class="box">
		              <div class="box-img">
		                 <img class="lazy" src="picture/pixel.gif" data-original=<%=tthumb2 %> width="375"> 
		              </div>
		              <div class="box-content">
		                  <h4 class="title"><%=tnumber2 + " " + ttitle2 %></h4>
		                  <p class="description">this song is for the best people.they belive in love.</p>
		              </div>
		           </div>
		        </div>
		        <strong><%=tnumber2 + " " + ttitle2 %></strong>
		        <p><%=tduration2 %> </p>
		        <div class="meta">
		           <a href=<%=musicFile2 %>><img src="picture/play2.png" width="31" height="26" /></a>
		           <img type="submit" src="picture/download.png"  onclick="window.open('Download.jsp?fileName=<%=filename2 %>')">
		        </div>
		    </div>
		    <% 
				  }
				}
			%>
		      
		  </div>
		 
		
		
	

<script type="text/javascript">
         $(function(){
	         $("img.lazy").lazyload({		
		          load:function(){
			          $('#container').BlocksIt({
				         numOfCol:5,
				         offsetX: 8,
				         offsetY: 8
			          });
		           }
	          });	
	          $(window).scroll(function(){
		            if ($(document).height() - $(this).scrollTop() - $(this).height()<50){
			             $('#container').append($("#test").html());		
			             $('#container').BlocksIt({
				              numOfCol:5,
				              offsetX: 8,
				              offsetY: 8
			             });
			             $("img.lazy").lazyload();
		             }
	           });
	
	           //window resize
	           var currentWidth = 1100;
	           $(window).resize(function() {
		           var winWidth = $(window).width();
		           var conWidth;
		           if(winWidth < 660) {
			          conWidth = 440;
			          col = 2
		           } else if(winWidth < 880) {
			          conWidth = 660;
			          col = 3
		           } else if(winWidth < 1100) {
			          conWidth = 880;
			          col = 4;
		           } else {
			          conWidth = 1100;
			          col = 5;
		           }
		
		           if(conWidth != currentWidth) {
			           currentWidth = conWidth;
			           $('#container').width(conWidth);
			           $('#container').BlocksIt({
				           numOfCol: col,
				           offsetX: 8,
				           offsetY: 8
			           });
		           }
	            });
           });
           </script>
<div style="position:fixed; left:0px;top:5px;">
	   <a href="javascript:;" onClick="javascript :history.back(-1);"><img src="picture/back.png" border="0" title="返回上一页"></a>
	</div>
 
</body>
</html>