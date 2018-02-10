//
//  Store.swift
//  ForexAnalisis
//
//  Created by David Londoño on 1/11/18.
//  Copyright © 2018 David Londoño. All rights reserved.
//

import Foundation

struct Storer {
    private let userDefaults: UserDefaults
    private let key: String
    init(userDefaults: UserDefaults, forKey: String) {
        self.userDefaults = userDefaults
        self.key = forKey
    }
    var int: Int {
        get {
            return userDefaults.integer(forKey: key)
        }
        set {
            userDefaults.set(newValue, forKey: key)
        }
    }
    
    var double: Double {
        get {
            return userDefaults.double(forKey: key)
        }
        set {
            userDefaults.set(newValue, forKey: key)
        }
    }
}
struct Store {
    private let userDefaults: UserDefaults
    
    init() {
        userDefaults = .standard
    }
    init?(db: String) {
        guard let userDefaults = UserDefaults(suiteName: db) else {
            return nil
        }
        self.userDefaults = userDefaults
    }
    subscript(val: String) -> Storer {
        get {
            return Storer(userDefaults: userDefaults, forKey: val)
        }
        set {
            //
        }
    }
}
class StoreModel {
    
}
struct PipsCalculatorStore {
    
    var pips: Double
    var portafolio: Double
    var percentLose: Double
    init(pips: Double = 0, portafolio: Double = 0, percentLose: Double = 0) {
        self.pips = pips
        self.portafolio = portafolio
        self.percentLose = percentLose
    }
    func save() {
        guard var store = Store(db: "forex") else {
            return
        }
        store["pips"].double = self.pips
        store["portafolio"].double = self.portafolio
        store["percentLose"].double = self.percentLose
    }
    static func load() -> PipsCalculatorStore? {
        guard var store = Store(db: "forex") else {
            return nil
        }
        let pips = store["pips"].double
        let portafolio = store["portafolio"].double
        let percentLose = store["percentLose"].double
        return PipsCalculatorStore(pips: pips, portafolio: portafolio, percentLose: percentLose)
    }
}
