//
//  GFLabel.swift
//  HolidayBooking
//
//  Created by guncel on 1.02.2024.
//

import UIKit

final class GFTitleLabel: UILabel {
    
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
        font = .systemFont(ofSize: 25, weight: .bold)
        textColor = UIColor(hex: "264653")
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.75
        lineBreakMode = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints = false
    }
}
