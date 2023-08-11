package toy;

public class Toy {

	private AA battery;
	
	public Toy(AA battery) {
		this.battery = battery;
	}
	
	public void setBattery(AA battery) {
		this.battery = battery;
	}
	
	public void run() {
		if(battery == null) {
			System.out.println("배터리가 없습니다");
			// throw new NoBatteryException();
		}
		else {
			System.out.println("장난감이 움직입니다");
		}
	}
}
