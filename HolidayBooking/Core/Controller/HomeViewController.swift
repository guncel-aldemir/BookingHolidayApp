//
//  ViewController.swift
//  HolidayBooking
//
//  Created by guncel on 12.12.2023.
//

import UIKit

protocol HomeViewInterface: AnyObject{
    
    func configureVC()
    
    func stackVC()
    
     func createDate()
    
    func buttonAction()
    
}

final class HomeViewController: UIViewController {
    
    let homeScrollView = UIScrollView()
    
    var homeModel: HomeViewModel?
    
    init(viewModel:HomeViewModel){
        
        self.homeModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    // MARK: SEARCH FIELD
    fileprivate let searchBox:UISearchBar = {
        let searchText = UISearchBar()
        searchText.placeholder = "Otel veya Lokasyon girin"
        searchText.layer.cornerRadius =  10
        searchText.layer.zPosition = 10
        searchText.tintColor = .black
        
        return searchText
    }()
    // MARK: Date side
    
    
    fileprivate let dateEntryTextField: UITextField = {
        let dateText = UITextField()
        dateText.placeholder = "Giriş Tarihi"
        dateText.backgroundColor = .systemBackground
        dateText.borderStyle = .roundedRect
        dateText.layer.cornerRadius = 10
        dateText.textAlignment = .center
        return dateText
    }()
    
    fileprivate let dateExitTextField: UITextField = {
        let dateText = UITextField()
        dateText.placeholder = "Çıkış Tarihi"
        dateText.backgroundColor = .systemBackground
        dateText.borderStyle = .roundedRect
        dateText.layer.cornerRadius = 10
        dateText.textAlignment = .center
        return dateText
    }()
    
    fileprivate let searchButton: UIButton = {
        let clickButton = UIButton()
        clickButton.setTitle("Search", for: .normal)
        clickButton.backgroundColor = .systemPink
        
        clickButton.setTitleColor(.white, for: .normal)
        clickButton.addTarget(self, action:#selector(buttonAction), for: .touchUpInside)
        
        return clickButton
        
    }()
    
    fileprivate let datePickerField: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        // datePicker.addTarget(self, action: #selector(datePickerValueChanged(sender: )), for: .valueChanged)
        datePicker.preferredDatePickerStyle = .inline
        
        return datePicker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        guard let homeModel = homeModel else {
            fatalError("viewmmodel nil")
        }
        
        homeModel.view = self
        homeModel.viewDidLoad()
        searchBox.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        homeModel?.viewDidAppear()
    }
    
}


extension HomeViewController:HomeViewInterface{
    
    
    func configureVC() {
        view.backgroundColor = UIColor(hex: "#f4e7fb")
        
        view.addSubview(homeScrollView)
        homeScrollView.contentSize = CGSize(width: self.view.frame.size.width, height:  5678)
        homeScrollView.anchorView(top: self.view.topAnchor, bottom: self.view.safeAreaLayoutGuide.bottomAnchor, leading: nil, trailing: nil, widthConstarint: self.view.frame.size.width)
        homeScrollView.backgroundColor = UIColor(hex: "#f3dcdc")
    }
    
    func stackVC() {
        homeScrollView.addSubview(searchBox)
        searchBox.anchorEqualTo(top: homeScrollView.topAnchor, bottom: nil, leading: nil, trailing: nil, heightConstraint: 50, widthConstraint: homeScrollView.widthAnchor)
        
        let stackDate = UIStackView(arrangedSubviews: [dateEntryTextField, dateExitTextField])
        stackDate.axis = .horizontal
        
        stackDate.alignment = .fill
        stackDate.spacing = 5
        stackDate.distribution = .fillEqually
        homeScrollView.addSubview(stackDate)
        stackDate.anchorEqualTo(top: searchBox.bottomAnchor, bottom: nil, leading: nil, trailing: nil,padding: .init(top: 5, left: 2, bottom: 2, right: 2), heightConstraint: 60, widthConstraint: homeScrollView.widthAnchor)
        
        let buttonStack = UIStackView(arrangedSubviews: [searchButton])
        
        buttonStack.axis = .vertical
        buttonStack.distribution = .equalCentering
        buttonStack.alignment = .fill
        homeScrollView.addSubview(buttonStack)
        
        buttonStack.anchorEqualTo(top: stackDate.bottomAnchor, bottom: nil, leading: homeScrollView.leadingAnchor, trailing: homeScrollView.trailingAnchor,padding: .init(top: 20, left: 0, bottom: 5, right: 0), heightConstraint: 60, widthConstraint: homeScrollView.widthAnchor)
        
        
        print("çalıştı")
 
    }
    
    func createDate() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePicker))
        toolbar.setItems([doneBtn], animated: true)
        dateEntryTextField.inputAccessoryView = toolbar
        dateEntryTextField.inputView = datePickerField
    }
    
    @objc func donePicker(){
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.dateFormat = "dd.MM.yyyy"
        
        dateEntryTextField.text = formatter.string(from: datePickerField.date)
        
        self.view.endEditing(true)
    }
    
    
    
    @objc func buttonAction() {
        homeModel?.searchOperation()
    }
    
}

extension HomeViewController:UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count >= 3 {
            print("view controller  burası oldu \(searchText)")
            homeModel?.searchBarText = searchText
        }
    }
}
