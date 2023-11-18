//
//  HomeView.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 18.11.2023.
//

import UIKit



final class HomeView: UIView {

    //MARK: - UI Elements
    private let specialProductsTitle = TitleLabel(fontSize: 22, textAlignment: .left, lineBreakMode: .byTruncatingTail)
    
    lazy var specialProductsCollection = CustomCollection(backgroundColor: .tertiarySystemBackground, cornerRadius: 30, showsScrollIndicator: false, paging: true ,layout: UICollectionViewFlowLayout(), scrollDirection: .horizontal)
   
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 5
        pageControl.currentPage = 0
        pageControl.tintColor = .red
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .purple
        return pageControl
    }()
   
    private let categoriesTitle = TitleLabel(fontSize: 22, textAlignment: .left, lineBreakMode: .byTruncatingTail)
    
    lazy var categoryCollection = CustomCollection(showsScrollIndicator: false, paging: false, layout: UICollectionViewFlowLayout(), scrollDirection: .horizontal)
    
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UI Configuration
    
    private func configureUI() {
        backgroundColor = .secondarySystemBackground
        addSubviewsExt(specialProductsTitle,specialProductsCollection,pageControl,categoriesTitle,categoryCollection)
        configureSpecialProductsTitle()
        configureSpecialProductsCollection()
        configurePageControl()
        configureCategoriesTitle()
        configureCategoryCollection()
    }
    
    private func configureSpecialProductsTitle() {
        specialProductsTitle.text = "Special Products"
        specialProductsTitle.anchor(top: safeAreaLayoutGuide.topAnchor,
                                    leading: leadingAnchor,
                                    trailing: trailingAnchor,
                                    padding: .init(top: 20, leading: 10))
    }
    
    private func configureSpecialProductsCollection() {
        specialProductsCollection.anchor(top: specialProductsTitle.bottomAnchor,
                                         leading: leadingAnchor,
                                         trailing: trailingAnchor,
                                         padding: .init(top: 20, leading: 10, trailing: 10))
        
        specialProductsCollection.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    private func configurePageControl() {
        pageControl.anchor(top: specialProductsCollection.bottomAnchor,
                           leading: leadingAnchor,
                           trailing: trailingAnchor)
        pageControl.heightAnchor.constraint(equalToConstant: 20).isActive = true
        pageControl.addTarget(self, action: #selector(pageControlValueChanged), for: .valueChanged)
    }
    
    private func configureCategoriesTitle() {
        categoriesTitle.text = "Categories"
        categoriesTitle.anchor(top: pageControl.bottomAnchor,
                               leading: leadingAnchor,
                               trailing: trailingAnchor,
                               padding: .init(top: 10, leading: 10))
    }
    private func configureCategoryCollection() {
        categoryCollection.anchor(top: categoriesTitle.bottomAnchor,
                                  leading: leadingAnchor,
                                  trailing: trailingAnchor,
                                  padding: .init(top: 10),
                                  size: .init(heightSize: 90))
    }
    
    
    
    
    
    // MARK: - @Actions
    @objc func pageControlValueChanged() {
        let selectedPage = pageControl.currentPage
        let indexPath = IndexPath(item: selectedPage, section: 0)
        specialProductsCollection.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
}
