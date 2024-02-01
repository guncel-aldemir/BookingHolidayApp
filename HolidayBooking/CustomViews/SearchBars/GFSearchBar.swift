//
//  GFSearchBox.swift
//  HolidayBooking
//
//  Created by guncel on 1.02.2024.
//

import UIKit

final class GFSearchBar:UISearchBar{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func configure(){
        placeholder = "Otel veya Lokasyon girin"
        layer.cornerRadius =  10
        layer.zPosition = 10
        tintColor = .black
        searchTextField.borderStyle = .roundedRect
        searchTextField.backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
        searchTextField.layer.cornerRadius = 10
        
    }
}
