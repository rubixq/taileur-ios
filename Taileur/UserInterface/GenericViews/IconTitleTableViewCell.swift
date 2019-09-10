//
//  IconTitleTableViewCell.swift
//  Taileur
//
//  Created by Engineer 144 on 10/09/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import UIKit

class IconTitleTableViewCell: UITableViewCell {

	
	override func awakeFromNib() {
		super.awakeFromNib()
		constrainView()
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		
		constrainView()
	}
	
	
	
	
	func constrainView(){
		
		addSubview(iconImage)
		addSubview(titleLabel)
		addSubview(forwardArrow)
		
		iconImage.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20).isActive = true
		iconImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
		
		iconImage.setHeightAnchor(30)
		iconImage.setWithAnchor(30)
		
		titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
		titleLabel.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor,constant: 20).isActive = true
		
		forwardArrow.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20).isActive = true
		forwardArrow.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
		
		forwardArrow.setHeightAnchor(20)
		forwardArrow.setWithAnchor(20)

	}
	
	
	
	lazy var iconImage: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFill
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = regularFont
		label.textAlignment = .left
		label.text = "GHS"
		return label
	}()
	
	lazy var forwardArrow: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFill
		imageView.image = #imageLiteral(resourceName: "forward")
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
}
