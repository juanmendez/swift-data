//
//  ModelConfiguration.swift
//  HuliPizzaPersistent
//
//  Created by Mendez, Juan on 9/25/26.
//

import SwiftData

typealias OrderTicket = VersionSchema_01_01_00.OrderTicket
typealias OrderItem = VersionSchema_01_01_00.OrderItem
typealias NameModel = VersionSchema_01_01_00.NameModel
typealias RatingModel = VersionSchema_01_01_00.RatingModel

@MainActor
let defaultPreviewNames = [
    NameModel(name: "Ernesto", partySize: 10),
    NameModel(name: "Carlos", partySize: 4)
]

var modelContainer: ModelContainer {
    let schema = Schema(versionedSchema: VersionSchema_01_01_00.self)
    let modelConfiguration = ModelConfiguration()
    let modelContainer = try! ModelContainer(for: schema, configurations: modelConfiguration)
    return modelContainer
}
