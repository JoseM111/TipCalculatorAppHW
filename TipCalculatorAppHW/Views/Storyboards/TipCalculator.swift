import Foundation

class TipCalculator {
    // MARK: @Properties
    var amountBeforeTax: Double = 0
    var tipAmt: Double = 0
    var tipPct: Double = 0
    var totalAmt: Double = 0
    
    init(amountBeforeTax: Double, tipPct: Double) {
        self.amountBeforeTax = amountBeforeTax
        self.tipPct = tipPct
    }
    
    // Calculates the tip amount
    func calculateTip() {
        tipAmt = amountBeforeTax * tipPct
        totalAmt = tipAmt + amountBeforeTax
        
        printf("$Bill total with tip%: \(roundTo(value: totalAmt))")
    }
}
