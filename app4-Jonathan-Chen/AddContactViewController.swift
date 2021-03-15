//
//  AddContactViewController.swift
//  app4-Jonathan-Chen
//
//  Created by Jonathan Chen on 2/22/21.
//

import Foundation
import UIKit

protocol AddContactDelegate: class {
    func didCreate(_ contact: Contact)
}

class AddContactViewController: UIViewController {
    
    weak var delegate: AddContactDelegate?
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var company: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!

    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        let newContact: Contact? = createNewContact()
        
        // check if contact is valid
        if newContact != nil  {
            self.delegate?.didCreate(newContact!)
        }
    }
    
    // return optional contact
    func createNewContact() -> Contact? {
        if firstName.text!.isEmpty || lastName.text!.isEmpty || company.text!.isEmpty || email.text!.isEmpty || phoneNumber.text!.isEmpty {
                    return nil
        }
        
        return Contact(fName: firstName.text!.capitalized, lName: lastName.text!.capitalized, company: company.text!, email: email.text!, phone: phoneNumber.text!)
    }
}
