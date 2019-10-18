//
//  UserProfileSubView.swift
//  Taileur
//
//  Created by Engineer 144 on 09/09/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import UIKit

protocol UserProfileSubViewProtocol{
	func selectedAction(_ profileItem : UserProfileCellItem)
}

struct UserProfileCellItem{
	var icon : UIImage
	var title : String
}

class UserProfileSubView: UIView {

	var delegate : UserProfileSubViewProtocol!
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupViews()
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setupViews(){
		translatesAutoresizingMaskIntoConstraints = false
		
		
		nameCountryStack.addArrangedSubview(userNameLabel)
		nameCountryStack.addArrangedSubview(userCountryLabel)
		
		topView.addSubview(verificationStateIcon)
		topView.addSubview(userImage)
		topView.addSubview(nameCountryStack)
		
		addSubview(topView)
		addSubview(descriptionlabel)
		
		topView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
		topView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
		topView.topAnchor.constraint(equalTo: topAnchor).isActive = true
		//topView.heightAnchor.constraint(equalToConstant: 200).isActive = true
		
		userImage.topAnchor.constraint(equalTo: topView.topAnchor,constant: 40).isActive = true
		userImage.bottomAnchor.constraint(equalTo: topView.bottomAnchor,constant: -20).isActive = true
		userImage.leadingAnchor.constraint(equalTo: topView.leadingAnchor,constant: 20).isActive = true
		userImage.centerHorizontalToView(topView)
		userImage.setWithAnchor(100)
		userImage.setHeightAnchor(100)
		
		nameCountryStack.leadingAnchor.constraint(equalTo: userImage.trailingAnchor,constant: 20).isActive = true
		nameCountryStack.centerHorizontalToView(topView)
		
		verificationStateIcon.leadingAnchor.constraint(equalTo: nameCountryStack.trailingAnchor,constant: 20).isActive = true
		verificationStateIcon.centerHorizontalToView(topView)
		
		addSubview(bottomTableView)

		bottomTableView.topAnchor.constraint(equalTo: descriptionlabel.bottomAnchor).isActive = true
		bottomTableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
		bottomTableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
		bottomTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
		
		descriptionlabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20).isActive = true
		descriptionlabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20).isActive = true

		descriptionlabel.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
		descriptionlabel.bottomAnchor.constraint(equalTo: bottomTableView.topAnchor,constant: -20).isActive = true

	}
	
	
	lazy var nameCountryStack: UIStackView = {
		let stack = UIStackView()
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.axis = .vertical
		stack.distribution = .fillProportionally
		return stack
	}()
	
	lazy var userImage: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = UIView.ContentMode.center
      imageView.image = #imageLiteral(resourceName: "profilepicture")
		imageView.layer.cornerRadius = 50
		imageView.layer.borderColor =  UIColor.red.cgColor
		imageView.layer.borderWidth = 0.5
		imageView.clipsToBounds = true
		return imageView
	}()

	lazy var descriptionlabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "While we do our verification please take a minute to complete your profile"
		label.font = UIFont.systemFont(ofSize: 17,weight: .thin)
		label.numberOfLines = 0
		return label
	}()
	
	lazy var userNameLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Username"
		label.font =  UIFont.systemFont(ofSize: 24,weight: .regular)
		return label
	}()
	
	lazy var userCountryLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Set country"
		label.font =  UIFont.systemFont(ofSize: 17,weight: .regular)
		return label
	}()
	
	
	lazy var verificationStateIcon: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = UIView.ContentMode.scaleAspectFit
		imageView.image = #imageLiteral(resourceName: "approved")
		return imageView
	}()
	
	
	
	lazy var topView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		
		return view
	}()
	
	
	 var profileItems: [UserProfileCellItem] = {
		var items : [UserProfileCellItem] = []
		items.append(UserProfileCellItem(icon: #imageLiteral(resourceName: "edit"), title: "Profile & Experience"))
		items.append(UserProfileCellItem(icon: #imageLiteral(resourceName: "review"), title: "Reviews"))
		items.append(UserProfileCellItem(icon: #imageLiteral(resourceName: "lookbook"), title: "Look Book"))
		items.append(UserProfileCellItem(icon: #imageLiteral(resourceName: "package"), title: "All Ready Made to Go"))
		items.append(UserProfileCellItem(icon: #imageLiteral(resourceName: "tracker"), title: "Progress Tracker"))
		return items
	}()
	
	lazy var bottomTableView : GenericTableView<UserProfileCellItem, IconTitleTableViewCell> = {
		
		
		let tableview = GenericTableView.init(items: profileItems, configure: { (cell : IconTitleTableViewCell, item) in
			cell.titleLabel.text = item.title
			cell.iconImage.image = item.icon
		},selectHandler: { (item, cell) in
			
			guard let _delegate = self.delegate else { return }
			_delegate.selectedAction(item)
		})
		
		tableview.isScrollEnabled = false 
		return tableview
	}()
}
