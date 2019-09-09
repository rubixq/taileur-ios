//
//  UsersData.swift
//  Taileur
//
//  Created by Engineer 144 on 09/09/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import Foundation
import Planet
class UsersData {
	
	static var country : Country?{
		set{ try? DataStorage.saveData(data: newValue, key: "usercountry") }
		get{ return try? DataStorage.getData(key: "usercountry")}
	}
	
	
}
