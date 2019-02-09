//
//  AccountTabBarProvider.swift
//  mosque-gazeteer
//
//  Created by Haris Khaliq on 2019-02-08.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import UIKit

class AccountTabBarProvider: TabBarControllerProvider {
    var tabBarTitle: String {
        return NSLocalizedString("Account", comment: "")
    }

    var tabBarImage: UIImage? {
        return UIImage(named: "user")
    }

    var viewController: UIViewController {
        return UIViewController()
    }
}
