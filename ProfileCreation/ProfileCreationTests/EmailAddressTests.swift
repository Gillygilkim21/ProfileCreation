//
//  EmailAddressTests.swift
//  ProfileCreationTests
//
//  Created by Gilbert Kim on 11/28/21.
//

import XCTest
@testable import ProfileCreation

class EmailAddressTests: XCTestCase {
	
	var emailAddress: EmailAddress!
	
	override func setUpWithError() throws {
		try super.setUpWithError()
	}
	
	override func tearDownWithError() throws {
		emailAddress = nil
		try super.tearDownWithError()
	}
	
	private func createEmailAddress(_ value: String) {
		emailAddress = EmailAddress(value: value)
	}
	
	func testInvalidEmail() throws {
		createEmailAddress("invalidEmail")
		XCTAssertFalse(emailAddress.isValid())
	}
	
	func testValidEmail() throws {
		createEmailAddress("validEmail@gmail.com")
		XCTAssertTrue(emailAddress.isValid())
	}
	
	func testEmptyEmail() throws {
		createEmailAddress("")
		XCTAssertFalse(emailAddress.isValid())
	}
}
