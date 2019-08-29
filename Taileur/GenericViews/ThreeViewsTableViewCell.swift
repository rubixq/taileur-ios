//
//  ThreeViewsTableViewCell.swift
//  Taileur
//
//  Created by Engineer 144 on 29/08/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import UIKit

class ThreeViewsTableViewCell: UITableViewCell {

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
		addSubview(subtitleLabel)
		
		iconImage.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10).isActive = true
		iconImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
		
		iconImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
		iconImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
		
		titleLabel.topAnchor.constraint(equalTo: iconImage.topAnchor,constant: 2).isActive = true
		titleLabel.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor,constant: 10).isActive = true
	
		subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
		subtitleLabel.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor,constant: 10).isActive = true
		
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
	
	lazy var subtitleLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font =  setFont(name: ".SFUIDisplay-Thin", size: 16)
		label.textAlignment = .left
   label.textColor = UIColor.gray
		label.text = "Ghana"
		return label
	}()
}
