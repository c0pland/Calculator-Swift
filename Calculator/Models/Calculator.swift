import UIKit

struct Calculator {
	var number: Double
	
	init(number: Double) {
		self.number = number
	}
	
	 func calculate(calcMethod: String) -> Double? {
		switch calcMethod {
		case "+/-":
			return number * -1
		case "AC":
			return 0
		case "%":
			return number * 0.01
		default:
			return nil
		}
	}
}
