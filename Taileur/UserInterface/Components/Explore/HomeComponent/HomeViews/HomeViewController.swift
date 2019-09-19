//
//  HomeViewController.swift
//  Taileur
//
//  Created by Engineer 144 on 09/09/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import UIKit

protocol HomeViewControllerProtocol {
	func collectionViewSelected(_ indexpath : IndexPath?,cell : UICollectionViewCell?,modelData : AnyObject)
}

class HomeViewController: UIViewController {
	var delegate : HomeViewControllerProtocol!
	var selectedCell = UIView()
	let transition = TransitionAnimator()
	
	var data : [ProductSummary] = [ProductSummary(image: #imageLiteral(resourceName: "kafdab"), name: "Shirt and Trouser", category: "Dress", price: "GHS 109"),
																 ProductSummary(image: #imageLiteral(resourceName: "image"), name: "Neka and Jeans", category: "Dress", price: "GHS 231"),
																 ProductSummary(image: #imageLiteral(resourceName: "denxel"), name: "Kafkan", category: "African", price: "GHS 500"),
																 ProductSummary(image: #imageLiteral(resourceName: "fullimage2"), name: "Ladies", category: "Female", price: "GHS 1,109"),
																 ProductSummary(image: #imageLiteral(resourceName: "fullimage1"), name: "Boss Wear", category: "Men", price: "GHS 700")]
	
	lazy var homeCollectionView: UICollectionView = {
		let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
		collection.translatesAutoresizingMaskIntoConstraints = false
		collection.delegate  = self
		collection.dataSource = self
		collection.register(HomeViewCollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CollectionViewHeader")
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
		self.delegate = self
		transition.dismissCompletion = {
			self.selectedCell.isHidden = false
		}
	}
	override func viewDidAppear(_ animated: Bool) {
		homeCollectionView.reloadData()
	}
	override func viewDidLayoutSubviews() {
		view.addSubview(homeCollectionView)
		homeCollectionView.constrainToSuperView(on: view)
	
	}

	
	
	func presentDetailView(){
		let navigationController = UINavigationController(rootViewController: HomeViewControllerDetail())
		navigationController.transitioningDelegate = self
		self.present(navigationController, animated: true, completion: nil)
	}
	
	
}

extension HomeViewController:HomeViewControllerProtocol{
	func collectionViewSelected(_ indexpath: IndexPath?, cell: UICollectionViewCell?, modelData: AnyObject) {
		guard let cellSelected = cell else { return  }
		  selectedCell = cellSelected
		  presentDetailView()
		
	}
	
	
}



