//
//  RideRequestView.swift
//  UberSwiftUI
//
//  Created by KhaleD HuSsien on 08/01/2023.
//

import SwiftUI

struct RideRequestView: View {
    var body: some View {
        VStack {
            Capsule()
                .foregroundColor(Color(.systemGray5))
                .frame(width: 48, height: 6)
            // trip info...
            HStack {
                // indecator view
                VStack{
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 8, height: 8)
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 32)
                    Rectangle()
                        .fill(Color(.black))
                        .frame(width: 8, height: 8)
                }
                // trip locatios and time to arrive...
                VStack(alignment: .leading, spacing: 24){
                    HStack{
                        Text("Current location")
                            .font(.system(size: 16,weight: .semibold))
                            .foregroundColor(.gray)
                        Spacer()
                        Text("1:30 PM")
                            .font(.system(size: 14,weight: .semibold))
                            .foregroundColor(.gray)
                    }
                    .padding(.bottom,10)
                    HStack{
                        Text("StarBucks coffee")
                            .font(.system(size: 16,weight: .semibold))
                        Spacer()
                        Text("1:45 PM")
                            .font(.system(size: 14,weight: .semibold))
                            .foregroundColor(.gray)
                    }
                }
                .padding(.leading, 8)
            }
            .padding(10)
            Divider()
            //ride type selection view...
            Text("SUGGESTED RIDES")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding()
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity,alignment: .leading)
            // scroll view
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12){
                    ForEach(0..<3,id: \.self){_ in
                        VStack(alignment: .leading) {
                            Image("uber-x")
                                .resizable()
                                .scaledToFit()
                            VStack(spacing: 4){
                                Text("UberX")
                                    .font(.system(size: 14,weight: .semibold))
                                Text("$22.04")
                                    .font(.system(size: 14,weight: .semibold))
                            }
                            .padding(8)
                        }
                        .frame(width: 112, height: 140)
                        .background(Color(.systemGroupedBackground))
                        .cornerRadius(10)
                    }
                }
            }
            .padding(.horizontal)
            // divider...
            Divider()
                .padding(.vertical,8)
            // payment option view...
            HStack(spacing: 12){
                Text("Visa")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(6)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                Text("****1234")
                    .fontWeight(.semibold)
                Spacer()
                Image(systemName: "chevron.right")
                    .imageScale(.medium)
                    .padding()
            }
            .padding()
            .frame(height: 50)
            .background(Color(.systemGroupedBackground))
            .cornerRadius(10)
            .padding(.horizontal)
            // request ride button...
            Button {
                
            } label: {
                Text("CONFIRM RIDE")
                    .fontWeight(.bold)
                    .frame(width: UIScreen.main.bounds.width-32, height: 50)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(10)
            }
            
        }
        .background(.white)
    }
}

struct RideRequestView_Previews: PreviewProvider {
    static var previews: some View {
        RideRequestView()
    }
}
