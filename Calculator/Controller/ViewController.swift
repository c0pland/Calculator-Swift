import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var displayLabel: UILabel!
	private var calculator = Calculator()
	private var isFinishedTyping = true
	private var displayValue: Double {
		get {
			guard let doubleNumber = Double(displayLabel.text!) else {
				fatalError("Error converting displayLabel to double")
			}
			return doubleNumber
		}
		set {
			displayLabel.text = String(format: "%g", newValue)
		}
	}
	
	@IBAction func calcButtonPressed(_ sender: UIButton) {
		//What should happen when a non-number button is pressed
		isFinishedTyping = true
		calculator.setNumber(displayValue)
		if let calcMethod = sender.currentTitle {
			if let result = calculator.calculate(calcMethod: calcMethod) {
				displayValue = result
			}
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
