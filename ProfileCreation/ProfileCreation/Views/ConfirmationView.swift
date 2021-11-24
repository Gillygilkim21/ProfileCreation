//
//  ConfirmationView.swift
//  ProfileCreation
//
//  Created by Gilbert Kim on 11/22/21.
//

import SwiftUI

struct ConfirmationView: View {
	
	@State var firstName: String
	@State var emailAddress: String
	@State var website: String
	
	var body: some View {
		VStack() {
			Text(String(localized: "confirmation_message"))
			if (!website.isEmpty) {
				Link("\(website)", destination: URL(string: website)!)
					.padding()
			}
			if (!firstName.isEmpty) {
				Text("\(firstName)")
					.padding()
			}
			Text("\(emailAddress)")
				.padding()
			Spacer()
			// I need to specify a destination so just specify one but disable it
			NavigationLink(destination: SignUpView(), label: {
				ConfirmButton(title: String(localized: "sign_in_label"), isDisabled: false)
			})
				.disabled(true)
		}
		.navigationTitle(String(format: String(localized: "confirmation_welcome"), firstName))
//		.navigationTitle("Hello, \(firstName)")
		.navigationBarBackButtonHidden(true)
	}
}

struct ConfirmationView_Previews: PreviewProvider {
	static var previews: some View {
		ConfirmationView(firstName: "FirstName", emailAddress: "Test@gmail.com", website: "test.com")
	}
}
