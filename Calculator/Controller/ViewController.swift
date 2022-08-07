import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var displayLabel: UILabel!
	private var isFinishedTyping = true
	private var displayValue: Double {
		get {
			guard let doubleNumber = Double(displayLabel.text!) else {
				fatalError("Error converting displayLabel to double")
			}
			return doubleNumber
		}
		set {
			displayLabel.text = String(newValue)
		}
	}
	
	@IBAction func calcButtonPressed(_ sender: UIButton) {
		//What should happen when a non-number button is pressed
		isFinishedTyping = true
		if let calcMethod = sender.currentTitle {
			let calculator = Calculator(number: displayValue)
			guard let result = calculator.calculate(calcMethod: calcMethod) else {
				fatalError("The result of the calculation with \(calcMethod) is nil")
			}
			displayValue = result
		}
	}
	
	
	@IBAction func numButtonPressed(_ sender: UIButton) {
		//What should happen when a number is entered into the keypad
		if let numValue = sender.currentTitle {
			if isFinishedTyping {
				displayLabel.text = numValue
				isFinishedTyping = false
			} else {
				switch numValue {
				case ".":
					let isInt = floor(displayValue) == displayValue
					if !isInt {return}
				default:
					break
				}
				displayLabel.text! += numValue
			}
		}
	}
}

