//
//  StorageViewController.swift
//  PickGo
//
//  Created by Zhou Timena on 5/1/18.
//  Copyright © 2018 Lily. All rights reserved.
//

import UIKit
import FirebaseDatabase

class StorageViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var ref: DatabaseReference!
    private var backUp = [foodData]()
    var count = 3
    
    func loadBackUp(){
        self.backUp = [foodData]()
        for index in 1...count {
            ref.child("foodStack").child("\(index)").observeSingleEvent(of: .value, with: { (snapshot) in
                // Get user value
                let value = snapshot.value as? NSDictionary
                let fdName = value?["fdName"] as? String ?? ""
                let fdAmount = value?["fdAmount"] as? String ?? ""
                var newImport = foodData(id: String(index), name: fdName, amount: fdAmount)
                self.backUp.append(newImport)
                print(fdName)
                self.storageView.reloadData()
                // ...
                print("here 3",self.backUp.count)
            },withCancel: nil)
        }
        print("here 4",self.backUp.count)
    }
    
    override func viewDidLoad() {
        self.storageView.rowHeight = 60.0
        storageView.delegate = self
        storageView.dataSource = self
        ref = Database.database().reference()
        loadBackUp()
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addItem(_ sender: Any) {
        var temp = newItem.text
        let itemRecord = [
            "fdName": temp,
            "fdAmount": "0"
        ]
        var newID = String(backUp.count+1)
        self.ref.child("foodStack").child("\(newID)").setValue(itemRecord)
        var foodDataTemp = foodData(id: newID,name: temp!, amount: "0")
        backUp.append(foodDataTemp)
        count += 1
        //redisplay in view
        let indexPath = IndexPath(row: backUp.count - 1,section: 0)
        storageView.insertRows(at: [indexPath], with: .automatic)
        storageView.endUpdates()
        
        newItem.text = ""
        view.endEditing(true)
        
    }
    @IBAction func updateAmount(_ sender: Any) {
        let cells = self.storageView.visibleCells as! Array<StorageTableViewCell>
        var treePos = 1
        
        for cell in cells{
            // look at data
            var increased :Int
            var decreased :Int
            var origin :Int
            if(cell.addText.text! == ""){
                increased = 0
            }
            else{
                increased = Int(cell.addText.text!)!
            }
            if(cell.decreaseText.text! == ""){
                decreased = 0
            }
            else{
                decreased = Int(cell.decreaseText.text!)!
            }
            if(cell.amountLabel.text! == ""){
                origin = 0
            }
            else{
                origin = Int(cell.amountLabel.text!)!
            }
            print(increased)
            print(decreased)
            print(origin)
            var new = origin - decreased + increased
            cell.amountLabel.text = String(new)
            print(cell.idPos)
            let ref = self.ref.child("foodStack").child("\(treePos)")
            ref.updateChildValues([
                "fdAmount": cell.amountLabel.text]
            )
            treePos += 1
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return backUp.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = storageView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! StorageTableViewCell
        var iPos: Int = indexPath.row
        let fditem = backUp[iPos]
        cell.materialLabel.text = "\(fditem.name)"
        cell.amountLabel?.text = "\(fditem.amount)"
        cell.idPos = Int(fditem.id)
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBOutlet weak var storageView: UITableView!
    @IBOutlet weak var newItem: UITextField!
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
