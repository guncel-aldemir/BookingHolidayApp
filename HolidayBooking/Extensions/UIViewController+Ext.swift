//
//  UIViewController+Ext.swift
//  HolidayBooking
//
//  Created by guncel on 2.02.2024.
//

import UIKit

extension UIViewController {
    func presentGFAlert(title:String, message:String, buttonTitle: String){
        let alertVC = GFAlert(title: title, message: message, buttonTitle: buttonTitle)
        alertVC.modalPresentationStyle = .overFullScreen
        alertVC.modalTransitionStyle = .crossDissolve
        present(alertVC, animated: true)
        
    }
}
