//
//  Date+DateFormat.swift
//  FixPayment
//
//  Created by Anton Skorodumov on 20/02/2019.
//  Copyright © 2019 chameleon production. All rights reserved.
//

import Foundation

enum DateFormat: String {
    
    case ddMMyyyy = "dd.MM.yyyy"
    
}

extension Date {
    
    func toString(format: DateFormat) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        return formatter.string(from: self)
    }
    
}
