//
//  SignUpView.swift
//  ProfileCreation
//
//  Created by Gilbert Kim on 11/22/21.
//

import SwiftUI

struct SignUpView: View {
	
	@State private var firstName = ""
	@State private var emailAddress = ""
	@State private var password = ""
	@State private var website = ""
	
	private let submitButtonGradientStartColor = Color(red: 255 / 255, green: 73 / 255, blue: 19 / 255)
	private let submitButtonGradientEndColor = Color(red: 255 / 255, green: 38 / 255, blue: 72 / 255)
	
    var body: some View {
		NavigationView {
			VStack {
				Text("Use the form below to create your portfolio. An email and password are required.")
					.padding()
				TextFieldClearToggle(title: "First Name", text: $firstName)
					.modifier(TextFieldPadding())
				TextFieldClearToggle(title: "Email Address", text: $emailAddress)
					.modifier(TextFieldPadding())
				SecureFieldToggle(title: "Password", text: $password)
					.modifier(TextFieldPadding())
				TextFieldClearToggle(title: "Website", text: $website)
					.modifier(TextFieldPadding())
				Spacer()
				
				NavigationLink(destination: ConfirmationView(), label: {
					Text("Submit")
						.bold()
						.foregroundColor(.white)
						.padding()
						.frame(maxWidth: .infinity)
						.background(LinearGradient(colors: [submitButtonGradientStartColor, submitButtonGradientEndColor], startPoint: .leading, endPoint: .trailing))
						.cornerRadius(8)
						.padding()
				})
			}
			.navigationTitle("Profile Creation")
		}
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
