//
//  
//

import UIKit

class ViewController: UIViewController {
    var cService : ClaimService!
    var title_lbl: UILabel!
    var claim_Lbl: UILabel!
    var date_Lbl: UILabel!
    var claim_Text: UITextField!
    var date_Text: UITextField!
    var addBtn : UIButton!
    var status_Lbl: UILabel!
    var status_Text: UITextField!
    
    @objc func add(sender: UIButton) {
        cService = ClaimService()
        if claim_Text.text?.count != 0 && date_Text.text?.count != 0{
            let cObj = Claim(title_: claim_Text.text!, date_: date_Text.text!)
            cService.addClaim(pObj: cObj, completion: {result in
                DispatchQueue.main.async {
                    self.claim_Text.text = ""
                    self.date_Text.text = ""
                    self.status_Text.text = result
                }
            })
        }
        else {
            status_Text.text = "Title/Date are empty"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = UIView()
        view.backgroundColor = .white
        
        //creation of title label properties
        title_lbl = UILabel()
        title_lbl.translatesAutoresizingMaskIntoConstraints = false
        title_lbl.textAlignment = .center
        title_lbl.text = "Please Enter Claim Information"
        title_lbl.font = UIFont(name: "Georgia-Bold", size: 18)
        view.addSubview(title_lbl)
        
        //claim label properties
        claim_Lbl = UILabel()
        claim_Lbl.translatesAutoresizingMaskIntoConstraints = false
        claim_Lbl.textAlignment = .left
        claim_Lbl.text = "Claim Title"
        view.addSubview(claim_Lbl)
        
        //claim text field properties
        claim_Text = UITextField()
        claim_Text.translatesAutoresizingMaskIntoConstraints = false
        claim_Text.placeholder = "Enter Claim Title"
        view.addSubview(claim_Text)
        
        //date label properties
        date_Lbl = UILabel()
        date_Lbl.translatesAutoresizingMaskIntoConstraints = false
        date_Lbl.textAlignment = .left
        date_Lbl.text = "Date"
        view.addSubview(date_Lbl)
        
        //date input label properties
        date_Text = UITextField()
        date_Text.translatesAutoresizingMaskIntoConstraints = false
        date_Text.placeholder = "MM-DD-YYYY"
        view.addSubview(date_Text)
        
        //addButton properties
        addBtn = UIButton()
        addBtn.translatesAutoresizingMaskIntoConstraints = false
        addBtn.setTitle("Add", for: .normal)
        addBtn.setTitleColor(.black, for: .normal)
        view.addSubview(addBtn)
        
        //status label properties
        status_Lbl = UILabel()
        status_Lbl.translatesAutoresizingMaskIntoConstraints = false
        status_Lbl.textAlignment = .left
        status_Lbl.text = "Status:"
        view.addSubview(status_Lbl)
        
        status_Text = UITextField()
        status_Text.translatesAutoresizingMaskIntoConstraints = false
        status_Text.placeholder = "<Status Message>"
        status_Text.sizeToFit()
        view.addSubview(status_Text)
        
        //layout anchors
        NSLayoutConstraint.activate([
            title_lbl.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            title_lbl.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            title_lbl.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            claim_Lbl.topAnchor.constraint(equalTo: title_lbl.bottomAnchor, constant: 15),
            claim_Lbl.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            claim_Lbl.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.3),
            
            claim_Text.topAnchor.constraint(equalTo: title_lbl.bottomAnchor, constant: 15),
            claim_Text.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            claim_Text.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.7),
            
            date_Lbl.topAnchor.constraint(equalTo: claim_Lbl.bottomAnchor, constant: 10),
            date_Lbl.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            date_Lbl.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.3),
            
            date_Text.topAnchor.constraint(equalTo: claim_Text.bottomAnchor, constant: 10),
            date_Text.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            date_Text.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.7),
            
            addBtn.topAnchor.constraint(equalTo: date_Lbl.bottomAnchor, constant: 15),
            addBtn.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            status_Lbl.topAnchor.constraint(equalTo: addBtn.bottomAnchor, constant: 15),
            status_Lbl.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            status_Lbl.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.3),
            
            status_Text.topAnchor.constraint(equalTo: addBtn.bottomAnchor, constant: 15),
            status_Text.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            status_Text.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.7)
            ])
        
        addBtn.addTarget(self, action: #selector(add), for: .touchUpInside)
    }
    
    
}

