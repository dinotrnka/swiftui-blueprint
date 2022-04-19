//
//  ContentView.swift
//  SwiftUIBlueprint
//
//  Created by Dino Trnka on 19. 4. 2022..
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("ContentView.WelcomeMessage".localized(arguments: "Peter"))
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
