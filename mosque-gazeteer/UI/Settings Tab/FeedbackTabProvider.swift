//
//  SettingsTabProvider.swift
//  mosque-gazeteer
//
//  Created by Haris Khaliq on 2019-01-30.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import UIKit

class FeedbackTabProvider: TabBarControllerProvider {
    var tabBarTitle: String {
        return "Feedback"
    }

    var tabBarImage: UIImage? {
        return UIImage(named: "feedback")
    }

    var viewController: UIViewController {
        return FeedbackViewController()
    }



}
