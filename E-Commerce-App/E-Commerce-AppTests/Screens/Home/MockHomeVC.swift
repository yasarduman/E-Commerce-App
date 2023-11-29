//
//  MockHomeVC.swift
//  E-Commerce-AppTests
//
//  Created by Yaşar Duman on 29.11.2023.
//

@testable import E_Commerce_App

final class MockHomeVC: HomeVCInterface{
    var invokePrepareController = false
    var invokePrepareControllerCount = 0
    
    func configureViewController() {
        invokePrepareController = true
        invokePrepareControllerCount += 1
    }
    
    var invokePrepareProductReloadData = false
    var invokePrepareProductReloadDataCount = 0
    
    func specialProductReloadData() {
        invokePrepareProductReloadData = true
        invokePrepareProductReloadDataCount += 1
    }
    
    var invokePrepareCategoryCollectionReloadData = false
    var invokePrepareCategoryCollectionReloadDataCount = 0
    
    func categoryCollectionReloadData() {
        invokePrepareCategoryCollectionReloadData = true
        invokePrepareCategoryCollectionReloadDataCount += 1
    }
    
}
