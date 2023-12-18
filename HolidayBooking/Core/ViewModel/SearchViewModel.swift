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
       // print("search key ==> \(searchBoxKey)")
        view?.setupUI()
        print("burası searchDetails ====> \(self.searchBoxKey), giriş : \(self.searchEntryDate), çıkış: \(self.searchExitDate)")
    }
    
    
    
    
}
