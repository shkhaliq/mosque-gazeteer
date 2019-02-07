//
//  MosquesTabBarProvider.swift
//  mosque-gazeteer
//
//  Created by Haris Khaliq on 2019-01-30.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import UIKit

class MosquesTabBarProvider: TabBarControllerProvider {
    var tabBarTitle: String {
        return "Mosques"
    }

    var tabBarImage: UIImage? {
        return UIImage(named: "takbir")
    }

    var viewController: UIViewController {
        return MosquesListViewController()
    }



}
