//
//  MiddleCell.swift
//  Taileur
//
//  Created by Engineer 144 on 13/09/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import UIKit


struct MiddleData{
	var icon : UIImage!
	var title : String!
	var subtitle: String!
}



class MiddleCell : UICollectionViewCell {
	override init(frame: CGRect) {
		super.init(frame: frame)
		setUpViews()
		
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setUpViews()
	}
	
	func setUpViews(){
		
		addSubview(middleCollectionView)
		middleCollectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
		middleCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
		middleCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10).isActive = true
		middleCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -8).isActive = true
		
		
	}
	
	lazy var middleLayout : UICollectionViewFlowLayout = {
		let lay = UICollectionViewFlowLayout()
		lay.scrollDirection = .horizontal
		lay.minimumLineSpacing = 10
		lay.minimumInteritemSpacing = 10
		
		return lay
	}()
	
	
	lazy var middleCollectionView: GenericCollectionView<MiddleData, MiddleCellCollectionViewCell> = {
		var data : [MiddleData] = [MiddleData(icon: #imageLiteral(resourceName: "designer"), title: "Mark Q", subtitle: "300 Heats"),MiddleData(icon: #imageLiteral(resourceName: "denxel"), title: "Bobby smith Q", subtitle: "300 Heats"),MiddleData(icon: #imageLiteral(resourceName: "designer"), title: "Mark Q", subtitle: "300 Heats"),MiddleData(icon: #imageLiteral(resourceName: "designer"), title: "Mark Q", subtitle: "300 Heats"),MiddleData(icon: #imageLiteral(resourceName: "designer"), title: "Mark Q", subtitle: "300 Heats")]
		let collectionview = GenericCollectionView.init(frame: .zero, layout: middleLayout, items: data, configure: { (cell : MiddleCellCollectionViewCell, tab,index) in
			
			cell.icon.image = tab.icon
			cell.title.text = tab.title
			cell.subtitle.text = tab.subtitle
		}) { (tab,row,collectionview) in
			
			
		}
		collectionview.contentInset = UIEdgeInsets(top: 0, left: 2, bottom: -1, right: 0)
		collectionview.showsVerticalScrollIndicator = false
		collectionview.showsHorizontalScrollIndicator = false
		collectionview.backgroundColor =  .white //UIColor(hue: 0.95, saturation: 0, brightness: 0.96, alpha: 1.0)
		collectionview.translatesAutoresizingMaskIntoConstraints = false
		return collectionview
	}()
	
}






class MiddleCellCollectionViewCell : UICollectionViewCell {
	override init(frame: CGRect) {
		super.init(frame: frame)
		setUpViews()
		
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setUpViews()
	}
	
	func setUpViews(){
		//self.backgroundColor = .red
		//self.clipsToBounds = true
		//self.layer.cornerRadius = 12
		//	self.backgroundColor =  .lightGray //UIColor(hue: 0.95, saturation: 0, brightness: 0.96, alpha: 1.0)
		self.addShadow()
		addSubview(icon)
		stack.addArrangedSubview(title)
		stack.addArrangedSubview(subtitle)
		addSubview(stack)
		icon.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10).isActive = true
		icon.centerHorizontalToView(self)
		
		stack.leadingAnchor.constraint(equalTo: icon.trailingAnchor,constant: 10).isActive = true
		stack.centerHorizontalToView(self)
		stack.pintoRight(superview: self,space: -2)
		
		icon.setWithAnchor(50)
		icon.setHeightAnchor(50)
		
	}
	
	lazy var title: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Welcome,"
		label.font = regularBoldFont
		return label
	}()
	
	lazy var subtitle: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = " Sign In to continue"
		label.font = setFont(name: ".SFUIDisplay", size: 15)
		label.textColor = .gray
		return label
	}()
	
	lazy var stack: UIStackView = {
		let view = UIStackView()
		view.axis = .vertical
		view.spacing = 3
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	
	lazy var icon: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.isUserInteractionEnabled = true
		//imageView.contentMode = UIView.ContentMode.scaleToFill
	  imageView.contentMode = UIView.ContentMode.center
	//	imageView.image = #imageLiteral(resourceName: "profilepicture")
		//	imageView.contentMode = .scaleAspectFill
		imageView.layer.cornerRadius = 25
		imageView.layer.borderColor =  UIColor.red.cgColor //UIColor(red: 0.8588, green: 0.8588, blue: 0.8588, alpha: 1.0).cgColor
		imageView.layer.borderWidth = 0.5
		imageView.clipsToBounds = true
		return imageView
	}()
	
}
