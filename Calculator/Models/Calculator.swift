import UIKit

struct Calculator {
	private var number: Double?
	private var intermediateOperation: (operation: String, number: Double)?
	mutating func setNumber(_ number: Double) {
		self.number = number
	}
	
	mutating func calculate(calcMethod: String) -> Double? {
		if let n = number {
			switch calcMethod {
			case "+/-":
				return n * -1
			case "AC":
				return 0
			case "%":
				return n * 0.01
			case "=":
				return performCalculation(n2: n)
			default:
				self.intermediateOperation = (operation: calcMethod, number: n)
			}
		}
		return nil
	}
	
	private func performCalculation(n2: Double) -> Double? {
		guard let n1 = intermediateOperation?.number, let operation = intermediateOperation?.operation else {return nil}
		switch operation {
		case "+":
			return n1 + n2
		case "-":
			return n1 - n2
		case "×":
			return n1 * n2
		case "÷":
			return n1 / n2
		default:
			fatalError("Unknown operation")
		}
	}
}
