//
//  LocationSearchView.swift
//  UberSwiftUI
//
//  Created by KhaleD HuSsien on 31/12/2022.
//

import SwiftUI

struct LocationSearchView: View {
    @State private var startLocationText: String = ""
    @State private var destinationLocationText: String = ""
    var body: some View {
        VStack{
            // header view
            HStack{
                VStack{
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 6, height: 6)
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 24)
                    Rectangle()
                        .fill(Color(.black))
                        .frame(width: 6, height: 6)
                }
                VStack{
                    TextField("Current location", text: $startLocationText)
                        .frame(height: 32)
                        .background(Color(.systemGroupedBackground))
                        .padding(.trailing)
                    TextField("Where to?", text: $destinationLocationText)
                        .frame(height: 32)
                        .background(Color(.systemGray4))
                        .padding(.trailing)
                }
            }
            .padding(.horizontal)
            .padding(.top,64)
            Divider()
                .padding(.vertical)
            
            // list view
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading){
                    ForEach(0..<10) { index in
                        LocationSearchResultCell()
                    }
                }
            }
        }
        .background(.white)
    }
}

struct LocationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchView()
    }
}
