//
//  ContentView.swift
//  Birthdays
//
//  Created by Mendez, Juan on 6/1/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    @Query private var friends: [Friend]

    @State private var newName = ""
    @State private var newDate = Date.now
    @Environment(\.modelContext) private var context

    var body: some View {
        NavigationStack {
            List(friends, id: \.name) { friend in
                HStack {
                    Text(friend.name)
                    Spacer()
                    Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                }
            }
            .navigationTitle("Birthdays")
            .safeAreaInset(edge: .bottom) {
                VStack(alignment: .center, spacing: 20) {
                    Text("New Birthday")
                        .font(.headline)

                    DatePicker(
                        selection: $newDate,
                        in: Date.distantPast...Date.now,
                        displayedComponents: .date
                    ) {
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                    }

                    Button("Save") {
                        let newFriend = Friend(name: newName, birthday: newDate)
                        context.insert(newFriend)

                        newName = ""
                        newDate = .now
                    }
                    .fontWeight(.bold)
                }
                .padding()
                .background(.bar)
            }

        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Friend.self, inMemory: true )
}
