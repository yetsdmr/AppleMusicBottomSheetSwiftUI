//
//  AppleMusicBottomSheetSwiftUIUITestsLaunchTests.swift
//  AppleMusicBottomSheetSwiftUIUITests
//
//  Created by Yunus Emre Taşdemir on 27.04.2023.
//

import XCTest

final class AppleMusicBottomSheetSwiftUIUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
