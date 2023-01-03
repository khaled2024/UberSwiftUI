//
//  UberSwiftUIApp.swift
//  UberSwiftUI
//
//  Created by KhaleD HuSsien on 23/12/2022.
//

import SwiftUI

@main
struct UberSwiftUIApp: App {
    @StateObject var locationViewModel = LocationSearchViewModel()
    var body: some Scene {
        WindowGroup {
            Home()
                .environmentObject(locationViewModel)
        }
    }
}
