//
//  OnBoardViewModel.swift
//  Taileur
//
//  Created by Engineer 144 on 13/10/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import Foundation
protocol OnBoardViewModel : class {
	
	var  onboardingRequestParams : OnboardRequestParameter?{ get set }
	var  apiService : OnBoardAPIService?{ get set }
	func setUserType(_ type: String?)
	func setOnBoardMode(_ mode: OnboardMode)
	func setUserContryCode(_ code: String?)
	func setUserPhone(_ phone: String?)
	func registerUserAPICall( _ success:@escaping(RegisterResponse)->Void, _ error: @escaping(APIError)->Void)

}
