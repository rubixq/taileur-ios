//
//  ProductDetailCell.swift
//  Taileur
//
//  Created by Engineer 144 on 18/09/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//


import UIKit
class ProductDetailCell : UITableViewCell{
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setUpViews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setUpViews()
	}
	
	lazy var detailText: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.numberOfLines = 0
		label.textAlignment = .left
		label.textColor = .gray
      label.font = UIFont.systemFont(ofSize: 17,weight: .regular)
		label.text = "The vintage-inspired floral design featured on this by-the-yard fabric is just as awe-inspiring as a beautiful meadow."
		return label
	}()
	
	lazy var readMoreButon: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitleColor(.red, for: .normal)
		button.setTitleColor(.black, for: .highlighted)
		button.setTitle("Read More", for: .normal)

		return button
	}()
	
	func setUpViews(){
		backgroundColor = UIColor(hue: 0.95, saturation: 0, brightness: 0.96, alpha: 1.0)
		addSubview(detailText)
		addSubview(readMoreButon)
		selectionStyle = .none
		detailText.centerHorizontalToView(self)
		detailText.pintoTop(superview: self,space: 5)
		detailText.pintoLeft(superview: self,space: 20)
		detailText.pintoRight(superview: self,space: -20)
		detailText.pintoBottom(superview: readMoreButon.topAnchor,space: -5)
		
		readMoreButon.pintoBottom(superview: self,space: -5)
		readMoreButon.pintoLeft(superview: self,space: 20)
		readMoreButon.centerHorizontalToView(self)
		

	}
	
}

