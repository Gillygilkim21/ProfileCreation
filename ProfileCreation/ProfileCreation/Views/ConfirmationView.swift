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
			Text("Your super-awesome portfolio has been successfully submitted! The details below will be public within your community!")
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
				ConfirmButton(title: "Sign In", isDisabled: false)
			})
				.disabled(true)
		}
		.navigationTitle("Hello, \(firstName)")
		.navigationBarBackButtonHidden(true)
	}
}

struct ConfirmationView_Previews: PreviewProvider {
	static var previews: some View {
		ConfirmationView(firstName: "FirstName", emailAddress: "Test@gmail.com", website: "test.com")
	}
}
