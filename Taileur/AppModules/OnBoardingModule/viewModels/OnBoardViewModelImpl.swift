//
//  OnBoardViewModelImpl.swift
//  Taileur
//
//  Created by Engineer 144 on 13/10/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import Foundation
class OnBoardViewModelImpl : NSObject,OnBoardViewModel{
	
	
	var apiService : OnBoardAPIService?
	var onboardingRequestParams: OnboardRequestParameter?
	
	override init() {
		onboardingRequestParams = OnboardRequestParameter()
		apiService = OnBoardAPIService()
	}
	
	
	func setUserType(_ type: String?) {
		guard let _type = type else { return  }
		onboardingRequestParams?.userType = _type.toUserType
	}
	
	func setOnBoardMode(_ mode: OnboardMode) {
		onboardingRequestParams?.onboardMode = mode
	}
	
	func setUserContryCode(_ code: String?) {
		guard let _code = code else { return  }
		onboardingRequestParams?.countryCode = _code
	}
	
	func setUserPhone(_ phone: String?) {
		guard let _phone = phone else { return  }
		onboardingRequestParams?.phoneNumber = _phone
	}
	

	
	func registerUserAPICall(_ success: @escaping (RegisterResponse) -> Void, _ error: @escaping (APIError) -> Void) {
		
		let isReady = onboardingRequestParams?.isReadyForProcessing
		if isReady?.0 ==  false {
			error((isReady?.1)!)
		}else{
			apiService?.registerUser(onboardingRequestParams, { (result) in
					switch result {
					case .success(let data): success(data)
					case .failure(let _error): error(_error)
				}
			 })
		}
		
		
	}
	
}
