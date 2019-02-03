//
//  LocationTabBarProvider.swift
//  mosque-gazeteer
//
//  Created by Haris Khaliq on 2019-02-03.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import UIKit

class LocationTabBarProvider: TabBarControllerProvider {
    var tabBarTitle: String {
        return NSLocalizedString("Map", comment: "")
    }

    var tabBarImage: UIImage? {
        return UIImage(named: "placeholder")
    }

    var viewController: UIViewController {
        return LocationViewController()
    }

}
