//
//  NotificationBanner.swift
//  Taileur
//
//  Created by Engineer 144 on 14/10/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

//
//  NotificationBanner.swift
//  ExchangeRates
//
//  Created by Engineer 144 on 08/07/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import UIKit

enum NotificiationType{
  case error
  case success
	case warning
}

class NotificationBanner: UIView {

   var parentView: UIViewController!
   var banner = NotificiationType.success
   var bColor : UIColor =  UIColor.red
   var title , message: String!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUp()
  }
  init(parentView:  UIViewController,title: String, message: String, bannerType: NotificiationType) {
    super.init(frame: parentView.view.frame)
    self.parentView = parentView
    self.title = title
    self.message = message
    self.banner = bannerType
    
    switch banner {
    case .error :
      bColor = #colorLiteral(red: 0.8835063174, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
      break
    case .success :
      bColor = #colorLiteral(red: 0.003921568627, green: 0.7378667543, blue: 0.6941176471, alpha: 1)
      break
		case .warning:
			bColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
			break
		}
    
    setUp()
 
  }
	
	
	
	
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setUp()
  }
  
  var backgroundView: UIView = {
    var parentView: UIView = UIView()
    parentView.translatesAutoresizingMaskIntoConstraints = false
    parentView.sizeToFit()
    return parentView
  }()
  

  var errorTitleLabel: UILabel = {
    var titleLabel : UILabel = UILabel()
    titleLabel.text  = "Error"
    titleLabel.textColor = UIColor.white
    titleLabel.font = UIFont.systemFont(ofSize: 18,weight: .regular)
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.textAlignment = .left
    return titleLabel
  }()
  
  var messageLabel: UILabel = {
    var messageLabel : UILabel = UILabel()
    messageLabel.text  = "you got an error"
    messageLabel.textColor = UIColor.white
    messageLabel.font = UIFont.systemFont(ofSize: 16,weight: .regular)
    messageLabel.translatesAutoresizingMaskIntoConstraints = false
    messageLabel.textAlignment = .left
    messageLabel.numberOfLines = 0
    return messageLabel
  }()
	
	
	var dismissButton : UIButton = {
		let button  = UIButton(type: .custom)
		button.setTitle("Dimiss", for: .normal)
		button.tintColor = UIColor.white
		button.titleLabel?.font  = UIFont.systemFont(ofSize: 17,weight: .regular)
		button.layer.cornerRadius = 4.0
		button.layer.borderColor = UIColor.lightGray.cgColor
		button.layer.borderWidth = 1.0
    return button
	}()
  
  func setUp()  {
     self.accessibilityIdentifier = "NotificationBanner"
    let guide = self.parentView.view.safeAreaLayoutGuide
    backgroundView.addSubview(errorTitleLabel)
    backgroundView.addSubview(messageLabel)
		//backgroundView.addSubview(dismissButton)
    
    parentView.view.addSubview(backgroundView)
    backgroundView.topAnchor.constraint(equalTo: parentView.view.topAnchor).isActive = true
    backgroundView.widthAnchor.constraint(equalToConstant: parentView.view.frame.size.width).isActive = true
    backgroundView.centerXAnchor.constraint(equalTo: parentView.view.centerXAnchor).isActive = true
    
    errorTitleLabel.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor).isActive = true
    errorTitleLabel.leftAnchor.constraint(equalTo: backgroundView.leftAnchor,constant: 10).isActive = true
    errorTitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: guide.topAnchor, multiplier: 1.0).isActive = true
    
    messageLabel.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor).isActive = true
    messageLabel.topAnchor.constraint(equalTo: errorTitleLabel.bottomAnchor,constant: 1).isActive = true
    messageLabel.leftAnchor.constraint(equalTo: backgroundView.leftAnchor,constant: 10).isActive = true
    messageLabel.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor,constant: -10).isActive = true
		
	
		
    errorTitleLabel.text =  self.title
    messageLabel.text = self.message
    backgroundView.backgroundColor = bColor
   
  }
  
  func show(){
    guard let _mainView = self.parentView else { return  }
    _mainView.view.addSubview(backgroundView)
    delay(time: 4.0) {
      self.backgroundView.removeFromSuperview()
    }
    
  }
  
}
