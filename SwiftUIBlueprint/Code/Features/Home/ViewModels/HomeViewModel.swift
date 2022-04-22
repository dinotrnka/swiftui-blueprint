//
//  HomeViewModel.swift
//  SwiftUIBlueprint
//
//  Created by Dino Trnka on 21. 4. 2022..
//

import Foundation

class HomeViewModel: ObservableObject {

    func logout() {
        Auth.shared.logout()
    }
}
