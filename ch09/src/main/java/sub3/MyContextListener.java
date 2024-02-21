package sub3;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

// 컨테이너(WAS)의 실행/종료를 감시하는 리스너
public class MyContextListener implements ServletContextListener {

	public MyContextListener() {
		System.out.println("MyContextListener()...");
	}
	
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		// 컨테이너가 실행될 때 호출
		System.out.println("contextInitialized()...");
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// 컨테이너가 종료될 때 호출
		System.out.println("contextDestroyed()...");
	}
}
