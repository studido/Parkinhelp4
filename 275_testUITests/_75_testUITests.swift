//
//  _75_testUITests.swift
//  275_testUITests
//
//  Created by Sterling Smith on 10/29/19.
//  Copyright © 2019 Sterling Smith. All rights reserved.
//

import XCTest

class _75_testUITests: XCTestCase {
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
    }
    //ALL TESTS MUST BE PERFORMED AFTER ACCOUNT IS ALREADY LOGGED IN AT PATIENT MAIN MENU
    //PATIENT TEST ACCOUNT:
    //Email: testParkinHelpPatient@gmail.com
    //Password: Group4Password

    func testMenuSlider() {
        
        let app = XCUIApplication()
        app.navigationBars["Home"].buttons["Menu"].tap()
        XCTAssert(app.buttons["Home"].exists)
        XCTAssert(app.buttons["Profile"].exists)
        XCTAssert(app.buttons["Settings"].exists)
        XCTAssert(app.buttons["AboutUs"].exists)
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Home"]/*[[".cells.buttons[\"Home\"]",".buttons[\"Home\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let window = app.children(matching: .window).element(boundBy: 0)
        window.children(matching: .other).element(boundBy: 1).navigationBars["Home"].buttons["Menu"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Profile"]/*[[".cells.buttons[\"Profile\"]",".buttons[\"Profile\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let homeButton = app.buttons["Home"]
        homeButton.tap()
        window.children(matching: .other).element(boundBy: 3).navigationBars["Home"].buttons["Menu"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Settings"]/*[[".cells.buttons[\"Settings\"]",".buttons[\"Settings\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        homeButton.tap()
        window.children(matching: .other).element(boundBy: 5).navigationBars["Home"].buttons["Menu"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["AboutUs"]/*[[".cells.buttons[\"AboutUs\"]",".buttons[\"AboutUs\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        homeButton.tap()
    }
    

    func testMainMenu() {
        //Start from main menu to run
        let app = XCUIApplication()
        app.buttons["Tremor Measurement"].tap()
        app.navigationBars["_75_test.TremorView"].buttons["Home"].tap()
        XCTAssert(app.buttons["Tremor Graph"].exists)
        XCTAssert(app.buttons["Tremor Measurement"].exists)
        XCTAssert(app.buttons["Exercise List"].exists)
        XCTAssert(app.staticTexts["Main Menu"].exists)
        app.buttons["Tremor Graph"].tap()
        app.navigationBars["_75_test.ChartView"].buttons["Home"].tap()
        app.buttons["Exercise List"].tap()
        XCTAssert(app.buttons["Recommended Exercices"].exists)
        XCTAssert(app.buttons["Head"].exists)
        XCTAssert(app.buttons["Lower Body"].exists)
        XCTAssert(app.buttons["Upper Body"].exists)
        XCTAssert(app.buttons["Arms"].exists)
        app.navigationBars["_75_test.ExerciseView"].buttons["Home"].tap()
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testExercises() {
        
       //wtf let app = app2
        let app = XCUIApplication()
        let app2 = app
        //have to start from main menu
        app.buttons["Exercise List"].tap()
        app.buttons["Lower Body"].tap()
        XCTAssert(app.buttons["calf"].exists)
        XCTAssert(app.buttons["foot"].exists)
      //  let app2 = app
        app2/*@START_MENU_TOKEN@*/.buttons["foot"]/*[[".otherElements[\"LOWER\"].buttons[\"foot\"]",".buttons[\"foot\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["_75_test.newfootView"].buttons["Back"].tap()
        app2/*@START_MENU_TOKEN@*/.buttons["calf"]/*[[".otherElements[\"LOWER\"].buttons[\"calf\"]",".buttons[\"calf\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["_75_test.calfView"].buttons["Back"].tap()
        
        let backButton = app.navigationBars["UIView"].buttons["Back"]
        backButton.tap()
        app.buttons["Arms"].tap()
        XCTAssert(app.buttons["arms"].exists)
        XCTAssert(app.buttons["hand"].exists)
        app2/*@START_MENU_TOKEN@*/.buttons["hand"]/*[[".otherElements[\"ARN\"].buttons[\"hand\"]",".buttons[\"hand\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["_75_test.handView"].buttons["Back"].tap()
        app2/*@START_MENU_TOKEN@*/.buttons["arms"]/*[[".otherElements[\"ARN\"].buttons[\"arms\"]",".buttons[\"arms\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["_75_test.armsView"].buttons["Back"].tap()
        backButton.tap()
        app.buttons["Upper Body"].tap()
        XCTAssert(app.buttons["chest"].exists)
        XCTAssert(app.buttons["back"].exists)
        XCTAssert(app.buttons["Shoulder"].exists)
        app2/*@START_MENU_TOKEN@*/.buttons["chest"]/*[[".otherElements[\"UPPER\"].buttons[\"chest\"]",".buttons[\"chest\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["_75_test.ChestView"].buttons["Back"].tap()
        app2/*@START_MENU_TOKEN@*/.buttons["back"]/*[[".otherElements[\"UPPER\"].buttons[\"back\"]",".buttons[\"back\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["_75_test.shoudlerView"].buttons["Back"].tap()
        app2.buttons["Shoulder"].tap()
        app.navigationBars["_75_test.backView"].buttons["Back"].tap()
        backButton.tap()
        app.buttons["Head"].tap()
        XCTAssert(app.buttons["face"].exists)
        XCTAssert(app.buttons["neck"].exists)
        app2/*@START_MENU_TOKEN@*/.buttons["face"]/*[[".otherElements[\"UPPER\"].buttons[\"face\"]",".buttons[\"face\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["_75_test.faceView"].buttons["Back"].tap()
        app2/*@START_MENU_TOKEN@*/.buttons["neck"]/*[[".otherElements[\"UPPER\"].buttons[\"neck\"]",".buttons[\"neck\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["_75_test.neckView"].buttons["Back"].tap()
        backButton.tap()
        }
    
    func testRecommended() {
        let app = XCUIApplication()
        app.buttons["Exercise List"].tap()
        app.buttons["Recommended Exercices"].tap()
        XCTAssert(app.staticTexts["Your Weekly Exercise Schedule"].exists)
        XCTAssert(app.staticTexts["Exercises per week:"].exists)
        XCTAssert(app.staticTexts["Total repititions per week:"].exists)
        XCTAssert(app.staticTexts["Intensity can be modified in settings"].exists)
        XCTAssert(app.staticTexts["Sets:"].exists)
        XCTAssert(app.staticTexts["Repititions:"].exists)
        app.navigationBars["_75_test.RecommendView"].buttons["Back"].tap()
        app.navigationBars["_75_test.ExerciseView"].buttons["Home"].tap()
    }
    //THE FOLLOWING DOCTOR ACCOUNT TEST MUST BE PERFORMED FROM THE DOCTOR ACCOUNT MAIN MENU
    //Doctor test account: usertesting275.04@gmail.com
    //Email: Group4Password
    func testDoctorAccount() {
        
        let app = XCUIApplication()
        app.buttons["My Account"].tap()
        XCTAssert(app.staticTexts["Name:"].exists)
        XCTAssert(app.staticTexts["Profession:"].exists)
        XCTAssert(app.staticTexts["Number of Patients:"].exists)
        app.buttons["Back"].tap()
        XCTAssert(app.staticTexts["Patient 1"].exists)
        XCTAssert(app.staticTexts["Patient 2"].exists)
        XCTAssert(app.staticTexts["Patient 3"].exists)
    }
    
    

}
