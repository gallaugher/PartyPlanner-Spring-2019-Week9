//
//  ItemDetailViewController.swift
//  PartyPlanner
//
//  Created by John Gallaugher on 2/25/19.
//  Copyright © 2019 John Gallaugher. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController {
    @IBOutlet weak var partyItemField: UITextField!
    @IBOutlet weak var personResponsibleField: UITextField!
    
    var partyListItem: PartyListItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if partyListItem == nil {
            partyListItem = PartyListItem()
        }
        partyItemField.text = partyListItem.partyItem
        personResponsibleField.text = partyListItem.personResponsible
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UnwindFromSave" {
            partyListItem.partyItem = partyItemField.text!
            partyListItem.personResponsible = personResponsibleField.text!
        }
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
}
