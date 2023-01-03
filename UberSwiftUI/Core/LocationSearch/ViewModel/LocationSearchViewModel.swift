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
    @Published var selectedLocationCoordinate: CLLocationCoordinate2D?
    private let searchCompleter = MKLocalSearchCompleter()
    var queryFragment: String = "" {
        didSet{
            searchCompleter.queryFragment = queryFragment
        }
    }
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
            self.selectedLocationCoordinate = coordinate
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
}
//MARK: - MKLocalSearchCompleterDelegate
extension LocationSearchViewModel : MKLocalSearchCompleterDelegate{
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
}
