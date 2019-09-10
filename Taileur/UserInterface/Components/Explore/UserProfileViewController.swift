//
//  UserProfileViewController.swift
//  Taileur
//
//  Created by Engineer 144 on 09/09/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController {

	var subview : UserProfileSubView!
    override func viewDidLoad() {
        super.viewDidLoad()

			  subview = UserProfileSubView()
    }
	
	
	override func viewWillLayoutSubviews() {
		view.addSubview(subview)
		subview.constrainToSuperView(on: view)
	}
	


}
