//
//  TabItem.swift
//  NachTest
//
//  Created by Kevin Uriel Velazquez Zamudio on 07/01/22.
//

import Foundation
import UIKit

enum TabItem: String, CaseIterable {
    case home = "home"
    case chat = "chat"
    case charts = "charts"
    case notifications = "notifications"
    case profile = "profile"
    
    var viewController: UIViewController {
        switch self {
        case .home:
            let groups = HomeRouter.getController()
            let navigationController = UINavigationController()
            navigationController.navigationBar.isHidden = true
            navigationController.pushViewController(groups, animated: false)
            return navigationController
            
        case .chat:
            let chatView = ChatRouter.getController()
            let navigationController = UINavigationController()
            navigationController.navigationBar.isHidden = true
            navigationController.pushViewController(chatView, animated: false)
            return navigationController
            
        case .charts:
            let groups = PieListRouter.getController()
            let navigationController = UINavigationController()
            navigationController.navigationBar.isHidden = true
            navigationController.pushViewController(groups, animated: false)
            return navigationController
            
        case .notifications:
            let notfication = NotificationsRouter.getController()
            let navigationController = UINavigationController()
            navigationController.navigationBar.isHidden = true
            navigationController.pushViewController(notfication, animated: false)
            return navigationController
            
        case .profile:
            let prof = ProfileRouter.getController()
            let navigationController = UINavigationController()
            navigationController.navigationBar.isHidden = true
            navigationController.pushViewController(prof, animated: false)
            return navigationController
            
        }
    }
    
    var icon: UIImage {
        switch self {
        case .home:
            
            return UIImage(systemName: "house.fill")! 
            
        case .chat:
            return UIImage(systemName: "message.fill")!
            
        case .charts:
            return UIImage(systemName: "plus.circle.fill")!
            
        case .notifications:
            return UIImage(systemName: "bell.fill")!
            
        case .profile:
            return UIImage(systemName: "person.circle.fill")!
            
        }
    }
    
    var displayTitle: String {
        return self.rawValue.capitalized(with: nil)
    }
}
