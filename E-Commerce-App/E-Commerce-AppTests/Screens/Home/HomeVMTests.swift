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
        XCTAssertEqual(view.invokedConfigureViewControllerCount, 0)
        XCTAssertEqual(networkManager.invokedGetProductsCount, 0)
        XCTAssertEqual(view.invokedProductReloadDataCount, 0)
        
        //when
        viewModel.viewDidLoad()
        
        //then
        XCTAssertEqual(view.invokedConfigureViewControllerCount, 1)
        XCTAssertEqual(networkManager.invokedGetProductsCount, 1)
        XCTAssertEqual(view.invokedProductReloadDataCount, 1)

    }
    
    func test_viewWillAppear_InvokesPrepareProductByCategory() {
        //given
        XCTAssertFalse(networkManager.invokedGetProducts)
        XCTAssertFalse(firestoreManager.invokeGetProductsFromFavorites)
        XCTAssertFalse(view.invokedCategoryCollectionReloadData)
        
        //when
        viewModel.viewWillAppear()

        //then
        XCTAssertEqual(networkManager.invokedGetProductsCount, 1)
        XCTAssertEqual(firestoreManager.invokeGetProductsFromFavoritesCount, 1)
        XCTAssertEqual(view.invokedCategoryCollectionReloadDataCount, 1)
    }
    
    func test_categoryDidSelectItem_ReturnsCategoryAll() {
        //given
        XCTAssertEqual(networkManager.invokedGetProductsCount, 0)
        XCTAssertEqual(firestoreManager.invokeGetProductsFromFavoritesCount, 0)
        XCTAssertEqual(view.invokedCategoryCollectionReloadDataCount, 0)
        
        //when
        viewModel.categoryDidSelectItem(at: IndexPath(item: 0, section: 0))
        
        //then
        XCTAssertEqual(viewModel.categories[0], MockData.mockCategoryAll)
        XCTAssertEqual(networkManager.invokedGetProductsCount, 1)
        XCTAssertEqual(firestoreManager.invokeGetProductsFromFavoritesCount, 1)
        XCTAssertEqual(view.invokedCategoryCollectionReloadDataCount, 1)
    }
    
    
    
    func test_categoryDidSelectItem_ReturnsMensClothing() {
        //given
        XCTAssertEqual(networkManager.invokedGetProductByCategoryCount, 0)
        XCTAssertEqual(firestoreManager.invokeGetProductsFromFavoritesCount, 0)
        XCTAssertEqual(view.invokedCategoryCollectionReloadDataCount, 0)
        
        //when
        viewModel.categoryDidSelectItem(at: IndexPath(item: 1, section: 0))
        
        //then
        XCTAssertEqual(viewModel.categories[1], MockData.mockCategoryMensClothing)
        XCTAssertEqual(networkManager.invokedGetProductByCategoryCount, 1)
        XCTAssertEqual(firestoreManager.invokeGetProductsFromFavoritesCount, 1)
        XCTAssertEqual(view.invokedCategoryCollectionReloadDataCount, 1)
    }
    
    func test_productByCategoryDidSelectItem_PushDetail() {
        //given
        XCTAssertFalse(view.invokedPushDetailVC)
        
        //when
        viewModel.viewWillAppear()
        viewModel.productByCategoryDidSelectItem(at: IndexPath(item: 0, section: 0))
        
        //then
        XCTAssertTrue(view.invokedPushDetailVC)
 
    }
}
