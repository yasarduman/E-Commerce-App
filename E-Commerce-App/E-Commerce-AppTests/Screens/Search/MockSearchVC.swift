//
//  MockSearchVC.swift
//  E-Commerce-AppTests
//
//  Created by Yaşar Duman on 29.11.2023.
//

@testable import E_Commerce_App

final class MockSearchVC: SearchVCInterface {
    var invokePrepareNavigationBar = false
    var invokePrepareNavigationBarCount = 0
    
    func configureNavigationBar() {
        invokePrepareNavigationBar = true
        invokePrepareNavigationBarCount += 1
    }
    
    var invokePrepareSearchController = false
    var invokePrepareSearchControllerCount = 0
    
    func prepareSearchController() {
        invokePrepareSearchController = true
        invokePrepareSearchControllerCount += 1
    }
    
    var invokePrepareCollectionView = false
    var invokePrepareCollectionViewCount = 0
    
    func prepareCollectionView() {
        invokePrepareCollectionView = true
        invokePrepareCollectionViewCount += 1
    }
    
    var invokePrepareReloadData = false
    var invokePrepareReloadDataCount = 0
    
    func reloadData() {
        invokePrepareReloadData = true
        invokePrepareReloadDataCount += 1
    }
}
