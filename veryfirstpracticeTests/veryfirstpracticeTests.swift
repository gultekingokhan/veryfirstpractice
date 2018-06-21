//
//  veryfirstpracticeTests.swift
//  veryfirstpracticeTests
//
//  Created by Gokhan Gultekin on 9.06.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

import XCTest
@testable import veryfirstpractice

class veryfirstpracticeTests: XCTestCase {
    
    var sessionUnderTest: URLSession!
    
    override func setUp() {
        super.setUp()
        
        //Initialize the SUT object
        sessionUnderTest = URLSession(configuration: URLSessionConfiguration.default)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        sessionUnderTest = nil
        
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_backbuttonSized() {
        let width = 12
        let height = 12
        
        XCTAssertEqual(width, height, "Width is not equal to height")
    }
    
    func test_photoObjectNilOrNot() {
        
        let photo = Photo(id: "1234", url: nil, description: nil)
        XCTAssertNotNil(photo.url, "Photo URL has not to be nil.")
        XCTAssertNotNil(photo.description, "Photo description has not to be nil.")
    }
    
    func test_artistObjectNilOrNot() {
        
        let artist = Artist(id: "1234", username: nil, profileImageURL: nil)
        XCTAssertNotNil(artist.username, "Artist username has not to be nil.")
        XCTAssertNotNil(artist.profileImageURL, "Artist avatar URL has not to be nil.")
    }
    
    func test_unsplashGetPhotosHTTPStatusCode200() {
        //given
        let constants = Constants()
        let url = URL(string: constants.unsplash_curetad_photos_ready_url)
        XCTAssertNotNil(url, "URL is nil")
        
        let promise = expectation(description: "Completion handler invoked")
        var statusCode: Int?
        var responseError: Error?
        //when
        if url != nil {
            
            let dataTask = sessionUnderTest.dataTask(with: url!) { (data, response, error) in
                
                XCTAssertNotNil(response, "Response object is nil")
                
                statusCode = (response as! HTTPURLResponse).statusCode
                responseError = error
                
                promise.fulfill()
            }
            dataTask.resume()
            
            waitForExpectations(timeout: 5, handler: nil)
            
            //then
            XCTAssertNil(responseError)
            XCTAssertEqual(statusCode, 200)
            
        }
    }
}
