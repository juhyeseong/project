package toy;

import org.springframework.context.support.GenericXmlApplicationContext;

public class Main3 {
	public static void main(String[] args) {
		
		// 의존성을 주입하지 않은 일반 객체는 직접 의존성을 처리해야만 한다
		Clock clock = new Clock();
		clock.run();
		
		System.out.println("=====================");
		
		// 스프링 컨테이너(IoC) 내부의 스프링 빈을 불러오기 위한 context 객체
		GenericXmlApplicationContext context = 
				new GenericXmlApplicationContext("classpath:toy-context.xml");
		
		Clock clock2 = context.getBean(Clock.class);
		clock2.run();
		
		context.close();
	}
}
