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
        [
            VersionSchema_01_00_00.self,
            VersionSchema_01_01_00.self,
            VersionSchema_02_00_00.self,
        ]
    }

    static var from_01_00_000_to_01_01_00: MigrationStage {
        MigrationStage.lightweight(
            fromVersion: VersionSchema_01_00_00.self,
            toVersion: VersionSchema_01_01_00.self,
        )
    }

    static var from_01_01_000_to_02_00_00: MigrationStage {
        MigrationStage.lightweight(
            fromVersion: VersionSchema_01_01_00.self,
            toVersion: VersionSchema_02_00_00.self,
        )
    }

    static var stages: [MigrationStage] {
        [
            from_01_00_000_to_01_01_00,
            from_01_01_000_to_02_00_00,
        ]
    }
}
