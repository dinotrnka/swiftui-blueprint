//
//  SwiftUIBlueprintApp.swift
//  SwiftUIBlueprint
//
//  Created by Dino Trnka on 19. 4. 2022..
//

import SwiftUI

@main
struct SwiftUIBlueprintApp: App {
    
    init() {
        NetworkMonitor.shared.startMonitoring()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
