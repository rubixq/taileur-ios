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
	var selectedCell = UIView()
	let transition = TransitionAnimator()

	
	lazy var homeTableview: UITableView = {
		let tableview = UITableView(frame: .zero)
		tableview.translatesAutoresizingMaskIntoConstraints = false
		tableview.delegate  = self
		tableview.dataSource = self
		tableview.register(TableviewHeader.self, forHeaderFooterViewReuseIdentifier: "TableviewHeader")
		tableview.register(TopCell.self, forCellReuseIdentifier: "TopCell")
		tableview.register(MiddleCell.self, forCellReuseIdentifier: "MiddleCell")
		tableview.register(BottomCell.self, forCellReuseIdentifier: "BottomCell")
		tableview.backgroundColor = .white
		tableview.separatorStyle = .none
		return tableview
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
		transition.dismissCompletion = {
			self.selectedCell.isHidden = false
		}
	}
	override func viewDidAppear(_ animated: Bool) {
		homeTableview.reloadData()
	}
	override func viewDidLayoutSubviews() {
		view.addSubview(homeTableview)
		homeTableview.pintoBottom(superview: view,space: 1)
		homeTableview.pintoRight(superview: view)
		homeTableview.pintoTop(superview: view)
		homeTableview.pintoLeft(superview: view)
	
	}

}

extension HomeViewController : UITableViewDelegate,UITableViewDataSource{
	func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
		return UITableView.automaticDimension
	}
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		switch indexPath.section {
		case 0:
			return 200
		case 1:
			return 105
		case 2:
			return tableView.frame.height
		default:
			return 100
		}
	}
	func numberOfSections(in tableView: UITableView) -> Int {
	   return 3
	}
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		switch indexPath.section {
		case 0:
			let cell = tableView.dequeueReusableCell(withIdentifier: "TopCell", for: indexPath) as! TopCell
			cell.coverView.backgroundColor = .lightGray
			cell.coverView.addShadow()
			cell.itemImage.image = #imageLiteral(resourceName: "lady")
			return cell
		case 1:
			let cell = tableView.dequeueReusableCell(withIdentifier: "MiddleCell", for: indexPath) as! MiddleCell
			cell.delegate = self
			return cell
		case 2:
			let cell = tableView.dequeueReusableCell(withIdentifier: "BottomCell", for: indexPath) as! BottomCell
			cell.delegate = self
			return cell
		default:
			let cell = tableView.dequeueReusableCell(withIdentifier: "TopCell", for: indexPath) as! TopCell
			return cell
		}
	}
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		switch section {
		case 1:
			let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TableviewHeader") as! TableviewHeader
			headerView.viewTitle.text = "Featured Designers"
       return headerView
		case 2:
			let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TableviewHeader") as! TableviewHeader
				headerView.viewTitle.text = "Whats Hot"
			return headerView
		default:
			let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TableviewHeader") as! TableviewHeader
			return headerView
		}
	}
	func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
		switch section {
		case 0:
			return 0
		case 1:
			return 90
		case 2:
			return 90
		default:
			return 0
		}
	}
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		selectedCell = tableView.cellForRow(at: indexPath)! 
    presentView()
	}
	
	func presentView(){
		let navigationController = UINavigationController(rootViewController: HomeDetailViewController())
		navigationController.transitioningDelegate = self
		self.present(navigationController, animated: true, completion: nil)
	}
}

extension HomeViewController : MiddleCellDelegate,BottomCellDelegate{
	func BottomCellclicked(data: ProductSummary, collectionCell: UICollectionViewCell) {
		selectedCell = collectionCell
		presentView()
	}
	
	func middleCellclicked(data: MiddleData, collectionCell: UICollectionViewCell) {
		selectedCell = collectionCell
    presentView()
	}
	

	
	
}

extension HomeViewController: UIViewControllerTransitioningDelegate {
	
	func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		guard let originFrame = selectedCell.superview?.convert(selectedCell.frame, to: nil) else {
			return transition
		}
		transition.originFrame = originFrame
		transition.presenting = true
		selectedCell.isHidden = true
		return transition
	}
	
	func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		transition.presenting = false
		return transition
	}
}



class TableviewHeader : UITableViewHeaderFooterView {
	override init(reuseIdentifier: String?) {
		super.init(reuseIdentifier: reuseIdentifier)
		setUpViews()
	}
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	func setUpViews() {
		
		coverView.addSubview(clickButton)
		coverView.addSubview(viewTitle)
		contentView.addSubview(coverView)
		coverView.constrainToSuperView(on: contentView)
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
		button.setTitleColor(.black, for: .normal)
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
