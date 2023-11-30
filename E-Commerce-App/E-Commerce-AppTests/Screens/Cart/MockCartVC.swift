//
//  MockCartVC.swift
//  E-Commerce-AppTests
//
//  Created by Erislam Nurluyol on 30.11.2023.
//

@testable import E_Commerce_App

final class MockCartVC: CartVCInterface {
    
    var invokedConfigureNavigationController = false
    var invokedConfigureNavigationControllerCount = 0
    
    func configureNavigationController() {
        invokedConfigureNavigationController = true
        invokedConfigureNavigationControllerCount += 1
    }
    
    var invokedPrepareCollectionView = false
    var invokedPrepareCollectionViewCount = 0
    
    func prepareCollectionView() {
        invokedPrepareCollectionView = true
        invokedPrepareCollectionViewCount += 1
    }
    
    var invokedReloadData = false
    var invokedReloadDataCount = 0
    
    func reloadData() {
        invokedReloadData = true
        invokedReloadDataCount += 1
    }
    
    var invokedReloadTotalPrice = false
    var invokedReloadTotalPriceCount = 0
    
    func reloadTotalPrice() {
        invokedReloadTotalPrice = true
        invokedReloadTotalPriceCount += 1
    }
}
