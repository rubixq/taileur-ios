//
//  LauncherUIView.swift
//  Taileur
//
//  Created by Engineer 144 on 28/08/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import UIKit

class LauncherUIView: UIView {

	override init(frame: CGRect) {
		super.init(frame: frame)
		setupViews()
		loaderSlider()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	
	static var images : [UIImage]{
		return [#imageLiteral(resourceName: "kafdab"),#imageLiteral(resourceName: "image")]
	}
	
	
	func loaderSlider(){
		Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { (_) in
			print("timer fired")
			let position = Int.random(in: 0..<2)
			print(position)
			UIView.transition(with: self.coverImageView, duration: 2.0, options: .transitionCrossDissolve, animations: {
				self.coverImageView.image  = LauncherUIView.images[position]
			}, completion: nil)
		
		}.fire()
	}
	
	func setupViews(){
		translatesAutoresizingMaskIntoConstraints = false
		
		addSubview(coverImageView)
		labelStack.addArrangedSubview(titleLabel)
		labelStack.addArrangedSubview(subtitleLabel)
		coverImageView.addSubview(labelStack)
		addSubview(joinButton)
		addSubview(descriptionLabel)
		
		coverImageView.constrainToSuperView(on: self)
		labelStack.centerVerticalToView(coverImageView)
		labelStack.setTopAnchor(onview: coverImageView, topAnchor: get3DividerHight)
		
		joinButton.constrainBelowView(below: labelStack,topSpace: 20)
		joinButton.centerVerticalToView(coverImageView)
		joinButton.setWithAnchor(200)
		joinButton.setHeightAnchor(45)
		
		descriptionLabel.constrainBelowView(below: joinButton,topSpace: 20)
		descriptionLabel.centerVerticalToView(coverImageView)

		
	}
	
	
	var get3DividerHight  : CGFloat{
		
		return UIScreen.main.bounds.height / 1.5
	}
	
	
	
	lazy var joinButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("JOIN NOW", for: .normal)
		button.titleLabel?.font = regularButtonFont
		button.backgroundColor = .red
		button.setTitleColor(.white, for: .normal)
		button.setTitleColor(.lightGray, for: .highlighted)
		button.setTitleColor(.lightGray, for: .focused)

		button.layer.cornerRadius = 4
		return button
	}()
	
	lazy var labelStack: UIStackView = {
		 let view = UIStackView()
		  view.axis = .vertical
		 view.translatesAutoresizingMaskIntoConstraints = false
		 return view
	}()
	
	
	lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "TAILLEUR"
		label.textColor = .white
		label.font = bigTitleFont
		label.textAlignment = .center
		return label
	}()
	
	lazy var subtitleLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = " - Smart tailor - "
		label.textAlignment = .center
		label.textColor = .white
		label.font = regularBoldFont
		return label
	}()
	
	
	lazy var descriptionLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "JUST EXPORE"
		label.textColor = .white
		label.font = regularBoldFont
		label.textAlignment = .center
		return label
	}()
	
	lazy var coverImageView: UIImageView = {
		let view = UIImageView()
		view.image = #imageLiteral(resourceName: "kafdab")
		view.contentMode = UIView.ContentMode.scaleToFill
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()

}
