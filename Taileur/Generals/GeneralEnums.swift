//
//  GeneralEnums.swift
//  Taileur
//
//  Created by Engineer 144 on 13/10/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import Foundation

enum UserType : String,Decodable {
	case shopper = "shopper"
	case tailer = "tailer"
}


enum OnboardMode : String,Decodable {
	case login = "login"
	case register = "register"
	case forgotPassword = "forgotPassword"
}
