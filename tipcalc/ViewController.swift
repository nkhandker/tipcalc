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
        tipLabel.center.y  -= view.bounds.maxY
        tipPercent.center.y -= view.bounds.maxY
        totalLabel.center.y -= view.bounds.maxY
        background.center.y  -= view.bounds.maxY
        billField.center.y = view.center.y
    }
    
    class NavigationController: UINavigationController, UIViewControllerTransitioningDelegate {
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Status bar white font
            self.navigationBar.barStyle = UIBarStyle.Black
            self.navigationBar.tintColor = UIColor.whiteColor()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  
    override func viewWillAppear(animated: Bool) {
        UIView.animateWithDuration(0.8, animations: {
           self.billField.center.y = self.logo.center.y
        })
    }
    
 
    @IBAction func onEditingChanged(sender: AnyObject) {
        
        
        if let y : Bool? = billField.text!.isEmpty == false {
        
            totalLabel.hidden = false
            tipLabel.hidden = false
            tipPercent.hidden = false
            background.hidden = false
            UIView.animateWithDuration(0.4, animations: {
            self.logo.alpha = 0
            self.background.alpha = 1
            self.tipPercent.alpha = 1
            self.totalLabel.alpha = 1
            self.tipLabel.alpha = 1
        })
            UIView.animateWithDuration(0.4, animations: {
                
                self.background.center.y = (self.background.bounds.height) + self.tipPercent.bounds.height
                self.tipPercent.center.y = (self.background.frame.minY + self.logo.frame.maxY)/2
                self.totalLabel.center.y = self.view.center.x - 70
                self.tipLabel.center.y   = self.totalLabel.bounds.minY + 40
                
                
            })
        }
            
        else if let y : Bool? = billField.text!.isEmpty {
            
            UIView.animateWithDuration(0.4, animations: {
                self.logo.alpha = 1
                
                self.background.alpha = 0
                self.tipPercent.alpha = 0
                self.totalLabel.alpha = 0
                self.tipLabel.alpha = 0
            })
            UIView.animateWithDuration(0.4, animations: {
                self.tipLabel.center.y  = self.view.bounds.maxY
                self.tipPercent.center.y = self.view.bounds.maxY
                self.totalLabel.center.y = self.view.bounds.maxY
                self.background.center.y  = self.view.bounds.maxY
            })
        }
        
        var tipPercentages = [0.1, 0.15, 0.2]
        let percent = tipPercentages[tipPercent.selectedSegmentIndex]
        let billAmount = (billField.text! as NSString).doubleValue
        let tip = billAmount * percent
        let total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f" , tip)
        totalLabel.text = String(format: "$%.2f" , total)
    }

    
    @IBAction func onTap(sender: AnyObject) {
        if billField.text!.isEmpty{
        view.endEditing(true)
        }
}
}
