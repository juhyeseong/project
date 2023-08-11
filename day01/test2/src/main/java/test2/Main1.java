package test2;

import java.util.Date;

public class Main1 {
	public static void main(String[] args) {
		
		Today t1 = new Today();		// 메인 함수 시작 이후 객체를 생성하면 느리다
		Date d1 = t1.getDate();
		System.out.println(d1);
		
		Today t2 = new Today();		// 싱글톤이 아니라서, 메모리 낭비가 발생한다
		Date d2 = t2.getDate();
		System.out.println(d2);
		
		System.out.println();
		System.out.println(t1 == t2);	// 내가 만든 클래스 Today에 의해 생성된 서로 다른 객체
		System.out.println(d1 == d2);	// java.util.Date에 의해 생성된 서로 다른 객체
		System.out.println(d1.toString().equals(d2.toString()));
		// 그러나 표시되는 내용은 동일하다
		
	}
}

