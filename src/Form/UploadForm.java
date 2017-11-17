package Form;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class UploadForm {

	public static boolean isAdd;
	
	public static Map<String, String> parseRequest(HttpServletRequest request, String path, String type){
		if(path.endsWith("\\") || path.endsWith("/")){
			File tv = new File(path+"tvshow");
			if(!tv.exists()){
				tv.mkdir();
			}
			File music = new File(path+"music");
			if(!music.exists()){
				music.mkdir();
			}
			isAdd = true;
		}else{
			File tv = new File(path+"\\tvshow");
			if(!tv.exists()){
				tv.mkdir();
			}
			File music = new File(path+"\\music");
			if(!music.exists()){
				music.mkdir();
			}
			isAdd = false;
		}
		
		Map<String, String> form = new HashMap<String,String>();

		DiskFileItemFactory factory = new DiskFileItemFactory(); 

		ServletFileUpload sfu = new ServletFileUpload(factory);
		sfu.setFileSizeMax(1024*1024*50);
		
		try { 
			List<FileItem> items = sfu.parseRequest(request); 
			//Retrieve form fields
			for (int i = 0; i < items.size(); i++) { 
				FileItem item = items.get(i);
				if(item.isFormField()){
					form.put(item.getFieldName(), item.getString());
				}
			} 
			//Retrieve picture of media files from form
			for (int i=0; i<items.size(); i++){
				FileItem item = items.get(i); 
	
				if(!item.isFormField()){ 
					//Process media files of create TV show's form
					if(type.equals("createShowForm")){
						File showdir = null;
						if(isAdd == true){
							showdir = new File(path+"tvshow\\"+form.get("sname"));
						}else{
							showdir = new File(path+"\\tvshow\\"+form.get("sname"));
						}
						if(!showdir.exists()){
							showdir.mkdir();
						}
						
						String sthumb = null;
						if(isAdd == true){
							sthumb = path+"tvshow\\" + form.get("sname") + "\\"+"folder.jpg";
						}else{
							sthumb = path+"\\tvshow\\" + form.get("sname") + "\\"+"folder.jpg";
						}
						File showThumb = new File(sthumb);
						if(!showThumb.exists()){
							showThumb.createNewFile();
						}
						item.write(showThumb);
						form.put("sthumb", "tvshow\\" + form.get("sname") + "\\"+"folder.jpg");
					}else if(type.equals("createAlbumForm")){//Process media files of create album's form 
						File aldir = null;
						if(isAdd == true){
							aldir = new File(path+"music\\"+form.get("aname"));
						}else{
							aldir = new File(path+"\\music\\"+form.get("aname"));
						}
						if(!aldir.exists()){
							aldir.mkdir();
						}
						
						String athumb = null;
						if(isAdd == true){
							athumb = path+"music\\" + form.get("aname") + "\\"+"folder.jpg";
						}else{
							athumb = path+"\\music\\" + form.get("aname") + "\\"+"folder.jpg";
						}
						File albumThumb = new File(athumb);
						if(!albumThumb.exists()){
							albumThumb.createNewFile();
						}
						item.write(albumThumb);
						form.put("athumb", "music\\" + form.get("aname") + "\\"+"folder.jpg");
					}else if(type.equals("episodeForm")){//Process media files of upload episodes' form 
						File epdir = null;
						if(isAdd == true){
							epdir = new File(path+"tvshow\\"+form.get("showLists").substring(form.get("showLists").indexOf("_")+1)+"\\"+form.get("epname"));
						}else{
							epdir = new File(path+"\\tvshow\\"+form.get("showLists").substring(form.get("showLists").indexOf("_")+1)+"\\"+form.get("epname"));
						}
						
						
						if(!epdir.exists()){
							epdir.mkdir();
						}
						if(item.getFieldName().equals("epthumb")){	
							String epthumb = null;
							if(isAdd == true){
								epthumb = path+"tvshow\\"+form.get("showLists").substring(form.get("showLists").indexOf("_")+1)+"\\"+form.get("epname")+"\\"+"folder.jpg";
							}else{
								epthumb = path+"\\tvshow\\"+form.get("showLists").substring(form.get("showLists").indexOf("_")+1)+"\\"+form.get("epname")+"\\"+"folder.jpg";
							}
							
							File episodeThumb = new File(epthumb);
							if(!episodeThumb.exists()){
								episodeThumb.createNewFile();
							}
							item.write(episodeThumb);
							form.put("epthumb", "tvshow\\"+form.get("showLists").substring(form.get("showLists").indexOf("_")+1)+"\\"+form.get("epname")+"\\"+"folder.jpg");
						}else if(item.getFieldName().equals("showfile")){
							String epfile = null;
							if(isAdd == true){
								epfile = path+"tvshow\\"+form.get("showLists").substring(form.get("showLists").indexOf("_")+1)+"\\"+form.get("epname")+"\\"+form.get("slabel")+"-"+form.get("epname")+".mp4";
							}else{
								epfile = path+"\\tvshow\\"+form.get("showLists").substring(form.get("showLists").indexOf("_")+1)+"\\"+form.get("epname")+"\\"+form.get("slabel")+"-"+form.get("epname")+".mp4";
							}
							
							File episodefile = new File(epfile);
							if(!episodefile.exists()){
								episodefile.createNewFile();
							}
							item.write(episodefile);
							form.put("showfile", "tvshow\\"+form.get("showLists").substring(form.get("showLists").indexOf("_")+1)+"\\"+form.get("epname")+"\\"+form.get("slabel")+"-"+form.get("epname")+".mp4");
						}
					}else if(type.equals("musicForm")){//Process media files of upload tracks' form 
						File trdir = null;
						if(isAdd == true){
							trdir = new File(path+"music\\"+form.get("albumLists").substring(form.get("albumLists").indexOf("_")+1)+"\\"+form.get("ttitle"));
						}else{
							trdir = new File(path+"\\music\\"+form.get("albumLists").substring(form.get("albumLists").indexOf("_")+1)+"\\"+form.get("ttitle"));
						}
						if(!trdir.exists()){
							trdir.mkdir();
						}
						
						if(item.getFieldName().equals("tthumb")){
							  String tthumb=null;
							   
							  if(isAdd == true){
									tthumb = path+"music\\"+form.get("albumLists").substring(form.get("albumLists").indexOf("_")+1)+"\\"+form.get("ttitle")+"\\"+"folder.jpg";
								}else{
									tthumb = path+"\\music\\"+form.get("albumLists").substring(form.get("albumLists").indexOf("_")+1)+"\\"+form.get("ttitle")+"\\"+"folder.jpg";
								}
							  
							  File trackThumb = new File(tthumb);
								if(!trackThumb.exists()){
									trackThumb.createNewFile();
								}
								item.write(trackThumb);
								form.put("tthumb", "music\\"+form.get("albumLists").substring(form.get("albumLists").indexOf("_")+1)+"\\"+form.get("ttitle")+"\\"+"folder.jpg");
						}else if(item.getFieldName().equals("musicfile")){
							    String trfile = null;
							    if(isAdd == true){
								    trfile = path+"music\\"+form.get("albumLists").substring(form.get("albumLists").indexOf("_")+1)+"\\"+form.get("ttitle")+"\\"+form.get("tnumber")+"-"+form.get("ttitle")+".mp3";
							    }else{
								    trfile = path+"\\music\\"+form.get("albumLists").substring(form.get("albumLists").indexOf("_")+1)+"\\"+form.get("ttitle")+"\\"+form.get("tnumber")+"-"+form.get("ttitle")+".mp3";
							    }		
							    File trackfile = new File(trfile);
							    if(!trackfile.exists()){
							     trackfile.createNewFile();
							    }
						       item.write(trackfile);
					   	       form.put("musicfile", "music\\"+form.get("albumLists").substring(form.get("albumLists").indexOf("_")+1)+"\\"+form.get("ttitle")+"\\"+form.get("tnumber")+"-"+form.get("ttitle")+".mp3");
						}
					}
				} 
			}
		} catch (Exception e) { 
			e.printStackTrace(); 
		} 
		
		return form;
	}
}
