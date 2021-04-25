//
//  Hey_NellyApp.swift
//  Shared
//
//  Created by michael gunnulfsen on 25/04/2021.
//

import SwiftUI

@main
struct Hey_NellyApp: App {
    @StateObject var nellyData = ObservableNellyData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(nellyData)
        }
    }
}
