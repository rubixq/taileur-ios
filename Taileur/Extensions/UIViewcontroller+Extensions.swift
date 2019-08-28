//
//  UIViewcontroller+Extensions.swift
//  Taileur
//
//  Created by Engineer 144 on 28/08/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import UIKit


extension UIViewController {
	
	var hideNavigationBar : Void {
		self.navigationController?.navigationBar.isHidden = true 
		return
	}

	
	func actionSheets(title: String = "" ,message : String = "") {
			let  ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
		
		
	}
	
}

