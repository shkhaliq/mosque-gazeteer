//
//  LaunchCoordinator.swift
//  mosque-gazeteer
//
//  Created by Haris Khaliq on 2019-01-30.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import UIKit

class LaunchCoordinator {

    var tabBarController: RootTabBarController?
    private let tabBarProviders: [TabBarControllerProvider]

    init() {
        self.tabBarProviders = [
            MosquesTabBarProvider(),
            LocationTabBarProvider(),
            FeedbackTabProvider(),
            AccountTabBarProvider(),
        ]
    }

    func start(animated: Bool) {
        tabBarController = RootTabBarController(tabBarProviders)
    }
}
