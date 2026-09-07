//
//  HuliPizzaPersistentApp.swift
//  HuliPizzaPersistent
//
//  Created by Steven Lipton on 10/27/23.
//

import SwiftData
import SwiftUI

@main
struct HuliPizzaPersistentApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(
            for: [
                RatingModel.self,
                NameModel.self,
                OrderTicket.self,
                OrderItem.self
            ]
        )
    }
}
