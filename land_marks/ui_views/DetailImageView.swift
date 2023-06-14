//
//  LandMarkDetailView.swift
//  land_marks
//
//  Created by Kara Zu.  L. on 2023/6/12.
//  Copyright © 2023 Kara Zu.  L. All rights reserved.
//

import SwiftUI

struct DetailImageView: View {
    let item:LandMark
    @State private var zoomed=false
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            if !zoomed{
                Image(item.imagePath)
                    .resizable()
                    .aspectRatio(contentMode: zoomed ? .fill : .fit)
                    .navigationBarTitle(Text(item.name), displayMode: .inline)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 1)) {
                            self.zoomed.toggle()
                        }
                }
                Text("\(item.locationCity) \(item.locationContry)")
                    .lineLimit(1)
                    .font(.largeTitle)
                    .foregroundColor(.gray)
                    .padding()
                    .transition(.move(edge: .trailing))
            } else {
                ScrollView(.horizontal){
                    Image(item.imagePath)
                        .resizable()
                        .navigationBarTitle(Text(item.name), displayMode: .inline)
                        .frame(maxHeight: .infinity)
                        .aspectRatio(contentMode: zoomed ? .fill : .fit)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 1)) {
                                self.zoomed.toggle()
                            }
                    }
                }
                .foregroundColor(.blue)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}
