//
//  NavigationBaseController.swift
//  NachTest
//
//  Created by Pablo Luis Velazquez Zamudio on 07/01/22.
//

import Foundation
import UIKit

class NavigationMenuBaseController: UITabBarController, UITabBarControllerDelegate {
    var customTabBar: TabNavigationMenu!
    var tabBarHeight: CGFloat = 60.0
override func viewDidLoad() {
        super.viewDidLoad()
    delegate = self
        self.loadTabBar()
    }
func loadTabBar() {
        // We'll create and load our custom tab bar here
    let tabItems: [TabItem] = [.home, .chat, .charts, .notifications, .profile]
    self.setupCustomTabBar(tabItems) { (controllers) in
        self.viewControllers = controllers
    }
    self.selectedIndex = 0 // default our selected index to the first item
    }
func setupCustomTabBar(_ items: [TabItem], completion: @escaping ([UIViewController]) -> Void) {
// handle creation of the tab bar and attach touch event listeners
    let frame = tabBar.frame
    var controllers = [UIViewController]()
    // hide the tab bar
    tabBar.isHidden = true
    self.customTabBar = TabNavigationMenu(menuItems: items, frame: frame)
    self.customTabBar.translatesAutoresizingMaskIntoConstraints = false
    self.customTabBar.clipsToBounds = true
    self.customTabBar.itemTapped = self.changeTab
    // Add it to the view
    self.view.addSubview(customTabBar)
    // Add positioning constraints to place the nav menu right where the tab bar should be
    NSLayoutConstraint.activate([
        self.customTabBar.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor),
        self.customTabBar.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor),
        self.customTabBar.widthAnchor.constraint(equalToConstant: tabBar.frame.width),
        self.customTabBar.heightAnchor.constraint(equalToConstant: tabBarHeight), // Fixed height for nav menu
        self.customTabBar.bottomAnchor.constraint(equalTo: tabBar.bottomAnchor)
    ])
    for i in 0 ..< items.count {
        controllers.append(items[i].viewController) // we fetch the matching view controller and append here
    }
    self.view.layoutIfNeeded() // important step
    completion(controllers) // setup complete. handoff here
    }
func changeTab(tab: Int) {
        self.selectedIndex = tab
    }
    
    public func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomTabBarTransition(viewControllers: tabBarController.viewControllers)
    }
}
