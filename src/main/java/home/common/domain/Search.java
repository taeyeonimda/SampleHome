package home.common.domain;

public class Search extends Pagination{
	private String searchType;
	private String keyword;
	
	public String toString() {
		return searchType + " " + keyword;
	}
	
	public String getSearchType() {
		return searchType;
	}
	
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	
	public String getKeyword() {
		return keyword;
	}
	
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}	
}
