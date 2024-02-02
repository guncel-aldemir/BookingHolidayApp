//
//  SearchViewModel.swift
//  HolidayBooking
//
//  Created by guncel on 18.12.2023.
//

import Foundation


protocol SearchViewModelInterface {
    
    
    var view:SearchControllerInterface? { get set}
    
    func viewDidLoad()

    var searchBoxKey:String? { get set}
    var searchEntryDate:String? {get set}
    var searchExitDate:String? {get set}
    
}

class SearchViewModel {
    
    weak var view: SearchControllerInterface?
    
    var searchBoxKey: String?
    
    var searchEntryDate: String?
    
    var searchExitDate: String?
}

extension SearchViewModel:SearchViewModelInterface{
   
    func viewDidLoad() {
        
        view?.setupUI()
        print("search key ==> \(searchBoxKey)")
        print("entry key ==> \(searchEntryDate)")
        print("exit key ==> \(searchExitDate)")
    }
    
    
    
    
}
