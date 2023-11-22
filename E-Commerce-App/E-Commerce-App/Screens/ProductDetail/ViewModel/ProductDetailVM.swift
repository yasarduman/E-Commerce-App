//
//  ProductDetailVM.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 22.11.2023.
//

import Foundation

protocol ProductDetailVMIterface {
    var view: ProductDetailVCInterface? { get set}
    func viewDidLoad()
    func viewWillAppear()
}

final class ProductDetailVM {
    weak var view: ProductDetailVCInterface?
}

extension ProductDetailVM: ProductDetailVMIterface{
    func viewDidLoad() {
        
    }
    
    func viewWillAppear() {
        
    }
    
    
}
