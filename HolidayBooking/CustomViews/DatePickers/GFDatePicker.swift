//
//  GFDatePicker.swift
//  HolidayBooking
//
//  Created by guncel on 1.02.2024.
//

import UIKit

final class GFDatePicker: UIDatePicker {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        
    }
    
    convenience init(minimumDate:Date?) {
        self.init(frame: .zero)
        self.minimumDate = minimumDate
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func configure(){
        datePickerMode = .date
        preferredDatePickerStyle = .inline
        translatesAutoresizingMaskIntoConstraints = false
    }
}
