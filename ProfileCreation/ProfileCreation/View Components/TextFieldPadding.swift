//
//  TextFieldPadding.swift
//  ProfileCreation
//
//  Created by Gilbert Kim on 11/22/21.
//

import SwiftUI

struct TextFieldPadding: ViewModifier {
	public func body(content: Content) -> some View {
		content
			.padding()
			.cornerRadius(10)
			.overlay(RoundedRectangle(cornerRadius: 10)
						.stroke(lineWidth: 0.5))
			.padding(.horizontal)
	}
}

struct TextFieldPadding_Previews: PreviewProvider {
	static var previews: some View {
		TextField("Text", text: .constant("Text"))
			.modifier(TextFieldPadding())
	}
}
