package com.spring.project.utill;

public class WordChange {
	
	public WordChange() {}
	
	public String javaScriptSpace(String str) {
		
		str = str.replace(" ", "&#32");
		str = str.replace("	", "&#09");
		str = str.replace("\r\n", "&#10");
		str = str.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
		return str;
	}

}
