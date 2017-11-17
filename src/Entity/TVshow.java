package Entity;

public class TVshow {

	//name of tvshow
	private String sname;
	
	//genre of tvshow
	private String genre;
	
	//director of tvshow
	private String orig;
	
	//producer of tvshow
	private String prod;
	
	//description of tvshow
	private String sdesc;
	
	//picture of tvshow
	private String sthumb;
	
	public TVshow(String sname, String genre,String orig, String prod, String sdesc, String sthumb) {
		this.sname = sname;
		this.genre=genre;
		this.orig = orig;
		this.prod = prod;
		this.sdesc = sdesc;
		this.sthumb = sthumb;
	}
	
	public TVshow() {
	}
	
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getGenre(){
		return genre;
	}
	public void setGenre(String genre){
		this.genre=genre;
	}
	public String getOrig() {
		return orig;
	}
	public void setOrig(String orig) {
		this.orig = orig;
	}
	public String getProd() {
		return prod;
	}
	public void setProd(String prod) {
		this.prod = prod;
	}
	public String getSdesc() {
		return sdesc;
	}
	public void setSdesc(String sdesc) {
		this.sdesc = sdesc;
	}
	public String getSthumb() {
		return sthumb;
	}
	public void setSthumb(String sthumb) {
		this.sthumb = sthumb;
	}
}