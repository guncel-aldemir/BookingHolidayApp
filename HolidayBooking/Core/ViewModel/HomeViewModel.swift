//
//  HomeViewModel.swift
//  HolidayBooking
//
//  Created by guncel on 12.12.2023.
//


import UIKit

protocol HomeModelInterface :AnyObject{
    
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
        
        if searchBarText == nil {
            view?.showAlert(message: "Lütfen otel ya da lokayson giriniz")
        } else {
            switch(entryDateText, exitDateText){
            case (nil,nil):
                view?.showAlert(message: "Lütfen Giriş ve Çıkış Tarihini Giriniz")
            case (_,nil):
                view?.showAlert(message: "Çıkış Tarihi Girmediniz")
            case (nil,_):
                view?.showAlert(message: "Giriş Tarihi Girmediniz")
            default:
                break
            }
        }
        print("SearchBarText: \(searchBarText)")
        print("EntryDateText: \(entryDateText)")
        print("ExitDateText: \(exitDateText)")
        print("view model side \(searchBarText)")
        
        
    }
    
    
    func viewDidLoad() {
        view?.scrollViewConstraint()
        view?.searchFieldsConstraints()
        view?.configureLocationView()
        view?.configureSuggestionView()
        print("çlaıştı")
    }
    
    
}
