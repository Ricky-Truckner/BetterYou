//
//  InputView.swift
//  BetteryouRemake
//
//  Created by Danca Nguyen on 12/1/23.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecureField = false
    
    var body: some View {
        VStack {
            Text(title)
                .foregroundColor(Color(.darkGray))
                .fontWeight(.semibold)
                .font(.footnote)
            
            if isSecureField {
                SecureField(placeholder, text: $text)
                    .font(.system(size:14))
            } //issecureField
            else {
                TextField(placeholder, text: $text)
                    .font(.system(size:14))
            } //else
            
            Divider()
            
        } // VSTack
    } //some View
} //Input view


struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(text: .constant(""), title: "Email Address", placeholder: "name@example.com")
    }
}
