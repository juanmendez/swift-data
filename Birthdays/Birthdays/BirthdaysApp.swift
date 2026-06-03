//
//  BirthdaysApp.swift
//  Birthdays
//
//  Created by Mendez, Juan on 6/1/26.
//

import SwiftData
import SwiftUI

@main
struct BirthdaysApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friend.self)
        }
    }
}
