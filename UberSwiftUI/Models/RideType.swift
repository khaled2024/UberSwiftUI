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
    var baceFare: Double{
        switch self {
        case .uberX:
            return 5
        case .black:
            return 20
        case .uberXL:
            return 10
        }
    }
    func computePrice(for distanceInMeters: Double)-> Double{
        let distanceInMiles = distanceInMeters / 1600
        switch self {
        case .uberX:
            return distanceInMiles * 1.5 + baceFare // 1600 / 1600 = 1 mile -> 1 * 1.5 + 5
        case .black:
            return distanceInMiles * 2.0 + baceFare // 1600 / 1600 = 1 mile -> 1 * 2 + 7
        case .uberXL:
            return distanceInMiles * 1.75 + baceFare // 1600 / 1600 = 1 mile -> 1 * 1.75 + 6.75
        }
    }
}
