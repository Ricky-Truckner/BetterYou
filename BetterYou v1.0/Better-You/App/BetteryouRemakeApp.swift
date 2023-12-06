//
//  BetteryouRemakeApp.swift
//  BetteryouRemake
//
//  Created by Danca Nguyen on 12/1/23.
//

import SwiftUI
import Firebase

@main
struct BetteryouRemakeApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
