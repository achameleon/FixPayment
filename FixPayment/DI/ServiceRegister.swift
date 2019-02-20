//
//  ServiceRegister.swift
//  FixPayment
//
//  Created by Anton Skorodumov on 20/02/2019.
//  Copyright © 2019 chameleon production. All rights reserved.
//

import Foundation

class ServiceRegister {
    
    static func register() {
        ServiceLocator.register(KeyValueStorage.self) { KeyValueStorage() }
        ServiceLocator.register(TodayPaymentManager.self) { TodayPaymentManager() }
        ServiceLocator.register(KeyboardManager.self) { KeyboardManager() }
    }
    
}
