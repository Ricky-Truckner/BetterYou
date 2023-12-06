//
//  DashboardView.swift
//  BetterYou
//
//  Created by Ricky Truckner on 10/13/23.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .ignoresSafeArea()
            VStack{
                Text("Hello, World!")
                    .foregroundColor(Color.red)
            }
        }
    }
}
struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
