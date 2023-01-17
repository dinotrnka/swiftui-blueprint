//
//  LoginViewModel.swift
//  SwiftUIBlueprint
//
//  Created by Dino Trnka on 19. 4. 2022..
//

import Foundation

class LoginViewModel: ObservableObject {

    @Published var username: String = ""
    @Published var password: String = ""

    @Published var error: APIError? // Added this
    
    func login() {
        LoginAction(
            parameters: LoginRequest(
                username: username,
                password: password
            )
        ).call { response in
            self.error = nil // Added this
            
            Auth.shared.setCredentials(
                accessToken: response.data.accessToken,
                refreshToken: response.data.refreshToken
            )
        } failure: { error in
            self.error = error // Added this
        }
    }
}
