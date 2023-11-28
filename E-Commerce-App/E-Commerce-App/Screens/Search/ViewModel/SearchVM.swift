//
//  SearchVM.swift
//  E-Commerce-App
//
//  Created by Erislam Nurluyol on 27.11.2023.
//

import Foundation

protocol SearchVMInterface {
    var view: SearchVCInterface? { get set }
    
    func viewDidLoad()
}

final class SearchVM {
    weak var view: SearchVCInterface?
}

extension SearchVM: SearchVMInterface {
    func viewDidLoad() {}
}
