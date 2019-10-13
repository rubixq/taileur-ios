//
//  UIView+Extensions.swift
//  Taileur
//
//  Created by Engineer 144 on 28/08/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import UIKit

extension UIView {
	
	var heavyTitleFont : UIFont {
		return  UIFont.systemFont(ofSize: 40,weight: .heavy)
	}
	var bigTitleFont : UIFont {
		return  UIFont.systemFont(ofSize: 35,weight: .bold)
	}
	var mediumFont : UIFont {
		return  UIFont.systemFont(ofSize: 20,weight: .medium)
	}
	
	var regularBoldFont : UIFont {
		return  UIFont.systemFont(ofSize: 16,weight: .bold)
	}
	
	var regularButtonFont : UIFont {
		return  UIFont.systemFont(ofSize: 18,weight: .regular)
	}
	
	
	var regularFont : UIFont {
		return UIFont.systemFont(ofSize: 17)
	}
	var mediumFont18 : UIFont {
		return  UIFont.systemFont(ofSize: 18,weight: .bold)
	}
	
	func setFont(name: String,size : CGFloat) -> UIFont{
		return UIFont.init(name: name, size: size) ?? UIFont.systemFont(ofSize: size)
	}

	
	
	
	func addTopBorder(color: UIColor, width: CGFloat) {
		let border = UIView()
		border.backgroundColor = color
		border.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(border)
		border.addConstraint(NSLayoutConstraint(item: border,
																						attribute: NSLayoutConstraint.Attribute.height,
																						relatedBy: NSLayoutConstraint.Relation.equal,
																						toItem: nil,
																						attribute: NSLayoutConstraint.Attribute.height,
																						multiplier: 1, constant: 1))
		self.addConstraint(NSLayoutConstraint(item: border,
																					attribute: NSLayoutConstraint.Attribute.top,
																					relatedBy: NSLayoutConstraint.Relation.equal,
																					toItem: self,
																					attribute: NSLayoutConstraint.Attribute.top,
																					multiplier: 1, constant: 0))
		self.addConstraint(NSLayoutConstraint(item: border,
																					attribute: NSLayoutConstraint.Attribute.leading,
																					relatedBy: NSLayoutConstraint.Relation.equal,
																					toItem: self,
																					attribute: NSLayoutConstraint.Attribute.leading,
																					multiplier: 1, constant: 0))
		self.addConstraint(NSLayoutConstraint(item: border,
																					attribute: NSLayoutConstraint.Attribute.trailing,
																					relatedBy: NSLayoutConstraint.Relation.equal,
																					toItem: self,
																					attribute: NSLayoutConstraint.Attribute.trailing,
																					multiplier: 1, constant: 0))
	}
	func addBottomBorder(color: UIColor, width: CGFloat) {
		let border = UIView()
		border.backgroundColor = color
		border.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(border)
		border.addConstraint(NSLayoutConstraint(item: border,
																						attribute: NSLayoutConstraint.Attribute.height,
																						relatedBy: NSLayoutConstraint.Relation.equal,
																						toItem: nil,
																						attribute: NSLayoutConstraint.Attribute.height,
																						multiplier: 1, constant: 1))
		self.addConstraint(NSLayoutConstraint(item: border,
																					attribute: NSLayoutConstraint.Attribute.bottom,
																					relatedBy: NSLayoutConstraint.Relation.equal,
																					toItem: self,
																					attribute: NSLayoutConstraint.Attribute.bottom,
																					multiplier: 1, constant: 0))
		self.addConstraint(NSLayoutConstraint(item: border,
																					attribute: NSLayoutConstraint.Attribute.leading,
																					relatedBy: NSLayoutConstraint.Relation.equal,
																					toItem: self,
																					attribute: NSLayoutConstraint.Attribute.leading,
																					multiplier: 1, constant: 0))
		self.addConstraint(NSLayoutConstraint(item: border,
																					attribute: NSLayoutConstraint.Attribute.trailing,
																					relatedBy: NSLayoutConstraint.Relation.equal,
																					toItem: self,
																					attribute: NSLayoutConstraint.Attribute.trailing,
																					multiplier: 1, constant: 0))
	}
	func addLeftBorder(color: UIColor, width: CGFloat) {
		let border = UIView()
		border.backgroundColor = color
		border.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(border)
		border.addConstraint(NSLayoutConstraint(item: border,
																						attribute: NSLayoutConstraint.Attribute.width,
																						relatedBy: NSLayoutConstraint.Relation.equal,
																						toItem: nil,
																						attribute: NSLayoutConstraint.Attribute.width,
																						multiplier: 1, constant: 1))
		self.addConstraint(NSLayoutConstraint(item: border,
																					attribute: NSLayoutConstraint.Attribute.leading,
																					relatedBy: NSLayoutConstraint.Relation.equal,
																					toItem: self,
																					attribute: NSLayoutConstraint.Attribute.leading,
																					multiplier: 1, constant: 0))
		self.addConstraint(NSLayoutConstraint(item: border,
																					attribute: NSLayoutConstraint.Attribute.bottom,
																					relatedBy: NSLayoutConstraint.Relation.equal,
																					toItem: self,
																					attribute: NSLayoutConstraint.Attribute.bottom,
																					multiplier: 1, constant: 0))
		self.addConstraint(NSLayoutConstraint(item: border,
																					attribute: NSLayoutConstraint.Attribute.top,
																					relatedBy: NSLayoutConstraint.Relation.equal,
																					toItem: self,
																					attribute: NSLayoutConstraint.Attribute.top,
																					multiplier: 1, constant: 0))
	}
	func addRightBorder(color: UIColor, width: CGFloat) {
		let border = UIView()
		border.backgroundColor = color
		border.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(border)
		border.addConstraint(NSLayoutConstraint(item: border,
																						attribute: NSLayoutConstraint.Attribute.width,
																						relatedBy: NSLayoutConstraint.Relation.equal,
																						toItem: nil,
																						attribute: NSLayoutConstraint.Attribute.width,
																						multiplier: 1, constant: 1))
		self.addConstraint(NSLayoutConstraint(item: border,
																					attribute: NSLayoutConstraint.Attribute.trailing,
																					relatedBy: NSLayoutConstraint.Relation.equal,
																					toItem: self,
																					attribute: NSLayoutConstraint.Attribute.trailing,
																					multiplier: 1, constant: 0))
		self.addConstraint(NSLayoutConstraint(item: border,
																					attribute: NSLayoutConstraint.Attribute.bottom,
																					relatedBy: NSLayoutConstraint.Relation.equal,
																					toItem: self,
																					attribute: NSLayoutConstraint.Attribute.bottom,
																					multiplier: 1, constant: 0))
		self.addConstraint(NSLayoutConstraint(item: border,
																					attribute: NSLayoutConstraint.Attribute.top,
																					relatedBy: NSLayoutConstraint.Relation.equal,
																					toItem: self,
																					attribute: NSLayoutConstraint.Attribute.top,
																					multiplier: 1, constant: 0))
	}
	
	
	func addShadow(){
		self.layer.cornerRadius = 8
		self.layer.shadowColor = UIColor.lightGray.cgColor
		self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
		self.layer.shadowRadius = 3
		self.layer.shadowOpacity = 0.4
		
	}
}



