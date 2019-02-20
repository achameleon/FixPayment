//
//  PaymentManager.swift
//  FixPayment
//
//  Created by Anton Skorodumov on 20/02/2019.
//  Copyright © 2019 chameleon production. All rights reserved.
//

import Foundation

class TodayPaymentManager {
    
    fileprivate let storage: KeyValueStorage = ServiceLocator.resolve(KeyValueStorage.self)
    
    func todayPaymentsList() -> [Int] {
        return storage.getDayHistory(date: Date())
    }
    
    func register(payment: Int) {
        storage.registerDay(payment: payment)
    }
    
    func registerToday(ammount: Int) {
        storage.todayAmmount = ammount
    }
    
    func todayLeftAmmount() -> Int {
        var todayAmmount = storage.todayAmmount
        storage.getDayHistory(date: Date()).forEach { (pay) in
            todayAmmount -= pay
        }
        return todayAmmount
    }

}
