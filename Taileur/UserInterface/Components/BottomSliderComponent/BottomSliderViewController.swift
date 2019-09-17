//
//  BottomSliderViewController.swift
//  Taileur
//
//  Created by Engineer 144 on 29/08/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import UIKit
import FloatingPanel


protocol BottomSliderViewControllerProtocol {
	func itemSelected(item : BottomSheetItem)
}

struct BottomSheetItem {
	var title : String
	var icon : UIImage
	var subtitle : String
}

class BottomSliderViewController: UIViewController {
	var bottomSheetItems : [BottomSheetItem] = []
	var delegate : BottomSliderViewControllerProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
			
			
			 bottomSheetItems = [BottomSheetItem(title: "Shopper",
																					 icon: #imageLiteral(resourceName: "shopper"),
																					 subtitle: "Explore and buy on our worldwide"),
													 BottomSheetItem(title: "Fashion Designer",
												                  icon: #imageLiteral(resourceName: "designer"),
												                  subtitle: "Create and showcase your products")]
        
    }
	
	
	
	
	override func viewDidLayoutSubviews() {
		view.addSubview(titleLabel)
		view.addSubview(bottomSheetTableView)
		titleLabel.setTopAnchor(onview: view, topAnchor: 20)
		titleLabel.centerVerticalToView(view)
		bottomSheetTableView.constrainBelowSuperViewsTopView(superview: view, below: titleLabel,spacing: 10)
	
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		self.dismiss(animated: true, completion: nil)
	}
	
	lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = view.regularFont
		label.textAlignment = .center
		label.text = "Join Smart Tailor As"
		return label
	}()
	
	
	
	lazy var bottomSheetTableView : GenericTableView<BottomSheetItem, ThreeViewsTableViewCell> = {
		let tableview = GenericTableView.init(items: bottomSheetItems, configure: { (cell : ThreeViewsTableViewCell, item) in
			cell.titleLabel.text = item.title
			cell.subtitleLabel.text = item.subtitle
			cell.iconImage.image = item.icon
		},selectHandler: { (item, cell) in
			print(item)
			guard let _delegate = self.delegate else { return }
			_delegate.itemSelected(item: item)
			self.dismiss(animated: true)
		  })
		return tableview
	}()

}
