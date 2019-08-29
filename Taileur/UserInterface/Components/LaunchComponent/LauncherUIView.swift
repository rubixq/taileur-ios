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
			   return [#imageLiteral(resourceName: "kafdab"),#imageLiteral(resourceName: "image"),#imageLiteral(resourceName: "denxel")]
	  }
	
	

	func setupViews(){
		translatesAutoresizingMaskIntoConstraints = false
		
		addSubview(coverImageView)
		
		labelStack.addArrangedSubview(titleLabel)
		labelStack.addArrangedSubview(subtitleLabel)
		
		coverImageView.addSubview(labelStack)
		
		addSubview(joinButton)
		addSubview(descriptionLabel)
		
		coverImageView.constrainToSuperViewNoGuide(on: self)
		labelStack.centerVerticalToView(coverImageView)
		labelStack.setTopAnchor(onview: coverImageView, topAnchor: get3DividerHight)
		
		joinButton.constrainBelowView(below: labelStack,topSpace: 30)
		joinButton.centerVerticalToView(coverImageView)
		joinButton.setWithAnchor(250)
		joinButton.setHeightAnchor(55)
		
		descriptionLabel.constrainBelowView(below: joinButton,topSpace: 30)
		descriptionLabel.centerVerticalToView(coverImageView)

		
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
		label.textColor = .white
		label.font = regularBoldFont
		return label
	}()
	
	
	lazy var descriptionLabel: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle( "JUST EXPORE", for: .normal)
		button.setTitleColor(.white, for: .normal)
	//	label.textColor = .white
		//label.font = regularBoldFont
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
			let position = Int.random(in: 0..<3)
			print(position)
			UIView.transition(with: self.coverImageView, duration: 2.0, options: .transitionCrossDissolve, animations: {
				self.coverImageView.image  = LauncherUIView.images[position]
			}, completion: nil)
			
		})
		return
	
	}
}
