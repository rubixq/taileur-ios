//
//  LauncherUIView.swift
//  Taileur
//
//  Created by Engineer 144 on 28/08/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import UIKit

protocol LauncherUIViewProtocol {
	func joinNow()
	func explore()
}

class LauncherUIView: UIView {

	override init(frame: CGRect) {
		super.init(frame: frame)
		setupViews()
		loaderSliderTimer
		
	}
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	var delegate : LauncherUIViewProtocol!
	var timer : Timer!
	static var images : [UIImage]{
			 return [#imageLiteral(resourceName: "fullimage1"),#imageLiteral(resourceName: "fullimage2")]
	  }
	
	

	func setupViews(){
		translatesAutoresizingMaskIntoConstraints = false
		
		addSubview(coverImageView)
		
		labelStack.addArrangedSubview(titleLabel)
		labelStack.addArrangedSubview(subtitleLabel)
		
		coverImageView.addSubview(labelStack)
		
		addSubview(joinButton)
		addSubview(descriptionLabel)
		
		coverImageView.pintoTop(superview: self)
		coverImageView.pintoLeft(superview: self)
		coverImageView.pintoRight(superview: self)
		coverImageView.pintoBottom(superview: self)
		labelStack.centerVerticalToView(coverImageView)
		labelStack.setTopAnchor(onview: coverImageView, topAnchor: get3DividerHight)
		
		joinButton.constrainBelowView(below: labelStack,topSpace: 30)
		joinButton.centerVerticalToView(coverImageView)
		joinButton.setWithAnchor(250)
		joinButton.setHeightAnchor(55)
		
		descriptionLabel.centerVerticalToView(coverImageView)
		descriptionLabel.pintoTop(superview: joinButton.bottomAnchor,space: 10)
		descriptionLabel.pintoBottom(superview: bottomAnchor,space: -30)

		backgroundColor = UIColor(hue: 0.5861, saturation: 0.54, brightness: 0.23, alpha: 1.0) /* #1b2a3b */

		
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
		button.addTarget(self, action: #selector(joinNowAction), for: .touchUpInside)
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
		label.layer.shadowOpacity = 0.8
		label.layer.shadowOffset = CGSize(width: 0, height: 0)
		label.textColor = .white
		label.font = heavyTitleFont
		label.textAlignment = .center
		return label
	}()
	
	lazy var subtitleLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = " - Smart tailor - "
		label.textAlignment = .center
		label.layer.shadowOpacity = 0.8
		label.layer.shadowOffset = CGSize(width: 0, height: 0)
		label.textColor = .white
		label.font = UIFont.systemFont(ofSize: 20,weight: .bold)
		return label
	}()
	
	
	lazy var descriptionLabel: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle( "JUST EXPORE", for: .normal)
		button.setTitleColor(.white, for: .normal)
	//	label.textColor = .white
		//label.font = regularBoldFont
		button.titleLabel?.layer.shadowOpacity = 0.8
		button.titleLabel?.layer.shadowOffset = CGSize(width: 0, height: 0)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 22,weight: .bold)
		button.titleLabel?.textAlignment = .center
		button.isUserInteractionEnabled = true
		button.addTarget(self, action: #selector(exploreAction), for: .touchUpInside)

		//label.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(exploreAction)))
		return button
	}()
	
	lazy var coverImageView: UIImageView = {
		let view = UIImageView()
		view.image = #imageLiteral(resourceName: "kafdab")
		view.contentMode = UIView.ContentMode.scaleAspectFill
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()

}

extension LauncherUIView {
	@objc func  joinNowAction(){
		guard let _delegate = delegate else { return }
		_delegate.joinNow()
	}
	@objc func  exploreAction(){
		guard let _delegate = delegate else { return }
		          _delegate.explore()
	}
}


extension LauncherUIView {
	var get3DividerHight  : CGFloat{
		return UIScreen.main.bounds.height / 1.6
	}
	var loaderSliderTimer: Void{
		self.timer =  Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true, block: { (_) in
			print("timer fired")
			let position = Int.random(in: 0..<2)
			print(position)
			UIView.transition(with: self.coverImageView, duration: 2.0, options: .transitionCrossDissolve, animations: {
				self.coverImageView.image  = LauncherUIView.images[position]
			}, completion: nil)
			
		})
		return
	
	}
}
