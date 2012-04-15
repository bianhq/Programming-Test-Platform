/*
 * 常量类
 * 存储系统使用的常量信息
 * 作者:肖正陶
 */
package judge;

import java.util.Properties;

/**
 * <font face="华文楷体" color="red">常量类</font>
 * 
 * @author shawzt
 * @version 1.0
 * @build 2011/12/27
 * 
 */
public class Constant {
	private String information;
	private static Properties properties;
	private static String osName;

	// 以下为系统使用的编译器路径设置 [注意末尾的空格不能省略，涉及编译命令]
	public static String C_PATH;
	public static String CP_PATH;
	public static String JV_PATH;
	public static String JV_RUN;
	// 以下为待编译代码文件、生成可执行文件存储路径及代码备份目录路径
	public static String CODE_CMP;
	public static String CODE_BCK;
	// 以下为编译返回信息
	public static final int Waiting = 0;
	public static final int Judging = 1;
	public static final int Compile_error = 2;

	// 以下为运行返回信息
	public static final int Runtime_error = 0;
	public static final int Present_error = 1;
	public static final int Time_limit_exceed = 2;
	public static final int Memory_limit_exceed = 3;
	public static final int Output_limit_exceed = 4;
	public static final int Restrict_function = 5;

	public Constant() {
		this.information = "This is a constant class for initialization of variables";
		System.out.println(information);		
	}
	
	static{
		properties = System.getProperties();
		osName = properties.getProperty("os.name").toUpperCase();
		
		if (osName.startsWith("WINDOWS")) { // windows平台下的项目使用目录初始化
			C_PATH = "E:/gcc/bin/gcc.exe ";
			CP_PATH = "E:/gcc/bin/g++.exe ";
			JV_PATH = "C:/Program Files/Java/jdk1.6.0_31/bin/javac ";
			JV_RUN = "C:/Program Files/Java/jdk1.6.0_31/bin/java -classpath ";
			CODE_CMP = "E:/CODES";
			CODE_BCK = "E:/BackUp";
			System.out.println("init Constant on Windows");
		} else  if(osName.startsWith("LINUX")){
			C_PATH = "/usr/bin/gcc ";
			CP_PATH = "/usr/bin/g++ ";
			JV_PATH = "/usr/bin/javac ";
			JV_RUN = "/usr/bin/java -classpath ";
			CODE_CMP = "/home/shawzt/Documents/PTP/CODES";
			CODE_BCK = "/home/shawzt/Documents/PTP/BackUp";
			System.out.println("init Constant on Linux");
		}
	}

}
