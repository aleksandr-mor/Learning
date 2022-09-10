//
//  UITestingUITests.swift
//  UITestingUITests
//
//  Created by Aleksandr Morozov on 10.09.2022.
//

import XCTest

class UITestingUITests: XCTestCase {

    func testAddNoiseMaker() {
        
        let app = XCUIApplication()
        app.launch()
        
        let newNameBtn = app.navigationBars["Noise Makers"].buttons["Add"]
        let nameField = app.alerts["Add Noise Maker"].scrollViews.otherElements.collectionViews/*@START_MENU_TOKEN@*/.textFields["Shaggy"]/*[[".cells.textFields[\"Shaggy\"]",".textFields[\"Shaggy\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let addBtn = app.alerts["Add Noise Maker"].scrollViews.otherElements.buttons["Add"]
        let addedCell = app.tables/*@START_MENU_TOKEN@*/.staticTexts["Emmanuel"]/*[[".cells.staticTexts[\"Emmanuel\"]",".staticTexts[\"Emmanuel\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        newNameBtn.tap()
        nameField.tap()
        nameField.typeText("Emmanuel")
        
        XCTAssertFalse(addedCell.exists)
        
        addBtn.tap()
        
        XCTAssertTrue(addedCell.exists)
    }
    
    func testDeleteNoiseMaker() {
        
        let app = XCUIApplication()
        app.launch()
        
        let newNameBtn = app.navigationBars["Noise Makers"].buttons["Add"]
        let nameField = app.alerts["Add Noise Maker"].scrollViews.otherElements.collectionViews/*@START_MENU_TOKEN@*/.textFields["Shaggy"]/*[[".cells.textFields[\"Shaggy\"]",".textFields[\"Shaggy\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let addBtn = app.alerts["Add Noise Maker"].scrollViews.otherElements.buttons["Add"]
        let addedCell = app.tables.staticTexts["Victor"]
        let tablesQuery = app.tables
        let deleteBtn = tablesQuery/*@START_MENU_TOKEN@*/.buttons["Delete"]/*[[".cells.buttons[\"Delete\"]",".buttons[\"Delete\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        newNameBtn.tap()
        nameField.tap()
        nameField.typeText("Victor")
        addBtn.tap()
        
        
        addedCell.swipeLeft()
        deleteBtn.tap()
        XCTAssertFalse(addedCell.exists)
    }
}
