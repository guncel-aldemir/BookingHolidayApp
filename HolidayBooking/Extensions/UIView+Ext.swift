//
//  UIView+Ext.swift
//  HolidayBooking
//
//  Created by guncel on 14.12.2023.
//


import UIKit


extension UIView {
    public func anchorView(top:NSLayoutYAxisAnchor?, bottom:NSLayoutYAxisAnchor?, leading:NSLayoutXAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding:UIEdgeInsets = .zero, heightConstraint:CGFloat? = nil, widthConstarint:CGFloat? = nil){
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: padding.bottom).isActive = true
        }
        
        if let leading = leading {
            self.leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let trailing = trailing {
            self.trailingAnchor.constraint(equalTo: trailing, constant: padding.right).isActive = true
        }
        
        if let heightConstraint = heightConstraint {
            self.heightAnchor.constraint(equalToConstant: heightConstraint).isActive = true
        }
        if let widthConstarint = widthConstarint {
            self.widthAnchor.constraint(equalToConstant: widthConstarint).isActive  = true
        }
        
    }
   
    public func anchorEqualTo(top:NSLayoutYAxisAnchor?, bottom:NSLayoutYAxisAnchor?, leading:NSLayoutXAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding:UIEdgeInsets = .zero,heightConstraint:CGFloat?, widthConstraint:NSLayoutDimension?){
         self.translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: padding.bottom).isActive = true
        }
        
        if let leading = leading {
            self.leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let trailing = trailing {
            self.trailingAnchor.constraint(equalTo: trailing, constant: padding.right).isActive = true
        }
         if let heightConstraint = heightConstraint {
             self.heightAnchor.constraint(equalToConstant: heightConstraint).isActive = true
         }
         if let widthConstraint = widthConstraint {
             self.widthAnchor.constraint(equalTo: widthConstraint).isActive = true
         }
     }
    
    
}
