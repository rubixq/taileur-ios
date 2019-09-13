//
//  TopCell.swift
//  Taileur
//
//  Created by Engineer 144 on 13/09/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import UIKit
class TopCell : UICollectionViewCell{
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setUpViews()
		
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setUpViews()
	}
	
	
	
	lazy var coverView: UIView = {
		let view = UIView()
		view.backgroundColor = .red
		view.clipsToBounds = true
		view.layer.cornerRadius = 12
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	lazy var itemImage : UIImageView = {
		let imageview = UIImageView()
	
		imageview.contentMode = UIView.ContentMode.scaleAspectFill
		imageview.translatesAutoresizingMaskIntoConstraints = false
		return imageview
	}()
	func setUpViews(){
		
		coverView.addSubview(itemImage)
		addSubview(coverView)
		itemImage.constrainToSuperView(on: coverView)

		coverView.topAnchor.constraint(equalTo: topAnchor,constant: 10).isActive = true
		coverView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -10).isActive = true
		coverView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10).isActive = true
		coverView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10).isActive = true
		
		
	
	}
}
