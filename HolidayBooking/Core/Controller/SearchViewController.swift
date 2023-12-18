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

    var searchModel: SearchViewModel?
    
    init(viewModel:SearchViewModel){
        self.searchModel = viewModel
        super.init(nibName: nil, bundle: nil)
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
    }
}
