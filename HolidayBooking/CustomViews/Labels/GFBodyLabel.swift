//
//  GFBodyLabel.swift
//  HolidayBooking
//
//  Created by guncel on 2.02.2024.
//


import UIKit

final class GFBodyLabel:UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        
    }
    
    convenience init(text:String){
        self.init(frame: .zero)
        self.text = text
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    fileprivate func configure(){
        font = .systemFont(ofSize: 16, weight: .bold)
        textColor = .secondaryLabel
        adjustsFontSizeToFitWidth = true
        adjustsFontForContentSizeCategory = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
       
    }
}
