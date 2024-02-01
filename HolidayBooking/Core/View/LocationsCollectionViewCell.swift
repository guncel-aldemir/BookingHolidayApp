//
//  LocationsCollectionViewCell.swift
//  HolidayBooking
//
//  Created by guncel on 15.12.2023.
//

import UIKit

class LocationsCollectionViewCell: UICollectionViewCell {
    
    
    static let identifier = "locationIdentifier"
    
    let locationNames: [String] = ["Kemer","Manavgat","Belek","Alanya","Kaş"]

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
    let locationTexts = GFSubtitle(text: "deneme", alignment: .center, color: UIColor.init(hex: "287271"), fontSize: 16, fontWeight: .bold)
    func configure(withIndex index: Int){
        locationTexts.text = locationNames[index]
    }
    
    func locationStack(){
    
         let stackLocation = UIStackView(arrangedSubviews: [locationImages, locationTexts])
        stackLocation.axis = .vertical
        stackLocation.alignment = .center
        
         self.addSubview(stackLocation)
        stackLocation.translatesAutoresizingMaskIntoConstraints = false
        locationImages.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
            stackLocation.topAnchor.constraint(equalTo: self.topAnchor,constant: 20),
            stackLocation.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: 20),
            stackLocation.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 5),
            stackLocation.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            
            locationImages.heightAnchor.constraint(equalToConstant: 100),
            locationImages.widthAnchor.constraint(equalToConstant: 100),
            
        ])
        
//      locationImages.anchorView(top: stackLocation.topAnchor, bottom: locationTexts.topAnchor, leading: nil, trailing: nil, heightConstraint: 100, widthConstarint: 100)
//        locationTexts.anchorView(top: locationImages.bottomAnchor, bottom: stackLocation.bottomAnchor, leading: stackLocation.leadingAnchor, trailing: stackLocation.trailingAnchor,widthConstarint: 125)

    }
    override init(frame:CGRect){
        super.init(frame: frame)
        locationStack()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
