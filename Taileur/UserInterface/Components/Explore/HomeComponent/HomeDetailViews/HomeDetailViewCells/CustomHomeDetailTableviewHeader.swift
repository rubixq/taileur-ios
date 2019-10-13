//
//  CustomHomeDetailTableviewHeader.swift
//  Taileur
//
//  Created by Engineer 144 on 18/09/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import UIKit
class CustomHomeDetailTableviewHeader: UITableViewHeaderFooterView {
	override init(reuseIdentifier: String?) {
		super.init(reuseIdentifier: reuseIdentifier)
		setUpViews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError()
		//setUpViews()
	}
	
	
	func setUpViews(){
		contentView.addSubview(coverMain)
		coverMain.constrainToSuperView(on: contentView)
		coverMain.addSubview(headerTitle)
		coverMain.addSubview(writeReview)
		
		headerTitle.centerHorizontalToView(coverMain)
		headerTitle.pintoLeft(superview: coverMain,space: 20)
		headerTitle.pintoRight(superview: coverMain,space: -20)
		
		//writeReview.centerVerticalToView(coverMain)
		writeReview.pintoTop(superview: headerTitle.bottomAnchor)
		writeReview.pintoLeft(superview: coverMain,space: 20)
		//writeReview.pintoRight(superview: coverMain,space: -20)
		

	}
	
	lazy var coverMain: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor  = UIColor(hue: 0.95, saturation: 0, brightness: 0.96, alpha: 1.0)
		return view
	}()
	lazy var headerTitle: UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 16,weight: .bold)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	lazy var writeReview: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("Write Review", for: .normal)
		button.setTitleColor(UIColor(hue: 0.4194, saturation: 1, brightness: 0.77, alpha: 1.0), for: .normal)
		button.setTitleColor(#colorLiteral(red: 0.1203751341, green: 0.7845523953, blue: 0.848885715, alpha: 1), for: .highlighted)
		return button
	}()
}
