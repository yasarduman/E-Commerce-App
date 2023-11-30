//
//  MockSearchVC.swift
//  E-Commerce-AppTests
//
//  Created by Yaşar Duman on 29.11.2023.
//

@testable import E_Commerce_App

final class MockSearchVC: SearchVCInterface {
    var invokedPrepareNavigationBar = false
    var invokedPrepareNavigationBarCount = 0
    
    func configureNavigationBar() {
        invokedPrepareNavigationBar = true
        invokedPrepareNavigationBarCount += 1
    }
    
    var invokedPrepareSearchController = false
    var invokedPrepareSearchControllerCount = 0
    
    func prepareSearchController() {
        invokedPrepareSearchController = true
        invokedPrepareSearchControllerCount += 1
    }
    
    var invokedPrepareCollectionView = false
    var invokedPrepareCollectionViewCount = 0
    
    func prepareCollectionView() {
        invokedPrepareCollectionView = true
        invokedPrepareCollectionViewCount += 1
    }
    
    var invokedPrepareReloadData = false
    var invokedPrepareReloadDataCount = 0
    
    func reloadData() {
        invokedPrepareReloadData = true
        invokedPrepareReloadDataCount += 1
    }
}
