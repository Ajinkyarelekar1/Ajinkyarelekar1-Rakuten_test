//
//  Rakuten_testTests.swift
//  Rakuten_testTests
//
//  Created by venajr on 22/5/21.
//

import XCTest
@testable import Rakuten_test

class DataListViewModelTests: XCTestCase {
    let viewModel = DataListViewModel()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel.delegate = self
        MainConstants.useMockForTest = true
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchUsre() throws {
        viewModel.callFetchUsers()
    }
    
    func testDateFormating() {
        let formattedDate = viewModel.convertedDate(dateStr: "2011-06-06T03:40:09.505792+00:00")
        XCTAssertTrue(formattedDate == "06 Jun 2011 11:40 AM")
    }
}

extension DataListViewModelTests: DataListViewModelDelegate {
    func loadUsers(lastIndex: Int) {
        XCTAssertTrue(viewModel.users.count == 10)
        XCTAssertTrue(viewModel.users[0].fullName == "opensymphony/xwork")
        XCTAssertTrue(viewModel.users[0].name == "xwork")
        XCTAssertTrue(viewModel.users[0].type == "repository")
        XCTAssertTrue(viewModel.users[0].language == "java")
        XCTAssertTrue(viewModel.users[0].createdOn == "2011-06-06T03:40:09.505792+00:00")
    }
}
