//
//  OnBoardingViewController.swift
//  Taileur
//
//  Created by Engineer 144 on 29/08/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import UIKit
import Planet

protocol OnBoardingProtocol {
	func showRegister()
	func showForgotpassword()
	func showLogin()
	func justExplore()
	func showCountryPicker()
}

enum OnboardMode {
	case register
	case login
}

class OnBoardingViewController: UIViewController {
	let countryPicker = CountryPickerViewController()
	var loginView : LoginUIView!
	var registerView : RegisterUIView!
	var mode : OnboardMode = .login
	
   override func viewDidLoad() {
			super.viewDidLoad()
		  self.view.backgroundColor = .white
	   	loginView = LoginUIView()
		  loginView.tag = 202
		  loginView.delegate = self
		  registerView = RegisterUIView()
		  registerView.delegate = self
		  countryPicker.delegate = self
		

		
    }
	
	
	func updateCountryCodeDetails(){
		guard let county = UsersData.country else { return  }
		loginView.codeField.text = county.callingCode
		loginView.flagIcon.image = county.image
		registerView.codeField.text = county.callingCode
		registerView.flagIcon.image = county.image
	}
	
	override func viewDidLayoutSubviews() {}
	override func viewWillLayoutSubviews() {
		
		view.addSubview(loginView)
		loginView.constrainToSuperView(on: view,leading:20)
		
		view.addSubview(registerView)
		registerView.constrainToSuperView(on: view,leading:20)
		
		if mode == .login {
			  loginView.isHidden = false
			  registerView.isHidden = true
		}else{
			  loginView.isHidden = true
		  	registerView.isHidden = false
		 }
	
	
	}

}


extension OnBoardingViewController : OnBoardingProtocol {
	
	var showView : Void {
		if mode == .login {
			loginView.isHidden = false
			registerView.isHidden = true
		}else{
			loginView.isHidden = true
			registerView.isHidden = false
		}
		
		return
	}
	func showRegister() {
		 mode = .register
		showView
	}
	func showForgotpassword() {
		showOneTextFieldDialogWithAction(with: "Forgot your password?",
																		 and: "Provide a phone number to recover your password",
																		 for: "Recover") { (password) in
																			
																			print(password)
			
		}
	}
	
	
	func showLogin() {
		 mode = .login
		showView
	}
	func justExplore() {
		let appDelegate = UIApplication.shared.delegate as? AppDelegate
		appDelegate?.window?.rootViewController = ExploreTabViewController()
		appDelegate?.window?.makeKeyAndVisible()
	}
	func showCountryPicker() {
		 let navigationBar = UINavigationController(rootViewController: countryPicker)
		navigationBar.modalPresentationStyle = .fullScreen
		self.show(navigationBar, sender: self)
	}
	
}

extension OnBoardingViewController : CountryPickerViewControllerDelegate {
	func countryPickerViewControllerDidCancel(_ countryPickerViewController: CountryPickerViewController) {
		countryPickerViewController.dismiss(animated: true)
	}
	func countryPickerViewController(_ countryPickerViewController: CountryPickerViewController, didSelectCountry country: Country) {
		   UsersData.country = country
		countryPickerViewController.dismiss(animated: true,completion: {
			self.updateCountryCodeDetails()
		})
	}
	
	
}

