//
//  TopImageCell.swift
//  Taileur
//
//  Created by Engineer 144 on 18/09/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import UIKit
class TopImageCell : UITableViewCell{
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setUpViews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setUpViews()
	}
	
	lazy var mainImageView: UIImageView = {
		let view = UIImageView()
		view.contentMode = UIView.ContentMode.scaleAspectFill
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	func setUpViews(){
		selectionStyle = .none
		addSubview(mainImageView)
		mainImageView.pintoTop(superview: topAnchor)
		mainImageView.pintoLeft(superview: leadingAnchor)
		mainImageView.pintoRight(superview: trailingAnchor)
		mainImageView.pintoBottom(superview: bottomAnchor)
		backgroundColor  = .red
	}
	
}
