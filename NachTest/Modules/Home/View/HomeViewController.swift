//
//  HomeViewController.swift
//  NachTest
//
//  Created by Kevin Uriel Velazquez Zamudio on 07/01/22.
//

import UIKit

class HomeViewController: UIViewController, HomeViewProtocol {
    
    // MARK: @IBOUTLETS -
        @IBOutlet weak var mainTable: UITableView!
    @IBOutlet weak var navView: UIView!
    @IBOutlet weak var lblCategories: UILabel!
    @IBOutlet weak var lblDirection: UILabel!
    @IBOutlet weak var btnSearch: UIButton!
    
// MARK: PROTOCOL VAR -
    var presenter: HomePresenterProtocol?
    
// MARK: LOCAL VAR -
    var arrayData = ["dvasvsadsdv", "adkvasvñadlsnvadsjvnasdvlñnadsjkasdnsadkjvñasdlvasndñvlknkñaldsvnasdvklasñdnalksdvnasdklvnasdkvlnsdvklasñdnvñdsaklvdasvkldasnkadsvndsaklvnadskvakdvldsnvldksv", "dvaskvjasndvña", "dajvnasvasndvasdjvnaspvddasvnkadnfakdsnarkjgasjvkajkfsnasdkjasndvjkasdvakjsdvajksdnvajskgnaukjbasdjkgbwkhjfbgqiuwrgbiùasdvqworu`nqiurwpnvquifnweuivnnfadsjknasñvansdvjkadsnfjkanasfjdksjajsdnkfnadsjkfnasdjkfnadsfkjdsnfkjdasnfajsdkfnakjsdfajsdf"]
    var arrayDummyData = [HomeData]()
    
// MARK: LIFE CYCLE VIEW FUNCTIONS -
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHomeData()
        setupTableView()
        
    }

// MARK: SETUP FUNCTIONS -
    private func setupTableView() {
        mainTable.register(UINib(nibName: "HomeTableViewCell", bundle: .main), forCellReuseIdentifier: "HCELL")
        mainTable.delegate = self
        mainTable.dataSource = self
    }
    
    private func setupHomeData() {
        let item1 = HomeData(userName: "Jax Teller Morrow", country: "Charming", postText: "What is the loop of creation? How is there something from nothing? ", imgName: "jax", price: "$500")
        let item2 = HomeData(userName: "Opie Jones", country: "Charming", postText: "I am lokking for something new", imgName: "opie", price: "$400")
        let item3 = HomeData(userName: "Gema Teller", country: "Chraming", postText: "There is awsome event happening lets join it guys", imgName: "gema", price: "$600")
        let item4 = HomeData(userName: "Clay Morrow", country: "Charming", postText: "This is a large post to test a multiline text and see the auto resizing of table view cell", imgName: "clay", price: "$250")
        arrayDummyData.append(item1)
        arrayDummyData.append(item2)
        arrayDummyData.append(item3)
        arrayDummyData.append(item4)
    }

}
