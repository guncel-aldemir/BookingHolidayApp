//
//  SuggestionHotelsCollectionViewCell.swift
//  HolidayBooking
//
//  Created by guncel on 16.12.2023.
//

import UIKit

class SuggestionHotelsCollectionViewCell: UICollectionViewCell {
    
    
    static let identifier = "suggestion cell identifier"
    
    
    fileprivate let suggestionHotelCoverImages: UIImageView = {
       let hotelCoverImage = UIImageView()
        
        hotelCoverImage.layer.backgroundColor = UIColor(hex: "#81b29a").cgColor
        hotelCoverImage.contentMode = .scaleAspectFit
        hotelCoverImage.layer.cornerRadius = 10
        hotelCoverImage.clipsToBounds = true
        return hotelCoverImage
    }()
    
    fileprivate let suggestionHotelTitleLabels:UILabel = {
       
        let hotelTitle = UILabel()
        hotelTitle.text = "Hotel Başlığı"
        hotelTitle.textColor = UIColor(hex: "3d405b")
        hotelTitle.font = .systemFont(ofSize: 18, weight: .bold)
        
        return hotelTitle
    }()
    
    fileprivate let suggestionHotelLocationLabels:UILabel = {
       
        let hotelLocation = UILabel()
        hotelLocation.text = "📍Kemer/Antalya"
        hotelLocation.textColor = UIColor(hex: "3d5872")
        hotelLocation.font = .systemFont(ofSize: 15, weight: .bold)
        
        return hotelLocation
    }()
    
    
    func suggestionHotelContraints(){
        
        self.addSubview(suggestionHotelCoverImages)
        
        suggestionHotelCoverImages.anchorEqualTo(top: self.topAnchor, bottom: nil, leading: self.leadingAnchor, trailing: self.trailingAnchor,padding: .init(top: 0, left: 0, bottom: 0, right: 0) ,heightConstraint: 300, widthConstraint: self.widthAnchor)
        
        self.addSubview(suggestionHotelTitleLabels)
        
        let stack = UIStackView(arrangedSubviews: [suggestionHotelTitleLabels, suggestionHotelLocationLabels])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .leading
        stack.spacing = 5
      
        self.addSubview(stack)
        stack.anchorEqualTo(top: suggestionHotelCoverImages.bottomAnchor, bottom: nil, leading: self.leadingAnchor, trailing: nil, padding: .init(top: 0, left: 5, bottom: 0, right: 0), heightConstraint: 60, widthConstraint: self.widthAnchor)
        /*
         suggestionHotelLocationLabels.anchorEqualTo(top: suggestionHotelTitleLabels.bottomAnchor, bottom: nil, leading: self.leadingAnchor, trailing: nil, heightConstraint: 20, widthConstraint: self.widthAnchor)
         */
        
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        suggestionHotelContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
