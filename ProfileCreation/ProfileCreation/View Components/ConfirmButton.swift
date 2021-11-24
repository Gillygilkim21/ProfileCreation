//
//  ConfirmButton.swift
//  ProfileCreation
//
//  Created by Gilbert Kim on 11/23/21.
//

import SwiftUI

struct ConfirmButton: View {
	
	let title: String
	var isDisabled: Bool = false
	
	private let submitButtonGradientStartColor = Color(red: 255 / 255, green: 73 / 255, blue: 19 / 255)
	private let submitButtonGradientEndColor = Color(red: 255 / 255, green: 38 / 255, blue: 72 / 255)
	
    var body: some View {
		Text(title)
			.bold()
			.foregroundColor(.white)
			.padding()
			.frame(maxWidth: .infinity)
			.background(isDisabled ? LinearGradient(colors: [Color.gray, Color.gray], startPoint: .leading, endPoint: .trailing) : LinearGradient(colors: [submitButtonGradientStartColor, submitButtonGradientEndColor], startPoint: .leading, endPoint: .trailing))
			.cornerRadius(8)
			.padding()
    }
}

struct ConfirmButton_Previews: PreviewProvider {
    static var previews: some View {
		ConfirmButton(title: "Title", isDisabled: false)
    }
}
