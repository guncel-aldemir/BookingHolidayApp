//
//  GFCollectionView.swift
//  HolidayBooking
//
//  Created by guncel on 3.02.2024.
//

import UIKit

final class GFCollectionView:UICollectionView {
    
    
    override init(frame: CGRect, collectionViewLayout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: collectionViewLayout)
        
        configure()
    }
    
    convenience init(frame: CGRect, collectionViewLayout: UICollectionViewFlowLayout,scrollDirection: UICollectionView.ScrollDirection,cell:AnyClass,identifier:String) {
        self.init(frame: frame, collectionViewLayout: collectionViewLayout)
        let layout = collectionViewLayout
        layout.scrollDirection = scrollDirection
        self.register(cell, forCellWithReuseIdentifier: identifier)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func configure(){
        backgroundColor = nil
        showsHorizontalScrollIndicator = false
    }
    
}
