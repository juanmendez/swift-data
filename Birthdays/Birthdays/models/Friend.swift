//
//  Friend.swift
//  Birthdays
//
//  Created by Mendez, Juan on 6/1/26.
//

import Foundation
import SwiftData

@Model
class Friend {
    var name: String
    var birthday: Date

    init(name: String, birthday: Date) {
        self.name = name
        self.birthday = birthday
    }
}
