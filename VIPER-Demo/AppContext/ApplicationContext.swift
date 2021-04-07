//
//  ApplicationContext.swift
//  VIPER-Demo
//
//  Created by Mihail Salari on 07.04.2021.
//

import Foundation
import Swinject

class ApplicationContext {
    private struct Static {
        static var sharedContainer: Container?
    }
    
    static var defaultContainer: Container {
        Static.sharedContainer = Container { container in
            // Register all services here
            
            container.register(DataServiceProtocol.self) { _ in
                return DefaultDataService()
            }
        }
        
        return Static.sharedContainer!
    }
}
