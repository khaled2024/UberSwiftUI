//
//  Home.swift
//  UberSwiftUI
//
//  Created by KhaleD HuSsien on 25/12/2022.
//

import SwiftUI

struct Home: View {
    @State private var showLocationSearchView: Bool = false
    var body: some View {
        ZStack(alignment: .top){
            UberMapViewRepresentable()
                .ignoresSafeArea()
            if showLocationSearchView{
                LocationSearchView()
            }else{
                LocationSearchActivationView()
                    .padding(.vertical, 72)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            showLocationSearchView.toggle()
                        }
                    }
            }
            MapViewActionButton(showLocationSearchView: $showLocationSearchView)
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
