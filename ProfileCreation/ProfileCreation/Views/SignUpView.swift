//
//  SignUpView.swift
//  ProfileCreation
//
//  Created by Gilbert Kim on 11/22/21.
//

import SwiftUI

/// TODO:
/// - Have an indicator for required fields

struct SignUpView: View {
	
	@State private var firstName = ""
	@State private var emailAddress = ""
	@State private var password = ""
	@State private var website = ""
	
	@State private var isSecured: Bool = true
	
	private var disableConfirm: Bool {
		return emailAddress.isEmpty || password.isEmpty || !isValidEmail(emailAddress) || (!website.isEmpty && !isValidURL(website))
	}
	
	var body: some View {
		NavigationView {
			VStack {
				Text("Use the form below to create your portfolio. An email and password are required.")
					.padding()
				
				TextField("First Name", text: $firstName)
					.modifier(TextFieldPadding())
				
				ZStack {
					TextField("Email Address", text: $emailAddress)
						.modifier(TextFieldPadding())
						.autocapitalization(.none)
					if (!emailAddress.isEmpty && !isValidEmail(emailAddress)) {
						HStack {
							Spacer()
							Image(systemName: "exclamationmark.circle.fill")
								.foregroundColor(Color.red)
								.padding(.trailing, 24)
						}
					}
				}
				
				ZStack {
					if (isSecured) {
						SecureField("Password*", text: $password)
							.modifier(TextFieldPadding())
					} else {
						TextField("Password*", text: $password)
							.modifier(TextFieldPadding())
					}
					if (!password.isEmpty) {
						HStack {
							Spacer()
							Button(action: {
								isSecured.toggle()
							}, label: {
								Image(systemName: self.isSecured ? "eye.slash" : "eye")
									.foregroundColor(.gray)
									.padding(.trailing, 24)
							})
						}
					}
				}
				
				ZStack {
					TextField("Website", text: $website)
						.modifier(TextFieldPadding())
						.autocapitalization(.none)
					if (!website.isEmpty && !isValidURL(website)) {
						HStack {
							Spacer()
							Image(systemName: "exclamationmark.circle.fill")
								.foregroundColor(Color.red)
								.padding(.trailing, 24)
						}
					}
				}
				
				Text("* Indicates a required field")
					.foregroundColor(Color.gray)
				Spacer()
				NavigationLink(destination: ConfirmationView(firstName: firstName, emailAddress: emailAddress, website: website), label: {
					ConfirmButton(title: "Submit", isDisabled: disableConfirm)
				})
					.disabled(disableConfirm)
			}
			.navigationTitle("Profile Creation")
		}
	}
	
	private func isValidEmail(_ string: String) -> Bool {
		let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
		let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
		return emailPredicate.evaluate(with: string)
	}
	
	private func isValidURL(_ string: String) -> Bool {
		let detector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
		guard let detector = detector else { return false }
		if let match = detector.firstMatch(in: string, options: [], range: NSRange(location: 0, length: string.utf16.count)) {
			return match.range.length == string.utf16.count
		} else {
			return false
		}
	}
}

struct SignUpView_Previews: PreviewProvider {
	static var previews: some View {
		SignUpView()
	}
}
