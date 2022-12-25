//
//  Home.swift
//  UberSwiftUI
//
//  Created by KhaleD HuSsien on 25/12/2022.
//

import SwiftUI

struct Home: View {
    var body: some View {
        UberMapViewRepresentable()
            .ignoresSafeArea()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
