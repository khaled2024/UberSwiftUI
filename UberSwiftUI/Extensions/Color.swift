//
//  Color.swift
//  UberSwiftUI
//
//  Created by KhaleD HuSsien on 10/01/2023.
//

import Foundation
import SwiftUI
extension Color {
    static let them = ColorThem()
}
struct ColorThem{
    let BackgroundColor = Color("BackgroundColor")
    let SecondaryBackgroundColor = Color("SecondaryBackgroundColor")
    let PrimaryTextColor = Color("PrimaryTextColor")
}
