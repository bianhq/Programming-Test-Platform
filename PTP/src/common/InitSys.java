package common;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import judge.Constant;
import judge.PtpJudge;
/**
 * <font face="华文楷体" color="red"> 系统初始化时，启动评判监听程序</font>
 * @author shawzt
 * @version 1.0
 * @build 2011/1/1
 *
 */
public class InitSys extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PtpJudge judge;
	private Constant constant;

	public InitSys() {
		super();
		constant = new Constant();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy();
	}

	/**
	 * Initialization of the servlet. <br>
	 * <font face="华文楷体" color="red"> 启动评判监听程序 </font>
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		try {
			this.judge = new PtpJudge();
			System.out.println("Listener is running!");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
}
