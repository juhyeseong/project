package toy;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;

public class Clock {

	@Autowired	// 스프링 빈 중에서 자료형이 맞는 객체가 있으면 자동으로 연결시켜준다
	private AAA battery; // = null;
	
	public void run() {
		if(battery != null) {
			String time = new SimpleDateFormat("a hh:mm").format(new Date());
			System.out.println(time);
		}
		else {
			System.err.println("배터리가 부족합니다");
		}
	}
}
