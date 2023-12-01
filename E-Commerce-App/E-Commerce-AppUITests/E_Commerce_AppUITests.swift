//
//  E_Commerce_AppUITests.swift
//  E-Commerce-AppUITests
//
//  Created by Yaşar Duman on 1.12.2023.
//

import XCTest

final class E_Commerce_AppUITests: XCTestCase {
    private var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        app = nil
        super.tearDown()
    }
    
    func test_SeeAllButtonNavigatesToSpecialProductPage() {
        
        app.buttons["See All"].tap()        
        XCTAssertTrue(app.navigationBars["Special Products"].waitForExistence(timeout: 3))
    }
    
    // See All butonuna tıklanarak Special Products sayfasına geçilir ve detay sayfasına gidilir.
    func test_SeeAllButton_ToSpecialProductDetailPage() {
        app.buttons["See All"].tap()
        
        // Collection View'daki ilk hücreye tıklanır.
        let specialProductCell = app.collectionViews.cells.element(boundBy: 0)
        XCTAssertTrue(specialProductCell.waitForExistence(timeout: 5))
        specialProductCell.tap()
        
        // Detay sayfasında, ürün başlığının doğruluğu kontrol edilir.
        let productTitle = app.staticTexts["productTitle"]
        XCTAssertTrue(productTitle.waitForExistence(timeout: 5))
        XCTAssertEqual(productTitle.label, "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops")
    }
    
    // specialProductsCollection sayfa kontrolünün doğru çalıştığını kontrol eden test.
    func test_SpecialProductsPageControl() {
        // specialProductsCollection'ın ilk hücresi ve sayfa kontrol elemanlarına erişilir.
        let collectionView = app.collectionViews["specialProductsCollection"].cells.element(boundBy: 0)
        let pageControl = app.pageIndicators.element(boundBy: 0)

        // İkinci sayfaya kaydırın
        collectionView.swipeLeft()
        XCTAssertEqual(pageControl.value as? String, "page 2 of 20")

        // Page indicator üzerindeki mevcut sayfanın sağına dokunarak üçüncü sayfaya gidilir.
        let normalizedOffset = CGVector(dx: 0.9, dy: 0.2)
        pageControl.coordinate(withNormalizedOffset: normalizedOffset).tap()

        // Üçüncü sayfanın görünür olmasını bekler
        XCTAssert(app.staticTexts["Mens Cotton Jacket"].waitForExistence(timeout: 5))

        // Page control'ün "sayfa 3 / 20" olarak güncellendiğini doğrular
        XCTAssertEqual(pageControl.value as? String, "page 3 of 20")
    }
    
    
    func testCategoryCollection() throws {
        // "categoryCollection" isimli collectionView'a erişilir
        let categoryCollection = app.collectionViews["categoryCollection"]
        
        // CollectionView'daki hücre sayısını kontrol et
        XCTAssertTrue(categoryCollection.cells.count >= 2, "categoryCollection'da en az iki hücre olmalıdır.")
        
        sleep(5) // 5 saniye bekle
        
        // 3. hücreyi seç
        selectCell(at: 2, in: categoryCollection)
        sleep(5)
        
        let productCollection = app.collectionViews["productCollection"].cells.element(boundBy: 0)
        productCollection.tap()
        
        
        // Detay sayfasında, ürün başlığının doğruluğu kontrol edilir.
        let productTitle = app.staticTexts["productTitle"]
        XCTAssertTrue(productTitle.waitForExistence(timeout: 5))
        XCTAssertEqual(productTitle.label, "BIYLACLESEN Women's 3-in-1 Snowboard Jacket Winter Coats")
        
    }

    func selectCell(at index: Int, in collectionView: XCUIElement) {
           let cell = collectionView.cells.element(boundBy: index)

           // Hücreyi seç
           cell.tap()
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
