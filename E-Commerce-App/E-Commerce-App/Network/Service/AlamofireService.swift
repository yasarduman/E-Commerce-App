//
//  AlamofireService.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 17.11.2023.
//

import Alamofire

protocol ServiceProtocol: AnyObject {
    func request<T:Codable>(path: String, onSuccess: @escaping (T) -> Void, onError: @escaping (AFError) -> Void)
}

final class AlamofireService: ServiceProtocol {
  
    static let shared = AlamofireService()
    
    private init() {}
    
    func request<T:Codable>(path: String, onSuccess: @escaping (T) -> Void, onError: @escaping (AFError) -> Void){
        AF.request(path).validate().responseDecodable(of: T.self) { (response) in
            guard let model = response.value else { return }
            onSuccess(model)
        }
    }
}
