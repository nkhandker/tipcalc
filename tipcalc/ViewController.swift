import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipPercent: UISegmentedControl!
    
    @IBOutlet weak var background: UIView!
    
    @IBOutlet weak var logo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        self.logo.alpha = 1;
        /*tipLabel.center.y  -= view.bounds.height
        tipPercent.center.y -= view.bounds.height
        totalLabel.center.y -= view.bounds.height
        background.center.y  -= view.bounds.height
        billField.center.y = view.center.y*/
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
 
    @IBAction func onEditingChanged(sender: AnyObject) {
        
        
        if billField.text.isEmpty == false {
        
            totalLabel.hidden = false
            tipLabel.hidden = false
            tipPercent.hidden = false
            background.hidden = false
            UIView.animateWithDuration(0.4, animations: {
            self.logo.alpha = 0
        })
            
        }
            
        else if billField.text.isEmpty {
            
            totalLabel.hidden = true
            tipLabel.hidden = true
            tipPercent.hidden = true
            background.hidden = true
            UIView.animateWithDuration(0.4, animations: {
                self.logo.alpha = 1
            })
        }
        
        var tipPercentages = [0.1, 0.15, 0.2]
        var percent = tipPercentages[tipPercent.selectedSegmentIndex]
        var billAmount = (billField.text as NSString).doubleValue
        var tip = billAmount * percent
        var total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f" , tip)
        totalLabel.text = String(format: "$%.2f" , total)
    }

    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

