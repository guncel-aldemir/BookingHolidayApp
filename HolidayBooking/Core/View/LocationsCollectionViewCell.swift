//
//  LocationsCollectionViewCell.swift
//  HolidayBooking
//
//  Created by guncel on 15.12.2023.
//

import UIKit

class LocationsCollectionViewCell: UICollectionViewCell {
    
    
    static let identifier = "locationIdentifier"
    
    fileprivate let locationImages: UIImageView = {
        let imageView = UIImageView(frame: .init(x: 0, y: 0, width: 100, height: 100))
        
        imageView.backgroundColor = UIColor.init(hex: "#eab69f")
        imageView.layer.cornerRadius = (imageView.frame.size.width) / 2
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderColor = UIColor.init(hex: "#e07a5f").cgColor
        imageView.layer.borderWidth = 1
        imageView.clipsToBounds = true
        return imageView
    }()
    
    fileprivate let locationTexts: UILabel = {
       let locationText = UILabel()
       
        locationText.font = .systemFont(ofSize: 16, weight: .bold)
        locationText.text = "deneme"
        
        locationText.textColor = UIColor(hex: "#287271")
        locationText.textAlignment = .center
        
        return locationText
    }()
    
    func locationStack(){
    
         let stackLocation = UIStackView(arrangedSubviews: [locationImages, locationTexts])
         stackLocation.axis = .vertical
         stackLocation.alignment = .center
        
         self.addSubview(stackLocation)
         
        stackLocation.anchorView(top: self.topAnchor, bottom: self.bottomAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, padding: .init(top: 20, left: 0, bottom: 20, right: 0))
        locationImages.anchorView(top: stackLocation.topAnchor, bottom: locationTexts.topAnchor, leading: nil, trailing: nil, heightConstraint: 100, widthConstarint: 100)
        locationTexts.anchorView(top: locationImages.bottomAnchor, bottom: stackLocation.bottomAnchor, leading: stackLocation.leadingAnchor, trailing: stackLocation.trailingAnchor,widthConstarint: 125)
        /*
         self.addSubview(locationImages)
         self.addSubview(locationTexts)
         
         locationTexts.translatesAutoresizingMaskIntoConstraints = false
         NSLayoutConstraint.activate([
             locationTexts.topAnchor.constraint(equalTo: self.locationImages.bottomAnchor, constant: 0),
             locationTexts.leadingAnchor.constraint(equalTo: self.locationImages.leadingAnchor, constant: 15)
         ])
         */
    
    }
    override init(frame:CGRect){
        super.init(frame: frame)
        locationStack()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
