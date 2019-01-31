//
//  ListViewModel.swift
//  mosque-gazeteer
//
//  Created by Haris Khaliq on 2019-01-30.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import UIKit

protocol ListCellType {
    var height: CGFloat { get set }
    func bindViewModel(_ viewModel: Any)
}
