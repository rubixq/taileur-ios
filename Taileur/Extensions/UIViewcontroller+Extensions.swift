//
//  UIViewcontroller+Extensions.swift
//  Taileur
//
//  Created by Engineer 144 on 28/08/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import UIKit
import FloatingPanel

extension UIViewController {
	
	var hideNavigationBar : Void {
		self.navigationController?.navigationBar.isHidden = true 
		return
	}


	
	func showBottomSheet(delegate : BottomSliderViewControllerProtocol?){
		let fpc = FloatingPanelController()
		let contentVC = BottomSliderViewController()
		if delegate != nil {
			contentVC.delegate = delegate
		}
		fpc.set(contentViewController: contentVC)
		fpc.isRemovalInteractionEnabled = true // Optional: Let it removable by a swipe-down
		self.present(fpc, animated: true, completion: nil)
	}
	
}

