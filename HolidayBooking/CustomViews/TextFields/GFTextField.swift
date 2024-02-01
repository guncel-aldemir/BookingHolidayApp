//
//  GFTextField.swift
//  HolidayBooking
//
//  Created by guncel on 1.02.2024.
//

import UIKit

final class GFTextField:UITextField{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(placeholder:String){
        self.init(frame: .zero)
        self.placeholder = placeholder
    }
    
    fileprivate func configure(){
        backgroundColor = .systemBackground
        borderStyle = .roundedRect
        layer.cornerRadius = 10
        textAlignment = .center
        translatesAutoresizingMaskIntoConstraints = false
    }
}
