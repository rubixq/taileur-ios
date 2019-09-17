//
//  HomeViewController.swift
//  Taileur
//
//  Created by Engineer 144 on 09/09/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
	let searchController = UISearchController(searchResultsController: nil)
	
	var data : [ProductSummary] = [ProductSummary(image: #imageLiteral(resourceName: "kafdab"), name: "Shirt and Trouser", category: "Dress", price: "GHS109"),ProductSummary(image: #imageLiteral(resourceName: "kafdab"), name: "Shirt", category: "Dress", price: "GHS109"),ProductSummary(image: #imageLiteral(resourceName: "kafdab"), name: "Shirt", category: "Dress", price: "GHS109"),ProductSummary(image: #imageLiteral(resourceName: "kafdab"), name: "Shirt", category: "Dress", price: "GHS109"),ProductSummary(image: #imageLiteral(resourceName: "kafdab"), name: "Shirt", category: "Dress", price: "GHS109"),ProductSummary(image: #imageLiteral(resourceName: "kafdab"), name: "Shirt", category: "Dress", price: "GHS109"),ProductSummary(image: #imageLiteral(resourceName: "kafdab"), name: "Shirt", category: "Dress", price: "GHS109"),ProductSummary(image: #imageLiteral(resourceName: "kafdab"), name: "Shirt", category: "Dress", price: "GHS109")]
	
	lazy var homeCollectionView: UICollectionView = {
		let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
		collection.translatesAutoresizingMaskIntoConstraints = false
		collection.delegate  = self
		collection.dataSource = self
		collection.register(CollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CollectionViewHeader")
		collection.register(TopCell.self, forCellWithReuseIdentifier: "TopCell")
		collection.register(MiddleCell.self, forCellWithReuseIdentifier: "MiddleCell")
		collection.register(BottomCellCollectionViewCell.self, forCellWithReuseIdentifier: "BottomCellCollectionViewCell")
    collection.showsVerticalScrollIndicator = false
		collection.showsHorizontalScrollIndicator = false
		collection.backgroundColor = .white
		return collection
	}()

	override func viewDidLoad() {
			super.viewDidLoad()
		self.navigationController?.navigationBar.prefersLargeTitles = true
		self.title = "Home"
	}
	override func viewDidAppear(_ animated: Bool) {
		homeCollectionView.reloadData()
	}
	override func viewDidLayoutSubviews() {
		view.addSubview(homeCollectionView)
		homeCollectionView.constrainToSuperView(on: view)
	
	}

}

extension HomeViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		switch indexPath.section {
		case 0:
			return CGSize(width: collectionView.frame.width, height: 200)
		case 1:
			return CGSize(width: collectionView.frame.width, height: 105)
		case 2:
			let lay = collectionViewLayout as! UICollectionViewFlowLayout
        let width =  (collectionView.frame.width / 2) - lay.minimumInteritemSpacing
			return CGSize(width: width, height:  280)
		default:
			return CGSize(width: collectionView.frame.width, height: 100)
		}
	}
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		switch section {
		case 0:
			return 1
		case 1 :
			return 1
		case 2 :
			
			return data.count
		default:
			return 1
		}
	}
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		switch indexPath.section {
		case 0:
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopCell", for: indexPath) as! TopCell
			cell.coverView.backgroundColor = .lightGray
			cell.coverView.addShadow()
			cell.itemImage.image = #imageLiteral(resourceName: "lady")
			return cell
		case 1:
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MiddleCell", for: indexPath) as! MiddleCell
			return cell
		case 2:
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BottomCellCollectionViewCell", for: indexPath) as! BottomCellCollectionViewCell
			let product = data[indexPath.item]
			cell.itemImage.image = product.image
			cell.itemName.text = product.name
			cell.categoryLabel.text = product.category
			cell.itemPrice.text = product.price
			return cell
		default:
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopCell", for: indexPath) as! TopCell
			return cell
		}
	}
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 3
	}
	func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		switch indexPath.section {
		case 1:
			let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CollectionViewHeader", for: indexPath) as! CollectionViewHeader
       headerView.viewTitle.text = "Featured Designers"
      return headerView
		case 2 :
			let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CollectionViewHeader", for: indexPath) as! CollectionViewHeader
			headerView.viewTitle.text = "Whats Hot"
			return headerView
		default:
			return UICollectionReusableView()
		}
	}
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
		switch section {
		case 1 , 2:
			return CGSize(width: collectionView.frame.width - 20, height: 35)
		default:
			return CGSize(width: 0, height: 0)
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
		switch indexPath.section {
		case 2:
			let cell = collectionView.cellForItem(at: indexPath) as! BottomCellCollectionViewCell
			cell.backgroundColor = 	UIColor(white: 0.9, alpha: 1)
			
		default:
			break
		}
		
	}
	
	func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
		switch indexPath.section {
		case 2:
			let cell = collectionView.cellForItem(at: indexPath) as! BottomCellCollectionViewCell
			cell.backgroundColor = 	.white
		default: break
			
		}
	}
}



class CollectionViewHeader : UICollectionReusableView {
	override init(frame: CGRect) {
		super.init(frame: frame)
		setUpViews()
	}
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	func setUpViews() {
		
		coverView.addSubview(clickButton)
		coverView.addSubview(viewTitle)
		addSubview(coverView)
		coverView.constrainToSuperView(on: self)
		viewTitle.pintoLeft(superview: coverView,space: 20)
		viewTitle.centerHorizontalToView(coverView)
		clickButton.pintoRight(superview: coverView,space: -20)
		clickButton.centerHorizontalToView(coverView)
		
	}
	lazy var clickButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("See all", for: .normal)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
		button.setTitleColor(#colorLiteral(red: 0.06135459909, green: 0.5319878823, blue: 1, alpha: 1), for: .normal)
		button.setTitleColor(.lightGray, for: .highlighted)
		return button
	}()
	
	lazy var coverView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .white
		return view
	}()
	lazy var viewTitle: UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 18)
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Section goes here"
		return label
	}()
}


