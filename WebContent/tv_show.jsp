<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*, java.util.*" %>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="Form.*" %>
<%@ page import="service.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Mcloud TV show</title>
      <link href="css/navi.css" rel="stylesheet" type="text/css"/>
	  <link href="css/musicstyle.css" rel="stylesheet" media="screen"/>
	  <link href="css/hoverstyle.css" rel="stylesheet" type="text/css"/>
	  <script src="js/homepage.js"></script>
	  <script type="text/javascript"src="js/jquery.min.js"></script>
	  <script type="text/javascript"src="js/jquery.lazyload.min.js"></script>
	  <script type="text/javascript"src="js/blocksit.min.js"></script>
</head>
<body>
<div class="border" style="background: url('picture/tvshow.jpg'); position:fixed; overflow:auto; left:0px; top:0px; width:100%; height:100%;">
</div>		
		<div style="position:relative;left:0px; top:-18px;width:100%;">
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
				List<String[]> shows = QueryService.queryShow();
						
				
				int count = 0;
				for(int i = 1; i <= shows.size(); i++) {
					++count;
					
					List<String[]> episodes = QueryService.queryEpisode(i);
					
					int temp = 0;
					for(int j = 0; j < episodes.size(); j++) {
						String[] episode = episodes.get(j);
						
						String epname = episode[0];
						String slable = episode[1];
						String elength = episode[2];
						String epthumb = episode[3].trim().replace(" ", "%20");
						String showFile = episode[4];
						String filename=showFile.replaceAll("\\\\", "/");	
						temp++;	
					
			%>
		   
		   
		    <div class="grid">
		        <div class="imgholder">
		          <div class="box">
		            <div class="box-img">
		               <img class="lazy" src="picture/pixel.gif" data-original="<%=epthumb %>" width="375" > 
		            </div>
		            <div class="box-content">
		                  <h4 class="title"><%=epname+" --"+slable %></h4>
		                  <p class="description"><%=slable %>this is a good movie,you deserve it.</p>
		            </div>
		          </div>
		        </div>
		        <strong><%=epname %></strong>
		        <p><%=elength %> </p>
		        <div class="meta">
		           <a href=<%=showFile %>><img src="picture/play2.png" width="31" height="26"  /></a>
		           <img type="submit" src="picture/download.png"  onclick="window.open('Download.jsp?fileName=<%=filename%>')">
		        </div>
		    </div>
		    <% 
				  }
				}
			%>

		  </div>
		 </div>
		 
		 
		 
		 
		 <div id="test" style="display:none;">
		     <%
				List<String[]> shows2 = QueryService.queryShow();
						
				
				int count2 = 0;
				for(int i = 1; i <= shows2.size(); i++) {
					++count2;
					
					List<String[]> episodes2 = QueryService.queryEpisode(i);
					
					int temp2 = 0;
					for(int j = 0; j < episodes2.size(); j++) {
						String[] episode2 = episodes2.get(j);
						
						String epname2 = episode2[0];
						String slable2 = episode2[1];
						String elength2 = episode2[2];
						String epthumb2 = episode2[3].trim().replace(" ", "%20");
						String showFile2 = episode2[4];
						String filename2=showFile2.replaceAll("\\\\", "/");	
						temp2++;	
					
			%>
		   
		   
		    <div class="grid">
		        <div class="imgholder">
		          <div class="box">
		            <div class="box-img">
		               <img class="lazy" src="picture/pixel.gif" data-original="<%=epthumb2 %>" width="375" > 
		            </div>
		            <div class="box-content">
		                  <h4 class="title"><%=epname2+" --"+slable2 %></h4>
		                  <p class="description"><%=slable2 %>this is a good movie,you deserve it.</p>
		            </div>
		          </div>
		        </div>
		        <strong><%=epname2 %></strong>
		        <p><%=elength2 %> </p>
		        <div class="meta">
		           <a href=<%=showFile2 %>><img src="picture/play2.png" width="31" height="26"  /></a>
		           <img type="submit" src="picture/download.png"  onclick="window.open('Download.jsp?fileName=<%=filename2%>')">
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
			       // 
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