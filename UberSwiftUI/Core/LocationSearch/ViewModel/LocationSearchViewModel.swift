//
//  LocationSearchViewModel.swift
//  UberSwiftUI
//
//  Created by KhaleD HuSsien on 02/01/2023.
//

import SwiftUI
import MapKit
class LocationSearchViewModel: NSObject,ObservableObject {
    //MARK: - proparties
    @Published var results = [MKLocalSearchCompletion]()
    @Published var selectedUberLocation: UberLocation?
    @Published var pickUpTime: String?
    @Published var dropOffTime: String?
    private let searchCompleter = MKLocalSearchCompleter()
    var queryFragment: String = "" {
        didSet{
            searchCompleter.queryFragment = queryFragment
        }
    }
    var userLocation: CLLocationCoordinate2D?
    override init() {
        super.init()
        // for delegate and protocol
        searchCompleter.delegate = self
        searchCompleter.queryFragment = queryFragment
    }
    //MARK: - func
    func selectLocation(_ localSearch: MKLocalSearchCompletion){
        locationSearch(forLocalSearchCompletion: localSearch) { response, error in
            if let error = error {
                print("error failed location search \(error.localizedDescription)")
                return
            }
            guard let item = response?.mapItems.first else{return}
            let coordinate = item.placemark.coordinate
            self.selectedUberLocation = UberLocation(title: localSearch.title, coordinate: coordinate)
            print("coordinates is \(coordinate)")
        }
    }
    func locationSearch(forLocalSearchCompletion localSeach: MKLocalSearchCompletion, completion: @escaping MKLocalSearch.CompletionHandler){
        let searchrequest = MKLocalSearch.Request()
        // هنا بيسرش علي الاحداثيات بتاعت اللوكيشن بالتايتل والصب تايتل...
        searchrequest.naturalLanguageQuery = localSeach.title.appending(localSeach.subtitle)
        let search = MKLocalSearch(request: searchrequest)
        search.start(completionHandler: completion)
    }
    func computeRidePrice(forType type: RideType)-> Double{
        guard let coordinate = selectedUberLocation?.coordinate else{ return 0.0}
        guard let Location = self.userLocation else { return 0.0}
        // lat and long...
        let userLocation = CLLocation(latitude: Location.latitude, longitude: Location.longitude)
        let destination = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        // trip with meters...
        let tripDistanceWithMeters = userLocation.distance(from: destination)
        print("tripDistanceWithMeters: \(tripDistanceWithMeters)")
        return type.computePrice(for: tripDistanceWithMeters)
        
    }
    // getdestinationRoute...
    func getdestinationRoute(from userLocation: CLLocationCoordinate2D,
                             to destination: CLLocationCoordinate2D,
                             completion: @escaping(MKRoute)-> Void){
        let userPlacemark = MKPlacemark(coordinate: userLocation)
        let destPlacemark = MKPlacemark(coordinate: destination)
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: userPlacemark)
        request.destination = MKMapItem(placemark: destPlacemark)
        let directions = MKDirections(request: request)
        
        directions.calculate { response, error in
            if let error = error{
                print("failed to get directions with \(error.localizedDescription)")
                return
            }
            guard let route = response?.routes.first else{return}
            // here configPickupAndDropoffTimes
            self.configPickupAndDropoffTimes(with: route.expectedTravelTime)
            completion(route)
        }
    }
    func configPickupAndDropoffTimes(with expectedTravelTime: Double){
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        
        pickUpTime = formatter.string(from: Date())
        dropOffTime = formatter.string(from: Date() + expectedTravelTime)
    }
}
//MARK: - MKLocalSearchCompleterDelegate
extension LocationSearchViewModel : MKLocalSearchCompleterDelegate{
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
}
