//
//  CartTableViewController.swift
//  PickGo
//
//  Created by WuYueyang on 4/5/18.
//  Copyright © 2018 Lily. All rights reserved.
//

import CoreData
import UIKit

class CartTableViewController: UITableViewController {
    var cart = [NSManagedObject]()
    private var pri:[Int] = []
    var totalCalculated = 0

    @IBOutlet weak var totalPrice: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
        calculateTotal()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        //
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"Cart")
        
        //
        var fetchedResults:[NSManagedObject]? = nil
        
        do {
            try fetchedResults = managedContext.fetch(fetchRequest) as? [NSManagedObject]
        } catch {
            // what to do if an error occurs?
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
        if let results = fetchedResults {
            cart = results
        } else {
            print("Could not fetch")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("the count:")
        print("\(cart.count)")
        print("the count end")
        return cart.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartItem", for: indexPath)
        // Configure the cell...
        let item = cart[indexPath.row]
        let n = (item.value(forKey: "name") as? String )!
        let p = (item.value(forKey: "price") as? String )!
        cell.textLabel?.text = "\(n)"
        cell.detailTextLabel?.text = "\(p)"
//        print("\(p)")
//        pri.append((p as NSString).integerValue)
//        print("\(pri)")
        return cell
    }
    
    private func calculateTotal(){
        if cart.count > 0{
        let index = cart.count-1
        for i in 0...index{
            let item = cart[i]
            let p = (item.value(forKey: "price") as? String )!
            let val = (p as NSString).integerValue
            totalCalculated += val
        }
        print("\(totalCalculated)")
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
