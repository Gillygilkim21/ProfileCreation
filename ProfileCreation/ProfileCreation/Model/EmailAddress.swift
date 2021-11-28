//
//  EmailAddress.swift
//  ProfileCreation
//
//  Created by Gilbert Kim on 11/28/21.
//

import Foundation

struct EmailAddress {
	var value: String = ""
	
	func isValid() -> Bool {
		return !value.isEmpty && isValidEmailFormat()
	}
	
	private func isValidEmailFormat() -> Bool {
		let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
		let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
		return emailPredicate.evaluate(with: self.value)
	}
}
