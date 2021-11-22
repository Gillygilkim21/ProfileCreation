//
//  TextFieldClearToggle.swift
//  ProfileCreation
//
//  Created by Gilbert Kim on 11/22/21.
//

import SwiftUI

struct TextFieldClearToggle: View {
	let title: String
	@Binding var text: String
	
    var body: some View {
		HStack {
			TextField(title, text: $text)
			if (!text.isEmpty) {
				Button(action: {
					text = ""
				}, label: {
					Image(systemName: "multiply.circle.fill")
						.foregroundColor(.gray)
				})
			}
		}
    }
}

struct TextFieldClearToggle_Previews: PreviewProvider {
    static var previews: some View {
		VStack {
			TextFieldClearToggle(title: "Title", text: .constant("Text"))
			TextFieldClearToggle(title: "Title", text: .constant(""))
		}
    }
}
