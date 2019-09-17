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


protocol BottomCellDelegate {
	func BottomCellclicked(data: ProductSummary,collectionCell : UICollectionViewCell)
}

class BottomCell : UITableViewCell {
	
	var delegate : BottomCellDelegate!

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
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

		}) { (tab,row,collectionview,cell) in
			guard let _delegate = self.delegate else { return  }
			_delegate.BottomCellclicked(data: tab,collectionCell: cell)
			
		}
		//collectionview.contentInset = UIEdgeInsets(top: 0, left: 2, bottom: -1, right: 0)
		collectionview.showsVerticalScrollIndicator = false
		collectionview.showsHorizontalScrollIndicator = false
		collectionview.backgroundColor =  .white //UIColor(hue: 0.95, saturation: 0, brightness: 0.96, alpha: 1.0)
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
		label.font = regularBoldFont
		label.textAlignment = .left
		label.adjustsFontSizeToFitWidth = true
		return label
	}()
	
	
	lazy var itemPrice : UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.init(name: ".SFUIDisplay", size: 15)
		label.numberOfLines = 0
		label.textAlignment = .left
		return label
	}()
	
	lazy var categoryLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = " Sign In to continue"
		label.textAlignment = .left
		label.font = setFont(name: ".SFUIDisplay", size: 14)
		label.textColor = .gray
		return label
	}()
	
	lazy var stack: UIStackView = {
		let view = UIStackView()
		view.axis = .vertical
		view.spacing = 5
		view.distribution = UIStackView.Distribution.fillEqually
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

		//stack.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
	//	stack.topAnchor.constraint(equalTo: itemImage.bottomAnchor,constant: 5).isActive = true
		stack.pintoLeft(superview: itemImage)
		stack.pintoBottom(superview: self,space: -15)
	//	stack.leftAnchor.constraint(equalTo: leftAnchor,constant: 15).isActive = true
	//	stack.rightAnchor.constraint(equalTo: rightAnchor,constant: -15).isActive = true
		//stack.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -15).isActive = true
		
		/**itemPrice.heightAnchor.constraint(equalToConstant: 40).isActive = true
		itemPrice.topAnchor.constraint(equalTo: itemImage.bottomAnchor,constant: 2).isActive = true
		itemPrice.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		itemPrice.leftAnchor.constraint(equalTo: leftAnchor,constant: 15).isActive = true
		itemPrice.rightAnchor.constraint(equalTo: rightAnchor,constant: -15).isActive = true
		
		itemName.topAnchor.constraint(equalTo: itemPrice.bottomAnchor,constant: 1).isActive = true
		itemName.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		
		itemName.leftAnchor.constraint(equalTo: leftAnchor,constant: 15).isActive = true
		itemName.rightAnchor.constraint(equalTo: rightAnchor,constant: -15).isActive = true
		itemName.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -15).isActive = true
		
		
		**/
		
		
	}
	
	/**override init(frame: CGRect) {
		super.init(frame: frame)
		setUpViews()
		
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setUpViews()
	}
	
	func setUpViews(){
		
	//	self.addShadow()
		
		mainstack.addArrangedSubview(icon)
		stack.addArrangedSubview(nameLabel)
		stack.addArrangedSubview(categoryLabel)
		stack.addArrangedSubview(priceLabel)

		mainstack.addArrangedSubview(stack)
		addSubview(mainstack)
		
		mainstack.pintoTop(superview: self,space: 1)
		mainstack.pintoLeft(superview: self)
		mainstack.pintoRight(superview: self)
		mainstack.pintoBottom(superview: self)

	//	icon.centerVerticalToView(self)
		
	//	stack.topAnchor.constraint(equalTo: icon.bottomAnchor,constant: 10).isActive = true
	 // stack.centerVerticalToView(self)
		
		
	//	icon.setWithAnchor(100)
	//	icon.setHeightAnchor(100)
		
	}
	
	lazy var nameLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Welcome,"
		label.font = regularBoldFont
		return label
	}()
	
	lazy var categoryLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = " Sign In to continue"
		label.font = setFont(name: ".SFUIDisplay", size: 16)
		label.textColor = .gray
		return label
	}()
	
	lazy var priceLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = " Sign In to continue"
		label.font = setFont(name: ".SFUIDisplay", size: 16)
		label.textColor = .gray
		return label
	}()
	
	lazy var stack: UIStackView = {
		let view = UIStackView()
		view.axis = .vertical
		view.spacing = 3
		view.distribution = UIStackView.Distribution.fill
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	lazy var mainstack: UIStackView = {
		let view = UIStackView()
		view.axis = .vertical
		view.spacing = 3
		view.distribution = UIStackView.Distribution.fillEqually
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	lazy var icon: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.isUserInteractionEnabled = true
		imageView.contentMode = UIView.ContentMode.scaleAspectFit
		return imageView
	}()
	**/
}
