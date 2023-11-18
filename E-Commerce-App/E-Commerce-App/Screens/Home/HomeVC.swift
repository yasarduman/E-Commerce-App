//
//  HomeVC.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 17.11.2023.
//

import UIKit


final class HomeVC: UIViewController {

    //MARK: - Properties
    private let homeView = HomeView()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionCellRegister()
        setupDelegates()
    }
    
    override func loadView() {
        view = homeView
    }
 
    
    //MARK: - Register Custom Cell
    private func collectionCellRegister() {
        homeView.specialProductsCollection.register(SpecialCollectionCell.self, forCellWithReuseIdentifier: SpecialCollectionCell.identifier)
        homeView.categoryCollection.register(CategoryCollectionCell.self, forCellWithReuseIdentifier: CategoryCollectionCell.identifier)
        homeView.productCollection.register(ProductCollectionCell.self, forCellWithReuseIdentifier: ProductCollectionCell.identifier)
    }
    
    //MARK: - Setup Delegates
    private func setupDelegates() {
        homeView.specialProductsCollection.dataSource = self
        homeView.specialProductsCollection.delegate = self
        
        homeView.categoryCollection.dataSource = self
        homeView.categoryCollection.delegate = self
        
        homeView.productCollection.dataSource = self
        homeView.productCollection.delegate = self
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
extension HomeVC:  UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case homeView.specialProductsCollection:
            return 5
        case homeView.categoryCollection:
            return CategoryMockData.categories.count
        case homeView.productCollection:
            return 6
            
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case homeView.specialProductsCollection:
            guard let cell = homeView.specialProductsCollection.dequeueReusableCell(withReuseIdentifier: SpecialCollectionCell.identifier, for: indexPath) as? SpecialCollectionCell else {
                return UICollectionViewCell()
            }
            cell.specialTitleLabel.text = "DenemeTitle"
            cell.specialDetailLabel.text = "DEtail Deneme sadsa das dasdas"
            
            return cell
            
        case homeView.categoryCollection:
            guard let cell = homeView.categoryCollection.dequeueReusableCell(withReuseIdentifier: CategoryCollectionCell.identifier, for: indexPath) as? CategoryCollectionCell else {
                return UICollectionViewCell()
            }
            cell.categoryImage.image = UIImage(named: CategoryMockData.categories[indexPath.row].imageName)
            cell.categoryName.text = CategoryMockData.categories[indexPath.row].name
            return cell
        case homeView.productCollection:
            guard let cell = homeView.productCollection.dequeueReusableCell(withReuseIdentifier: ProductCollectionCell.identifier, for: indexPath) as? ProductCollectionCell else {
                return UICollectionViewCell()
            }
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case homeView.specialProductsCollection:
            return CGSize(width: homeView.specialProductsCollection.frame.width , height: homeView.specialProductsCollection.frame.height)
        case homeView.categoryCollection:
            return CGSize(width: homeView.categoryCollection.frame.height, height: homeView.categoryCollection.frame.height)
        case homeView.productCollection:
            return CGSize(width: homeView.productCollection.frame.width / 2 - 10, height: homeView.productCollection.frame.width / 2)
            
        default:
            return CGSize(width: 20, height: 20)
        }
    }
    
    
}

// MARK: - UIScrollViewDelegate
extension HomeVC: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        homeView.pageControl.currentPage = currentPage
    }
}

struct Category {
    let imageName: String
    let name: String
}

struct CategoryMockData {
    static let categories: [Category] = [
            Category(imageName: "allCategories", name: "All"),
            Category(imageName: "men", name: "men"),
            Category(imageName: "women", name: "women"),
            Category(imageName: "headset", name: "electironics"),
            Category(imageName: "jewelery", name: "jewelery")
           
        
    ]
}
