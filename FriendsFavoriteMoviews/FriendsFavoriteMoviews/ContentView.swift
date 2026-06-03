//
//  ContentView.swift
//  FriendsFavoriteMoviews
//
//  Created by Mendez, Juan on 6/2/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Friends", systemImage: "person.and.person") {
                FriendList()
            }

            Tab("Movies", systemImage: "film.stack") {
                MovieList()
            }
        }
    }
}

#Preview {
    ContentView()
}
