import SwiftUI

extension SearchView {
    class ViewModel: SearchBar {
        func listings(data: DataService) -> [Listing] {
            guard let listings = data.listings else {
                fatalError()
            }

            return listings.data.filter { listing in
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
            let quote = listing.quote.first!

            switch state.range {
            case "1h":
                return quote.value.percentChange1H
            case "24h":
                return quote.value.percentChange24H
            case "7d":
                return quote.value.percentChange7D
            default:
                fatalError()
            }
        }
    }
}
