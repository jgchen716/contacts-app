//
//  Contact.swift
//  app4-Jonathan-Chen
//
//  Created by Jonathan Chen on 2/22/21.
//

import Foundation
import UIKit

struct Contact {
    let firstName: String
    let lastName: String
    let company: String
    let email: String
    let phone: String
    
    var pic: UIImage?
    
    init(fName: String, lName: String, company: String, email: String, phone: String) {
        self.firstName = fName
        self.lastName = lName
        self.company = company
        self.email = email
        self.phone = phone
    }
    
}
