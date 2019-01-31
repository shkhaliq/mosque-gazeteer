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
        return nil
    }

    var viewController: UIViewController {
        let dataSource = MosquesListDataSource()
        return MosquesListViewController(dataSource: dataSource)
    }



}
