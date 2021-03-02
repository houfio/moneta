import SwiftUI

extension SearchView {
    class ViewModel: SearchBar {
        func listings(data: DataService) -> [Listing]? {
            data.listings?.data.filter { listing in
                isSearched(listing)
            }
        }

        func isSearched(_ listing: Listing) -> Bool {
            if text.isEmpty {
                return true
            }

            return listing.name.localizedCaseInsensitiveContains(text) || listing.symbol.localizedCaseInsensitiveContains(text)
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
