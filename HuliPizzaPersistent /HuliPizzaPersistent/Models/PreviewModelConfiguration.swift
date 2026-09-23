//
//  PreviewModelConfiguration.swift
//  HuliPizzaPersistent
//
//  Created by Mendez, Juan on 9/23/26.
//

import SwiftData

let previewConfiguration = ModelConfiguration(isStoredInMemoryOnly: true)

let previewNameContainer = try! ModelContainer(
    for: NameModel.self,
    configurations: previewConfiguration
)

let previewRatingContainer = try! ModelContainer(
    for: RatingModel.self,
    configurations: previewConfiguration
)
