//
//  MosqueDataCoordinator.swift
//  mosque-gazeteer
//
//  Created by Khaliq, Haris on 2019-09-29.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class MosqueDataCoordinator {

    var container: NSPersistentContainer
    private static var coordinator: MosqueDataCoordinator?

    static var shared: MosqueDataCoordinator {
        if let coordinator = coordinator {
            return coordinator
        }
        coordinator = MosqueDataCoordinator()
        return coordinator! //swiftlint:disable:this force_unwrapping
    }

    private init() {
        container = NSPersistentContainer(name: "MosqueDataModel")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }

    private(set) lazy var mosque = DataModel<Mosque>()
    private(set) lazy var salah = DataModel<Salah>()
}
