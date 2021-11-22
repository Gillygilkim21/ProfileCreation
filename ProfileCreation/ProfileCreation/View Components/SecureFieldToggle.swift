//
//  SecureFieldToggle.swift
//  ProfileCreation
//
//  Created by Gilbert Kim on 11/22/21.
//

import SwiftUI

struct SecureFieldToggle: View {
	let title: String
	@Binding var text: String
	@State private var isSecured: Bool = true
	
	var body: some View {
		HStack {
			if (isSecured) {
				SecureField(title, text: $text)
			} else {
				TextField(title, text: $text)
			}
			Button(action: {
				isSecured.toggle()
			}, label: {
				Image(systemName: self.isSecured ? "eye.slash" : "eye")
					.foregroundColor(.gray)
			})
		}
	}
}

struct SecureFieldToggle_Previews: PreviewProvider {
	static var previews: some View {
		SecureFieldToggle(title: "Title", text: .constant("Text"))
	}
}
