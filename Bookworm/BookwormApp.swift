//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Justin Hold on 10/8/22.
//

import SwiftUI
import SwiftData

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
		.modelContainer(for: Book.self)
    }
}
