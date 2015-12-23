import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipPercent: UISegmentedControl!
    
    @IBOutlet weak var background: UIView!
    
    @IBOutlet weak var logo: UILabel!
    
    @IBOutlet weak var placeholder: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // swipe recognition does same thing as tapping
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: "onTap:")
        swipeDown.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(swipeDown)
        
        //initial setup for labels fields and logo
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        self.logo.alpha = 0;
        tipLabel.center.y  -= view.bounds.maxY
        tipPercent.center.y -= view.bounds.maxY
        totalLabel.center.y -= view.bounds.maxY
        background.center.y  -= view.bounds.maxY
        billField.center.y = view.center.y
        billField.center.x = view.center.x
        logo.center.y = view.center.y
    }
   


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditMove(sender: AnyObject) {
        UIView.animateWithDuration(0.3, animations: {
            self.logo.alpha = 1;
        })
        UIView.animateWithDuration(0.3, delay: 0.0,  options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.billField.center.y = self.placeholder.center.y
            self.logo.center.y = self.placeholder.center.y
        }, completion: nil )
    }
  
    override func viewWillAppear(animated: Bool) {
        
    }
    
 
    @IBAction func onEditingChanged(sender: AnyObject) {
        
        let y : Bool? = billField.text!.isEmpty;
        
       
        
          if y == false {
        
            totalLabel.hidden = false
            tipLabel.hidden = false
            tipPercent.hidden = false
            background.hidden = false
            UIView.animateWithDuration(0.2, animations: {
            self.logo.alpha = 0
            self.background.alpha = 1
            self.tipPercent.alpha = 1
            self.totalLabel.alpha = 1
            self.tipLabel.alpha = 1
        })
            UIView.animateWithDuration(0.3, animations: {
                
                self.background.center.y = (self.background.bounds.height) + self.tipPercent.bounds.height
                self.tipPercent.center.y = (self.background.frame.minY + self.logo.frame.maxY)/2
                self.totalLabel.center.y = self.view.center.x - 70
                self.tipLabel.center.y   = self.totalLabel.bounds.minY + 40
                
                
            })
        }
            
        else if y == true {
            
            UIView.animateWithDuration(0.2, animations: {
                self.logo.alpha = 1
                
                self.background.alpha = 0
                self.tipPercent.alpha = 0
                self.totalLabel.alpha = 0
                self.tipLabel.alpha = 0
            })
            UIView.animateWithDuration(0.3, animations: {
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
        
        billField.text = "";
        
        onEditingChanged(self)
        UIView.animateWithDuration(0.3, delay: 0.0,  options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.billField.center.y = self.view.center.y
            self.logo.center.y = self.view.center.y
            }, completion: nil )
        view.endEditing(true)
        }

}
