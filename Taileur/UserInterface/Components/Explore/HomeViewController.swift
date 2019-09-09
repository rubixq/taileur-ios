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

    override func viewDidLoad() {
        super.viewDidLoad()

			self.navigationController?.navigationBar.prefersLargeTitles = true
			//self.navigationController?.navigationBar.tintColor =  .red
			self.title = "Home"
			self.navigationItem.searchController = searchController
			searchController.searchBar.placeholder = "Search product"
			searchController.searchBar.searchBarStyle = .minimal
			//searchController.searchBar.delegate = self
			//searchController.searchBar.backgroundColor = .red

			
			searchController.searchBar.textField?.backgroundColor = .yellow
			searchController.searchBar.textField?.tintColor = .yellow
			
			definesPresentationContext = true
			searchController.obscuresBackgroundDuringPresentation = false
    }
    


}
extension UISearchBar {
	
	var textField: UITextField? {
		let subViews = subviews.flatMap { $0.subviews }
		return (subViews.filter { $0 is UITextField }).first as? UITextField
	}
}
