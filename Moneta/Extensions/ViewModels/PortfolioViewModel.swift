import SwiftUI

extension PortfolioView {
    class ViewModel: ObservableObject {
        func getValue(data: DataService, state: StateService) -> Double {
            let listings = getListings(data: data, state: state)

            return listings.reduce(0) { result, model in
                guard let q = quote(model.listing, state: state) else {
                    return result
                }

                return result + q.price * model.amount
            }
        }

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

        private func quote(_ listing: Listing, state: StateService) -> Quote? {
            listing.quote.first { key, value in
                key == state.currency
            }?.value
        }
    }
}
