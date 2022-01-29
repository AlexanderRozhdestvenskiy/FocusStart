//
//  Data.swift
//  FocusStart
//
//  Created by Alexander Rozhdestvenskiy on 29.01.2022.
//

import Foundation

class DataState {
    
    private enum Keys: String {
        case hasOnboarded
    }
    
    static var hasOnboarded: Bool {
        get {
            return UserDefaults.standard.bool(forKey: Keys.hasOnboarded.rawValue)
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.hasOnboarded.rawValue)
            UserDefaults.standard.synchronize()
        }
    }
}
