//
//  DetailViewController.swift
//  app4-Jonathan-Chen
//
//  Created by Jonathan Chen on 2/22/21.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var photo: UIImageView!
    
    @IBOutlet weak var myName: UILabel!
    @IBOutlet weak var myCompany: UILabel!
    @IBOutlet weak var myEmail: UILabel!
    @IBOutlet weak var myPhone: UILabel!
    
    var contact: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        myName.text = "\(contact!.firstName) \(contact!.lastName)"
                myCompany.text = "\(contact!.company)"
                myEmail.text = "\(contact!.email)"
                myPhone.text = "\(contact!.phone)"
    }
}
