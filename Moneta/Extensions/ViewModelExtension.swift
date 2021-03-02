import Foundation

protocol ViewModelExtension {
    func getChange(_ listing: Listing, state: StateService) -> Double

    func getQuote(_ listing: Listing, state: StateService) -> Quote?
}

extension ViewModelExtension {
    func getChange(_ listing: Listing, state: StateService) -> Double {
        guard let quote = getQuote(listing, state: state) else {
            return 0
        }

        switch state.range {
        case "1h":
            return quote.percentChange1H
        case "24h":
            return quote.percentChange24H
        case "7d":
            return quote.percentChange7D
        default:
            return 0
        }
    }

    func getQuote(_ listing: Listing, state: StateService) -> Quote? {
        listing.quote.first { key, value in
            key == state.currency
        }?.value
    }
}

extension DetailView.ViewModel: ViewModelExtension {
}

extension PortfolioView.ViewModel: ViewModelExtension {
}

extension SearchView.ViewModel: ViewModelExtension {
}

extension SettingsView.ViewModel: ViewModelExtension {
}
