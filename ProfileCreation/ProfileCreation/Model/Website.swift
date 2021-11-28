//
//  Website.swift
//  ProfileCreation
//
//  Created by Gilbert Kim on 11/28/21.
//

import Foundation

struct Website {
	var value: String = ""
	
	func isValid() -> Bool {
		return value.isEmpty || isValidURLFormat()
	}
	
	private func isValidURLFormat() -> Bool {
		let detector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
		guard let detector = detector else { return false }
		if let match = detector.firstMatch(in: self.value, options: [], range: NSRange(location: 0, length: self.value.utf16.count)) {
			return match.range.length == self.value.utf16.count
		} else {
			return false
		}
	}
}
