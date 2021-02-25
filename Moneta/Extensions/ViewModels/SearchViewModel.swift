import SwiftUI

extension SearchView {
    class ViewModel: SearchBar {
        func currencies(data: DataService) -> [Cryptocurrency] {
            data.cryptocurrencies.data.filter { currency in
                isSearched(currency)
            }
        }

        func isSearched(_ currency: Cryptocurrency) -> Bool {
            if text.isEmpty {
                return true
            }

            return currency.name.localizedCaseInsensitiveContains(text) || currency.symbol.localizedCaseInsensitiveContains(text)
        }

        func change(_ currency: Cryptocurrency, state: StateService) -> Double {
            let range = state.range!
            let quote = currency.quote.first!

            switch range {
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

        func positive(_ currency: Cryptocurrency, state: StateService) -> Bool {
            change(currency, state: state) >= 0
        }

        func difference(_ currency: Cryptocurrency, state: StateService) -> String {
            "\(String(format: "%.2f", change(currency, state: state)))%"
        }
    }
}
