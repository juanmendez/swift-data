//
//  SampleData.swift
//  FriendsFavoriteMoviews
//
//  Created by Mendez, Juan on 7/10/26.
//

import Foundation
import SwiftData

@MainActor
class SampleData {
    static let shared = SampleData()

    let modelContainer: ModelContainer

    var context: ModelContext {
        modelContainer.mainContext
    }

    var friend: Friend {
        Friend.sampleData[0]
    }

    var movie: Movie {
        Movie.sampleData[0]
    }

    private init() {
        let schema = Schema([Friend.self, Movie.self])

        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)

        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            insertSampleData()
            try context.save()
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }

    }

    private func insertSampleData() {
        for friend in Friend.sampleData {
            context.insert(friend)
        }

        for movie in Movie.sampleData {
            context.insert(movie)
        }

        Friend.sampleData[0].favoriteMovie = Movie.sampleData[1]
        Friend.sampleData[2].favoriteMovie = Movie.sampleData[0]
        Friend.sampleData[3].favoriteMovie = Movie.sampleData[4]
        Friend.sampleData[4].favoriteMovie = Movie.sampleData[0]
    }
}
