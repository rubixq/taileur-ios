//
//  DataStorage.swift
//  Taileur
//
//  Created by Engineer 144 on 09/09/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import Foundation
class DataStorage {
	
	
	static let encoder = JSONEncoder()
	static let decoder = JSONDecoder()
	static let defaults = UserDefaults.standard
	
	
	
	static func saveValue<T : Any>(data : T,key : String){
		defaults.set(data, forKey: key)
	}
	
	static func getValue<T: Any>(key: String)->T{
		return defaults.object(forKey: key) as! T
	}
	
	static func saveData<T: Encodable>(data: T?,key: String)  throws {
		guard let _data = data else { throw  StorageError.dataNil }
		guard let encodedData = try? encoder.encode(_data) else { throw StorageError.encoderNil }
		defaults.set(encodedData, forKey: key)
	}
	
	static func getData<T: Decodable>(key: String) throws -> T {
		guard let decoded = defaults.object(forKey: key) else { throw StorageError.dataNil }
		guard let decodedData = try? decoder.decode(T.self, from: decoded as! Data) else { throw  StorageError.decoderNil }
		return decodedData
	}
	
	static func saveData<T: Encodable>(data: [T]?,key: String)  throws {
		guard let _data = data else { throw  StorageError.dataNil }
		guard let encodedData = try? encoder.encode(_data) else { throw StorageError.encoderNil }
		defaults.set(encodedData, forKey:key)
	}
	
	static func getData<T: Decodable>(key: String) throws -> [T] {
		guard let decoded = defaults.object(forKey: key) else { throw StorageError.dataNil }
		guard let decodedData = try? decoder.decode([T].self, from: decoded as! Data) else { throw  StorageError.decoderNil }
		return decodedData
	}
	
	static func clearAllCache(){
		defaults.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
		defaults.synchronize()
	}
	
	
}




public enum StorageError : Error {
	case dataNil
	case decoderNil
	case encoderNil
}
