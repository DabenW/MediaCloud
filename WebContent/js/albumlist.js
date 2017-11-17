/**
 * 
 */
 function edit() {
	 
     $("#myModal").modal();
 }
 
 function submit() {
	 
	 var path = $("#path").html();
	 	 
	 var aname = $("#aname").val();
	 var genre = $("#genre").val();
	 var singer = $("#singer").val();
	 var adesc = $("#adesc").val();
	 
	 var data = "path=" + path + "&" + "aname=" + aname + "&" + "genre=" + genre + "&" + "singer=" + singer + "&" + "adesc=" + adesc;
	 
	 console.log("11111");
	 
	 $.ajax({url : "EditAlbum", data : data, success : function (data) {
		 
		 /*console.log("data : %s", data.sname);
		 console.log("data : %s", data.orig);
		 console.log("data : %s", data.prod);
		 console.log("data : %s", data.sdesc);*/
//		 console.log("json : %s", data.);
		 
		 /*var raw_params = data.split("&");
		 var sname = (raw_params[0].split("="))[1];
		 var orig = (raw_params[1].split("="))[1];
		 var prod = (raw_params[2].split("="))[1];
		 var sdesc = (raw_params[3].split("="))[1];*/
		 
		 $("#text_aname").html(data.aname);
		 $("#text_genre").html("Genre: " + data.genre);
		 $("#text_singer").html("Singer: " + data.singer);
		 $("#text_adesc").html(data.adesc);
		 
		 $("#aname").val(data.aname);
		 $("#genre").val(data.genre);
		 $("#singer").val(data.singer);
		 $("#adesc").val(data.adesc);
	 }, error : "error_", dataType : "json" });
	 
	 console.log("22222");
	 
 }
 
 function error_(data) {
	 console.log("error");
 }
 
 
 
 
 function edit_track(num) {
	 
	 console.log("33333");
	 
	 var s_1 = "#tt_" + num;
	 var s_2 = "#tduration_" + num;
	 
	 var s = ($(s_1).html()).split(" ");
	 
	 /*console.log("    %s : ", s_1);
	 console.log("    %s : ", $(s_1).html());*/
	 
	 $("#num").html(num);
	 $("#ttitle").val(s[1]);
	 $("#tnumber").val(s[0]);
	 $("#tduration").val($(s_2).html());
	 
	 $("#track_modal").modal();
 }
 
function track_submit() {
	 
	 
	 var path = $("#path").html();
	 
	 var ttitle = $("#ttitle").val();
	 var tnumber = $("#tnumber").val();
	 var tduration = $("#tduration").val();
	 
//	 console.log("    %s : ", epname);
	 
	 var data = "path=" + path  + "&" + "ttitle=" + ttitle + "&" + "tnumber=" + tnumber + "&" + "tduration=" + tduration;
	 
	 
	 $.ajax({url : "EditTrack", data : data, success : function (data) {
		 
		console.log("444444");
		 
		var num = $("#num").html();
		
		console.log("    %s : ", num);
     	console.log("    %s : ", data.epname);
		
		var s_1 = "#tt_" + num;
		var s_2 = "#tduration_" + num;
		
		$(s_1).html(data.tnumber + " " + data.ttitle);
		$(s_2).html(data.tduration);
		 
	 }, error : "error_", dataType : "json"});
 }
 
 
 