//
//  LocationSearchResultCell.swift
//  UberSwiftUI
//
//  Created by KhaleD HuSsien on 31/12/2022.
//

import SwiftUI

struct LocationSearchResultCell: View {
    var body: some View {
        HStack{
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .foregroundColor(.blue)
                .accentColor(.white)
                .frame(width: 40, height: 40)
            VStack(alignment: .leading,spacing: 4){
                Text("Starbucks Coffee.")
                    .font(.body)
                Text("123 main street, california state.")
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                Divider()
            }
            .padding(.trailing,8)
            .padding(.vertical,8)
        }
        .padding(.leading)
    }
}

struct LocationSearchResultCell_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchResultCell()
    }
}
