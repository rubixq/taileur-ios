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
	
	lazy var homeCollectionView: UICollectionView = {
		let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
		collection.translatesAutoresizingMaskIntoConstraints = false
		collection.delegate  = self
		collection.dataSource = self
		collection.register(TopCell.self, forCellWithReuseIdentifier: "TopCell")
		collection.register(MiddleCell.self, forCellWithReuseIdentifier: "MiddleCell")
		collection.register(BottomCell.self, forCellWithReuseIdentifier: "BottomCell")

		collection.backgroundColor = .white
		return collection
	}()

    override func viewDidLoad() {
        super.viewDidLoad()

			self.navigationController?.navigationBar.prefersLargeTitles = true
			self.title = "Home"
		//	self.navigationItem.searchController = searchController
			//searchController.searchBar.placeholder = "Search product"
			//searchController.searchBar.searchBarStyle = .minimal
			//searchController.searchBar.delegate = self
			//searchController.searchBar.backgroundColor = .red
	  	//searchController.searchBar.textField?.backgroundColor = .yellow
			//searchController.searchBar.textField?.tintColor = .yellow
		//	definesPresentationContext = true
		//	searchController.obscuresBackgroundDuringPresentation = false
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
			return CGSize(width: collectionView.frame.width, height:  collectionView.frame.height)
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
			return 1
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
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BottomCell", for: indexPath) as! BottomCell
			return cell
		default:
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopCell", for: indexPath) as! TopCell
			return cell
		}
	}
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 3
	}

	
	
}














