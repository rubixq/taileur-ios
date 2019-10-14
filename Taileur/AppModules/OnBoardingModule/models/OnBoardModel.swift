//
//  OnBoardModel.swift
//  Taileur
//
//  Created by Engineer 144 on 02/09/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import Foundation
import Planet

class OnBoardModel : NSObject{
  
	func defaultCountry()-> Country{
		var country = Country.find(isoCode: "GH")
		let countryLocale = Locale.current
		let code = countryLocale.regionCode ?? ""
		country = Country.find(isoCode: code)
		if let newCountry = Country.find(isoCode: code) {
			country = newCountry
			
		}
		return country!
		
	}
	
}
