//
//  ChallengeYapeUITests.swift
//  ChallengeYapeUITests
//
//  Created by Serguei Diaz on 20.06.2023.
//

import XCTest
import Resolver

final class RecipesListUITests: XCTestCase {
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        //Resolver.registerSuccessMockers()
        app.launch()
    }
    
    override func tearDown() {
        //Resolver.root = Resolver.main
    }
    
    func testFilterBarAppears() {
        let searchBar = app.textFields["Buscar"]
        XCTAssert(searchBar.waitForExistence(timeout: 5))
    }
    
    func testRecipesScrollViewAppears() {
        let scrollView = app.scrollViews.firstMatch
        
        XCTAssert(scrollView.waitForExistence(timeout: 5))
        
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

final class RecipeDetailUITests: XCTestCase {
    let app = XCUIApplication()
    
    var recipeName: String = ""
    
    override func setUpWithError() throws {
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app.launch()
        
        //go to detail view
        let exp = expectation(description: "Wait afert 5.0 seconds")
        let waiter = XCTWaiter.wait(for: [exp], timeout: 5.0)
        
        let scrollView = app.scrollViews.firstMatch
        let button = scrollView.buttons.firstMatch
        
        self.recipeName = button.label
        
        if waiter == XCTWaiter.Result.timedOut {
            button.tap()
        }
    }
    
    func testRecipeNameAppears() {
        let name = app.staticTexts[recipeName]
        
        XCTAssert(name.waitForExistence(timeout: 5))

    }
    
    func testImageAppears() {
        let image = app.images.firstMatch
        
        XCTAssert(image.waitForExistence(timeout: 5))

    }
    
    func testButtonGoToMapAppears() {
        
        let topBar = app.buttons["Ir al mapa"]
        
        XCTAssert(topBar.waitForExistence(timeout: 5))
        
    }
    
    func testTopBarBackButtonAppears() {
        
        let backButton = app.buttons["arrow.backward"]
        
        XCTAssert(backButton.waitForExistence(timeout: 5))
        
    }
    
    func testTopBarTitleAppears() {
        
        let title = app.staticTexts["Detalle"]
        
        XCTAssert(title.waitForExistence(timeout: 5))
        
    }
}

final class RecipeMapUITests: XCTestCase {
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app.launch()
        
        //go to detail view
        let exp = expectation(description: "Wait 5.0 seconds")
        let waiter = XCTWaiter.wait(for: [exp], timeout: 5.0)
        
        let scrollView = app.scrollViews.firstMatch
        let button = scrollView.buttons.firstMatch
        
        if waiter == XCTWaiter.Result.timedOut {
            button.tap()
        }
        
        //go to map view
        let secondExp = expectation(description: "Wait 5.0 seconds")
        let secondWaiter = XCTWaiter.wait(for: [secondExp], timeout: 5.0)
        
        let goToMapButton = app.buttons["Ir al mapa"]
        
        if secondWaiter == XCTWaiter.Result.timedOut {
            goToMapButton.tap()
        }
        
    }
    
    func testMapAppears() {
        
        let map = app.maps.firstMatch
        
        XCTAssert(map.waitForExistence(timeout: 5))
        
    }
    
    func testTopBarBackButtonAppears() {
        
        let backButton = app.buttons["arrow.backward"]
        
        XCTAssert(backButton.waitForExistence(timeout: 5))
        
    }
    
    func testTopBarTitleAppears() {
        
        let title = app.staticTexts["Origen"]
        
        XCTAssert(title.waitForExistence(timeout: 5))
        
    }
}
