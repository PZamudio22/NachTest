//
//  ChatViewController.swift
//  NachTest
//
//  Created by Pablo Luis Velazquez Zamudio on 08/01/22.
//

import UIKit
import Charts

class ChatViewController: UIViewController, ChatViewProtocol {

// MARK: PROTOCOL VAR -
    var presenter: ChatPresenterProtocol?
    
// MARK: @IBOUTLETS -
    @IBOutlet weak var mainTable: UITableView!
    @IBOutlet weak var NavView: UIView!
    @IBOutlet weak var lblInbox: UILabel!
    @IBOutlet weak var btnSearch: UIButton!
    
// MARK: LOCAL VAR -
    var arrayDummyData = [ChatData]()
    
// MARK: LIFE CYCLE VIEW FUNCTIONS -
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDummyData()
        setupTable()

    }
    
// MARK: SETUP FUNCTIONS -
    private func setupTable() {
        mainTable.register(UINib(nibName: "ChatTableViewCell", bundle: .main), forCellReuseIdentifier: "CHATCELL")
        mainTable.delegate = self
        mainTable.dataSource = self
    }
    
    private func setupDummyData() {
        let item1 = ChatData(userName: "Jax Teller", imgName: "jax", messaggeText: "This is a messagge", dayAgo: "2 days ago", NumberMessagges: 3)
        let item2 = ChatData(userName: "Opie Wintson", imgName: "opie", messaggeText: "Hello bro!", dayAgo: "Yesterday", NumberMessagges: 5)
        let item3 = ChatData(userName: "Gema Teller", imgName: "gema", messaggeText: "Hey son, how are you?", dayAgo: "3 days ago", NumberMessagges: 0)
        let item4 = ChatData(userName: "Clay Morrow", imgName: "clay", messaggeText: "See you soon", dayAgo: "Now", NumberMessagges: 0)
        let item5 = ChatData(userName: "Tommy Shelby", imgName: "tommy", messaggeText: "Ok", dayAgo: "last week", NumberMessagges: 0)
        let item6 = ChatData(userName: "Jared Leto", imgName: "jared", messaggeText: "This is war", dayAgo: "Last month", NumberMessagges: 1)
        let item7 = ChatData(userName: "Filip Telford", imgName: "filip", messaggeText: "Hey dude, this is a long text to test multiline label and autorisizing of table view cell with two or more lines in the same message.", dayAgo: "5 days ago", NumberMessagges: 0)
        let item8 = ChatData(userName: "Ana Mena", imgName: "ana", messaggeText: "Goodbye!", dayAgo: "Now", NumberMessagges: 3)
        arrayDummyData.append(item1)
        arrayDummyData.append(item2)
        arrayDummyData.append(item3)
        arrayDummyData.append(item4)
        arrayDummyData.append(item5)
        arrayDummyData.append(item6)
        arrayDummyData.append(item7)
        arrayDummyData.append(item8)
        
    }

}
