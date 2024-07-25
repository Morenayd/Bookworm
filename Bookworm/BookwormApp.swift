//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Jesutofunmi Adewole on 25/07/2024.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
