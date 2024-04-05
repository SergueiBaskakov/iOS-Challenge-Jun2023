//
//  MapView.swift
//  
//
//  Created by Serguei Diaz on 24.06.2023.
//

import SwiftUI
import CoreLocation
import MapKit
import Kingfisher
import Utils

struct MapView: View {
    
    let pin: Pin
    
    init(_ data: Pin) {
        self.pin = data
    }
    
    var body: some View {
        MapWrapper(pin: pin, region: MKCoordinateRegion(center: pin.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)))
            
    }
    
}

extension MapView {
    struct MapWrapper: View {
        let pin: Pin
        
        @State var region: MKCoordinateRegion
        
        var body: some View {
            Map(coordinateRegion: $region, annotationItems: [pin]) {
                MapPin( coordinate: $0.coordinate)
            }
            .navigationBar(title: "Mapa")
        }
    }
    
    struct Pin: Identifiable {
        let id = UUID()
        let name: String
        let coordinate: CLLocationCoordinate2D
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(.init(name: "TestPin", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275)))
            .preferredColorScheme(.light)
        
    }
}
