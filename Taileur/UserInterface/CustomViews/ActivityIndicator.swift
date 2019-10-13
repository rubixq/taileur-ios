//
//  ActivityIndicator.swift
//  Taileur
//
//  Created by Engineer 144 on 09/09/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import Foundation
import UIKit

class ActivityIndicator : UIView {
	
	var isSuccess : Bool = false
	var title : String  = ""
	var message : String = ""
	var style : UIActivityIndicatorView.Style = .gray
	var successColor  = #colorLiteral(red: 0, green: 0.4, blue: 0, alpha: 1)
	
	
	lazy var indicator : UIActivityIndicatorView = {
		
		let view = UIActivityIndicatorView(style: .whiteLarge)
		view.color = #colorLiteral(red: 0.003921568627, green: 0.7803921569, blue: 0.6941176471, alpha: 1)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.hidesWhenStopped = true
		view.startAnimating()
		return view
		
	}()
	
	
	lazy var indicatorTitle : UILabel = {
		let label = UILabel()
		label.text = "Loading"
		label.font = UIFont.systemFont(ofSize: 20,weight: .bold)
		label.textAlignment = .center
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	
	lazy var indicatorMessage : UILabel = {
		let label = UILabel()
		label.text = "Please wait"
		label.textAlignment = .center
		label.font = UIFont.systemFont(ofSize: 19,weight: .regular)
			
		label.translatesAutoresizingMaskIntoConstraints = false
		return  label
		
	}()
	
	
	lazy var blurView : UIVisualEffectView = {
		let view = UIVisualEffectView()
		view.effect = UIBlurEffect(style: .regular)
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setUpView()
	}
	
	init(frame: CGRect,title: String = "" ,message: String = "", style : UIActivityIndicatorView.Style = .whiteLarge) {
		self.title = title
		self.message = message
		self.style = style
		super.init(frame: frame)
		setUpView()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	
	func setUpView(){
		//self.translatesAutoresizingMaskIntoConstraints = false
		self.tag = 900009
		
		
		
		
		
		blurView.contentView.addSubview(indicator)
		blurView.contentView.addSubview(indicator)
		blurView.contentView.addSubview(indicatorTitle)
		blurView.contentView.addSubview(indicatorMessage)
		
		addSubview(blurView)
		
		blurView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
		blurView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		blurView.topAnchor.constraint(equalTo: topAnchor).isActive = false
		blurView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
		blurView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
		blurView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
		
		
		
		if UIDevice.current.userInterfaceIdiom == .pad {
			
			//indicator.topAnchor.constraint(equalTo: blurView.contentView.topAnchor,constant: 200).isActive = true
			//indicator.centerXAnchor.constraint(equalTo: blurView.contentView.centerXAnchor).isActive = true
			
			indicator.centerXAnchor.constraint(equalTo: blurView.contentView.centerXAnchor).isActive = true
			indicator.centerYAnchor.constraint(equalTo: blurView.contentView.centerYAnchor).isActive = true
			
		}else{
			indicator.centerXAnchor.constraint(equalTo: blurView.contentView.centerXAnchor).isActive = true
			indicator.centerYAnchor.constraint(equalTo: blurView.contentView.centerYAnchor).isActive = true
		}
		
		
		
		indicatorTitle.centerXAnchor.constraint(equalTo: blurView.contentView.centerXAnchor).isActive = true
		indicatorTitle.topAnchor.constraint(equalTo: indicator.bottomAnchor,constant: 10).isActive = true
		indicatorMessage.centerXAnchor.constraint(equalTo: blurView.contentView.centerXAnchor).isActive = true
		indicatorMessage.topAnchor.constraint(equalTo: indicatorTitle.bottomAnchor,constant: 10).isActive = true
		
		setValues()
	}
	
	
	
	func setValues(){
		
		if isSuccess ==  true {
			self.indicatorTitle.textColor = successColor
		}
		
		self.indicator.style = self.style
		self.indicator.color = #colorLiteral(red: 0.003921568627, green: 0.7803921569, blue: 0.6941176471, alpha: 1)
		self.indicatorMessage.text = self.message
		self.indicatorTitle.text = self.title
		
		
		
		
	}
	
}

