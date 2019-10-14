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
	func showIndicator(title: String,message: String){
		guard let view = self.view else { return  }
		
		let activityView = ActivityIndicator(frame: view.bounds,title: title,message: message)
		activityView.translatesAutoresizingMaskIntoConstraints = false
		//view.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(activityView)
		
		
		activityView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		activityView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
		
		activityView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
		activityView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		activityView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
	}
	func removeIndicator(){
		guard let view = self.view else { return  }
		guard let activityView = view.viewWithTag(900009) as? ActivityIndicator else { return  }
		activityView.removeFromSuperview()
		//view.addSubview(activityView)
		
	}
	func updateIndicatorValues(title: String,message: String) {
		guard let view = self.view else { return  }
		guard let activityView = view.viewWithTag(900009) as? ActivityIndicator else { return  }
		activityView.isSuccess = true
		activityView.indicatorTitle.text = title
		activityView.indicatorMessage.text = message
	}
	func showWarningDialog(with title : String,and message : String,style: UIAlertController.Style){
		
		let alert = 	UIAlertController(title: title, message: message, preferredStyle: style)
		alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
		self.present(alert, animated: true, completion: nil)
		
	}
	func showWarningDialog(with title : String,and message : String){
		
		let alert = 	UIAlertController(title: title, message: message, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
		self.present(alert, animated: true, completion: nil)
		
	}
	func showWarningDialogWithAction(with title : String,and message : String,for actionTitle : String , completionHandler :@escaping()-> Void ){
		
		let alert = 	UIAlertController(title: title, message: message, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
		
		let actionButon = UIAlertAction(title: actionTitle, style: .default) { _ in
			completionHandler()
		}
		
		alert.addAction(actionButon)
		
		self.present(alert, animated: true, completion: nil)
		
	}
	func showWarningDialogWithNoCancelAction(with title : String,and message : String,for actionTitle : String , completionHandler :@escaping()-> Void ){
		
		let alert = 	UIAlertController(title: title, message: message, preferredStyle: .alert)
		//	alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
		
		let actionButon = UIAlertAction(title: actionTitle, style: .default) { _ in
			completionHandler()
		}
		
		alert.addAction(actionButon)
		
		self.present(alert, animated: true, completion: nil)
		
	}
	func showOneTextFieldDialogWithAction(with title : String,
																				and message : String,
																				or placeHolder : String = "",
																				for actionTitle : String ,
																				completionHandler :@escaping(String)-> Void ){
		
		let alert = 	UIAlertController(title: title, message: message, preferredStyle: .alert)
		
		
		
		
		let actionButon = UIAlertAction(title: actionTitle, style: .default) { _ in
			let value = alert.textFields![0].text ?? ""
			
			completionHandler(value.capitalized)
		}
		
		
		
		alert.addTextField { (textField) in
			textField.placeholder = placeHolder
			textField.keyboardType = .default
		}
		alert.addAction(actionButon)
		alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
		
		self.present(alert, animated: true, completion: nil)
		
	}
	
	func showDoubleTextFieldDialogWithAction(title : String,
																					 titleDescription: String = "",
																					 actionTitle: String,
																					 placeHolder:[String] = ["",""],
																					 defaultValues:[String] = ["",""],
																					 completion : @escaping (String,String) ->Void){
		let ac = UIAlertController(title: title, message: titleDescription, preferredStyle: .alert)
		
		let submitAction = UIAlertAction(title: actionTitle, style: .default) { [unowned ac] _ in
			
			let inputOne = ac.textFields![0].text ?? ""
			let inputTwo = ac.textFields![1].text ?? ""
			
			completion(inputOne,inputTwo)
			
		}
		let cancel = UIAlertAction(title: "Cancel", style: .cancel) {  _ in
			
		}
		
		
		ac.addTextField(configurationHandler: { (textField) in
			textField.placeholder = placeHolder[0]
			textField.keyboardType = .phonePad
			textField.text = defaultValues[0]
			
		})
		
		ac.addTextField(configurationHandler: { (textField) in
			textField.placeholder = placeHolder[1]
			textField.keyboardType = .default
			textField.text = defaultValues[1]
			
		})
		
		ac.addAction(submitAction)
		ac.addAction(cancel)
		present(ac, animated: true)
	}
	
	var DialogWidth : CGFloat{
		print("UIScreen.main.bounds.Width",UIScreen.main.bounds.width)
		if (UIApplication.shared.statusBarOrientation == .landscapeLeft ||
			UIApplication.shared.statusBarOrientation == .landscapeRight) &&
			UIDevice.current.userInterfaceIdiom == .pad {
			return  UIScreen.main.bounds.width / 2.5
		}else{
			return UIScreen.main.bounds.width / 2.5
		}
	}
	var DialogHeight : CGFloat{
		print("UIScreen.main.bounds.Height",UIScreen.main.bounds.height)
		if (UIApplication.shared.statusBarOrientation == .landscapeLeft ||
			UIApplication.shared.statusBarOrientation == .landscapeRight) &&
			UIDevice.current.userInterfaceIdiom == .pad {
			return  UIScreen.main.bounds.height  - 100
		}else{
			return UIScreen.main.bounds.height / 2
		}
		
	}
}

