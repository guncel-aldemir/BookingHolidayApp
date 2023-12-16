//
//  HomeViewModel.swift
//  HolidayBooking
//
//  Created by guncel on 12.12.2023.
//


import UIKit

protocol HomeModelInterface {
    
    var view: HomeViewInterface? {get set}
    
    func viewDidLoad()

    var searchBarText: String? {get set}
    
    var entryDateText:String? {get set}
    
    var exitDateText:String? {get set}
    
    func searchOperation()
    
    func viewDidAppear()
}

final class HomeViewModel{
    
    weak var view: HomeViewInterface?
    
    var searchBarText: String?
    
    var entryDateText: String?
    
    var exitDateText: String?
}


extension HomeViewModel: HomeModelInterface{
    func viewDidAppear() {
        
        view?.createEntryDate()
        view?.createExitDate()
            
        
        
    }
    
    func searchOperation() {
        print("view model side \(searchBarText)")
        print("view model side \(entryDateText) - \(exitDateText)")
    }
    func viewDidLoad() {
        view?.scrollViewConstraint()
        view?.searchFieldsConstraints()
        view?.configureLocationView()
        view?.configureSuggestionView()
        print("çlaıştı")
    }
    
    
}
