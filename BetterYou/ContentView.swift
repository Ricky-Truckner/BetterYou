//
//  ContentView.swift
//  BetterYou
//
//  Created by Ricky Truckner on 9/22/23.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        TabView {
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Dashboard")
                        
                
                    }
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Tracker")
                    }
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Account")
                    }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
