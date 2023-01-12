//
//  LocationSearchView.swift
//  UberSwiftUI
//
//  Created by KhaleD HuSsien on 31/12/2022.
//

import SwiftUI

struct LocationSearchView: View {
    @State private var startLocationText: String = ""
    @Binding var mapState: MapViewState
    @EnvironmentObject var viewModel: LocationSearchViewModel
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
                    TextField("Your location", text: $startLocationText)
                        .disabled(true)
                        .frame(height: 32)
                        .background(Color(.systemGroupedBackground))
                        .padding(.trailing)
                    TextField("Where to?", text: $viewModel.queryFragment)
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
                    ForEach(viewModel.results,id: \.self) { result in
                        LocationSearchResultCell(title: result.title, subTitle: result.subtitle)
                            .onTapGesture {
//                                viewModel.queryFragment = ""
                                withAnimation(.spring()) {
                                    viewModel.selectLocation(result)
                                    mapState = .locationSelected
                                }
                            }
                    }
                }
            }
        }
        .background(Color.them.BackgroundColor)
    }
}

struct LocationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchView(mapState: .constant(.searchingForLocation))
    }
}
