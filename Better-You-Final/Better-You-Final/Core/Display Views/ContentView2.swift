//
//  ContentView.swift
//  BetterYouApp
//
//  Created by Ricky Truckner on 12/1/23.
//

import SwiftUI

struct ContentView2: View {
    
    @EnvironmentObject var vm:cddatamodel
    @State var itemselected: Tab = .Breakfast

    @State var show = false
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Hello user").bold()
                        .font(.system(size: 35))
                    Spacer()
                    Image("m1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .shadow(color: .blue, radius: 20, x: 0, y: 0)
                        .clipShape(Circle())
                }
                .padding(.horizontal)
                TabView(itemselected: $itemselected)
                Divider()
                
                
            }
        }
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
