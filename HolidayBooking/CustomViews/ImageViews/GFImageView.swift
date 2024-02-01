//
//  GFImageView.swift
//  HolidayBooking
//
//  Created by guncel on 2.02.2024.
//

import UIKit

final class GFImageView:UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    fileprivate func configure(){
        layer.backgroundColor = UIColor(hex: "#81b29a").cgColor
        contentMode = .scaleAspectFit
       layer.cornerRadius = 10
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
