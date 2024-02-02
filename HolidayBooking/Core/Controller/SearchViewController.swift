//
//  SearchViewController.swift
//  HolidayBooking
//
//  Created by guncel on 18.12.2023.
//

import UIKit


protocol SearchControllerInterface : AnyObject {
    
    func setupUI()
   
}
class SearchViewController: UIViewController {
    var searchText :String = ""
    var entryDateText:String = ""
    var exitDateText:String = ""
    
    var searchModel: SearchViewModel?
    
    init(viewModel:SearchViewModel,searchText:String,entryDate:String, exitDate:String){
        super.init(nibName: nil, bundle: nil)
        self.searchModel = viewModel
        self.searchText = searchText
        self.entryDateText = entryDate
        self.exitDateText = exitDate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let searchModel = searchModel else {
            return
        }
        searchModel.view = self
        searchModel.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    

}

extension SearchViewController: SearchControllerInterface{
    
    func setupUI() {
        view.backgroundColor = .purple
        searchModel?.searchBoxKey = searchText
        searchModel?.searchEntryDate = entryDateText
        searchModel?.searchExitDate = exitDateText
    }
    
    
}
