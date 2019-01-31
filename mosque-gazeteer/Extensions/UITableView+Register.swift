//
//  UITableView+Register.swift
//  mosque-gazeteer
//
//  Created by Haris Khaliq on 2019-01-30.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import UIKit

extension UITableView {

    func register<T: UITableViewCell>(_ cellClass: T.Type) {
        self.register(cellClass.self, forCellReuseIdentifier: String(describing: cellClass.self))
    }

    func dequeueReusableCell<T: UITableViewCell>(_ cellClass: T.Type, for indexPath: IndexPath) -> T {
        let cellString = String(describing: cellClass.self)
        guard let cell = dequeueReusableCell(withIdentifier: cellString, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(cellString)")
        }
        return cell
    }
}
