import SwiftUI

extension PortfolioView {
    class ViewModel: ObservableObject {
        func getTotalValue(data: DataService, state: StateService) -> Double {
            getListings(data: data, state: state).reduce(0) { result, model in
                guard let q = getQuote(model.listing, state: state) else {
                    return result
                }

                return result + q.price * model.amount
            }
        }

        func getTotalChange(data: DataService, state: StateService) -> Double {
            let value = getTotalValue(data: data, state: state)

            return getListings(data: data, state: state).reduce(0) { result, model in
                guard let quote = getQuote(model.listing, state: state) else {
                    return result
                }

                let worth = quote.price * model.amount
                let weight = 1 / value * worth

                return result + getChange(model.listing, state: state) * weight
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

        func isEmpty(state: StateService) -> Bool {
            state.portfolio.isEmpty
        }
    }
}
