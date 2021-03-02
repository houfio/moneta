import SwiftUI

extension SearchView {
    class ViewModel: SearchBar {
        func getListings(data: DataService) -> [Listing]? {
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
    }
}
