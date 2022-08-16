//
//  VenueListView.swift
//  Foursquare Venues
//
//  Created by Mohamed El Gedawy on 14/08/2022.
//

import SwiftUI

struct VenueListView: View {
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: VenueListViewModel
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var radiusSlider: Double = 1000
    
    // MARK: - Init
    
    init(viewModel: VenueListViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Body
    
    var body: some View {
        
        VStack {
            Spacer()
            Slider(value: $radiusSlider, in: 0...10000, step: 1000, onEditingChanged: { editingChanged in
                if !editingChanged {
                    viewModel.requestVenuesList(radius: Int(radiusSlider))
                }
            })
            
            Text("\(Int32(radiusSlider)/1000) KM")
                .padding()
            
            List {
                ForEach(viewModel.venues, id: \.id) { venue in
                    VenueRow(name: venue.name, distance: venue.distance)
                }
            }
        }
        .onReceive(viewModel.errorSubject, perform: { _ in
            showAlert = true
            alertMessage = viewModel.errorMessageSubject.value
        })
        .alert(isPresented: $showAlert) {
            Alert(title: Text(""), message: Text("\(alertMessage)"), dismissButton: .default(Text("OK")))
        }
        
    }
}

// MARK: - Venue Row

struct VenueRow: View {
    
    // MARK: - Init
    
    var name: String
    var distance: Int
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            Text("\(name)")
            Spacer()
            Text("\(distance)M")
        }
    }
}

struct VenueListView_Previews: PreviewProvider {
    static var previews: some View {
        let repo = VenuesListRepository()
        let useCase = VenuesListUseCase(venuesListRepo: repo)
        let viewModel = VenueListViewModel(venuesListUseCase: useCase)
        VenueListView(viewModel: viewModel)
    }
}
