//
//  NotificationsViewController.swift
//  NachTest
//
//  Created by Pablo Luis Velazquez Zamudio on 08/01/22.
//

import UIKit

class NotificationsViewController: UIViewController, NotificationsViewProtocol {
    
// MARK: PROTOCOL VAR -
    var presenter: NotificationsPresenterProtocol?
    
// MARK: LOCAL VAR -
    var arrayDummyData = [NotificationsData]()
    
// MARK: @IBOUTLETS -
    @IBOutlet weak var mainTable: UITableView!
    @IBOutlet weak var navView: UIView!
    @IBOutlet weak var lblNotifications: UILabel!
    
    
// MARK: LIFE CYCLE VIEW FUNCTIONS -
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupTable()

    }
    
// MARK: SETUP FUNCTIONS -
    private func setupTable() {
        mainTable.register(UINib(nibName: "NotificationsTableViewCell", bundle: .main), forCellReuseIdentifier: "NOTIFICELL")
        mainTable.delegate = self
        mainTable.dataSource = self
    }
    
    private func setupData() {
        let item1 = NotificationsData(name: "Jax Teller Morrow", country: "Charming", text: "This is a text to test multiline text in view.", time: "9:30 PM", imgName: "jax")
        let item2 = NotificationsData(name: "Opie Wintson", country: "Charming", text: "Hey dude", time: "10:30 PM", imgName: "opie")
        arrayDummyData.append(item1)
        arrayDummyData.append(item2)
    }

}
