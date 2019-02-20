//
//  DayHistoryVM.swift
//  FixPayment
//
//  Created by Anton Skorodumov on 20/02/2019.
//  Copyright © 2019 chameleon production. All rights reserved.
//

import Foundation

struct DayHistoryVM {
    
    let title: String
    let value: String
    
    init(value: Int) {
        self.title = "Расход"
        self.value = String(value)
    }
    
    static func dataWith(pays: [Int]) -> [DayHistoryVM] {
        var paysList: [DayHistoryVM] = []
        for pay in pays {
            paysList.append(DayHistoryVM(value: pay))
        }
        return paysList
    }
    
}
