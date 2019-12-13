package org.utils;

import java.util.Calendar;

import org.apache.commons.lang.StringUtils;


/**
 * @author wzd
 */
public class FileUploadUtil {
	
	private FileUploadUtil() {
		super();
	}
	
	
	/**
	 * @param fileName
	 * @return
	 */
	public static String getFileExt(String fileName){
		String ext="";
		if(StringUtils.isNotEmpty(fileName)&&
				StringUtils.contains(fileName, ".")){
			
			ext=StringUtils.substring(fileName, fileName.lastIndexOf(".")+1);
		}
		return ext;
	}
	
	
	/**
	 */
	public static String getTimeDesPath(){
		Calendar cal=Calendar.getInstance();
		
		return "/"+cal.get(Calendar.YEAR)+"/"+(cal.get(Calendar.MONTH)+1)+"/";
	}
	
}

