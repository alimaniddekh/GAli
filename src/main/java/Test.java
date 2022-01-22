import beans.*;
import service.MachineService;
import service.SalleService;

public class Test {

	public static void main(String[] args) {

		
		SalleService ss= new SalleService();
		System.out.println(ss.findById(29));
	}
}
