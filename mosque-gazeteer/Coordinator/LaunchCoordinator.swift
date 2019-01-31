//
//  LaunchCoordinator.swift
//  mosque-gazeteer
//
//  Created by Haris Khaliq on 2019-01-30.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import UIKit

class LaunchCoordinator {

    var navigationController: UINavigationController?
    private let mosquesListViewController: MosquesListViewController

    init() {
        let dataSource = MosquesListDataSource()
        self.mosquesListViewController = MosquesListViewController(dataSource: dataSource)
    }

    func start(animated: Bool) {
        navigationController = UINavigationController(rootViewController: mosquesListViewController)

        mosquesListViewController.navigationItem.title = NSLocalizedString("Mosques", comment: "")
    }
}
