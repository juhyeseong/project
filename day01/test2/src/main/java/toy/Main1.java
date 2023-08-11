package toy;

public class Main1 {
	public static void main(String[] args) {
		
		Toy toy1 = new Toy(null);	// 직접 객체를 생성한다
		toy1.run();					// 의존성을 만족하지 않으면 작동하지 않는다
		
		AA battery = new AA();		// 필요한 객체도 직접 생성한다
		toy1.setBattery(battery);	// 의존성을 직접 주입한다
		toy1.run();					// 정상적으로 작동한다
		
	}
}
