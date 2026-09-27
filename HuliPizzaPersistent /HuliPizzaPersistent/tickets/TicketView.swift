//
//  TicketView.swift
//  minipizzaApp
//
//  Created by Steven Lipton on 10/13/23.
//

import SwiftData
import SwiftUI

struct TicketView: View {

    @Environment(\.modelContext) private var modelContext
    @Binding var tabTag: Int

    // Model declarations
    @Query(sort: [SortDescriptor(\OrderTicket.ticketKey)]) private var tickets: [OrderTicket] = []

    @State private var ticketKey: Int = 0
    @State private var items: [OrderItem] = []

    @State private var isListViewVisible: Bool = true
    @State private var deleteTicketSets: IndexSet = []

    // Computed properties

    private var keyList: [Int] {
        tickets.map { $0.ticketKey }
    }

    private var maxKey: Int {
        keyList.max() ?? -1
    }

    private var nextKey: Int {
        maxKey + 1
    }

    private var noModelsPending: Bool {
        let allArrays =
            modelContext.insertedModelsArray + modelContext.changedModelsArray + modelContext.deletedModelsArray

        return allArrays.isEmpty
    }

    private func modelArrays(message: String = "") {
        if !message.isEmpty {
            print(message)
        }
        print("Inserted", modelContext.insertedModelsArray)
        print("Changed", modelContext.changedModelsArray)
        print("Deleted", modelContext.deletedModelsArray)
        print("\n\n")
    }

    var body: some View {
        VStack {
            HStack {
                Text("\(tickets.count) Order Tickets")
                    .font(.title).fontWeight(.heavy)
                Button {
                    isListViewVisible.toggle()
                } label: {
                    Image(systemName: isListViewVisible ? "chevron.down" : "chevron.up")
                }
            }

            HStack {
                TicketListView(
                    ticketKey: $ticketKey,
                    orderItems: $items,
                    tickets: tickets,
                    deleteTicketSets: $deleteTicketSets
                )
                .frame(height: isListViewVisible ? nil : 0)
                .onChange(of: deleteTicketSets) {
                    for index in deleteTicketSets {
                        modelContext.delete(tickets[index])
                        // try! modelContext.save()
                    }
                }

                AllOrdersView()
            }

            HStack {
                Button("Save") {
                    modelArrays(message: "before saving ticket")
                    try! modelContext.save()
                    modelArrays(message: "after saving ticket")
                }
                .font(.title2)
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .padding([.top, .bottom])
                .padding([.leading, .trailing], 30)
                .background(.surf, in: RoundedRectangle(cornerRadius: 15))
                .padding([.leading, .trailing, .top])
                .opacity(noModelsPending ? 0.5: 1.0)
                .disabled(noModelsPending)

                Button(keyList.contains(ticketKey) ? "Save Ticket" : "Add Ticket") {
                    saveTicket()
                    modelArrays(message: "Save Ticket")
                }
                .font(.title2)
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .padding([.top, .bottom])
                .padding([.leading, .trailing], 30)
                .background(.surf, in: RoundedRectangle(cornerRadius: 15))
                .padding([.leading, .trailing, .top])

                Button("Undo") {
                    modelContext.rollback()
                    modelArrays(message: "After rolling back")
                }
                .font(.title2)
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .padding([.top, .bottom])
                .padding([.leading, .trailing], 30)
                .background(.surf, in: RoundedRectangle(cornerRadius: 15))
                .padding([.leading, .trailing, .top])
                .opacity(noModelsPending ? 0.5: 1.0)
                .disabled(noModelsPending)

                Spacer()
                if ticketKey >= 0 {
                    Text("Order #")
                    Text(ticketKey, format: .number)
                } else {
                    Text("Press New ticket to begin")
                }
                Spacer()
                Text(tickets.totalPrice, format: .currency(code: "USD"))
            }
            .padding(20)
            .font(.title).bold()
            .background(.sky, in: Capsule())

            OrderListView(ticketKey: $ticketKey, orderItems: $items)

            Spacer()
        }
        .onAppear {
            ticketKey = nextKey
        }.onChange(of: tickets.count) {
            ticketKey = nextKey
        }
    }

    func saveTicket() {

        let newTicketKey = ticketKey
        let newItems = items

        if !keyList.contains(where: { $0 == ticketKey }) {
            let addedTicket = OrderTicket(ticketKey: newTicketKey, items: newItems)
            modelContext.insert(addedTicket)
        } else if let ticketIdex = tickets.firstIndex(where: { $0.ticketKey == ticketKey }) {
            tickets[ticketIdex].items = items
        }

        items = []
        modelArrays(message: "add ticket")
    }
}

#Preview {
    TicketView(tabTag: .constant(0))
}
