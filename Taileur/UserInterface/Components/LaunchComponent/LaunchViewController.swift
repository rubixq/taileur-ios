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
			  mainView.delegate = self
    }
	
	
	override func viewDidAppear(_ animated: Bool) {
			mainView.timer.fire()
	}
	override func viewWillAppear(_ animated: Bool) {
		//mainView.timer.fire()
	}
	
	override func viewDidDisappear(_ animated: Bool) {
	//	mainView.timer.invalidate()

	}
	override func viewWillDisappear(_ animated: Bool) {
	//	mainView.timer.invalidate()
	}
	
	override func viewDidLayoutSubviews() {
		       view.addSubview(mainView)
		       mainView.constrainToSuperViewNoGuide(on: self.view)
	}


}

extension LaunchViewController: BottomSliderViewControllerProtocol{
	func itemSelected(item: BottomSheetItem) {
		print("item selected" ,item)
	}
}

extension LaunchViewController: LauncherUIViewProtocol {
	func joinNow() {
		showBottomSheet(delegate: self)
	}
	
	func explore() {
			self.navigationController?.show(JoinNowViewController(), sender: self)
	}
	
	
}
