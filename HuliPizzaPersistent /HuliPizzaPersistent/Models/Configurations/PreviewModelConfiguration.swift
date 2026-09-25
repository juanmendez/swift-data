//
//  PreviewModelConfiguration.swift
//  HuliPizzaPersistent
//
//  Created by Mendez, Juan on 9/23/26.
//

import SwiftData

@MainActor
func modelPreviewContainer(
    autoSaveEnabled: Bool = true,
    names: [NameModel] = defaultPreviewNames,
) -> ModelContainer {
    let schema = Schema(
        [OrderTicket.self, NameModel.self, RatingModel.self, OrderItem.self,]
    )

    let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: schema, configurations: configuration)
    let context = ModelContext(container)
    context.autosaveEnabled = autoSaveEnabled

    for name in names {
        context.insert(name)
    }

    try! context.save()

    return container
}
