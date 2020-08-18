//
//  AddItemViewController.swift
//  PickGo
//
//  Created by WuYueyang on 4/5/18.
//  Copyright © 2018 Lily. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtPrice: UITextField!
    @IBOutlet weak var txtDescription: UITextField!
    @IBOutlet weak var txtId: UITextField!
    @IBOutlet weak var lblMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Person"
        //DataStore.shared.loadMenu()
        //Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnSave(_ sender: UIButton) {
        let item = Item(id: txtId.text!, name: txtName.text!, price: txtPrice.text!, description: txtDescription.text!)
        DataStore.shared.addItem(item: item)
        lblMessage.text = "Item Added!"
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
