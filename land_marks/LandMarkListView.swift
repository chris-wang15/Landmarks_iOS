//
//  LandMarkListView.swift
//  land_marks
//
//  Created by Kara Zu.  L. on 2023/6/12.
//  Copyright © 2023 Kara Zu.  L. All rights reserved.
//

import SwiftUI

struct LandMarkListView: View {
    var filterString:String
    @ObservedObject var viewModel: MainViewModel
    
    @State private var showFavorite = false
    
    // thread error without NavigationView
    var body: some View {
        List{
            // isOn: .constant(true) not changable
            Toggle(isOn: $showFavorite){
                Text("Show Favorite")
            }
            ForEach(viewModel.landMarks){ landMark in
                if (!self.showFavorite || landMark.isFavorite){
                    if (self.filterString == "All" || self.filterString == landMark.catagory) {
                        NavigationLink(destination: LandMarkDetailView(landMark: landMark, viewModel: self.viewModel)) {
                            LandMarkItemViewHolder(landMarkItem: landMark)
                        }
                    }
                }
                
            }
        }
        .navigationBarTitle(Text("Land Marks"))
    }
}

struct LandMarkItemViewHolder: View {
    let landMarkItem:LandMark
    var body: some View {
        HStack{
            Image(landMarkItem.imagePath)
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(8)
                .padding(.trailing)
            
            Text(landMarkItem.name)
            
            Spacer()
            
            if landMarkItem.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}
