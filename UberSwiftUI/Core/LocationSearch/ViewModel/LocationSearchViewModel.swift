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
    @Published var selectedLocation: String?
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
    func selectLocation(_ location: String){
        self.selectedLocation = location
    }
}
//MARK: - MKLocalSearchCompleterDelegate
extension LocationSearchViewModel : MKLocalSearchCompleterDelegate{
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
}
