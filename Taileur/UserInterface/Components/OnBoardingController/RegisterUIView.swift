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
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupViews()
		
		
	}
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	func setupViews(){
		translatesAutoresizingMaskIntoConstraints = false
	
		
		stack.addArrangedSubview(title)
		stack.addArrangedSubview(subtitle)
		addSubview(stack)
		addSubview(phoneNumberStack)
		
		stack.constraintoTop(superview: self,topSpace: 20)
		stack.centerVerticalToView(self)
		phoneNumberStack.topAnchor.constraint(equalTo: stack.bottomAnchor).isActive = true
    phoneNumberStack.centerVerticalToView(self)
		
		
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
		label.text = " Sign up to continue"
		label.font = setFont(name: ".SFUIDisplay", size: 16)
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
		return imageView
	}()
	
	lazy var codeField: UITextField = {
		let field = UITextField()
		field.translatesAutoresizingMaskIntoConstraints = false
		field.keyboardType = .phonePad
		return field
	}()
	lazy var phoneNumberField: UITextField = {
		let field = UITextField()
		field.translatesAutoresizingMaskIntoConstraints = false
		field.keyboardType = .phonePad
		return field
	}()
	
	
	
	lazy var phoneNumberStack : UIStackView = {
		let view = UIStackView()
		view.axis = .horizontal
		view.spacing = 3
		view.translatesAutoresizingMaskIntoConstraints = false
		view.addArrangedSubview(flagIcon)
		flagIcon.setWithAnchor(40)
		flagIcon.setHeightAnchor(40)
		view.addArrangedSubview(codeField)
		view.addArrangedSubview(phoneNumberField)
		view.distribution = UIStackView.Distribution.fillProportionally
		return view
	}()
	
}
