//
//  MockHomeVC.swift
//  E-Commerce-AppTests
//
//  Created by Yaşar Duman on 29.11.2023.
//

@testable import E_Commerce_App

final class MockHomeVC: HomeVCInterface{
 
    var invokedConfigureViewController = false
    var invokedConfigureViewControllerCount = 0
    
    func configureViewController() {
        invokedConfigureViewController = true
        invokedConfigureViewControllerCount += 1
    }
    
    var invokedProductReloadData = false
    var invokedProductReloadDataCount = 0
    
    func specialProductReloadData() {
        invokedProductReloadData = true
        invokedProductReloadDataCount += 1
    }
    
    var invokedCategoryCollectionReloadData = false
    var invokedCategoryCollectionReloadDataCount = 0
    
    func categoryCollectionReloadData() {
        invokedCategoryCollectionReloadData = true
        invokedCategoryCollectionReloadDataCount += 1
    }
    
    
    var invokedPushDetailVC = false
    var invokedPushDetailVCCount = 0
    
    func pushDetailVC(product: E_Commerce_App.Product) {
        invokedPushDetailVC = true
        invokedPushDetailVCCount += 1
    }
    
    
}
