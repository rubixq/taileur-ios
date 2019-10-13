//
//  RegisterUIView.swift
//  Taileur
//
//  Created by Engineer 144 on 29/08/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import UIKit

class RegisterUIView: UIView {
	
	var controls = UIControls()
	var viewModel : OnBoardModel!
	var delegate : OnBoardingProtocol!
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupViews()
		viewModel = OnBoardModel()
		setValues()
		
	}
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	func setupViews(){
		translatesAutoresizingMaskIntoConstraints = false
		
		
		stack.addArrangedSubview(title)
		stack.addArrangedSubview(subtitle)
		addSubview(stack)
		phoneNumberStack.addArrangedSubview(flagIcon)
		phoneNumberFieldStack.addArrangedSubview(codeField)
		phoneNumberFieldStack.addArrangedSubview(phoneNumberField)
		phoneNumberStack.addArrangedSubview(phoneNumberFieldStack)
		addSubview(phoneNumberStack)
		
		addSubview(signInButon)
		addSubview(orLabel)
		addSubview(justExploreButton)
		addSubview(registerButton)
		
		stack.constraintoTop(superview: self,topSpace: 30,leadingSpace: 30,trailingSpace: -30)
		//stack.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 30).isActive = true
		
		phoneNumberStack.topAnchor.constraint(equalTo: stack.bottomAnchor,constant: 100).isActive = true
		phoneNumberStack.leadingAnchor.constraint(equalTo: stack.leadingAnchor).isActive = true
		
		phoneNumberFieldStack.setHeightAnchor(40)
		flagIcon.setWithAnchor(30)
		flagIcon.setHeightAnchor(30)
		
		
		phoneNumberField.trailingAnchor.constraint(equalTo: stack.trailingAnchor,constant: -30).isActive = true
		phoneNumberField.addBottomBorder(color: .lightGray, width: phoneNumberField.frame.width)
		
		codeField.setWithAnchor(50)
		codeField.addBottomBorder(color: .lightGray, width: codeField.frame.width + 13)
		
		
		
		
		
		signInButon.topAnchor.constraint(equalTo: phoneNumberStack.bottomAnchor,constant: 50).isActive = true
		signInButon.setHeightAnchor(54)
		signInButon.trailingAnchor.constraint(equalTo: phoneNumberStack.trailingAnchor).isActive = true
		signInButon.leadingAnchor.constraint(equalTo: phoneNumberStack.leadingAnchor).isActive = true
		
		
		orLabel.topAnchor.constraint(equalTo: signInButon.bottomAnchor,constant: 30).isActive = true
		orLabel.trailingAnchor.constraint(equalTo: signInButon.trailingAnchor).isActive = true
		orLabel.leadingAnchor.constraint(equalTo: signInButon.leadingAnchor).isActive = true
		
		justExploreButton.topAnchor.constraint(equalTo: orLabel.bottomAnchor,constant: 30).isActive = true
		justExploreButton.trailingAnchor.constraint(equalTo: orLabel.trailingAnchor).isActive = true
		justExploreButton.leadingAnchor.constraint(equalTo: orLabel.leadingAnchor).isActive = true
		justExploreButton.setHeightAnchor(52)
		
		registerButton.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -20).isActive = true
		registerButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -30).isActive = true
		registerButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 30).isActive = true
		registerButton.setHeightAnchor(52)
		
		
	}
	func setValues(){
		let country = viewModel.defaultCountry()
		flagIcon.image = country.image
		codeField.text = country.callingCode
		
	}
	
	
	@objc func showLoginView(){
		guard let _delegate = delegate else { return  }
		_delegate.showLogin()
	}
	@objc func showforgotPassword(){
		guard let _delegate = delegate else { return  }
		_delegate.showForgotpassword()
	}
	@objc func showjustExplore(){
		guard let _delegate = delegate else { return  }
		_delegate.justExplore()
	}
	@objc func showCountryPicker(){
		guard let _delegate = delegate else { return  }
		_delegate.showCountryPicker()
	}
	
	
	lazy var title: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Welcome,"
		label.font = bigTitleFont
		return label
	}()
	
	lazy var subtitle: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = " Sign Up to continue"
		label.font = UIFont.systemFont(ofSize: 16,weight: .regular)
		label.textColor = .gray
		return label
	}()
	
	lazy var stack: UIStackView = {
		let view = UIStackView()
		view.axis = .vertical
		view.spacing = 3
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	
	
	
	
	lazy var flagIcon: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showCountryPicker)))
    imageView.isUserInteractionEnabled = true
		return imageView
	}()
	
	lazy var codeField: UITextField = {
		let field = UITextField()
		field.translatesAutoresizingMaskIntoConstraints = false
		field.keyboardType = .phonePad
		field.placeholder = "+1"
		field.textAlignment = .center
		field.addTarget(self, action: #selector(showCountryPicker), for: .editingDidBegin)
    field.isUserInteractionEnabled = true
		return field
	}()
	lazy var phoneNumberField: UITextField = {
		let field = UITextField()
		field.translatesAutoresizingMaskIntoConstraints = false
		field.keyboardType = .phonePad
		field.placeholder = "Phone number"
		return field
	}()
	
	
	
	
	lazy var phoneNumberStack : UIStackView = {
		let view = UIStackView()
		view.axis = .horizontal
		view.spacing = 5
		view.translatesAutoresizingMaskIntoConstraints = false
		view.distribution = UIStackView.Distribution.fillProportionally
		return view
	}()
	
	lazy var phoneNumberFieldStack : UIStackView = {
		let view = UIStackView()
		view.axis = .horizontal
		view.spacing = 0
		view.translatesAutoresizingMaskIntoConstraints = false
		view.distribution = UIStackView.Distribution.fillProportionally
		return view
	}()
	
	
	
	
	lazy var signInButon: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("CONTINUE", for: .normal)
		button.titleLabel?.font = regularFont
		button.backgroundColor = .red
		button.setTitleColor(.white, for: .normal)
		button.setTitleColor(.lightGray, for: .highlighted)
		button.setTitleColor(.lightGray, for: .focused)
		//button.addTarget(self, action: #selector(joinNowAction), for: .touchUpInside)
		button.layer.cornerRadius = 4
		return button
	}()
	
	
	lazy var orLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "- OR -"
		label.font = UIFont.systemFont(ofSize: 16,weight: .bold)
		label.textColor = .black
		label.textAlignment = .center
		return label
	}()
	
	
	lazy var justExploreButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("JUST EXPLORE", for: .normal)
		button.titleLabel?.font = regularFont
		button.layer.borderColor = UIColor.lightGray.cgColor
		button.layer.borderWidth =  1
		button.setTitleColor(.gray, for: .normal)
		button.setTitleColor(.lightGray, for: .highlighted)
		button.setTitleColor(.lightGray, for: .focused)
		button.addTarget(self, action: #selector(showjustExplore), for: .touchUpInside)
		button.layer.cornerRadius = 4
		return button
	}()
	
	
	lazy var registerButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("Click here to Sign In !", for: .normal)
		button.titleLabel?.font = regularFont
		//button.backgroundColor = .red
		button.setTitleColor(.gray, for: .normal)
		button.setTitleColor(.lightGray, for: .highlighted)
		button.setTitleColor(.lightGray, for: .focused)
		button.addTarget(self, action: #selector(showLoginView), for: .touchUpInside)
		button.layer.cornerRadius = 4
		return button
	}()
}
