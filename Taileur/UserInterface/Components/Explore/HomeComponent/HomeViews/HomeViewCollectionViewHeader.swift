//
//  HomeViewCollectionViewHeader.swift
//  Taileur
//
//  Created by Engineer 144 on 18/09/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import UIKit
class HomeViewCollectionViewHeader : UICollectionReusableView {
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


