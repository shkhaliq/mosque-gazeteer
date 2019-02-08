//
//  MosquesListSectionController.swift
//  mosque-gazeteer
//
//  Created by Haris Khaliq on 2019-02-08.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import IGListKit

protocol MosquesListSectionControllerDelegate: class {
    func didSelectMosque(_ viewModel: MosqueViewModel)
}

class MosquesListSectionController: ListSectionController {

    private var viewModel: MosqueViewModel?

    weak var delegate: MosquesListSectionControllerDelegate?

    override func didUpdate(to object: Any) {
        self.viewModel = object as? MosqueViewModel
    }

    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let viewModel = viewModel,
            let cell = collectionContext?.dequeueReusableCell(
                of: MosqueLabelCell.self,
                for: self,
                at: index) as? MosqueLabelCell
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

    override func didSelectItem(at index: Int) {
        guard let viewModel = viewModel else { return }
        delegate?.didSelectMosque(viewModel)
    }

}
