//
//  UIView+Extensions.swift
//  Taileur
//
//  Created by Engineer 144 on 28/08/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import UIKit

extension UIView {
	
	var heavyTitleFont : UIFont {
		return UIFont.init(name: ".SFUIDisplay-Heavy", size: 40) ?? UIFont.systemFont(ofSize: 20)
	}
	var bigTitleFont : UIFont {
		return UIFont.init(name: ".SFUIDisplay-Bold", size: 35) ?? UIFont.systemFont(ofSize: 20)
	}
	var mediumFont : UIFont {
		return UIFont.init(name: ".SFUIDisplay-Medium", size: 20) ?? UIFont.systemFont(ofSize: 18)
	}
	
	var regularBoldFont : UIFont {
		return UIFont.init(name: ".SFUIDisplay-Bold", size: 16) ?? UIFont.systemFont(ofSize: 16)
	}
	
	var regularButtonFont : UIFont {
		return UIFont.init(name: ".SFUIDisplay", size: 18) ?? UIFont.systemFont(ofSize: 18)
	}
	
	
	var regularFont : UIFont {
		return UIFont.init(name: ".SFUIDisplay", size: 17) ?? UIFont.systemFont(ofSize: 17)
	}
	var mediumFont18 : UIFont {
		return UIFont.init(name: ".SFUIDisplay-Medium", size: 18) ?? UIFont.systemFont(ofSize: 18)
	}
	
	func setFont(name: String,size : CGFloat) -> UIFont{
		return UIFont.init(name: name, size: size) ?? UIFont.systemFont(ofSize: size)
	}

}

