//
//  GFSubtitle.swift
//  HolidayBooking
//
//  Created by guncel on 1.02.2024.
//

import UIKit

final class GFSubtitle:UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        
    }
    
    convenience init(text:String,alignment:NSTextAlignment?,color:UIColor,fontSize:CGFloat,fontWeight:UIFont.Weight){
        self.init(frame: .zero)
        self.text = text
        self.textAlignment = alignment ?? .center
        self.textColor = color
        self.font = .systemFont(ofSize: fontSize, weight: fontWeight)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    fileprivate func configure(){
   
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.75
        lineBreakMode = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints = false
    }
}
