package kr.co.jboard1.dto;

public class TermsDTO {

	private String terms;
	private String privacy;
	
	public String getTerms() {
		return terms;
	}
	public void setTerms(String terms) {
		this.terms = terms;
	}
	public String getPrivacy() {
		return privacy;
	}
	public void setPrivacy(String privacy) {
		this.privacy = privacy;
	}
	
	@Override
	public String toString() {
		return "TermsDTO [terms=" + terms + ", privacy=" + privacy + "]";
	}
	
	
	
}
