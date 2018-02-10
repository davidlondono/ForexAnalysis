//
//  +String.swift
//  ForexAnalisis
//
//  Created by David Londoño on 1/11/18.
//  Copyright © 2018 David Londoño. All rights reserved.
//

import Foundation

extension String {
    var float: Float? {
        return Float(self)
    }
    var floatValue: Float {
        return Float(self) ?? 0.0
    }
    var double: Double? {
        return Double(self)
    }
    var doubleValue: Double {
        return Double(self) ?? 0.0
    }
}
