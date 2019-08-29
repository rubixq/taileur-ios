//
//  AutoConstrainExtension.swift
//  Taileur
//
//  Created by Engineer 144 on 28/08/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import UIKit
extension UIView{
	
	func setWithAnchor(_ width: CGFloat){
		self.widthAnchor.constraint(equalToConstant: width).isActive = true
	}
	
	func setHeightAnchor(_ width: CGFloat){
		self.heightAnchor.constraint(equalToConstant: width).isActive = true
	}
	
	func centerVerticalToView(_ view : UIView){
		self.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
	}
	

	
	func setTopAnchor(onview : UIView,topAnchor : CGFloat)  {
		self.topAnchor.constraint(equalTo: onview.topAnchor,constant: topAnchor).isActive = true
	}
	
	func constrainToSuperViewNoGuide(on view : UIView){
		//let guide = view.safeAreaLayoutGuide
		self.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		self.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
		self.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
		self.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
		
	}
	func constrainToBelowView(below view : UIView){
		let guide = view.safeAreaLayoutGuide
		self.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
		self.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
		self.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
		self.topAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
		
	}
	
	func constrainToSuperView(on view : UIView){
		let guide = view.safeAreaLayoutGuide
		self.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
		self.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
		self.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
		self.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
		
	}
	
	func constrainTopOfSuperView(on view : UIView,
															 leadingConstant:CGFloat = 0,
															 trailingConstant : CGFloat = 0){
		let guide = view.safeAreaLayoutGuide
		self.leadingAnchor.constraint(equalTo: guide.leadingAnchor,constant: leadingConstant).isActive = true
		self.trailingAnchor.constraint(equalTo: guide.trailingAnchor,constant: trailingConstant).isActive = true
		self.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
		
	}
	
	func constrainBelowSuperViewsTopView(superview : UIView,
																			 below topview : UIView,
																			 spacing: CGFloat = 0){
		
		let guide = superview.safeAreaLayoutGuide
		self.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
		self.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
		self.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
		self.topAnchor.constraint(equalTo: topview.bottomAnchor,constant: spacing).isActive = true
		
	}
	
	
	
	func constrainBelowView(below: UIView,
													topSpace:CGFloat = 0,
													bottomSpace:CGFloat = 0,
													leadingSpace:CGFloat = 0,
													tralingSpace:CGFloat = 0 ,withBottomAchor:Bool = false){
		
		
		self.topAnchor.constraint(equalTo: below.bottomAnchor,constant: topSpace).isActive = true
		self.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: leadingSpace).isActive = true
		self.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: tralingSpace).isActive = true
		if withBottomAchor {
			self.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: bottomSpace).isActive = true
		}
		
	}
}
