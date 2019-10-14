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
	var viewModel : OnBoardViewModelImpl!
    override func viewDidLoad() {
        super.viewDidLoad()
			  hideNavigationBar
           mainView = LauncherUIView()
			  mainView.delegate = self
		     viewModel = OnBoardViewModelImpl()
    }
	
	
	override func viewDidAppear(_ animated: Bool) {
			mainView.timer.fire()
	}
	override func viewWillAppear(_ animated: Bool) {
		//mainView.timer.fire()
	}
	
	override func viewDidDisappear(_ animated: Bool) {
		mainView.timer.invalidate()

	}
	override func viewWillDisappear(_ animated: Bool) {
	  mainView.timer.invalidate()
	}
	
	override func viewDidLayoutSubviews() {
		       view.addSubview(mainView)
		       mainView.constrainToSuperViewNoGuide(on: self.view)
	}


}

extension LaunchViewController: BottomSliderViewControllerProtocol{
	func itemSelected(item: BottomSheetItem) {
		viewModel.setUserType(item.title)
		viewModel.setOnBoardMode(.login)
		let loginView = LoginUIView(onboardViewModel: viewModel)
		let controller = OnBoardingViewController()
			 controller.loginView = loginView
		    controller.mode = .login
		self.navigationController?.show(controller, sender: self)
	}
}

extension LaunchViewController: LauncherUIViewProtocol {
	func joinNow() {
		showBottomSheet(delegate: self)
	}
	
	func explore() {
		let appDelegate = UIApplication.shared.delegate as? AppDelegate
		appDelegate?.window?.rootViewController = ExploreTabViewController()
		appDelegate?.window?.makeKeyAndVisible()
	 
	}
	
	
}
