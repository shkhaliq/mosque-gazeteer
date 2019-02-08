//
//  SearchSectionController.swift
//  mosque-gazeteer
//
//  Created by Haris Khaliq on 2019-02-08.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import IGListKit

protocol SearchSectionControllerDelegate: class {
    func searchSectionController(_ sectionController: SearchSectionController, didChangeText text: String)
}

final class SearchSectionController: ListSectionController, UISearchBarDelegate, ListScrollDelegate {

    weak var delegate: SearchSectionControllerDelegate?

    override init() {
        super.init()
        scrollDelegate = self
    }

    override func sizeForItem(at index: Int) -> CGSize {
        guard let collectionContext = collectionContext else { return .zero }
        return CGSize(width: collectionContext.containerSize.width, height: 44)
    }

    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let collectionContext = collectionContext
            else {
                fatalError("Collection context cannot be nil")
            }
        guard let cell = collectionContext.dequeueReusableCell(of: SearchCell.self, for: self, at: index) as? SearchCell
            else {
                fatalError("Cell cannot be nil")
            }
        cell.searchBar.delegate = self
        return cell
    }

    // MARK: UISearchBarDelegate

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        delegate?.searchSectionController(self, didChangeText: searchText)
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        delegate?.searchSectionController(self, didChangeText: text)
    }

    // MARK: ListScrollDelegate

    func listAdapter(_ listAdapter: ListAdapter, didScroll sectionController: ListSectionController) {
        if let searchBar = (collectionContext?.cellForItem(at: 0, sectionController: self) as? SearchCell)?.searchBar {
            searchBar.resignFirstResponder()
        }
    }

    func listAdapter(_ listAdapter: ListAdapter, willBeginDragging sectionController: ListSectionController) {}
    func listAdapter(_ listAdapter: ListAdapter,
                     didEndDragging sectionController: ListSectionController,
                     willDecelerate decelerate: Bool) {}
}
