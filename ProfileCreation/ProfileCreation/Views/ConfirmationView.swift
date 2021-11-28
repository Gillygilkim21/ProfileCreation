//
//  ConfirmationView.swift
//  ProfileCreation
//
//  Created by Gilbert Kim on 11/22/21.
//

import SwiftUI

struct ConfirmationView: View {
	
	let firstName: String
	let emailAddress: EmailAddress
	let website: Website
	
	var body: some View {
		VStack() {
			Text(String(localized: "confirmation_message"))
			if (!website.value.isEmpty) {
				Link("\(website.value)", destination: URL(string: website.value)!)
					.padding()
			}
			if (!firstName.isEmpty) {
				Text("\(firstName)")
					.padding()
			}
			if (!emailAddress.value.isEmpty) {
				Text("\(emailAddress.value)")
					.padding()
			}
			Spacer()
			// I need to specify a destination so just specify one but disable it
			NavigationLink(destination: SignUpView(), label: {
				ConfirmButton(title: String(localized: "sign_in_label"), isDisabled: false)
			})
				.disabled(true)
		}
		.navigationTitle(String(format: String(localized: "confirmation_welcome"), firstName))
		.navigationBarBackButtonHidden(true)
	}
}

struct ConfirmationView_Previews: PreviewProvider {
	static var previews: some View {
		ConfirmationView(firstName: "FirstName", emailAddress: EmailAddress(value: "Test@gmail.com"), website: Website(value: "test.com"))
	}
}
