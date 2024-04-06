//
//  utils.swift
//  ios-ev-enhance
//
//  Created by carson tham on 7/4/24.
//

import Foundation

func populateTable(arr: inout[Charger]){
    
    let charger1 = Charger(company_operator: "SP Group", location: "Marina Square", distance: "0.3km")
    let charger2 = Charger(company_operator: "Charge+" , location: "CapitaGreen", distance: "0.45km")
    let charger3 = Charger(company_operator: "ChargeNow",location: "CapitaSpring", distance: "0.58km")
    let charger4 = Charger(company_operator: "Shell Recharge", location: "Republic Plaza", distance: "0.64km")
    
    let charger5 = Charger(company_operator: "SP Group", location: "SBF Centre", distance: "0.68km")
    let charger6 = Charger(company_operator: "Charge+" , location: "ParkRoyal", distance: "0.70km")
    let charger7 = Charger(company_operator: "ChargeNow",location: "UIC Building", distance: "0.71km")
    let charger8 = Charger(company_operator: "Shell Recharge", location: "CapitaSky", distance: "0.80km")
    
    // Add sample charger objects to the array
    arr.append(contentsOf: [charger1, charger2, charger3, charger4, charger5, charger6, charger7, charger8])
}
