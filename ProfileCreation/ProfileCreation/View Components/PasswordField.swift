//
//  PasswordField.swift
//  ProfileCreation
//
//  Created by Gilbert Kim on 11/28/21.
//

import SwiftUI

struct PasswordField: View {
	
	@Binding var password: String
	@State private var isSecured: Bool = true
	
    var body: some View {
		ZStack {
			if (isSecured) {
				SecureField(String(localized: "password_label") + "*", text: $password)
					.modifier(TextFieldPadding())
			} else {
				TextField(String(localized: "password_label") + "*", text: $password)
					.modifier(TextFieldPadding())
			}
			if (!password.isEmpty) {
				HStack {
					Spacer()
					Button(action: {
						isSecured.toggle()
					}, label: {
						Image(systemName: isSecured ? "eye.slash" : "eye")
							.foregroundColor(.gray)
							.padding(.trailing, 24)
					})
				}
			}
		}
    }
}

struct PasswordField_Previews: PreviewProvider {
    static var previews: some View {
		PasswordField(password: .constant("password"))
    }
}
