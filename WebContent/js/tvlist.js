/**
 * 
 */
 function edit() {
	 
     $("#myModal").modal();
 }
 
 function submit() {
	 
	 var path = $("#path").html();
	 	 
	 var sname = $("#sname").val();
	 var genre = $("#genre").val();
	 var orig = $("#orig").val();
	 var prod = $("#prod").val();
	 var desc = $("#desc").val();
	 
	 var data = "path=" + path + "&" + "sname=" + sname + "&" +"genre="+genre+"&"+ "orig=" + orig + "&" + "prod=" + prod + "&" + "sdesc=" + desc;
	 
	 $.ajax({url : "EditShow", data : data, success : function (data) {
		 $("#text_sname").html(data.sname);
		 $("#text_genre").html(data.genre);
		 $("#text_director").html("Director: " + data.orig);
		 $("#text_producer").html("Producer: " + data.prod);
		 $("#text_desc").html(data.sdesc);
		 
		 $("#sname").val(data.sname);
		 $("#genre").val(data.genre);
		 $("#orig").val(data.orig);
		 $("#prod").val(data.prod);
		 $("#desc").val(data.sdesc);
	 }, error : "error_", dataType : "json" });
	 
 }
 
 function error_(data) {
	 console.log("error");
 }
 
 
 
 
 function edit_episode(num) {
	 
	 console.log("23333");
	 
	 var s_1 = "#epname_" + num;
	 var s_2 = "#slable_" + num;
	 var s_3 = "#elength_" + num;
	 
	 /*console.log("    %s : ", s_1);
	 console.log("    %s : ", $(s_1).html());*/
	 
	 $("#num").html(num);
	 $("#epname").val($(s_1).html());
	 $("#slable").val($(s_2).html());
	 $("#elength").val($(s_3).html());
	 
	 $("#episode_modal").modal();
 }
 
function episode_submit() {
	 
	 
	 var path = $("#path").html();
	 
	 var epname = $("#epname").val();
	 var slable = $("#slable").val();
	 var elength = $("#elength").val();
	 
	 console.log("    %s : ", epname);
	 
	 var data = "path=" + path  + "&" + "epname=" + epname + "&" + "slabel=" + slable + "&" + "elength=" + elength;
	 
	 
	 $.ajax({url : "EditEpisode", data : data, success : function (data) {
		 
		console.log("444444");
		 
		var num = $("#num").html();
		
		console.log("    %s : ", num);
		console.log("    %s : ", data.epname);
		
		var s_1 = "#epname_" + num;
		var s_2 = "#slable_" + num;
		var s_3 = "#elength_" + num;
		
		$(s_1).html(data.epname);
		$(s_2).html(data.slabel);
		$(s_3).html(data.elength);
		 
	 }, error : "error_", dataType : "json"});
 }
 
 
 