import SwiftUI

extension PortfolioView {
    class ViewModel: ObservableObject {
        func value(data: DataService, state: StateService) -> Double {
            listings(data: data, state: state).reduce(0) { result, model in
                guard let q = quote(model.listing, state: state) else {
                    return result
                }

                return result + q.price * model.amount
            }
        }

        func change(data: DataService, state: StateService) -> Double {
            let v = value(data: data, state: state)

            return listings(data: data, state: state).reduce(0) { result, model in
                guard let q = quote(model.listing, state: state) else {
                    return result
                }

                var percent: Double {
                    switch state.range {
                    case "1h":
                        return q.percentChange1H
                    case "24h":
                        return q.percentChange24H
                    case "7d":
                        return q.percentChange7D
                    default:
                        return 0
                    }
                }
                let worth = q.price * model.amount
                let weight = 1 / v * worth;
                let weightedPercent = percent * weight;

                return result + weightedPercent
            }
        }

        func listings(data: DataService, state: StateService) -> [PortfolioModel] {
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
