//
//  ProductattributeCell.swift
//  Taileur
//
//  Created by Engineer 144 on 18/09/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import UIKit
class ProductattributeCell: UICollectionViewCell {
	
	
	lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .gray
		label.textAlignment = .center
		label.adjustsFontSizeToFitWidth = true
		label.sizeToFit()
		label.font = UIFont.systemFont(ofSize: 17,weight: .regular)
		return label
	}()
	
	lazy var actionButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitleColor(.black, for: .normal)
		
		return button
	}()
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setUpViews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setUpViews()
	}
	
	func setUpViews() {
		
		layer.cornerRadius = 22.5
		layer.borderWidth = 1
		backgroundColor =   UIColor(hue: 0.95, saturation: 0, brightness: 0.96, alpha: 1.0)
		addSubview(titleLabel)
		addSubview(actionButton)
		titleLabel.pintoLeft(superview: self,space: 20)
		titleLabel.centerHorizontalToView(self)
		actionButton.pintoRight(superview: self,space: -20)
		actionButton.centerHorizontalToView(self)
		
		
		
	}
}
