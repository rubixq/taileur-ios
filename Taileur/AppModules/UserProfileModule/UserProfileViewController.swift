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
		     subview.delegate = self
		self.navigationItem.setRightBarButton(UIBarButtonItem(title: "Sign Out", style: .done, target: self, action: #selector(Logout)), animated: true)
    }
	
	
	@objc func Logout(){
			let appDelegate = UIApplication.shared.delegate as? AppDelegate
			appDelegate?.window?.rootViewController = UINavigationController(rootViewController: LaunchViewController())
			appDelegate?.window?.makeKeyAndVisible()
	}
	
	override func viewWillLayoutSubviews() {
		view.addSubview(subview)
		subview.constrainToSuperView(on: view)
	}
	


}

extension UserProfileViewController : UserProfileSubViewProtocol{
	func selectedAction(_ profileItem: UserProfileCellItem) {
		if profileItem.title == "Reviews"{
			let vc = ReviewsViewController()
			vc.modalPresentationStyle = .fullScreen
			self.show(UINavigationController(rootViewController: vc), sender: self)
		}
	}
}
