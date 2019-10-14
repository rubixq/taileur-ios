//
//  APIEndPoint.swift
//  Taileur
//
//  Created by Engineer 144 on 14/10/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import Foundation
struct APIEndPoint {
	
	static let baseURL : String = "http://52.58.205.198:3000/api"
	enum URLPath : String{
		case backSlash = "/"
		case signUp = "/users/signup"
	}
	
	static func buildStringURL(base:String = baseURL,
										urlPaths:[URLPath] = [],
										otherPaths:[String] = []) -> String?{
		let endpoint: String = base
		let path = urlPaths.compactMap{ args in args.rawValue }.joined()
		let otherPath  = otherPaths.joined(separator: "/")
		return [endpoint,path,otherPath].joined()
		
		
	}
}

public enum HTTPMethods : String {
	case get = "GET"
	case post = "POST"
}
