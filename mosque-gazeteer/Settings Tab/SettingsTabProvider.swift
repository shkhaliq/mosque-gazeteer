//
//  SettingsTabProvider.swift
//  mosque-gazeteer
//
//  Created by Haris Khaliq on 2019-01-30.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import UIKit

class SettingsTabProvider: TabBarControllerProvider {
    var tabBarTitle: String {
        return "Settings"
    }

    var tabBarImage: UIImage? {
        return nil
    }

    var viewController: UIViewController {
        return UIViewController()
    }



}
