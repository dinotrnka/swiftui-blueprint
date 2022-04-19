//
//  LoginResponse.swift
//  SwiftUIBlueprint
//
//  Created by Dino Trnka on 19. 4. 2022..
//

import Foundation

struct LoginResponse: Decodable {
    let data: LoginResponseData
}

struct LoginResponseData: Decodable {
    let accessToken: String
    let refreshToken: String
}
