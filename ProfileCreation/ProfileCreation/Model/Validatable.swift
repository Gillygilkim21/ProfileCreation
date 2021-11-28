//
//  Validatable.swift
//  ProfileCreation
//
//  Created by Gilbert Kim on 11/28/21.
//

import Foundation

protocol Validatable {
	func isValid() -> Bool
	var value: String { get set }
}
