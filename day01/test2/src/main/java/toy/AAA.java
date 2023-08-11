package toy;

import org.springframework.stereotype.Component;

// @Controller			: 요청을 받아서 응답 관련 내용을 반환하는 클래스
// @Service				: 웹 혹은 DB에 대해 중립적인 자바 코드를 작성하는 클래스
// @Repository			: 데이터 저장소에 접근하는 클래스(DAO)
// @Component			: 용도 불특정의 스프링 빈 컴포넌트
// @ControllerAdvice	: 발생하는 Exception을 모아서 처리하는 클래스
// @RestController		: 자바스크립트에 의해 들어오는 비동기 요청을 처리하는 클래스
// @RestControllerAdvice: 비동기 요청에서 발생하는 예외를 처리하는 클래스

@Component	// 이 클래스의 객체는 스프링 빈으로 등록되어야 합니다 !! -> component-scan
public class AAA implements Battery {

	@Override
	public String toString() {
		return "AAA";
	}
}
