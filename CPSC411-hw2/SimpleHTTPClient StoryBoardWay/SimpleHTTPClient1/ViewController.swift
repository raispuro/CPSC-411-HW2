//
//
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    var cService : ClaimService!
    @IBOutlet weak var addBtnOutlet: UIButton!
    @IBOutlet weak var statTxt: UITextField!
    @IBOutlet weak var dateTxt: UITextField!
    @IBOutlet weak var claimTxt: UITextField!
    @IBAction func AddBtnAction(_ sender: Any) {
        
    cService = ClaimService()
        
    if claimTxt.text?.count != 0 && dateTxt.text?.count != 0{
        let cObj = Claim(title_: claimTxt.text!, date_: dateTxt.text!)
        cService.addClaim(pObj: cObj, completion: {result in
           DispatchQueue.main.async {
               self.claimTxt.text = ""
               self.dateTxt.text = ""
               self.statTxt.text = result
            }
        })
       }
       else {
           statTxt.text = "Title/date are empty"
       }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

