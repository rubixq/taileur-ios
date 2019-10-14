//
//  OnBoardAPIServiceProtocol.swift
//  Taileur
//
//  Created by Engineer 144 on 14/10/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import Foundation
protocol OnBoardAPIServiceProtocol : class {
	var  requestExecuter: APIRequestExecuter?{ get }
	func registerUserRequest(params: OnboardRequestParameter)  throws -> URLRequest
	func registerUser(_ parameter: OnboardRequestParameter?, _ completionHandler: @escaping(Result<RegisterResponse, APIError>)->Void)
	
}
