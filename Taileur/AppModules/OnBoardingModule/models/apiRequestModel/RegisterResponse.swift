//
//  RegisterResponse.swift
//  Taileur
//
//  Created by Engineer 144 on 14/10/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import Foundation


// MARK: - RegisterResponse
struct RegisterResponse: Codable {
    let data: ResponeClass?
    let userMsg: String?
}

// MARK: - DataClass
struct ResponeClass: Codable {
    let msisdn, createdAt, updatedAt, id: String?
}
