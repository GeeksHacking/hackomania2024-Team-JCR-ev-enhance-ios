//
//  ConfirmViewController.swift
//  ios-ev-enhance
//
//  Created by carson tham on 7/4/24.
//

import UIKit

class ConfirmViewController: UIViewController {

    @IBOutlet var companyName: UITextView!
    @IBOutlet var rate: UITextView!
    
    var obj: EVResponse!
    
    override func viewWillAppear(_ animated: Bool) {
        return
    }
    override func viewDidLoad() {
        populateObj()
    }
    @IBAction func confirmButton(_ sender: Any) {
        performSegue(withIdentifier: "unwindToHome", sender: self)
    }
    
    func populateObj() {
        companyName.text = obj.operator_name
        rate.text = String(obj.rate_kwh) + "/kWh"
    }
}
