//
//  APIRequestExecuter.swift
//  Taileur
//
//  Created by Engineer 144 on 14/10/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import Foundation

final class APIRequestExecuter {
  let urlSession = URLSession.shared
  
  
	
	func execute<T>(_ request : URLRequest,completionQueue: DispatchQueue = .main,
						 completionHandler: @escaping (Result<T,APIError>) -> Void) where T : Decodable{
		   urlSession.dataTask(with: request) { (data, response, error) in
				print(response?.description,error)
			guard error == nil else {return completionHandler(.failure(.mainError(error!)))}
			guard let data = data else {return completionHandler(.failure(.emptyData))}
			guard let httpResponse = response as? HTTPURLResponse else { return completionHandler(.failure(.invalidResponse)) }
			switch httpResponse.statusCode {
			case 200...299:
				do {
					let value = try JSONDecoder().decode(T.self, from: data)
					return completionHandler(.success(value))
				}
				catch let error {
					print(error)
					return completionHandler(.failure(.failDecode(data,error)))
				}
			case 400 :
		  	return completionHandler(.failure(.statusCode(httpResponse.statusCode)))
				case 401 :
		   return completionHandler(.failure(.notAuthorized))
			case 403:
				return completionHandler(.failure(.statusCode(httpResponse.statusCode)))
			case 404:
				return completionHandler(.failure(.statusCode(httpResponse.statusCode)))
			case 500:
				return completionHandler(.failure(.statusCode(httpResponse.statusCode)))
			default:
				return completionHandler(.failure(.emptyData))
			}
			}.resume()
	}

  
}

