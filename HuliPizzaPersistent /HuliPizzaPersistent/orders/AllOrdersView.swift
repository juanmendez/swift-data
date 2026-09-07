//
//  AllOrdersView.swift
//  HuliPizzaPersistent
//
//  Created by Mendez, Juan on 9/6/26.
//

import SwiftUI
import SwiftData

struct AllOrdersView: View {
    @Environment(\.modelContext) var modelContext
    @Query var orders: [OrderItem]

    var body: some View {
        Text(
            orders
                .map { $0.extendedPrice }
                .reduce(0,+),
            format: .currency(code: "USD")
        )

        List(orders) { order in
            HStack {
                Text("\(order.ticketKey)-\(order.rowKey)")
                    .bold()
                Text(order.menuItem.name)
                Text(order.extendedPrice, format: .currency(code: "USD"))
            }
        }
    }
}

#Preview {
    AllOrdersView()
}
