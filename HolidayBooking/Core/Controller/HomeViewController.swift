//
//  ViewController.swift
//  HolidayBooking
//
//  Created by guncel on 12.12.2023.
//

import UIKit

protocol HomeViewInterface: AnyObject{
    
    func scrollViewConstraint()
    
    func searchFieldsConstraints()
    
    func createEntryDate()
    
    func createExitDate()
    
    func searchButtonAction()
    
    func configureLocationView()
    
    func configureSuggestionView()
    
    func showAlert(message:String)
    
   
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
        searchText.searchTextField.backgroundColor = .clear
        searchText.searchTextField.anchorEqualTo(top: searchText.topAnchor, bottom: nil, leading: nil, trailing: nil,padding: .init(top: 0, left: 0, bottom: 0, right: 0), heightConstraint: 100, widthConstraint: searchText.widthAnchor)
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
    
    fileprivate lazy var datePickerEntryField: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        
        datePicker.preferredDatePickerStyle = .inline
        datePicker.minimumDate = Date()
        return datePicker
    }()
    
    fileprivate lazy var datePickerExitField: UIDatePicker = {
        let dateExitPicker = UIDatePicker()
        dateExitPicker.datePickerMode = .date
        
        dateExitPicker.preferredDatePickerStyle = .inline
       
        return dateExitPicker
    }()
    // MARK: - Search Button
    
    fileprivate let searchButton: UIButton = {
        let clickButton = UIButton()
        clickButton.setTitle("Search", for: .normal)
        clickButton.backgroundColor = UIColor(hex: "#e07a5f")
        
        clickButton.setTitleColor(.white, for: .normal)
        clickButton.addTarget(self, action:#selector(searchButtonAction), for: .touchUpInside)
       
        return clickButton
        
    }()
    
    // MARK: - LOCATION HEAD
    
    fileprivate let locationTitle: UILabel = {
       let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 25, weight: .bold)
        titleLabel.textColor = UIColor(hex: "264653")
        titleLabel.text = "Sık Gidilen Lokasyonlar"
        titleLabel.numberOfLines = 0
        titleLabel.text?.localizedUppercase
        return titleLabel
    }()
    
    // MARK: - SUGGESTION HEAD
    
    fileprivate let suggestionTitle: UILabel = {
       let suggestionLabel = UILabel()
        suggestionLabel.font = .systemFont(ofSize: 25, weight: .bold)
        suggestionLabel.textColor = UIColor(hex: "264653")
        suggestionLabel.text = "Öne Çıkan Oteller"
        suggestionLabel.numberOfLines = 0
        suggestionLabel.text?.localizedUppercase
        return suggestionLabel
    }()
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
 
    
    
    
    //MARK: - ScrollView constraint
    func scrollViewConstraint() {
        
        view.backgroundColor = UIColor(hex: "#e9e3d5")
        
        view.addSubview(homeScrollView)
        homeScrollView.showsVerticalScrollIndicator = true
        
        homeScrollView.contentSize = CGSize(width: self.view.frame.size.width, height: 1000)
        homeScrollView.anchorView(top: self.view.topAnchor, bottom: self.view.bottomAnchor, leading: nil, trailing: nil, widthConstarint: self.view.frame.size.width)
        homeScrollView.backgroundColor = UIColor(hex: "#e9e3d5")
    }
    
    // MARK: - Search Textfields constraints
    func searchFieldsConstraints() {
        homeScrollView.addSubview(searchBox)
        searchBox.anchorEqualTo(top: homeScrollView.topAnchor, bottom: nil, leading: nil, trailing: nil,padding: .init(top: 20, left: 0, bottom: 0, right: 0), heightConstraint: 100, widthConstraint: homeScrollView.widthAnchor)
        
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
        
        buttonStack.anchorEqualTo(top: stackDate.bottomAnchor, bottom: nil, leading: homeScrollView.leadingAnchor, trailing: nil,padding: .init(top: 20, left: 0, bottom: 5, right: 0), heightConstraint: 60, widthConstraint: homeScrollView.widthAnchor)
        
        homeScrollView.addSubview(locationTitle)
        locationTitle.anchorEqualTo(top: searchButton.bottomAnchor, bottom: nil, leading: homeScrollView.leadingAnchor, trailing: nil,padding: .init(top: 25, left: 10, bottom: 0, right: 0), heightConstraint: 50, widthConstraint: homeScrollView.widthAnchor)
        
        print("çalıştı")
        
        
        
    }
    // MARK: - CollectionView constraints
    func configureLocationView() {
        collectionViewLocation.dataSource = self
        collectionViewLocation.delegate = self
        homeScrollView.addSubview(collectionViewLocation)
        
        collectionViewLocation.anchorEqualTo(top: locationTitle.bottomAnchor, bottom: nil, leading: nil, trailing: nil,padding: .init(top: 20, left: 0, bottom: 0, right: 0), heightConstraint: 160, widthConstraint: homeScrollView.widthAnchor)

        
    }
    
    func configureSuggestionView(){
        collectionViewSuggestion.dataSource = self
        collectionViewSuggestion.delegate = self
       
        homeScrollView.addSubview(collectionViewSuggestion)
        
        collectionViewSuggestion.anchorEqualTo(top: collectionViewLocation.bottomAnchor, bottom: nil, leading: homeScrollView.leadingAnchor, trailing: self.view.trailingAnchor,padding: .init(top: 10, left: 2, bottom: 0, right: 0), heightConstraint: 450, widthConstraint: self.view.widthAnchor)
        
        homeScrollView.addSubview(suggestionTitle)
        suggestionTitle.anchorEqualTo(top: collectionViewLocation.bottomAnchor, bottom: nil, leading: homeScrollView.leadingAnchor, trailing: nil,padding: .init(top: 25, left: 10, bottom: 0, right: 0), heightConstraint: 50, widthConstraint: homeScrollView.widthAnchor)
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
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Uyarı", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Tamam", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
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
            return CGSize(width: self.view.frame.size.width, height: 300)
        }
    }
}
