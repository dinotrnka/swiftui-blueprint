//
//  RootScreen.swift
//  SwiftUIBlueprint
//
//  Created by Dino Trnka on 21. 4. 2022..
//

import SwiftUI

struct RootScreen: View {
    
    @EnvironmentObject var auth: Auth
    
    var body: some View {
        if auth.loggedIn {
            HomeScreen()
        } else {
            LoginScreen()
        }
    }
}

struct RootScreen_Previews: PreviewProvider {
    static var previews: some View {
        RootScreen()
    }
}
