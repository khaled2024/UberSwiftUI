//
//  RideType.swift
//  UberSwiftUI
//
//  Created by KhaleD HuSsien on 08/01/2023.
//

import Foundation
enum RideType: Int,CaseIterable,Identifiable {
    var id: Int {return rawValue}
    case uberX
    case black
    case uberXL
    var description: String{
        switch self {
        case .uberX:
            return "UberX"
        case .black:
            return "UberBlack"
        case .uberXL:
            return "UberXL"
        }
    }
    var imageName: String{
        switch self {
        case .uberX:
            return "uber-x"
        case .black:
            return "uber-black"
        case .uberXL:
            return "uber-x"
        }
    }
}
