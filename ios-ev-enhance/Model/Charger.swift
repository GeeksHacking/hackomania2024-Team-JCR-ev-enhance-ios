//
//  Charger.swift
//  ios-ev-enhance
//
//  Created by carson tham on 7/4/24.
//

import Foundation
import UIKit

class Charger: Decodable {
    var company_operator: String
    var location: String
    var distance: String
    
    init(company_operator: String, location: String, distance: String) {
        self.company_operator = company_operator
        self.location = location
        self.distance = distance
    }
}

class ChargerCell: UITableViewCell {

    @IBOutlet weak var distance: UITextView!
    @IBOutlet weak var location: UITextView!
    @IBOutlet weak var company: UITextView!
    
    override func layoutSubviews() {
        super.layoutSubviews()

    }

}
