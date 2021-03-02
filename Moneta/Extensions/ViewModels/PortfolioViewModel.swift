import SwiftUI

extension PortfolioView {
    class ViewModel: ObservableObject {
        func getListings(data: DataService, state: StateService) -> [PortfolioModel] {
            state.portfolio.compactMap { key, value -> PortfolioModel? in
                guard let listing = data.listings?.data.first(where: { listing in
                    listing.symbol == key
                }) else {
                    return nil
                }

                guard let amount = Double(value) else {
                    return nil
                }

                return PortfolioModel(listing: listing, amount: amount)
            }.sorted { a, b in
                a.listing.cmcRank < b.listing.cmcRank
            }
        }
    }
}
