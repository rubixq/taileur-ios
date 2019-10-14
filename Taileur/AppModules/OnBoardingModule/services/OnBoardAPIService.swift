//
//  OnBoardAPIService.swift
//  Taileur
//
//  Created by Engineer 144 on 14/10/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import Foundation



class OnBoardAPIService : NSObject,OnBoardAPIServiceProtocol {
	
	var requestExecuter: APIRequestExecuter?
	
	override init() {
		requestExecuter = APIRequestExecuter()
	}
	
	
	internal func registerUserRequest(params: OnboardRequestParameter) throws -> URLRequest {
		guard let urlString = APIEndPoint.buildStringURL(urlPaths: [.signUp]) else { throw APIError.invalidURL }
		guard let url = URL(string: urlString) else { throw APIError.invalidURL }
		
		var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: .init(10.0))
		request.httpMethod = HTTPMethods.post.rawValue
		let parameters = [
			"countryCode": params.countryCode!,
			"phoneNumber": params.phoneNumber!,
			"locale": params.locale!,
			"password": params.password!,
			"userType": params.userType?.rawValue
		]
		
		request.httpBody = try? JSONEncoder().encode(parameters)
		return request
	}
	func registerUser(_ parameter: OnboardRequestParameter?,
							_ completionHandler: @escaping (Result<RegisterResponse, APIError>) -> Void) {
		
		guard let  onboardParams = parameter else { return completionHandler(.failure(.invalidBody)) }
		guard let request = try? registerUserRequest(params: onboardParams) else { return  completionHandler(.failure(APIError.invalidBody)) }
		print(request)
		requestExecuter?.execute(request, completionHandler: { (result) in
			main {
				completionHandler(result)
			}
			
		})
		
	}
	

	
	
}
