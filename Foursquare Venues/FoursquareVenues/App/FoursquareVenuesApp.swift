//
//  Foursquare_VenuesApp.swift
//  Foursquare Venues
//
//  Created by Mohamed El Gedawy on 11/08/2022.
//

import SwiftUI

@main
struct FoursquareVenuesApp: App {
    var body: some Scene {
        let repo = VenuesListRepository()
        let useCase = VenuesListUseCase(venuesListRepo: repo)
        let viewModel = VenueListViewModel(venuesListUseCase: useCase)
        WindowGroup {
            VenueListView(viewModel: viewModel)
        }
    }
}
