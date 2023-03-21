//
//  DataController.swift
//  Bookworm
//
//  Created by Justin Hold on 10/8/22.
//

import Foundation
import CoreData

// NS stands for NextStep (old Steve Jobs company)
class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Bookworm")
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
