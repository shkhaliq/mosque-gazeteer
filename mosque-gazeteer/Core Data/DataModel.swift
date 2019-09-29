//
//  DataModel.swift
//  mosque-gazeteer
//
//  Created by Khaliq, Haris on 2019-09-29.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import Foundation
import CoreData

class DataModel<T: NSManagedObject> {

    let context: NSManagedObjectContext

    var items = [T]()

    init(context: NSManagedObjectContext = MosqueDataCoordinator.shared.container.viewContext) {
        self.context = context
        self.items = self.getAll()
    }

    private func save() -> Bool {
        guard context.hasChanges else { return false }
        do {
            try context.save()
            return true
        } catch {
            return false
        }
    }

    func getAll() -> [T] {
        let fetchRequest = NSFetchRequest<T>(entityName: String(describing: T.self))
        let list: [T]

        do {
            list = try context.fetch(fetchRequest)
        } catch {
            return []
        }

        return list
    }

    func create() -> T? {
        guard let entity = NSEntityDescription.entity(
            forEntityName: String(describing: T.self),
            in: context) else { return nil }
        return T(
            entity: entity,
            insertInto: context)
    }

    func delete(_ item: T) -> Bool {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }

        context.delete(item)
        return save()
    }

    func addOrUpdate(_ item: T) -> T {
        if items.contains(item) == false {
            items.append(item)
        }

        _ = save()
        return item
    }
}
