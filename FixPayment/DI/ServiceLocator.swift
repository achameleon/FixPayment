//
//  ServiceLocator.swift
//  FixPayment
//
//  Created by Anton Skorodumov on 20/02/2019.
//  Copyright © 2019 chameleon production. All rights reserved.
//

import Foundation

class ServiceLocator {
    
    static fileprivate var serviceLocator: ServiceLocator = ServiceLocator()
    
    fileprivate var factories: [String: Any] = [:]
    
    init() {}
    
    static func register<Service>(_ service: Service.Type,
                           factory: @escaping () -> Service) {
        ServiceLocator.serviceLocator.factories["\(service)"] = factory
    }
    
    static func resolve<Service>(_ service: Service.Type) -> Service {
        let factory = ServiceLocator.serviceLocator.factories["\(service)"] as! (() -> Service)
        return factory()
    }
    
}
