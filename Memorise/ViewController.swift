//
//  ViewController.swift
//  Memorise
//
//  Created by Kha Tran on 19/4/2022.
//

import UIKit

class ViewController: UITableViewController {
    let dataSource = MemoryDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
    }

    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "MemoryViewController") as? MemoryViewController else {
            fatalError("Unable to instantiate memory view controller.")
        }
        
        let item = dataSource.item(at: indexPath.row)
        vc.item = item
        
        navigationController?.pushViewController(vc, animated: true)
    }

}

