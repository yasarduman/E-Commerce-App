//
//  HomeVMTests.swift
//  E-Commerce-AppTests
//
//  Created by Yaşar Duman on 29.11.2023.
//


import XCTest
@testable import E_Commerce_App

final class HomeVMTests: XCTestCase {
    private var viewModel: HomeVM!
    private var view: MockHomeVC!
    private var networkManager: MockNetworkManager!
    private var firestoreManager: MockFirestoreManager!
    
    override func setUp() { //testlere başlamadan önce bu çalışacak
        // Test senaryosu için başlangıç durumunu ayarla
        super.setUp()
        view = .init()
        networkManager = .init()
        firestoreManager = .init()
        viewModel = .init(view: view, networkManager: networkManager, firestoreManager: firestoreManager)
        
    }
    
    override func tearDown() {//test tamamlandıktan sonra çalışır.
        // Test tamamlandıktan sonra temizlik yap
        super.tearDown()
        
    }
    
    func test_viewDidLoad_InvokesRequiredMethods() {
        //given
        XCTAssertEqual(view.invokePrepareControllerCount, 0)
        XCTAssertEqual(view.invokePrepareProductReloadDataCount, 0)
        XCTAssertEqual(networkManager.invokedGetProductsCount, 0)
        XCTAssertEqual(view.invokePrepareProductReloadDataCount, 0)
        
        //when
        viewModel.viewDidLoad()
        
        //then
        XCTAssertEqual(view.invokePrepareControllerCount, 1)
        XCTAssertEqual(view.invokePrepareProductReloadDataCount, 1)
        XCTAssertEqual(networkManager.invokedGetProductsCount, 1)
        XCTAssertEqual(view.invokePrepareProductReloadDataCount, 1)
    }
    
    func test_viewWillAppear_InvokesPrepareProductByCategory() {
        //given
        XCTAssertFalse(networkManager.invokedGetProducts)
        XCTAssertFalse(firestoreManager.invokeGetProductsFromFavorites)
        XCTAssertFalse(view.invokePrepareCategoryCollectionReloadData)
        
        //when
        viewModel.viewWillAppear()
        
        //then
        XCTAssertEqual(networkManager.invokedGetProductsCount, 1)
        XCTAssertEqual(firestoreManager.invokeGetProductsFromFavoritesCount, 1)
        XCTAssertEqual(view.invokePrepareCategoryCollectionReloadDataCount, 1)
    }
}
