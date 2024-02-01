//
//  SuggestionHotelsCollectionViewCell.swift
//  HolidayBooking
//
//  Created by guncel on 16.12.2023.
//

import UIKit

class SuggestionHotelsCollectionViewCell: UICollectionViewCell {
    
    
    static let identifier = "suggestion cell identifier"
    
    let suggestionHotelCoverImages = GFImageView(frame: .zero)
   
    let suggestionHotelTitleLabels = GFSubtitle(text: "Hotel Başlığı", alignment: .center, color: UIColor.init(hex: "3d405b"), fontSize: 18, fontWeight: .bold)
    
    let suggestionHotelLocationLabels = GFSubtitle(text: "📍Kemer/Antalya", alignment: .center, color: UIColor.init(hex: "3d5872"), fontSize: 15, fontWeight: .bold)
    
    
    func suggestionHotelContraints(){
        
        self.addSubview(suggestionHotelCoverImages)
        NSLayoutConstraint.activate([
            suggestionHotelCoverImages.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            suggestionHotelCoverImages.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            suggestionHotelCoverImages.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            suggestionHotelCoverImages.heightAnchor.constraint(equalToConstant: 320)
        ])
        
        
        self.addSubview(suggestionHotelTitleLabels)
        
        let stack = UIStackView(arrangedSubviews: [suggestionHotelTitleLabels, suggestionHotelLocationLabels])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .leading
        stack.spacing = 3
      
        self.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: suggestionHotelCoverImages.bottomAnchor, constant: 5),
            stack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            stack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            stack.heightAnchor.constraint(equalToConstant: 60)
        ])
      
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
