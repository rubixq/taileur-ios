//
//  HomeViewControllerDetail.swift
//  Taileur
//
//  Created by Engineer 144 on 18/09/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import UIKit



enum productSummaryAttributeType{
	case size
	case color
}
struct ProductSummaryAttributes {
	var name : String!
	var attributeName : String!
	var type : productSummaryAttributeType
}










class HomeViewControllerDetail: UIViewController {
	
	lazy var detailTableView: UITableView = {
		let tableview = UITableView(frame: .zero)
		tableview.translatesAutoresizingMaskIntoConstraints = false
		tableview.register(CustomHomeDetailTableviewHeader.self, forHeaderFooterViewReuseIdentifier: "CustomHomeDetailTableviewHeader")
		tableview.register(TopImageCell.self, forCellReuseIdentifier: "TopImageCell")
		tableview.register(ProductSummaryCell.self, forCellReuseIdentifier: "ProductSummaryCell")
		tableview.register(ProductDetailCell.self, forCellReuseIdentifier: "ProductDetailCell")
		tableview.delegate = self
		tableview.dataSource = self
		tableview.backgroundColor = UIColor(hue: 0.95, saturation: 0, brightness: 0.96, alpha: 1.0)
		tableview.layoutMargins = .zero
		tableview.separatorStyle = .none
		tableview.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
		tableview.rowHeight = UITableView.automaticDimension
		
		return tableview
	}()

	lazy var bottomViewCover: UIView = {
		let view = UIView()
		view.backgroundColor = .white  //UIColor(hue: 0.95, saturation: 0, brightness: 0.96, alpha: 1.0)
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	lazy var priceLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .lightGray
		label.text = "Price"
		label.font = UIFont.systemFont(ofSize: 18)
		return label
	}()
	
	lazy var priceValue: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = UIColor(hue: 0.4194, saturation: 1, brightness: 0.77, alpha: 1.0) /* #00c569 */
		label.text = "GHS 100"
		label.font = UIFont.systemFont(ofSize: 20)

		return label
	}()
	
	lazy var buyButtom: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("BUY NOW", for: .normal)
		button.setTitleColor(.white, for: .normal)
		button.setTitleColor(.lightGray, for: .highlighted)

		button.backgroundColor = UIColor(hue: 0.4694, saturation: 0.69, brightness: 0.86, alpha: 1.0)
		button.layer.cornerRadius = 4
		return button
	}()
	
	lazy var stack: UIStackView = {
		let stack = UIStackView()
		stack.axis = .vertical
		stack.translatesAutoresizingMaskIntoConstraints = false
		return stack
	}()
	
	override func viewDidLoad() {
			super.viewDidLoad()
			self.view.backgroundColor = .white
			self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(closeThisView))
	}
	override func viewDidLayoutSubviews() {
		view.addSubview(detailTableView)
		view.addSubview(bottomViewCover)
		
		detailTableView.pintoTop(superview: view)
		detailTableView.pintoLeft(superview: view)
		detailTableView.pintoRight(superview: view)
		detailTableView.pintoBottom(superview: bottomViewCover.topAnchor)
		
		bottomViewCover.setHeightAnchor(100)
		bottomViewCover.pintoLeft(superview: view)
		bottomViewCover.pintoRight(superview: view)
		bottomViewCover.pintoBottom(superview: view.safeAreaLayoutGuide.bottomAnchor)
		
		stack.addArrangedSubview(priceLabel)
		stack.addArrangedSubview(priceValue)
		bottomViewCover.addSubview(stack)
		bottomViewCover.addSubview(buyButtom)
		
		stack.pintoLeft(superview: bottomViewCover,space: 20)
		stack.pintoBottom(superview: bottomViewCover,space: -20)
		
		buyButtom.pintoRight(superview: bottomViewCover,space: -20)
		buyButtom.pintoBottom(superview: bottomViewCover,space: -20)
		
		
		buyButtom.setHeightAnchor(50)
		buyButtom.setWithAnchor(120)

		
	}
	@objc func closeThisView(){
			  presentingViewController?.dismiss(animated: true, completion: nil)

	}
	
}

extension HomeViewControllerDetail:UITableViewDelegate,UITableViewDataSource{
	func numberOfSections(in tableView: UITableView) -> Int {
		return 4
	}
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		switch section {
		case 0,1,2,3:
			return 1
		default:
			return 0
		}
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		switch indexPath.section {
		case 0:
			let cell = tableView.dequeueReusableCell(withIdentifier: "TopImageCell", for: indexPath) as! TopImageCell
			cell.layoutMargins = .zero
			cell.mainImageView.image = #imageLiteral(resourceName: "lady")
			return cell
		case 1:
			let cell = tableView.dequeueReusableCell(withIdentifier: "ProductSummaryCell", for: indexPath) as! ProductSummaryCell
			cell.titleLabel.text = "Product Name"
			return cell
		case 2:
			let cell = tableView.dequeueReusableCell(withIdentifier: "ProductDetailCell", for: indexPath) as! ProductDetailCell
			return cell
		default:
			return UITableViewCell()
		}
	}
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		switch  indexPath.section {
		case 0:
			return 200
		case 1:
			return 140
		case 2:
			return 100
		default:
			return 0 
		}
	}
	
	 func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		switch section {
		case 2:
			let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CustomHomeDetailTableviewHeader") as! CustomHomeDetailTableviewHeader
			headerView.headerTitle.text = "Details"
			headerView.writeReview.isHidden = true
			return headerView
		case 3:
			let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CustomHomeDetailTableviewHeader") as! CustomHomeDetailTableviewHeader
			headerView.headerTitle.text = "Reviews"
			headerView.writeReview.isHidden = false
			return headerView
		default:
			return UITableViewHeaderFooterView()
		}
	}
	
	 func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		switch section {
		case 2:
			return 40
		case 3:
			return 80
		default:
			return 0
		}
	}
}




















