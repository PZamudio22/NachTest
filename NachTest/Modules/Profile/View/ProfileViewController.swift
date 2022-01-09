//
//  ProfileViewController.swift
//  NachTest
//
//  Created by Kevin Uriel Velazquez Zamudio on 08/01/22.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class ProfileViewController: UIViewController, ProfileViewProtocol {
    
// MARK: PROTOCOL VAR -
    var presenter: ProfilePresenterProtocol?

// MARK: LOCAL VAR -
    var referenceDB: DatabaseReference!
    
// MARK: @IBOUTLETS -
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var segmentLine: UIView!
    @IBOutlet weak var postTable: UITableView!
    @IBOutlet weak var heightPostTable: NSLayoutConstraint!
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPlace: UILabel!
    @IBOutlet weak var lblCount21: UILabel!
    @IBOutlet weak var lblPublic: UILabel!
    @IBOutlet weak var lblCountsFollowers: UILabel!
    @IBOutlet weak var lblFollowers: UILabel!
    @IBOutlet weak var lblCountFollowing: UILabel!
    @IBOutlet weak var lblFollowing: UILabel!
    @IBOutlet weak var btnLogout: UIButton!
    
// MARK: LOCAL VAR -
    var dummyDataPosted = [PostsData]()
    var dummyDataLiked = [PostsData]()
    var dummyData = [PostsData]()
    
// MARK: LIFE CYCLE VIEW FUNCTIONS -
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        referenceDB = Database.database().reference()
        segmentControl.addUnderlineForSelectedSegment()
        setupDummyData()
        setupTable()

    }
    
// MARK: SETUP FUNCTIONS -
    private func setupTable() {
        postTable.register(UINib(nibName: "PostsTableViewCell", bundle: .main), forCellReuseIdentifier: "POSTCELL")
        postTable.delegate = self
        postTable.dataSource = self
    }
    
    private func setupDummyData() {
        let itemPost1 = PostsData(userName: "Jax Teller Morrow", country: "Charming", postText: "What is the loop of creation? How is there something from nothing? ", imgName: "jax", price: "$500")
        let itemLiked1 = PostsData(userName: "Opie Jones", country: "Charming", postText: "I am lokking for something new", imgName: "opie", price: "$400")
        let itemLiked2 = PostsData(userName: "Gema Teller", country: "Chraming", postText: "There is awsome event happening lets join it guys", imgName: "gema", price: "$600")
        dummyDataPosted.append(itemPost1)
        dummyDataLiked.append(itemLiked1)
        dummyDataLiked.append(itemLiked2)
        dummyData = dummyDataPosted
    }
    
    private func setupUI() {
        imgUser.circleImage()
    }
    
    private func showAlert(titleAlert: String, messagge: String) {
        let alert = UIAlertController(title: titleAlert, message: messagge, preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "Cancelar", style: .destructive) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(cancel)
        
        let accept = UIAlertAction(title: "Aceptar", style: .default) { (action2) in
            self.Logout()
        }
        alert.addAction(accept)
        present(alert, animated: true, completion: nil)
    
    }
// MARK: @IBACTIONS -
    @IBAction func changeSegment(_ sender: Any) {
        segmentControl.changeUnderlinePosition()
        
        switch segmentControl.selectedSegmentIndex {
        case 0:
            dummyData = dummyDataPosted
            postTable.reloadData()
            
        default:
            dummyData = dummyDataLiked
            postTable.reloadData()
        }
        
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        showAlert(titleAlert: "Atención", messagge: "Estas seguro que quieres cerrar sesión")
    }
    
// MARK: AUTH FUNCTIONS -
    func Logout() {
        try! Auth.auth().signOut()
        self.navigationController?.popToRootViewController(animated: true)
       
    }

}
