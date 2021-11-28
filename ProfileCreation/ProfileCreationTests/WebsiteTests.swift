//
//  WebsiteTests.swift
//  ProfileCreationTests
//
//  Created by Gilbert Kim on 11/28/21.
//

import XCTest
@testable import ProfileCreation

class WebsiteTests: XCTestCase {

	var website: Website!
	
	override func setUpWithError() throws {
		try super.setUpWithError()
	}
	
	override func tearDownWithError() throws {
		website = nil
		try super.tearDownWithError()
	}
	
	private func createWebsite(_ value: String) {
		website = Website(value: value)
	}
	
	func testInvalidWebsite() throws {
		createWebsite("invalidWebsite")
		XCTAssertFalse(website.isValid())
	}
	
	func testValidWebsite() throws {
		createWebsite("validWebsite.com")
		XCTAssertTrue(website.isValid())
	}
	
	func testValidWebsiteWithHttp() throws {
		createWebsite("http://validWebsite.com")
		XCTAssertTrue(website.isValid())
	}
	
	func testValidWebsiteWithHttps() throws {
		createWebsite("https://validWebsite.com")
		XCTAssertTrue(website.isValid())
	}
	
	func testEmptyWebsite() throws {
		createWebsite("")
		XCTAssertTrue(website.isValid())
	}
}
