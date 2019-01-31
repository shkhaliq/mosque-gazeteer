//
//  RootTabBarController.swift
//  mosque-gazeteer
//
//  Created by Haris Khaliq on 2019-01-30.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import UIKit

protocol TabBarControllerProvider {
    var tabBarTitle: String { get }
    var tabBarImage: UIImage? { get }
    var viewController: UIViewController { get }
}

class RootTabBarController: UITabBarController {

    init(_ providers: [TabBarControllerProvider]) {
        super.init(nibName: nil, bundle: nil)

        self.viewControllers = providers.map {
            let navigationController = UINavigationController(rootViewController: $0.viewController)
            navigationController.tabBarItem = UITabBarItem(title: $0.tabBarTitle, image: $0.tabBarImage, selectedImage: $0.tabBarImage)
            return navigationController
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


