//
//  LandMarkDetailView.swift
//  land_marks
//
//  Created by Kara Zu.  L. on 2023/6/12.
//  Copyright © 2023 Kara Zu.  L. All rights reserved.
//

import SwiftUI

struct LandMarkDetailView: View {
    let landMark:LandMark
    @ObservedObject var viewModel: MainViewModel
    
    var landmarkIndex: Int{
        viewModel.landMarks.firstIndex(where: {$0.id == landMark.id})!
    }
    
    var body: some View {
        VStack{
            MapView(latitude: landMark.latitude, longitude: landMark.longtitude)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 500)
            NavigationLink(destination: DetailImageView(item: landMark)){
                Image(landMark.imagePath)
                    .renderingMode(.original)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 250, height: 250)
                    .overlay(Circle()
                        .stroke(Color.white, lineWidth: 4)
                        .shadow(radius: 10))
                    .offset(x:0, y: -100)
                    .padding(.bottom, -100)
            }
            
            VStack(alignment: .leading, spacing: 8){
                HStack{
                    Text(landMark.name).font(.title)
                    Button(action: {
                        self.viewModel.landMarks[self.landmarkIndex].isFavorite.toggle()
                    }){
                        if viewModel.landMarks[landmarkIndex].isFavorite{
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        } else {
                            Image(systemName: "star")
                                .foregroundColor(.gray)
                        }
                        
                    }
                }
                
                HStack{
                    Text(landMark.locationCity).font(.subheadline)
                    Spacer()
                    Text(landMark.locationContry).font(.subheadline)
                }
            }
            .padding()
            
            Spacer()
        }
        .navigationBarTitle(Text("\(landMark.name) Location"), displayMode: .inline)
        
    }
}
