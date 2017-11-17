<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.io.*, java.util.*" %>
<%@ page import="Form.Constants" %>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List all files</title>
    <link href="css/homepage.css" rel="stylesheet">
    <link href="css/navi.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="css/liststyle.css"/>
	<link href="css/bootstrap.min.css" rel="stylesheet"/>
	<script src="js/jquery.min.js"></script>
	<script src="js/list.js" type="text/javascript" charset="utf-8"></script>
    
</head>
<body>
 <div class="border" style="background:url('picture/allfiles.jpg'); position:fixed; overflow:auto; left:0px; top:0px; width:100%; height:100%;">
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
             tv show part��
       -->
   <div id="container" style="position:relative; ">
   <br/><br/>
   <div id="main" style="background-color:#FFF;">
       <div class="c1" >
       <br/>
         <p >Tv show All file</p>
       <div id="Medialist" >
           <!-- 
           <input class="search" placeholder="search"
            -->
            
            <br/><br/><p>Filter:</p>
            <ul class="filter">
                 <li class="btn" id="allshow">Show All</li>
                 <li class="btn" id="comedy">comedy</li>
                 <li class="btn" id="drama">drama</li>
                 <li class="btn" id="science">science</li>
                 <li class="btn" id="fantasy">fantasy</li>
                 <li class="btn" id="others">others</li>
            </ul>
            <ul class="list">
            <br/><br/>
            <%
             
              List<String[]> shows = QueryService.queryShow();
              
              int count = 0;
              for(int i = 0; i < shows.size(); i++) {
            	  ++count;
            	  String[] result = shows.get(i);
            	  
            	  String sname = result[0];
  		          String sgenre=result[1];
  		          String orig=result[2];
  		          String prod=result[3];
  		          String sdesc=result[4];
  		          String sthumb=result[5];
  		          
  		          String Scategory=String.valueOf(i+1);
              
            %>
                 <li>
                     <img  src=<%=sthumb %> style="width:175px;height:100%"  class="thumb"   onclick="window.location.href='episodelist.jsp?Scategory=<%=Scategory %>'"/>
                     <h1>
                     
                     <span class="name"><%=sname %></span><br/>
                     <p1>Category:</p1><p1 class="category"><%=sgenre %></p1>
                     <HR style="FILTER: alpha(opacity=100,finishopacity=0,style=2)" width="100%" color=#987cb9 SIZE=10>
                     <p2 calss="description" ><%="Description: "+sdesc %></p2>
                     </h1>
                     <p calss="description"></p>
                 </li>    
                 <%
                  }
                 %>
                
            </ul>
       </div>
       </div>
       </div>
      </div>
      
      <HR style="FILTER: alpha(opacity=100,finishopacity=0,style=3)" width="80%" color=#987cb9 SIZE=3>
      
      <!-- 
      all music 
       -->
      <div id="container" style="position:relative;">
      <div id="main" style="background-color:#FFF;">
       <div class="c1">
       <br/>
         <p >Music: All file</p>
       <div id="Medialist2">
           <!-- 
           <input class="search" placeholder="search"
            -->
            
            <br/><br/><p>Filter:</p>
            <ul class="filter">
                 <li class="btn" id="allmusic">Show All</li>
                 <li class="btn" id="rap">Rap</li>
                 <li class="btn" id="pop">Pop</li>
                 <li class="btn" id="RnR">Rock&Roll</li>
                 
            </ul>
            <ul class="list">
            <br/><br/>
            <%
                List<String[]> albums = QueryService.queryAlbum();
			
			    count = 0;
			    for(int i = 0; i < albums.size(); i++) {
			    	++count;									
					String[] result = albums.get(i);
					
					String aname=result[0];
			        String agenre=result[1];
			        String singer=result[2];
			        String adesc=result[3];
			        String athumb=result[4];
			        
			        String Acategory=String.valueOf(i+1);
			    
            %>
                 <li>
                     <img  src=<%=athumb %>  style="width:155px;height:100%" class="thumb"  onclick="window.location.href='tracklist.jsp?Acategory=<%=Acategory %>'"/>
                     <h1>
                     <span class="name"><%=aname %></span><br/>
                     <p1>Category:</p1><p1 class="category"><%=agenre %></p1><br/>
                     <p1><%="Singer:"+singer %></p1>
                     <HR style="FILTER: alpha(opacity=100,finishopacity=0,style=2)" width="100%" color=#987cb9 SIZE=10>
                     <p2 calss="description" ><%="Description: "+adesc %></p2>
                     </h1>
                     <p calss="description"></p>
                 </li>
                 <%
                 }
                 %>
            </ul>
       </div>
       </div>
       </div>
      </div>
      
      
      
    <div style="position:fixed; left:0px;top:5px;">
	   <a href="javascript:;" onClick="javascript :history.back(-1);"><img src="picture/back.png" border="0" title="返回上一页"></a>
	</div>
	

</body>
</html>

<script type="text/javascript">
	var options = {
    		valueNames: [ 'name', 'description', 'category' ]
		};

	var featureList = new List('Medialist', options);

	$('#comedy').click(function() {
	    featureList.filter(function(item) {
	    	if (item.values().category == "comedy") {
	      		return true;
	   		} else {
	     		return false;
	   		}
	 	});
	    return false;
	});

	$('#fantasy').click(function() {
	    featureList.filter(function(item) {
	    	if (item.values().category == "fantasy") {
	     		return true;
	    	} else {
	        	return false;
	    	}
	  	});
    	return false;
	});
	$('#science').click(function() {
	    featureList.filter(function(item) {
	    	if (item.values().category == "science") {
	     		return true;
	    	} else {
	        	return false;
	    	}
	  	});
    	return false;
	});
	$('#drama').click(function() {
	    featureList.filter(function(item) {
	    	if (item.values().category == "drama") {
	     		return true;
	    	} else {
	        	return false;
	    	}
	  	});
    	return false;
	});
	$('#others').click(function() {
	    featureList.filter(function(item) {
	    	if (item.values().category == "others") {
	     		return true;
	    	} else {
	        	return false;
	    	}
	  	});
    	return false;
	});
	$('#allshow').click(function() {
	    featureList.filter();
	 	return false;
	});
</script>
<script type="text/javascript">
	var options2 = {
    		valueNames: [ 'name', 'description', 'category' ]
		};

	var featureList2 = new List('Medialist2', options2);

	$('#rap').click(function() {
	    featureList2.filter(function(item) {
	    	if (item.values().category == "Rap") {
	      		return true;
	   		} else {
	     		return false;
	   		}
	 	});
	    return false;
	});

	$('#pop').click(function() {
	    featureList2.filter(function(item) {
	    	if (item.values().category == "Pop") {
	     		return true;
	    	} else {
	        	return false;
	    	}
	  	});
    	return false;
	});
	$('#RnR').click(function() {
	    featureList2.filter(function(item) {
	    	if (item.values().category == "Rock&Roll") {
	     		return true;
	    	} else {
	        	return false;
	    	}
	  	});
    	return false;
	});
	$('#allmusic').click(function() {
	    featureList2.filter();
	 	return false;
	});
</script>