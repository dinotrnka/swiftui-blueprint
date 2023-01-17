//
//  APIError.swift
//  SwiftUIBlueprint
//
//  Created by Dino Trnka on 16. 1. 2023..
//

import Foundation

enum APIError: String, Error {
    case jsonDecoding
    case response
    case noInternet
}
