//
//  ReviewTableCell.swift
//  Taileur
//
//  Created by Engineer 144 on 19/09/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import UIKit
import Cosmos
class ReviewTableCell : UITableViewCell{
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setUpViews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setUpViews(){
		backgroundColor = UIColor(hue: 0.95, saturation: 0, brightness: 0.96, alpha: 1.0)
		selectionStyle = .none

		addSubview(reviewerIcon)
		addSubview(reviewText)
		addSubview(reviewDots)
		addSubview(reviewerName)
		
		
		reviewerIcon.setWithAnchor(60)
		reviewerIcon.setHeightAnchor(60)
		reviewerIcon.pintoTop(superview: topAnchor,space: 20)
		reviewerIcon.pintoLeft(superview: leadingAnchor,space: 20)
		
		reviewerName.pintoTop(superview: topAnchor,space: 20)
		reviewerName.pintoLeft(superview: reviewerIcon.trailingAnchor,space: 10)
		
		reviewText.pintoTop(superview: reviewerName.bottomAnchor,space: 5)
		//reviewText.pintoBottom(superview: bottomAnchor,space: -20)

		reviewText.setWithAnchor(frame.width - 80)
		reviewText.pintoLeft(superview:reviewerName.leadingAnchor)
		//reviewText.pintoRight(superview:trailingAnchor,space: -10)
		
		
		reviewDots.setWithAnchor(100)
		reviewDots.pintoTop(superview: topAnchor,space: 20)
		//reviewDots.pintoLeft(superview: reviewerName.trailingAnchor,space: 20)
   reviewDots.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20).isActive = true
		
	}
	
	
	lazy var reviewerIcon: UIImageView = {
		let view = UIImageView()
		view.layer.cornerRadius = 30
		//view.layer.cornerRadius = 25
		view.layer.borderColor =  UIColor.lightGray.cgColor //UIColor(red: 0.8588, green: 0.8588, blue: 0.8588, alpha: 1.0).cgColor
		view.layer.borderWidth = 0.5
		view.clipsToBounds = true
		view.image = #imageLiteral(resourceName: "fullimage1")
		view.contentMode = UIView.ContentMode.scaleAspectFit
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	lazy var reviewerName: UILabel = {
		let label = UILabel()
		label.text = "Arch Brew"
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	lazy var reviewText: UILabel = {
		let label = UILabel()
		label.text = "Wonderful jean, perfect gift for my girl for our anniversary!"
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .gray
		label.font = UIFont.systemFont(ofSize: 15,weight: .regular)
		label.numberOfLines = 0 
		return label
	}()
	
	lazy var reviewDots: CosmosView = {
		let view = CosmosView()
		view.settings.totalStars = 4
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
}
