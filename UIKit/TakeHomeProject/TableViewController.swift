//
//  TableViewController.swift
//  TakeHomeProject
//
//  Created by Enrique Gongora on 5/28/21.
//

import UIKit

class TableViewController: UITableViewController {
    
    var stateName: [String] = []
    let network = Network()
    
    override func viewDidLoad() {
        network.get { (result) in
            switch result {
            case .success(let states):
                for state in states.countrySubdivisions {
                    self.stateName.append(state.name)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print("Failed to retrieve states", error)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stateName.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StateCell", for: indexPath)
        cell.textLabel?.text = stateName[indexPath.row]
        return cell
    }
}
