//
//  DataStore.swift
//  PickGo
//
//  Created by WuYueyang on 4/3/18.
//  Copyright © 2018 Lily. All rights reserved.
//

import Foundation
import Firebase

class DataStore {
    
    // Instantiate the singleton object.
    static let shared = DataStore()
    
    private var ref: DatabaseReference!
    private var menu: [Item]!
    
    // Making the init method private means only this class can instantiate an object of this type.
    private init() {
        // Get a database reference.
        // Needed before we can read/write to/from the firebase database.
        ref = Database.database().reference()
    }
    
    func count() -> Int {
        return menu.count
    }
    
    func getMenu(index: Int) -> Item {
        return menu[index]
    }
    
    func loadMenu() {
        // Start with an empty array.
        menu = [Item]()
        // Fetch the data from Firebase and store it in our internal people array.
        // This is a one-time listener.
        ref.child("menu").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get the top-level dictionary.
            let value = snapshot.value as? NSDictionary
            if let items = value {
                // Iterate over the person objects and store in our internal people array.
                for i in items {
                    let id = i.key as! String
                    let item = i.value as! [String:String]
                    let iName = item["iName"]
                    let iPrice = item["iPrice"]
                    let iDescription = item["iDescription"]
                    let newItem = Item(id: id, name: iName!, price: iPrice!, description: iDescription!)
                    self.menu.append(newItem)
//                    print("finding the match")
//                    print(newItem.id)
                }
//                print(items)
            }
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func addItem(item: Item) {
        // define array of key/value pairs to store for this person.
        let itemRecord = [
            "iName": item.name,
            "iPrice": item.price,
            "iDescription": item.description
        ]
        
        // Save to Firebase.
//        self.ref.child("menu").child(String("item"+String(item.id))).setValue(itemRecord)
        self.ref.child("menu").child(item.id).setValue(itemRecord)
        // Also save to our internal array, to stay in sync with what's in Firebase.
        menu.append(item)
    }
}
