//
//  MosqueSalahsSectionController.swift
//  mosque-gazeteer
//
//  Created by Haris Khaliq on 2019-02-08.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import Foundation
import IGListKit

class MosqueSalahsSectionController: ListSectionController {

    private var viewModel: SalahViewModel?

    override func didUpdate(to object: Any) {
        self.viewModel = object as? SalahViewModel
    }

    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let viewModel = viewModel,
            let cell = collectionContext?.dequeueReusableCell(
                of: PrayerTimeCell.self,
                for: self,
                at: index) as? PrayerTimeCell
            else {
                fatalError("Unsupported view model")
        }
        cell.bindViewModel(viewModel)
        return cell
    }

    override func sizeForItem(at index: Int) -> CGSize {
        guard let collectionContext = collectionContext else { return .zero }
        return CGSize(width: collectionContext.containerSize.width, height: 55)
    }
}
