//
//  ProductSummaryCell.swift
//  Taileur
//
//  Created by Engineer 144 on 18/09/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import UIKit
class ProductSummaryCell : UITableViewCell {
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setUpViews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setUpViews()
	}
	
	
	func setUpViews(){
		addSubview(titleLabel)
		addSubview(levelbadgeIcon)
		selectionStyle = .none
		addSubview(listOfCategoryItems)
		
		titleLabel.pintoTop(superview: self,space: 30)
		titleLabel.pintoLeft(superview: self,space: 20)
		
		levelbadgeIcon.pintoTop(superview: self,space: 20)
		levelbadgeIcon.pintoRight(superview: self,space: -20)
		levelbadgeIcon.setHeightAnchor(40)
		levelbadgeIcon.setWithAnchor(40)
		
		listOfCategoryItems.setHeightAnchor(50)
		listOfCategoryItems.pintoTop(superview: levelbadgeIcon.bottomAnchor,space: 20)
		listOfCategoryItems.pintoRight(superview: self,space: -15)
		listOfCategoryItems.pintoLeft(superview: self,space: 15)
		
		self.backgroundColor = UIColor(hue: 0.95, saturation: 0, brightness: 0.96, alpha: 1.0)
	}
	
	lazy var titleLabel: UILabel = {
		let label  = UILabel()
		label.font = UIFont.systemFont(ofSize: 18,weight: .bold)
		label.translatesAutoresizingMaskIntoConstraints = false
		label.numberOfLines = 0
		return label
	}()
	
	
	lazy var levelbadgeIcon: UIImageView = {
		let view = UIImageView()
		view.contentMode = UIView.ContentMode.scaleAspectFill
		view.translatesAutoresizingMaskIntoConstraints = false
		view.image = #imageLiteral(resourceName: "approved")
		return view
	}()
	
	lazy var categorylayout : UICollectionViewFlowLayout = {
		let lay = UICollectionViewFlowLayout()
		lay.scrollDirection = .horizontal
		lay.minimumLineSpacing = 4
		lay.minimumInteritemSpacing = 4
		return lay
	}()
	
	lazy var listOfCategoryItems: SmallCellsCollectionView<ProductSummaryAttributes, ProductattributeCell> = {
		let attributeData : [ProductSummaryAttributes] =  [ProductSummaryAttributes(name: "Size", attributeName: "12 yards", type: .size),
																											 ProductSummaryAttributes(name: "Color", attributeName: "", type: .color)]
		let collectionview = SmallCellsCollectionView.init(frame: .zero, layout: categorylayout, items: attributeData, configure: { (cell : ProductattributeCell, attribute,index) in
			cell.titleLabel.text = attribute.name
			if attribute.type == .color {
				cell.actionButton.backgroundColor = .black
				cell.actionButton.setHeightAnchor(20)
				cell.actionButton.setWithAnchor(20)
				cell.actionButton.layer.cornerRadius = 10
			}else{
				cell.actionButton.setTitle(attribute.attributeName, for: .normal)
			}
			
			
		}) { (category,row,collectionView,args)  in
			
		}
		
		collectionview.showsVerticalScrollIndicator = false
		collectionview.showsHorizontalScrollIndicator = false
		collectionview.backgroundColor = UIColor(hue: 0.95, saturation: 0, brightness: 0.96, alpha: 1.0)
		collectionview.translatesAutoresizingMaskIntoConstraints = false
		return collectionview
	}()
	
}


