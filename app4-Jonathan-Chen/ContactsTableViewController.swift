//
//  ContactsTableViewController.swift
//  app4-Jonathan-Chen
//
//  Created by Jonathan Chen on 2/22/21.
//

import Foundation
import UIKit

class ContactsTableViewController: UITableViewController, AddContactDelegate {
    
    func didCreate(_ contact: Contact) {
            dismiss(animated: true, completion: nil)
            // add new contact to array
            contacts.append(contact)
        
            // sort contacts
            contacts.sort { (contactA, contactB) -> Bool in
                contactA.lastName < contactB.lastName
            }
        
            // update table view
            self.tableView.reloadData()
    }
    
    var contacts: [Contact] = [Contact(fName: "Jonathan", lName: "Chen", company: "Penn", email: "jgchen@sas.upenn.edu", phone: "1234567890"), Contact(fName: "Mike", lName: "Ross", company: "Harvard", email: "mikeross123@gmail.com", phone: "0123456789")]
    
    @IBAction func addGoToACVC() {
            performSegue(withIdentifier: "toAddContact", sender: nil)
    }

    // table view methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell")!
                    
                cell.textLabel!.text = "\(contacts[indexPath.row].firstName) \(contacts[indexPath.row].lastName)"
                cell.detailTextLabel!.text = "\(contacts[indexPath.row].company)"
                
                return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "toDetail", sender: contacts[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let contactInfo = sender as? Contact {
                if let detailVC = segue.destination as? DetailViewController {
                    detailVC.contact = contactInfo
                }
            }
        } else if segue.identifier == "toAddContact" {
            if let navVC = segue.destination as? UINavigationController {
                if let addVC = navVC.topViewController as? AddContactViewController {
                        addVC.delegate = self
                }
            }
        }
    }
    
    
}
