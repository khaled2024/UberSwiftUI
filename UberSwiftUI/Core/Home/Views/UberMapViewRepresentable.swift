//
//  UberMapViewRepresentable.swift
//  UberSwiftUI
//
//  Created by KhaleD HuSsien on 25/12/2022.
//

import SwiftUI
import MapKit

struct UberMapViewRepresentable: UIViewRepresentable{
    let mapView = MKMapView()
    @EnvironmentObject var locationViewModel: LocationSearchViewModel
    // here we init the locationManager & can update the location...
    let locationManager = LocationManager()
    // this incharge to make our map view
    func makeUIView(context: Context) -> some UIView {
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        return mapView
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if let selectedLocation = locationViewModel.selectedLocation{
            print("selected location in map view \(selectedLocation)")
        }
    }
    func makeCoordinator() -> MapCoordinator{
        return MapCoordinator(parent: self)
    }
}
//MARK: - Extension
extension UberMapViewRepresentable{
    class MapCoordinator: NSObject,MKMapViewDelegate{
        let parent: UberMapViewRepresentable
        
        init(parent: UberMapViewRepresentable) {
            self.parent = parent
            super.init()
        }
        // Function
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            let region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            parent.mapView.setRegion(region, animated: true)
        }
    }
}
