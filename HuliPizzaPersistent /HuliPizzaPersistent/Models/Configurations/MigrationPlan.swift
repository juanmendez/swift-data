//
//  MigrationPlan.swift
//  HuliPizzaPersistent
//
//  Created by Mendez, Juan on 9/25/26.
//

import Foundation
import SwiftData

enum MigrationPlan: SchemaMigrationPlan {
    static var schemas: [VersionedSchema.Type] {
        [ VersionSchema_01_00_00.self ]
    }

    static var stages: [MigrationStage] {
        []
    }
}
