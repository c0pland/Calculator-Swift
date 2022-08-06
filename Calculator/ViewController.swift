import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var displayLabel: UILabel!
	private var isFinishedTyping = true
	
	
	@IBAction func calcButtonPressed(_ sender: UIButton) {
		//What should happen when a non-number button is pressed
		isFinishedTyping = true
		guard let number = Double(displayLabel.text!) else {
			fatalError("Error converting displayLabel to double")
		}
		if let calcMethod = sender.currentTitle {
			switch calcMethod {
			case "+/-":
				displayLabel.text = String(number * -1)
			case "AC":
				displayLabel.text = "0"
			case "%":
				displayLabel.text = String(number * 0.01)
			default:
				break
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
				displayLabel.text! += numValue
			}
		}
	}
}

