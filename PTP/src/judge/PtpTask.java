package judge;

import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;

/**
 * <font face="华文楷体" color="red">程序在线评测核心模块之任务队列<br>
 * 	用户提交代码并在后台保存为相应待编译文件<br>
 * 	本模块将用户保存的待编译文件路径作为信息，插入任务队列中</font>
 * @author shawzt
 * @version 1.0
 *@build 2011/12/27
 */
public class PtpTask{
	/**
	 * <font face="华文楷体" color="red">任务队列</font>
	 */
	private static LinkedBlockingQueue<String[]> que = new LinkedBlockingQueue<String[]>();
	
	/**
	 * <font face="华文楷体" color="red">新增评测任务</font>
	 */
	public static void addTask(String file,String lang,String subNo,String stuNo){
		try{
			String[] task = {file,lang,subNo,stuNo};
			que.put(task);
			System.out.println("Success to add Task!");
		}catch(Exception e){
			System.out.println("Fail to add Task!");
			System.out.println(e.getMessage());
		}
	}
	
	/**
	 * <font face="华文楷体" color="red">取出评测任务</font>
	 * @return String[] {file,lang,subNo,stuNo}
	 */
	public static String[] getTask(){
		try{
			return que.poll(2L, TimeUnit.SECONDS);
		}catch(Exception e){
			System.out.println(e.getMessage());
			return null;
		}
	}
}

