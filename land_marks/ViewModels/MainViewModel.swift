//
//  NetDataViewModel.swift
//  land_marks
//
//  Created by Kara Zu.  L. on 2023/6/14.
//  Copyright © 2023 Kara Zu.  L. All rights reserved.
//

import Foundation
import SwiftUI

struct ResponseData:Hashable, Codable {
    let code:Int
    let data:[LandMark]
}

class MainViewModel: ObservableObject {
    @Published var landMarks:[LandMark] = []
    
    static let categoryNameArr: [String] = ["modern", "ancient", "religious"]
    
    func fetch() {
        guard let url = URL(string: "http://localhost:8000/land_mark.json") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {
            [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let courseData = try
                    JSONDecoder().decode(ResponseData.self, from:data)
                DispatchQueue.main.async {
                    self?.landMarks = courseData.data
                }
            }
            catch {
                print(error)
            }
        }
        
        task.resume()
    }
}
