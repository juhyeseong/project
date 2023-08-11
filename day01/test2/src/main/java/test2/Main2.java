package test2;

import java.util.Date;

import org.springframework.context.support.GenericXmlApplicationContext;

public class Main2 {
	public static void main(String[] args) {
		GenericXmlApplicationContext context = 
				new GenericXmlApplicationContext("classpath:context.xml");
		
		Today t1 = context.getBean(Today.class);
		// context.xml 에 설정된 객체 중 Today 클래스로 작성된 객체를 가져온다
		// 해당 클래스로 작성된 객체는 하나뿐이라서, 객체 이름을 명시하지 않아도 된다
		
		Today t2 = context.getBean("t3", Today.class);
		// 만약, 지정한 클래스의 객체가 여러개라면, 객체의 이름(id)을 지정해서 불러올 수 있다
		
		System.out.println(t1.getName());
		System.out.println(t2.getName());
		System.out.println();
		
		Date d1 = t1.getDate();
		Date d2 = t2.getDate();
		
		System.out.println(d1 == d2);
		System.out.println(t1 == t2);
		context.close();
		
	}
}
