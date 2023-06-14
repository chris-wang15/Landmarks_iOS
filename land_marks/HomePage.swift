//
//  Home.swift
//  land_marks
//
//  Created by Kara Zu.  L. on 2023/6/13.
//  Copyright © 2023 Kara Zu.  L. All rights reserved.
//

import SwiftUI
import AVKit

struct HomePage: View {
    @ObservedObject var viewModel = MainViewModel()
    
    @State var isPresented = false
    
    @State private var index = 0
    
    var body: some View {
        let categoryNameArr: [String] = MainViewModel.categoryNameArr
        var categories: [String: [LandMark]] {
            Dictionary(
                grouping: viewModel.landMarks,
                by: {$0.catagory}
            )
        }
        let landMarkList:[LandMark] = viewModel.landMarks
        
        return NavigationView{
            ZStack{
                if (viewModel.landMarks.count > 0) {
                    List{
                        VStack{
                            // assume the first three item is featured
                            if (viewModel.landMarks.count >= 3) {
                                
                                TabView(selection: $index) {
                                    ForEach((0..<3), id: \.self) { index in
                                        Image(landMarkList[index].imagePath)
                                            .resizable()
                                            .scaledToFill()
                                            .clipped()
                                            .tabItem{
                                                index == self.index ?
                                                    Image(systemName: "largecircle.fill.circle") : Image(systemName: "circle")
                                                Text(self.viewModel.landMarks[index].name)
                                        }
                                    }
                                }
                            }
                        }
                        .frame(height: 250)
                        .listRowInsets(EdgeInsets())
                        
                        ForEach(0..<categoryNameArr.count){
                            i in
                            LandMarkRow(
                                viewModel: self.viewModel,
                                categoryName: categoryNameArr[i],
                                categories: categories
                            )
                        }
                    }
                    .sheet(isPresented: $isPresented, content: {
                        VStack(spacing: 30){
                            Text("All Land Marks").font(.headline).padding()
                            LandMarkListView(filterString: "All", viewModel: self.viewModel)
                        }
                    })
                } else {
                    Image(systemName: "goforward")
                        .imageScale(.large)
                        .padding()
                }
            }
            .onAppear{
                self.viewModel.fetch()
            }
            .navigationBarTitle(Text("Featured"))
            .navigationBarItems(trailing:
                Button(action: {self.isPresented.toggle()}){
                    Image(systemName: "person.crop.circle")
                        .imageScale(.large)
                        .padding()
                }
            )
        }
    }
}

private struct LandMarkRow: View {
    
    @ObservedObject var viewModel:MainViewModel
    var categoryName:String
    var categories: [String: [LandMark]]
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8){
            HStack(alignment: .bottom){
                Text(categoryName.capitalized).font(.headline)
                Spacer()
                NavigationLink(
                    destination: LandMarkListView(filterString: categoryName, viewModel: viewModel)
                ){
                    Text("more").font(.caption).foregroundColor(.gray)
                }.frame(width: 50)
                
            }
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing:16){
                    ForEach(self.categories[categoryName]!){
                        landMarkItem in
                        LandMarkRowItem(viewModel: self.viewModel, landMarkItem: landMarkItem)
                    }
                }
            }
        }
    }
}

private struct LandMarkRowItem: View {
    
    @ObservedObject var viewModel:MainViewModel
    var landMarkItem:LandMark
    var body: some View {
        VStack(alignment: .leading){
            Image(landMarkItem.imagePath)
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(8)
            
            Text(landMarkItem.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
    }
}

#if DEBUG
struct HomePage_Previews:PreviewProvider {
    static var previews: some View{
        Group{
            HomePage()
            HomePage().environment(\.colorScheme, .dark)
        }
    }
}
#endif
