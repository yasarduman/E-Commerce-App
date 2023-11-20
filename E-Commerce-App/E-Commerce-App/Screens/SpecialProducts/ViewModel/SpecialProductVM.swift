//
//  SpecialProductVM.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 20.11.2023.
//

import Foundation
// MARK: - SpecialVMInterface
protocol SpecialVMInterface {
    var view: SpecialVCInterface? { get set }
    func viewDidLoad()
}

// MARK: - SpecialProductVM
final class SpecialProductVM {
    weak var view: SpecialVCInterface?
}

// MARK: - SpecialVMInterface
extension SpecialProductVM: SpecialVMInterface {
    func viewDidLoad() {
        view?.configureViewController()
    }
}
