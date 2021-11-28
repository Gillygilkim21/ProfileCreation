//
//  ValidatableField.swift
//  ProfileCreation
//
//  Created by Gilbert Kim on 11/28/21.
//

import SwiftUI

struct ValidatableField<T>: View where T: Validatable {
	
	let title: String
	@Binding var field: T
	
    var body: some View {
		ZStack {
			TextField(title, text: $field.value)
				.modifier(TextFieldPadding())
				.autocapitalization(.none)
			if (!field.value.isEmpty && !field.isValid()) {
				HStack {
					Spacer()
					Image(systemName: "exclamationmark.circle.fill")
						.foregroundColor(Color.red)
						.padding(.trailing, 24)
				}
			}
		}
    }
}

struct ValidatableField_Previews: PreviewProvider {
    static var previews: some View {
		ValidatableField<EmailAddress>(title: "Title", field: .constant(EmailAddress(value: "email@email.com")))
    }
}
