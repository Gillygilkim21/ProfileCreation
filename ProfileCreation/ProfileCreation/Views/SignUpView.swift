//
//  SignUpView.swift
//  ProfileCreation
//
//  Created by Gilbert Kim on 11/22/21.
//

import SwiftUI

struct SignUpView: View {
	
	@State private var firstName: String = ""
	@State private var emailAddress: EmailAddress = EmailAddress(value: "")
	@State private var password: String = ""
	@State private var website: Website = Website(value: "")
	
//	@State private var isSecured: Bool = true
	
	var body: some View {
		NavigationView {
			VStack {
				Text(String(localized: "profile_creation_instructions"))
					.padding()
				
				TextField(String(localized: "first_name_label"), text: $firstName)
					.modifier(TextFieldPadding())
				
				ZStack {
					TextField(String(localized: "email_address_label") + "*", text: $emailAddress.value)
						.modifier(TextFieldPadding())
						.autocapitalization(.none)
					if (!emailAddress.value.isEmpty && !emailAddress.isValid()) {
						HStack {
							Spacer()
							Image(systemName: "exclamationmark.circle.fill")
								.foregroundColor(Color.red)
								.padding(.trailing, 24)
						}
					}
				}
				
				PasswordField(password: $password)
				
				ZStack {
					TextField(String(localized: "website_label"), text: $website.value)
						.modifier(TextFieldPadding())
						.autocapitalization(.none)
					if (!website.value.isEmpty && !website.isValid()) {
						HStack {
							Spacer()
							Image(systemName: "exclamationmark.circle.fill")
								.foregroundColor(Color.red)
								.padding(.trailing, 24)
						}
					}
				}
				
				Text(String(localized: "required_field_instructions"))
					.foregroundColor(Color.gray)
				Spacer()
				NavigationLink(destination: ConfirmationView(firstName: firstName, emailAddress: emailAddress, website: website), label: {
					ConfirmButton(title: String(localized: "submit_label"), isDisabled: disableConfirmButton())
				})
					.disabled(disableConfirmButton())
			}
			.navigationTitle(String(localized: "profile_creation_title"))
		}
	}
	
	private func disableConfirmButton() -> Bool {
		return password.isEmpty || !emailAddress.isValid() || !website.isValid()
	}
}

struct SignUpView_Previews: PreviewProvider {
	static var previews: some View {
		SignUpView()
	}
}
