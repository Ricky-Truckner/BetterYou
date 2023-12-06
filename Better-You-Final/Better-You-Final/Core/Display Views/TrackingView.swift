//
//  TrackingView.swift
//  BetterYou
//
//  Created by Ricky Truckner on 11/3/23.
//
import SwiftUI
enum AppearanceStyle {
    case dark, light, auto
}
struct TrackingView: View {
    @State var username: String = ""
    @State var isPrivate: Bool = true
    @State private var profileImageSize = false
    @State private var fontSize: CGFloat = 5
    @State private var appearance: AppearanceStyle = .auto

    var body: some View {
        List {
            Section {
                TextField("Username", text: $username)
                Toggle("Private Account", isOn: $isPrivate)
                Button {
                } label: {
                    Text("Sign out")
                }
            } header: { Text("Profile") }

            Section {
                Slider(value: $fontSize, in: 1...10) {
                    Label("Default Font Size", systemImage: "text.magnifyingglass")
                }

                Picker("Appearance", selection: $appearance) {
                    Text("Dark").tag(AppearanceStyle.dark)
                    Text("Light").tag(AppearanceStyle.light)
                    Text("Auto").tag(AppearanceStyle.auto)
                }
            } header: { Text("Appearance") }

            Section {
                HStack {
                    Text("Version")
                    Spacer()
                    Text("1.0")
                }
            } header: { Text("ABOUT") }
        }
    }
}
struct TrackingView_Previews: PreviewProvider {
    static var previews: some View {
        TrackingView()
    }
}
