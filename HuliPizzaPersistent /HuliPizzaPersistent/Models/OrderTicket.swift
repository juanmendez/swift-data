//
//  OrderTicket.swift
//  minipizzaApp
//
//  Created by Steven Lipton on 10/17/23.
//

import Foundation
import SwiftData

extension Array where Element == OrderTicket {
    var totalPrice: Double {
        self.reduce(0.0) { partialResult, orderTicket in
            partialResult + orderTicket.totalPrice
        }
    }
}
