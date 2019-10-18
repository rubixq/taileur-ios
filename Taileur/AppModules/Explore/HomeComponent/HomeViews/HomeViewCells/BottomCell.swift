//
//  BottomCell.swift
//  Taileur
//
//  Created by Engineer 144 on 13/09/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import UIKit

struct ProductSummary {
	var image : UIImage!
	var name : String!
	var category: String!
	var price: String!
}

class BottomCell : UICollectionViewCell {
	override init(frame: CGRect) {
		super.init(frame: frame)
		setUpViews()
		
		
	}
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setUpViews()
	}
	func setUpViews(){
		
		addSubview(bottomCollectionView)
		bottomCollectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
		bottomCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
		bottomCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10).isActive = true
		bottomCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -8).isActive = true
		
		
	}
	lazy var middleLayout : UICollectionViewFlowLayout = {
		let lay = UICollectionViewFlowLayout()
		lay.scrollDirection = .vertical
		lay.minimumLineSpacing = 1
		lay.minimumInteritemSpacing = 0.5
		return lay
	}()
	lazy var bottomCollectionView: GenericCollectionView<ProductSummary, BottomCellCollectionViewCell> = {
		var data : [ProductSummary] = [ProductSummary(image: #imageLiteral(resourceName: "kafdab"), name: "Shirt and Trouser", category: "Dress", price: "GHS109"),ProductSummary(image: #imageLiteral(resourceName: "kafdab"), name: "Shirt", category: "Dress", price: "GHS109"),ProductSummary(image: #imageLiteral(resourceName: "kafdab"), name: "Shirt", category: "Dress", price: "GHS109"),ProductSummary(image: #imageLiteral(resourceName: "kafdab"), name: "Shirt", category: "Dress", price: "GHS109"),ProductSummary(image: #imageLiteral(resourceName: "kafdab"), name: "Shirt", category: "Dress", price: "GHS109"),ProductSummary(image: #imageLiteral(resourceName: "kafdab"), name: "Shirt", category: "Dress", price: "GHS109"),ProductSummary(image: #imageLiteral(resourceName: "kafdab"), name: "Shirt", category: "Dress", price: "GHS109"),ProductSummary(image: #imageLiteral(resourceName: "kafdab"), name: "Shirt", category: "Dress", price: "GHS109")]
		
		let collectionview = GenericCollectionView.init(cellHeight:100, frame: .zero, layout: middleLayout, items: data, configure: { (cell : BottomCellCollectionViewCell, product,index) in
			
			cell.itemImage.image = product.image
			cell.itemName.text = product.name
			cell.categoryLabel.text = product.category
			cell.itemPrice.text = product.price

		}) { (tab,indexPath,cell,collectionview) in
			
			
		}
		collectionview.showsVerticalScrollIndicator = false
		collectionview.showsHorizontalScrollIndicator = false
		collectionview.backgroundColor =  .white
		collectionview.translatesAutoresizingMaskIntoConstraints = false
		return collectionview
	}()
	
}

class BottomCellCollectionViewCell : UICollectionViewCell {
	lazy var itemImage : UIImageView = {
		let imageview = UIImageView()
		imageview.contentMode = .scaleAspectFill
		imageview.layer.cornerRadius = 4
		imageview.layer.borderColor = UIColor(red: 0.8588, green: 0.8588, blue: 0.8588, alpha: 1.0).cgColor
		imageview.layer.borderWidth = 0.5
		imageview.clipsToBounds = true
		imageview.translatesAutoresizingMaskIntoConstraints = false
		return imageview
	}()
	
	
	lazy var itemName : UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.numberOfLines = 0
		label.font = UIFont.systemFont(ofSize: 16)
		label.textAlignment = .left
		label.adjustsFontSizeToFitWidth = true
		return label
	}()
	
	
	lazy var itemPrice : UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.systemFont(ofSize: 15)
		label.numberOfLines = 0
		label.textAlignment = .left
		return label
	}()
	
	lazy var categoryLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = " Sign In to continue"
		label.textAlignment = .left
		label.font = UIFont.systemFont(ofSize: 14)
		label.textColor = .gray
		return label
	}()
	
	lazy var stack: UIStackView = {
		let view = UIStackView()
		view.axis = .vertical
		view.spacing = 4
		view.distribution = UIStackView.Distribution.fillProportionally
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	//Factory methods
	override init(frame: CGRect) {
		super.init(frame: frame)
		setUpViews()
	}
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setUpViews()
	}
	func setUpViews() {
		//self.addShadow()
		addSubview(itemImage)
		stack.addArrangedSubview(itemName)
		stack.addArrangedSubview(categoryLabel)
		stack.addArrangedSubview(itemPrice)
		addSubview(stack)
		
		
		itemImage.widthAnchor.constraint(equalToConstant: self.frame.width - 20).isActive = true
		itemImage.heightAnchor.constraint(equalToConstant: self.frame.height / 1.5).isActive = true
		
		itemImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		itemImage.topAnchor.constraint(equalTo: topAnchor,constant: 15).isActive = true
		itemImage.bottomAnchor.constraint(equalTo: stack.topAnchor,constant: -10).isActive = true

		stack.pintoLeft(superview: itemImage)
		stack.pintoTop(superview: itemImage.bottomAnchor,space: -2)
	   stack.pintoRight(superview: self)
		
		
	}
	

}
