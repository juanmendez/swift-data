//
//  FriendsFavoriteMoviewsApp.swift
//  FriendsFavoriteMoviews
//
//  Created by Mendez, Juan on 6/2/26.
//

import SwiftUI
import SwiftData

@main
struct FriendsFavoriteMoviewsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Movie.self, Friend.self])
    }
}
