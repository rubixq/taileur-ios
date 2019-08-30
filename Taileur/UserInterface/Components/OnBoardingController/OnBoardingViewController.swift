//
//  OnBoardingViewController.swift
//  Taileur
//
//  Created by Engineer 144 on 29/08/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import UIKit

class OnBoardingViewController: UIViewController {
	
	var subview : UIView!
   override func viewDidLoad() {
			super.viewDidLoad()
    }
	

	
	override func viewDidLayoutSubviews() {
		    view.addSubview(subview)
	    	subview.constrainToSuperView(on: view,leading:20)
	}

}
