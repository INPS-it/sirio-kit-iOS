//
// Binding+Extension.swift
//
// SPDX-FileCopyrightText: 2024 Istituto Nazionale Previdenza Sociale
//
// SPDX-License-Identifier: BSD-3-Clause
//

import SwiftUI

extension Binding where Value == Int {
    /// Use this method to transform Binding<Int> to Binding<Double>
    public func double() -> Binding<Double> {
        return Binding<Double>(
            get: { Double(self.wrappedValue) },
            set: { self.wrappedValue = Int($0)})
    }
    
    /// Use this method to transform Binding<Int> to Binding<String>
    public func string() -> Binding<String> {
        return Binding<String>(
            get: { String(self.wrappedValue) },
            set: { self.wrappedValue = Int($0) ?? 0})
    }
}

extension Binding where Value == String {
    /// Use this method to set the max characters numbers
    func max(_ limit: Int) -> Self {
        if self.wrappedValue.count > limit {
            DispatchQueue.main.async {
                self.wrappedValue = String(self.wrappedValue.dropLast())
            }
        }
        return self
    }
}

extension Binding {
    /// Use this method to unwrap the optional binding
    func toUnwrapped<T>(defaultValue: T) -> Binding<T> where Value == Optional<T>  {
        Binding<T>(get: { self.wrappedValue ?? defaultValue }, set: { self.wrappedValue = $0 })
    }
}
