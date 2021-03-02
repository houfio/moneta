import SwiftUI

extension DetailView {
    class ViewModel: ObservableObject {
        func price(_ listing: Listing, state: StateService) -> Double {
            quote(listing, state: state)?.price ?? 0
        }

        func change(_ listing: Listing, state: StateService) -> Double {
            let q = quote(listing, state: state)

            switch state.range {
            case "1h":
                return q?.percentChange1H ?? 0
            case "24h":
                return q?.percentChange24H ?? 0
            case "7d":
                return q?.percentChange7D ?? 0
            default:
                return 0
            }
        }

        private func quote(_ listing: Listing, state: StateService) -> Quote? {
            listing.quote.first { key, value in
                key == state.currency
            }?.value
        }
    }
}
