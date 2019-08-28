//
//  UIView+Extensions.swift
//  Taileur
//
//  Created by Engineer 144 on 28/08/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import UIKit

extension UIView {
	
	var bigTitleFont : UIFont {
		return UIFont.init(name: ".SFUIDisplay-Bold", size: 30) ?? UIFont.systemFont(ofSize: 20)
	}
	var mediumFont : UIFont {
		return UIFont.init(name: ".SFUIDisplay-Medium", size: 20) ?? UIFont.systemFont(ofSize: 18)
	}
	
	var regularBoldFont : UIFont {
		return UIFont.init(name: ".SFUIDisplay-Bold", size: 18) ?? UIFont.systemFont(ofSize: 18)
	}
	
	var regularButtonFont : UIFont {
		return UIFont.init(name: ".SFUIDisplay", size: 18) ?? UIFont.systemFont(ofSize: 18)
	}
	
	
	

}

