//
//  SearchVMTests.swift
//  E-Commerce-AppTests
//
//  Created by Yaşar Duman on 29.11.2023.
//

import XCTest
@testable import E_Commerce_App

final class SearchVMTests: XCTestCase {
    private var viewModel: SearchVM! 
    private var view: MockSearchVC!
    private var netwokManager: MockNetworkManager!
    
    override func setUp() {//testlere başlamadan önce bu çalışacak
        // Test senaryosu için başlangıç durumunu ayarla
        super.setUp()
        view = .init()
        netwokManager = .init()
        viewModel = .init(view: view, networkManager: netwokManager)
    }
    
    override func tearDown() {//test tamamlandıktan sonra çalışır.
        // Test tamamlandıktan sonra temizlik yap
        super.tearDown()
    }
    
    func test_viewDidLoad_InvokesRequiredMethods(){
        //given
        XCTAssertFalse(netwokManager.invokedGetProducts)
        XCTAssertFalse(view.invokedPrepareReloadData)
        XCTAssertFalse(view.invokedPrepareNavigationBar)
        XCTAssertFalse(view.invokedPrepareSearchController)
        XCTAssertFalse(view.invokedPrepareCollectionView)
        
        //when
        viewModel.viewDidLoad()
        
        //then
        XCTAssertEqual(netwokManager.invokedGetProductsCount, 1)
        XCTAssertEqual(view.invokedPrepareReloadDataCount, 1)
        XCTAssertEqual(view.invokedPrepareNavigationBarCount, 1)
        XCTAssertEqual(view.invokedPrepareSearchControllerCount, 1)
        XCTAssertEqual(view.invokedPrepareCollectionViewCount, 1)

    }
}
