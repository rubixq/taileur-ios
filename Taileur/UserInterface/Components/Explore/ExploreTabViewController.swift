//
//  ExploreTabViewController.swift
//  Taileur
//
//  Created by Engineer 144 on 09/09/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import UIKit

class ExploreTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
    }
    
	
	func setUpView(){
		
		let homeview = HomeViewController()
	  homeview.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "shop"), tag: 1)
		
		
		let cartView = ShoppingViewController()
		cartView.tabBarItem = UITabBarItem(title: "Shopping", image: #imageLiteral(resourceName: "shopping"), tag: 1)
		
		let userProfile = UserProfileViewController()
		userProfile.tabBarItem = UITabBarItem(title: "Profile", image: #imageLiteral(resourceName: "profile"), tag: 1)
		
		let tabBarList = [homeview, cartView,userProfile]
		  viewControllers = //tabBarList
			tabBarList.map { UINavigationController(rootViewController: $0)}
	}
	
}
