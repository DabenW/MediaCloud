/**
 * These functions are used to change create file and upload file's form dynamically.
 */

function tvForm(){
	var tv = document.getElementById("tv");
	var music = document.getElementById("music");
	music.style.display="none";
	tv.style.display="";
}

function musicForm(){
	var tv = document.getElementById("tv");
	var music = document.getElementById("music");
	music.style.display="";
	tv.style.display="none";
	
}

function tvOver(){
	var tv = document.getElementById("upload_tv");
	tv.src="picture/tvOver.png";
}

function tvOut(){
	var tv = document.getElementById("upload_tv");
	tv.src="picture/upload_tv.png";
}

function musicOver(){
	var music = document.getElementById("upload_music");
	music.src="picture/musicOver.png";
}

function musicOut(){
	var music = document.getElementById("upload_music");
	music.src="picture/upload_music.png";
}

function isShowEmpty(){
	if($("#sname").val()==""){
		alert("The name of the show can't be empty!");
		$("#sname").focus();
		return false;
	}
	if($("#genre").val()==""){
		alert("The genre of the show can't be empty!");
		$("#genre").focus();
		return false;
	}
	if($("#orig").val()==""){
		alert("The director can't be empty!");
		$("#orig").focus();
		return false;
	}
	if($("#prod").val()==""){
		alert("The producer can't be empty!");
		$("#prod").focus();
		return false;
	}
	if($("#sdesc".val()=="")){
		alert("The description can't be empty!");
		$("#sdesc").focus();
		return false;
	}
	if($("#sthumb").val()==""){
		alert("The show thumb can't be empty!");
		$("#sthumb").focus();
		return false;
	}
	return true;
}

function isEpisodeEmpty(){
	if($("#showLists").val()==""){
		alert("Please create TV show directory first!");
		$("#showLists").focus();
		return false;
	}
	if($("#epname").val()==""){
		alert("The name of episode can't be empty!");
		$("#epname").focus();
		return false;
	}
	if($("#slabel").val()==""){
		alert("The season number of episode can't be empty!");
		$("#slabel").focus();
		return false;
	}
	if($("#elength").val()==""){
		alert("The length of episode can't be empty!");
		$("#elength").focus();
		return false;
	}
	if($("#epthumb").val()==""){
		alert("The episode thumb can't be empty!");
		$("#epthumb").focus();
		return false;
	}
	if($("#showfile").val()==""){
		alert("The show file can't be empty!");
		$("#showfile").focus();
		return false;
	}
	return true;
}

function isAlbumEmpty(){
	if($("#aname").val()==""){
		alert("The album name can't be empty!");
		$("#aname").focus();
		return false;
	}
	if($("#mgenre").val()==""){
		alert("The album genre can't be empty!");
		$("#mgenre").focus();
		return false;
	}
	if($("#singer").val()==""){
		alert("The singer can't be empty!");
		$("#singer").focus();
		return false;
	}
	if($("#adesc").val()==""){
		alert("The description can't be empty!");
		$("#adesc").focus();
		return false;
	}
	if($("#athumb").val()==""){
		alert("The album thumb can't be empty!");
		$("#athumb").focus();
		return false;
	}
	return true;
}

function isTrackEmpty(){
	if($("#albumLists").val()==""){
		alert("Please create album directory first!");
		$("#albumLists").focus();
		return false;
	}
	if($("#ttitle").val()==""){
		alert("The track title can't be empty!");
		$("#ttitle").focus();
		return false;
	}
	if($("#tnumber").val()==""){
		alert("The track number can't be empty!");
		$("#tnumber").focus();
		return false;
	}
	if($("#tduration").val()==""){
		alert("The track duration can't be empty!");
		$("#tduration").focus();
		return false;
	}
	if($("#tthumb").val()==""){
		alert("The track picture can't be empty!");
		$("#tthumb").focus();
		return false;
	}
	if($("#musicfile").val()==""){
		alert("The music file can't be empty!");
		$("#musicfile").focus();
		return false;
	}
	return true;
}