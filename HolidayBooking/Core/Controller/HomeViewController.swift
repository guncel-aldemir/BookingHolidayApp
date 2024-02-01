//
//  ViewController.swift
//  HolidayBooking
//
//  Created by guncel on 12.12.2023.
//

import UIKit

protocol HomeViewInterface: AnyObject{
    func configureScrollView()
    func configureAll()
    func createEntryDate()
    func createExitDate()
    func searchButtonAction()
    func configureLocationView()
    func configureSuggestionView()
    func showAlert(title:String,message:String,buttonTitle:String)
}

final class HomeViewController: UIViewController {
    let homeScrollView = UIScrollView()
    var homeModel: HomeViewModel?
    
    init(viewModel:HomeViewModel){
        super.init(nibName: nil, bundle: nil)
        self.homeModel = viewModel
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: SEARCH FIELD
    let searchBox = GFSearchBar()
    // MARK: Date side
    let dateEntryTextField = GFTextField(placeholder: "Giriş Tarihi")
    let dateExitTextField = GFTextField(placeholder: "Çıkış Tarihi")
    lazy var datePickerEntryField = GFDatePicker(minimumDate: Date())
    lazy var datePickerExitField = GFDatePicker()
    // MARK: - Search Button
    let searchButton = GFButton(backgroundColor: UIColor(hex: "#e07a5f"), titleColor: .white, title: "Search")
//        clickButton

    // MARK: - LOCATION HEAD
    let locationTitle = GFTitleLabel(text: "Sık Gidilen Lokasyonlar")

    // MARK: - SUGGESTION HEAD
    let suggestionTitle = GFTitleLabel(text: "Öne Çıkan Oteller")
    
    var stackDate = UIStackView()
    // MARK: - COLLECTION VIEW SIDE

    fileprivate let collectionViewLocation: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(LocationsCollectionViewCell.self, forCellWithReuseIdentifier: LocationsCollectionViewCell.identifier)
        collectionView.backgroundColor = nil
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
        
    }()

    // MARK: - SUGGESTION COLLECTION VIEW SIDE
    
    fileprivate let collectionViewSuggestion: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(SuggestionHotelsCollectionViewCell.self, forCellWithReuseIdentifier: SuggestionHotelsCollectionViewCell.identifier)
        collectionView.backgroundColor = nil
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
        
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
   
 
    func configureAll() {
        view.backgroundColor = UIColor(hex: "#e9e3d5")
        configureScrollView()
        configureSearchBar()
        configureSearchBar()
        configureDateField()
        configureSearchButton()
        configureLabel()
        print("çalıştı")
    }
    
    
    //MARK: - ScrollView constraint
    func configureScrollView() {
        view.addSubview(homeScrollView)
        homeScrollView.showsVerticalScrollIndicator = true
        homeScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            homeScrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            homeScrollView.widthAnchor.constraint(equalToConstant: self.view.frame.size.width),
            homeScrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
      homeScrollView.contentSize = CGSize(width: self.view.frame.size.width, height: 1000)
        
        homeScrollView.backgroundColor = UIColor(hex: "#e9e3d5")
    }
    
    // MARK: - Search Textfields constraints
    func configureSearchBar(){
        homeScrollView.addSubview(searchBox)
        
        let padding:CGFloat = 8
        NSLayoutConstraint.activate([
            searchBox.topAnchor.constraint(equalTo: homeScrollView.topAnchor),
            searchBox.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            searchBox.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            searchBox.heightAnchor.constraint(equalToConstant: 70),
        ])

    }
    func configureDateField(){
        stackDate = UIStackView(arrangedSubviews: [dateEntryTextField, dateExitTextField])
        stackDate.axis = .horizontal
        stackDate.alignment = .fill
        stackDate.spacing = 5
        stackDate.distribution = .fillEqually
        homeScrollView.addSubview(stackDate)
        stackDate.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackDate.topAnchor.constraint(equalTo: searchBox.bottomAnchor, constant: 5),
            stackDate.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            stackDate.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            stackDate.heightAnchor.constraint(equalToConstant: 60)
        ])

        
    }
    func configureSearchButton(){
        searchButton.addTarget(self, action:#selector(searchButtonAction), for: .touchUpInside)
       
        homeScrollView.addSubview(searchButton)
        NSLayoutConstraint.activate([
            searchButton.topAnchor.constraint(equalTo: stackDate.bottomAnchor, constant: 20),
            searchButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            searchButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 90),
            searchButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -90),
            searchButton.heightAnchor.constraint(equalToConstant: 60)
        ])
       
        
    }
    func configureLabel(){
        homeScrollView.addSubview(locationTitle)
        
        NSLayoutConstraint.activate([
            locationTitle.topAnchor.constraint(equalTo: searchButton.bottomAnchor, constant: 10),
            locationTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            locationTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            locationTitle.heightAnchor.constraint(equalToConstant: 40)
        ])
       
        
    }
  
    // MARK: - CollectionView constraints
    func configureLocationView() {
        collectionViewLocation.dataSource = self
        collectionViewLocation.delegate = self
        homeScrollView.addSubview(collectionViewLocation)
        
        collectionViewLocation.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionViewLocation.topAnchor.constraint(equalTo: locationTitle.bottomAnchor),
            collectionViewLocation.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 3),
            collectionViewLocation.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -3),
            collectionViewLocation.heightAnchor.constraint(equalToConstant: 160)
        ])
    }
    
    func configureSuggestionView(){
        collectionViewSuggestion.dataSource = self
        collectionViewSuggestion.delegate = self
       
        homeScrollView.addSubview(collectionViewSuggestion)
        homeScrollView.addSubview(suggestionTitle)
        suggestionTitle.translatesAutoresizingMaskIntoConstraints = false
        collectionViewSuggestion.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            suggestionTitle.topAnchor.constraint(equalTo: collectionViewLocation.bottomAnchor, constant: 20),
            suggestionTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            suggestionTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            suggestionTitle.heightAnchor.constraint(equalToConstant: 40),
            
            collectionViewSuggestion.topAnchor.constraint(equalTo: suggestionTitle.bottomAnchor, constant: 20),
            collectionViewSuggestion.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 4),
            collectionViewSuggestion.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -4),
            collectionViewSuggestion.heightAnchor.constraint(equalToConstant: 450)
        ])

        
    }

    // MARK: - Search Button Action Side
    @objc func searchButtonAction() {
        
        guard let homeModel = homeModel else {
            print("ERROR: homeModel is Nil")
            return
        }

        if let searchText = searchBox.text{
            if searchText.count >= 3 {
                homeModel.searchBarText = searchText
            }
        }
        homeModel.searchOperation()
    }
    
    // MARK: - Create Entry and Exit Date Side
    func createEntryDate() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneEntryPicker))
        toolbar.setItems([doneBtn], animated: true)
        
        dateEntryTextField.inputAccessoryView = toolbar
        dateEntryTextField.inputView = datePickerEntryField
        
    }
    
    @objc func doneEntryPicker(){
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.dateFormat = "dd.MM.yyyy"
        datePickerExitField.minimumDate = datePickerEntryField.date
        dateEntryTextField.text = formatter.string(from: datePickerEntryField.date)
        
        
        homeModel?.entryDateText = dateEntryTextField.text
        self.view.endEditing(true)
    }
    
    func createExitDate(){
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneBTN = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneExitPicker))
        toolBar.setItems([doneBTN], animated: true)
        
        dateExitTextField.inputAccessoryView = toolBar
        dateExitTextField.inputView = datePickerExitField
        
    }
    
    @objc func doneExitPicker(){
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.dateFormat = "dd.MM.yyyy"
        
        dateExitTextField.text = formatter.string(from: datePickerExitField.date)
        homeModel?.exitDateText = dateExitTextField.text
        self.view.endEditing(true)
    }
    
    func showAlert(title: String, message: String, buttonTitle: String){
        presentGFAlert(title: title, message: message, buttonTitle: buttonTitle)
//        let alert = UIAlertController(title: "Uyarı", message: message, preferredStyle: .alert)
//        let okAction = UIAlertAction(title: "Tamam", style: .default, handler: nil)
//        alert.addAction(okAction)
//        present(alert, animated: true, completion: nil)
   
    }
}

// MARK: - SEARCHBAR DELEGATE EXTENSION
extension HomeViewController:UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
}

// MARK: - COLLECTIONVIEW DELEGATE, DATASOURCE and COLLECTIONVIEWDELEGATEFLOWLAYOUT  EXTENSION
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionViewLocation {
            return 5
        } else {
            return 4
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionViewLocation{
            let cellA = collectionViewLocation.dequeueReusableCell(withReuseIdentifier: LocationsCollectionViewCell.identifier, for: indexPath) as! LocationsCollectionViewCell
            cellA.configure(withIndex: indexPath.item)
            return cellA
        } else {
            let cellB = collectionViewSuggestion.dequeueReusableCell(withReuseIdentifier: SuggestionHotelsCollectionViewCell.identifier, for: indexPath)
            return cellB
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.collectionViewLocation {
            let serchViewModel = SearchViewModel()
            
            let searchViewController =  SearchViewController(viewModel:serchViewModel)

            navigationController?.pushViewController(searchViewController, animated: true)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collectionViewLocation {
            return CGSize(width: (self.view.frame.size.width) / 3, height: 150)
        }
        else {
            return CGSize(width: (self.view.frame.size.width) - 11, height: 450)
        }
    }
}
