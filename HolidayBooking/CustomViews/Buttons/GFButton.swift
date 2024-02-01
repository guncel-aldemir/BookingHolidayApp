//
//  GFButton.swift
//  HolidayBooking
//
//  Created by guncel on 1.02.2024.
//

import UIKit


final class GFButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(backgroundColor:UIColor,titleColor:UIColor,title:String){
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitleColor(titleColor, for: .normal)
        self.setTitle(title, for: .normal)
    }
    fileprivate func configure(){
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
    }
}
