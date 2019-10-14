//
//  String+Extensions.swift
//  Taileur
//
//  Created by Engineer 144 on 13/10/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import Foundation
extension String {
	
	var toUserType: UserType {
		if self == "Shopper" {
			return .shopper
		}else {
			return .tailer
		}
		
	}
}
