//
//  KeyValueStorage.swift
//  FixPayment
//
//  Created by Anton Skorodumov on 20/02/2019.
//  Copyright © 2019 chameleon production. All rights reserved.
//

import Foundation

struct KeyStorage {
    static func dayPaymentHistoryKey(_ date: String) -> String {
        return "dayPaymentHistoryKey" + date
    }
    static let todayAmmountKey: String = "todayAmmountKey"
}

class KeyValueStorage {
    
    fileprivate var userDefault: UserDefaults = UserDefaults.standard
    
    var todayAmmount: Int {
        set {
            userDefault.set(newValue, forKey: KeyStorage.todayAmmountKey)
            userDefault.synchronize()
        }
        get {
            return userDefault.integer(forKey: KeyStorage.todayAmmountKey)
        }
    }

    func registerDay(payment: Int) {
        var history = getDayHistory(date: Date())
        history.append(payment)
        userDefault.set(history,
                        forKey: KeyStorage.dayPaymentHistoryKey(Date().toString(format: .ddMMyyyy)))
        userDefault.synchronize()
    }
    
    func getDayHistory(date: Date) -> [Int] {
        let history = userDefault.value(
            forKey: KeyStorage.dayPaymentHistoryKey(date.toString(format: .ddMMyyyy))
        ) as? [Int]
        return history ?? []
    }
    
}
