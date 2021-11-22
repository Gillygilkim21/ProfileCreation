//
//  ContentView.swift
//  ProfileCreation
//
//  Created by Gilbert Kim on 11/20/21.
//

import SwiftUI

struct ContentView: View {
	
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
				
				TextField("First Name", text: $firstName)
					.padding(.horizontal)
					.textFieldStyle(.roundedBorder)
				
				TextField("Email Address", text: $emailAddress)
					.padding(.horizontal)
					.textFieldStyle(.roundedBorder)
				
				SecureField("Password", text: $password)
					.padding(.horizontal)
					.textFieldStyle(.roundedBorder)
				
				TextField("Website", text: $website)
					.padding(.horizontal)
					.modifier(ClearButton(text: $emailAddress))
					.textFieldStyle(.roundedBorder)
				
				Spacer()
				
				Button(action: {
					// TODO: go to the next screen
				}, label: {
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

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
