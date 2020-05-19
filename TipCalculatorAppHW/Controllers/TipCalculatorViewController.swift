import UIKit

class TipCalculatorViewController: UIViewController {
    // MARK: _@IBOutlet
    @IBOutlet weak var amountBeforeTipTextField: UITextField!
    @IBOutlet weak var tipPctLabel: UILabel!
    @IBOutlet weak var tipPctSlider: UISlider!
    @IBOutlet weak var splitBillLabel: UILabel!
    @IBOutlet weak var splitBillSlider: UISlider!
    @IBOutlet weak var splitEachPersonLabel: UILabel!
    @IBOutlet weak var billTotalLabel: UILabel!
    @IBOutlet weak var clearBtn: UIButton!
    @IBOutlet weak var totalView: UIView!
    @IBOutlet weak var splitView: UIView!
    
    
    // MARK: Instance of TipCalculator
    var tipCalc = TipCalculator(amountBeforeTax: 0.0, tipPct: 0.10)
    
    // MARK: Life-Cycle method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getTheCorners()
        amountBeforeTipTextField.becomeFirstResponder()
    }
    
    // MARK: _@IBAction
    /**©---------------------------------------------©*/
    @IBAction func tipValueSliderChange(_ sender: UISlider) {
        tipPctLabel.text = "Tip: \(Int(tipPctSlider.value))%"
        calculateBill()
    }
    
    @IBAction func amtBeforeTipValueChange(_ sender: UITextField) {
        calculateBill()
    }
    
    @IBAction func numberOfPeopleToSplitBillWith(_ sender: UISlider) {
        splitBillLabel.text = "Split: \(Int(splitBillSlider.value))"
        calculateBill()
    }
    
    @IBAction func clearBill(_ sender: UIButton) {
        amountBeforeTipTextField.text = ""
        billTotalLabel.text = "$0.00"
        splitEachPersonLabel.text = "$0.00"
    }
    /**©---------------------------------------------©*/
    
    // MARK: -Helper methods
    /**©---------------------------------------------©*/
    // Uses the StyleGuide which extended UIView
    // To get all the corner raidius.
    func getTheCorners() {
        clearBtn.addCornerRadius(15)
        totalView.addCornerRadius(10)
        splitView.addCornerRadius(10)
    }
    
    func calculateBill() {
        tipCalc.tipPct = Double(tipPctSlider.value) / 100
        /*-------------------------------------------------------
         NSString:--?
         A static, plain-text Unicode string object that bridges
         to String; use NSString when you need reference semantics
         or other Foundation-specific behavior.
         -------------------------------------------------------*/
        tipCalc.amountBeforeTax = (amountBeforeTipTextField.text! as NSString).doubleValue
        
        tipCalc.calculateTip()
        updateUI()
    }
    
    func updateUI() {
        billTotalLabel.text = "$\(Double(roundTo(value: tipCalc.totalAmt)))"
        let numberOfPeople = Int(splitBillSlider.value)
        let result = roundTo(value: tipCalc.totalAmt / Double(numberOfPeople))
        
        splitEachPersonLabel.text = "$\(result)"
        printf("Bill split amount: $\(result)")
    }
    /**©---------------------------------------------©*/
}// END OF CLASS
