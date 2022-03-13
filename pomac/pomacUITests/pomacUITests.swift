//
//  pomacUITests.swift
//  pomacUITests
//
//  Created by ziad on 13/03/2022.
//

import XCTest

class pomacUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    func testSucessLogin(){
        let app = XCUIApplication()
        app.launch()
        let elementsQuery = app.scrollViews.otherElements
        let email = elementsQuery.textFields["Enter Email"]
        
        let enterPasswordSecureTextField = elementsQuery.secureTextFields["Enter Password"]
        
        let loginButtonAction = elementsQuery.buttons["Login"].staticTexts["Login"]
        
        let sucessAlert = app.alerts["Success"].scrollViews.otherElements.buttons["Go to main page"]
        let choseTableCell = app.tables/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"516 kcal").element/*[[".cells.containing(.staticText, identifier:\"Crispy Fish Goujons \").element",".cells.containing(.staticText, identifier:\"with Sweet Potato Wedges and Minted Snap Peas\").element",".cells.containing(.staticText, identifier:\"516 kcal\").element"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        email.tap()
        email.typeText("ziadali@gmail.com")
        enterPasswordSecureTextField.tap()
        enterPasswordSecureTextField.typeText("1234")
        loginButtonAction.tap()
        sucessAlert.tap()
        choseTableCell.tap()
        
    }
    func testInvalidEmail(){
        let app = XCUIApplication()
        app.launch()
        let loginButtonAction = app.scrollViews.otherElements.buttons["Login"].staticTexts["Login"]
        let okayButton = app.alerts["Alert"].scrollViews.otherElements.buttons["Okay"]
        loginButtonAction.tap()
        okayButton.tap()
                
    }
    
    func testAddToFavOrUnFav(){
        
        let app = XCUIApplication()
        app.launch()
        let elementsQuery = app.scrollViews.otherElements
        let email = elementsQuery.textFields["Enter Email"]
        
        let enterPasswordSecureTextField = elementsQuery.secureTextFields["Enter Password"]
        
        let loginButtonAction = elementsQuery.buttons["Login"].staticTexts["Login"]
        
        let sucessAlert = app.alerts["Success"].scrollViews.otherElements.buttons["Go to main page"]
        let choseTableCell = app.tables/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"516 kcal").element/*[[".cells.containing(.staticText, identifier:\"Crispy Fish Goujons \").element",".cells.containing(.staticText, identifier:\"with Sweet Potato Wedges and Minted Snap Peas\").element",".cells.containing(.staticText, identifier:\"516 kcal\").element"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/

        email.tap()
        email.typeText("ziadali@gmail.com")
        enterPasswordSecureTextField.tap()
        enterPasswordSecureTextField.typeText("1234")
        loginButtonAction.tap()
        sucessAlert.tap()
        choseTableCell.tap()
    
        let button = elementsQuery.buttons[" "]
        button.tap()
        button.tap()
                
                
    }
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
