//
//  HomeView.swift
//  caloriesApp
//
//  Created by Ricky Truckner on 12/7/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            Text("Welcome to the calm zone")
                .foregroundStyle(.pink).opacity(0.35)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
