//
//  Double.swift
//  UberSwiftUI
//
//  Created by KhaleD HuSsien on 10/01/2023.
//

import Foundation
extension Double{
    private var currencyFormatter: NumberFormatter{
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.minimumIntegerDigits = 2
        formatter.maximumIntegerDigits = 2
        return formatter
    }
    func toCurrency()-> String{
        return currencyFormatter.string(for: self) ?? ""
    }
}
