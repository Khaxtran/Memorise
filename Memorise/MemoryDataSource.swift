//
//  MemoryDataSource.swift
//  Memorise
//
//  Created by Kha Tran on 20/4/2022.
//

import UIKit

class MemoryDataSource: NSObject, UITableViewDataSource {
    //step 1 create variable to store all items
    var items = [MemoryItem]()
    
    //step 2 create function to load items using Codable (fetching)
    override init() {
        // first: find the path to MemoryItems.json in the bundle
        guard let url = Bundle.main.url(forResource: "MemoryItems", withExtension: "json") else {
            fatalError("Can't find JSON.")
        }
        //second: load the url above into a data instance
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Unable to load JSON")
        }
        //third: decode that json into the array of our struct
        let decoder = JSONDecoder()
        
        guard let savedItems = try? decoder.decode([MemoryItem].self, from: data) else {
            fatalError("Failed to decode JSON.")
        }
        //finally: we know if it loaded/parsed correctly and put them onto the array and call the loadItems in viewDidLoad
        items = savedItems
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = items[indexPath.row]
        
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.text
        
        return cell
    }
    
    func item(at index: Int) -> MemoryItem {
        return items[index]
    }
}
