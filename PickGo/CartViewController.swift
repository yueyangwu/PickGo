//
//  CartViewController.swift
//  PickGo
//
//  Created by WuYueyang on 4/30/18.
//  Copyright © 2018 Lily. All rights reserved.
//

import UIKit
import CoreData

class CartViewController: UIViewController {
//    var cart = [NSManagedObject]()
//    private var pri:[Int] = []
//    var totalCalculated = 0
//
    override func viewDidLoad() {
        super.viewDidLoad()
//        calculateTotal()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//        private func calculateTotal(){
//            let index = cart.count-1
//            for i in 0...index{
//                let item = cart[i]
//                let p = (item.value(forKey: "price") as? String )!
//                let val = (p as NSString).integerValue
//                totalCalculated += val
//            }
//            print("\(totalCalculated)")
//        }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
//        let seg = segue.destination as! CartTableViewController
    }
    

}
