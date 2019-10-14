//
//  OnboardRequestParameter.swift
//  Taileur
//
//  Created by Engineer 144 on 13/10/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import Foundation


struct OnboardRequestParameter {
	
	var countryCode: String?
	var phoneNumber: String?
	var locale : String?
	var password: String?
	var userType : UserType?
	var onboardMode : OnboardMode?
	
	
}




extension OnboardRequestParameter {
	
	var isReadyForProcessing : (Bool,APIError?) {
		var isready : (Bool,APIError?)
		
		guard let _ = userType else { return (false, APIError.customError("Invalid UserType")) }
		guard let _ = onboardMode else { return (false, APIError.customError("Invalid Onboarding Mode")) }
		
		guard let code = countryCode else { return (false,APIError.customError("Invalid Country Code")) }
		isready = code.isEmpty ? (false, APIError.customError("Invalid Country Code")) : (true,nil)
		
		guard let phone = phoneNumber else { return (false, APIError.customError("Invalid PhoneNumber")) }
		isready = phone.isEmpty ? (false,APIError.customError("Invalid PhoneNumber")) : (true,nil)
		
		guard let locale = locale else { return (false, APIError.customError("Invalid Locale")) }
		isready = locale.isEmpty ? (false,APIError.customError("Invalid Locale")) : (true,nil)
		
		guard let password = password else { return (false, APIError.customError("Invalid password")) }
		isready = password.isEmpty ? (false,APIError.customError("Invalid password")) : (true,nil)
		
		return isready
	}
}
