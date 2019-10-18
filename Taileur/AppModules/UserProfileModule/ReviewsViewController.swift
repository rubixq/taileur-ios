//
//  ReviewsViewController.swift
//  Taileur
//
//  Created by Engineer 144 on 18/10/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import UIKit

class ReviewsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

		self.view.backgroundColor = .white
		self.navigationItem.setLeftBarButton(UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(close)), animated: true)
       }
    
	
	   @objc func close(){
		self.dismiss(animated: true, completion: nil)
    	}

	lazy var warningLabel: UILabel = {
		let label = UILabel()
		label.text = "You currently have no reviews"
		label.translatesAutoresizingMaskIntoConstraints = false
		label.numberOfLines = 0
		label.textAlignment = .center
		return label
	}()
   
	override func viewDidLayoutSubviews() {
		view.addSubview(warningLabel)
		warningLabel.pintoTop(superview: view.safeAreaLayoutGuide.topAnchor,space: 10)
		warningLabel.pintoLeft(superview: view.safeAreaLayoutGuide.leadingAnchor)
		warningLabel.pintoRight(superview: view.safeAreaLayoutGuide.trailingAnchor)
		warningLabel.centerVerticalToView(view)
	}

}
