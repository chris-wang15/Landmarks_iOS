//
//  MapView.swift
//  land_marks
//
//  Created by Kara Zu.  L. on 2023/6/12.
//  Copyright © 2023 Kara Zu.  L. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    let latitude:Double
    let longitude:Double
    
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        MKMapView()
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        uiView.setRegion(
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(
                    latitude: latitude,
                    longitude: longitude
                )
                , span: MKCoordinateSpan(
                    latitudeDelta: 0.02,
                    longitudeDelta: 0.02)
            ),
            animated: true
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(latitude: 48.20328595, longitude: 16.369193411595)
    }
}
