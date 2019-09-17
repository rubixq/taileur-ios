//
//  HomeDetailViewController.swift
//  Taileur
//
//  Created by Engineer 144 on 17/09/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import UIKit

class HomeDetailViewController: UIViewController {
	
	private var dateCellExpanded: Bool = false
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
	
	lazy var bottomView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	override func viewDidLoad() {
			super.viewDidLoad()
		self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissView))
	}
	
	
	@objc func dismissView(){
		dismiss(animated: true, completion: nil)

	}
	override func viewDidLayoutSubviews() {
		view.backgroundColor = .white
	}

}


extension HomeDetailViewController : UITableViewDelegate,UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return UITableViewCell()
	}
	
	
}
