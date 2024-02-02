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
    
    var searchVC : UIViewController?
 
}


extension HomeViewModel: HomeModelInterface{

    func viewDidAppear() {
        
        view?.createEntryDate()
        view?.createExitDate()
        
        
    }
    
    func searchOperation() {
       
        if let searchBarText = searchBarText{
            if searchBarText.count >= 3 {
                
                switch(entryDateText, exitDateText){
                case (nil,nil):
                    view?.showAlert(title: "Tarih Seçimi Hatalı", message: "Lütfen Giriş ve Çıkış Tarihini Giriniz", buttonTitle: "Ok")
                case (nil,_):
                    view?.showAlert(title: "Tarih Seçimi Hatalı", message: "Lütfen Giriş Tarihini Giriniz", buttonTitle: "Ok")
                case (_,nil):
                    view?.showAlert(title: "Tarih Seçimi Hatalı", message: "Lütfen Çıkış Tarihini Giriniz", buttonTitle: "Ok")

                default:
                    
                    view?.navigateSearchVC()
                }
                
            }else {
                view?.showAlert(title: "Arama Yapmadınız", message: "Lütfen otel ya da lokasyon giriniz", buttonTitle: "Ok")
            }
            
        }
  
        
    }
    
    
    func viewDidLoad() {
//        view?.configureScrollView()
//        view?.configureAll()
//        view?.configureLocationView()
//        view?.configureSuggestionView()
       // view?.createDismissKeyboardTapGesture()
        
        print("çlaıştı")
    }
    
    
}
