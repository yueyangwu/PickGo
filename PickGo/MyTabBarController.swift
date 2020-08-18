//
//  MyTabBarController.swift
//  PickGo
//
//  Created by WuYueyang on 4/2/18.
//  Copyright © 2018 Lily. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.tabBar.isTranslucent = true
        
        self.createTabs()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func createTabs() {
        let storyboard = UIStoryboard(name: "Main", bundle:nil)
        
        let vc1 = storyboard.instantiateViewController(withIdentifier: "vc1") as?
        MenuViewController
        let vc2 = storyboard.instantiateViewController(withIdentifier: "vc2") as?
        CartTableViewController
        let vc3 = storyboard.instantiateViewController(withIdentifier: "vc3") as?
        OrderTableViewController
        let vc4 = storyboard.instantiateViewController(withIdentifier: "vc4") as?
        ProfileViewController
        
        // Get each tab's image from the Assets.xcassets (asset catalog) file.
        let image1 = UIImage(named: "menu")
        let image2 = UIImage(named: "cart")
        let image3 = UIImage(named: "order")
        let image4 = UIImage(named: "profile")
        
        // Set each tab's item attributes.
        vc1!.tabBarItem = UITabBarItem(
            title: "Menu",
            image: image1,
            tag: 1)
        vc2!.tabBarItem = UITabBarItem(
            title: "Cart",
            image: image2,
            tag: 2)
        vc3!.tabBarItem = UITabBarItem(
            title: "Order",
            image: image3,
            tag: 3)
        vc4!.tabBarItem = UITabBarItem(
            title: "Profile",
            image: image4,
            tag: 4)
        
        // Wrap the view controllers in their own nav controllers.
        let nc1 = UINavigationController(rootViewController: vc1!)
        let nc2 = UINavigationController(rootViewController: vc2!)
        let nc3 = UINavigationController(rootViewController: vc3!)
        let nc4 = UINavigationController(rootViewController: vc4!)
        // Create the array of controllers that make up the tab bar items.
        let controllers:[UIViewController] = [nc1, nc2, nc3, nc4]
        
        // Set the tab bar controller's array of controllers to manage.
        self.viewControllers = controllers
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
extension MyTabBarController: UITabBarControllerDelegate {
    // Indicates which tab bar item was tapped.
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("====>>>   didSelectItem. item.tag = \(item.tag)")
    }
}
