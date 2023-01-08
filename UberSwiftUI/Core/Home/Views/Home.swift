//
//  Home.swift
//  UberSwiftUI
//
//  Created by KhaleD HuSsien on 25/12/2022.
//

import SwiftUI

struct Home: View {
    @State private var mapState = MapViewState.noInput
    var body: some View {
        ZStack(alignment: .top){
            UberMapViewRepresentable(mapState: $mapState)
                .ignoresSafeArea()
            if mapState == .searchingForLocation{
                LocationSearchView(mapState: $mapState)
            }else if mapState == .noInput{
                LocationSearchActivationView()
                    .padding(.vertical, 72)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            mapState = .searchingForLocation
                        }
                    }
            }
            MapViewActionButton(mapState: $mapState)
                .padding(.leading)
                .padding(.top, 4)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
