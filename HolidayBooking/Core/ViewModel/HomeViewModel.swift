//
//  HomeViewModel.swift
//  HolidayBooking
//
//  Created by guncel on 12.12.2023.
//


import UIKit

protocol HomeModelInterface:AnyObject{
    
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
            view?.showAlert(title: "Arama Yapmadınız", message: "Lütfen otel ya da lokasyon giriniz", buttonTitle: "Ok")
        } else {
            switch(entryDateText, exitDateText){
            case (nil,nil):
                view?.showAlert(title: "Tarih Seçimi Hatalı", message: "Lütfen Giriş ve Çıkış Tarihini Giriniz", buttonTitle: "Ok")
                
            case (_,nil):
                view?.showAlert(title: "Tarih Seçimi Hatalı", message: "Lütfen Çıkış Tarihini Giriniz", buttonTitle: "Ok")
                
            case (nil,_):
                view?.showAlert(title: "Tarih Seçimi Hatalı", message: "Lütfen Giriş Tarihini Giriniz", buttonTitle: "Ok")
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
        view?.configureScrollView()
        view?.configureAll()
        view?.configureLocationView()
        view?.configureSuggestionView()
        print("çlaıştı")
    }
    
    
}
