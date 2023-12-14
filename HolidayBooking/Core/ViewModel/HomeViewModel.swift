//
//  HomeViewModel.swift
//  HolidayBooking
//
//  Created by guncel on 12.12.2023.
//

import Foundation

protocol HomeModelInterface {
    
    var view: HomeViewInterface? {get set}
    
    func viewDidLoad()

    var searchBarText: String? {get set}
    
    func searchOperation()
    
    func viewDidAppear()
}

final class HomeViewModel{
    
    weak var view: HomeViewInterface?
    
    var searchBarText: String?
}


extension HomeViewModel: HomeModelInterface{
    func viewDidAppear() {
        view?.createDate()
    }
    
    func searchOperation() {
        print("view model side \(searchBarText)")
    }
    
    func viewDidLoad() {
        view?.configureVC()
        view?.stackVC()
        print("çlaıştı")
    }
    
    
}
