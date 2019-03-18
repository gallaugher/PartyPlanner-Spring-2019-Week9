//
//  ViewController.swift
//  PartyPlanner
//
//  Created by John Gallaugher on 2/25/19.
//  Copyright © 2019 John Gallaugher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var partyListItems: [PartyListItem] = []
    var partyItems = ["Potato Chips",
                      "Tortilla Chips",
                      "Salsa",
                      "Chili",
                      "Punch",
                      "Sudsy Beverages",
                      "Brownies",
                      "Cupcakes",
                      "Fruit salad",
                      "Ribs",
                      "Corn bread",
                      "Macaroni Salad",
                      "Sandwich Rolls",
                      "Roast Beef",
                      "Ham",
                      "Cheese",
                      "Mayo",
                      "Mustard",
                      "Hummus",
                      "Baby carrots",
                      "Celery",
                      "Veggie Dip",
                      "Napkins",
                      "Plates & Bowls",
                      "Forks and Knives",
                      "Cups"]


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        for partyItem in partyItems {
            partyListItems.append(PartyListItem(partyItem: partyItem, personResponsible: ""))
        }
        
//        for index in 0..<partyItems.count{
//            partyListItems.append(PartyListItem(partyItem: partyItems[index], personResponsible: ""))
//        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowItemDetail" {
            let destination = segue.destination as! ItemDetailViewController
            let selectedIndexPath = tableView.indexPathForSelectedRow!
            destination.partyListItem = partyListItems[selectedIndexPath.row]
        } else {
            if let selectedPath = tableView.indexPathForSelectedRow {
                tableView.deselectRow(at: selectedPath, animated: true)
            }
        }
    }
    
    @IBAction func unwindFromItemDetailViewController(segue: UIStoryboardSegue) {
        let source = segue.source as! ItemDetailViewController
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            partyListItems[selectedIndexPath.row] = source.partyListItem
            tableView.reloadRows(at: [selectedIndexPath], with: .automatic)
        } else {
            let indexPath = IndexPath(row: partyListItems.count, section: 0)
            partyListItems.append(source.partyListItem)
            tableView.insertRows(at: [indexPath], with: .automatic)
            tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyListItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = partyListItems[indexPath.row].partyItem
        cell.detailTextLabel?.text = partyListItems[indexPath.row].personResponsible
        return cell
    }
    
    
}
