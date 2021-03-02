import SwiftUI

extension DetailView {
    class ViewModel: ObservableObject {
        func price(_ listing: Listing, state: StateService) -> Double {
            let q = quote(listing, state: state)

            return q.price;
        }

        func change(_ listing: Listing, state: StateService) -> Double {
            let q = quote(listing, state: state)

            switch state.range {
            case "1h":
                return q.percentChange1H
            case "24h":
                return q.percentChange24H
            case "7d":
                return q.percentChange7D
            default:
                fatalError()
            }
        }

        private func quote(_ listing: Listing, state: StateService) -> Quote {
            let quote = listing.quote.first { key, value in
                key == state.currency
            }

            if let q = quote {
                return q.value
            }

            fatalError()
        }
    }
}
