package toy;

import org.springframework.context.support.GenericXmlApplicationContext;

public class Main2 {
	public static void main(String[] args) {
		
		GenericXmlApplicationContext context = 
				new GenericXmlApplicationContext("classpath:toy-context.xml");
		
		// 스프링 컨테이너에서 Toy와 Battery(AA)는 스프링 빈으로 등록되어 있다
		// Toy가 가지는 의존성도 주입시킨 상태이다 (생성자 매개변수 or setter)
		// 따라서 모든 준비가 끝난 객체를 불러오기 때문에 곧바로 원하는 내용을 정상적으로 수행할 수 있다
		
		Toy toy = context.getBean(Toy.class);
		toy.run();
		
		context.close();
	}
}
