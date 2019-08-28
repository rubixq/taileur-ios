//
//  LaunchViewController.swift
//  Taileur
//
//  Created by Engineer 144 on 28/08/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {

	
	var mainView : LauncherUIView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
			  hideNavigationBar
        mainView = LauncherUIView()
      
    }
    

	override func viewDidLayoutSubviews() {
		       view.addSubview(mainView)
		       mainView.constrainToSuperView(on: self.view)
	}


}
