//
//  APIError.swift
//  Taileur
//
//  Created by Engineer 144 on 14/10/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import Foundation

public enum APIError: Error {
    case invalidBody
	 case invalidToken
	 case tokenExpired
    case invalidEndpoint
    case invalidURL
	 case invalidURLComponent
    case emptyData
    case invalidJSON
    case invalidResponse
    case statusCode(Int)
	 case mainError(Error)
	 case decoderError
	 case failDecode(Data,Error)
	 case notAuthorized
	 case customError(String)
}


extension APIError{
	
	var readable : String{
		switch self {
			case .invalidBody:
			return "Invalid Body"
			case .invalidToken:
			return "Invalid Token"
			case .tokenExpired:
			return "Token Expired"
			case .invalidEndpoint:
			return "InvalidEndpoint"
			case .invalidURL:
			return "InvalidURL"
			case .invalidURLComponent:
			return "InvalidURLComponent"
			case .emptyData:
			return "Data returned is Empty"
			case .invalidJSON:
			return "InvalidJSON"
			case .invalidResponse:
		   return "InvalidResponse"
			case .statusCode(let code):
		   return "Error with status code \(code)"
			case .mainError(let data):
			 return "\(data.localizedDescription)"
			case .decoderError:
			return "Decoding went wrong"
			case .failDecode( _,  _):
			return "Decoding went wrong"
			case .notAuthorized:
			return "Not Authorized may be token expried"
			case .customError(let error):
			return error
		}
	}
}


