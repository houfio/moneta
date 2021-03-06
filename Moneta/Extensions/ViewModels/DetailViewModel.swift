import SwiftUI

extension DetailView {
    class ViewModel: ObservableObject {
        @Published var showAmount = false
        @Published var amount = ""

        func initialize(_ listing: Listing, state: StateService) {
            amount = state.portfolio.first { key, value in
                key == listing.symbol
            }?.value ?? "0"
        }

        func getPrice(_ listing: Listing, state: StateService) -> Double {
            getQuote(listing, state: state)?.price ?? 0
        }

        func getMarketCap(_ listing: Listing, data: DataService, state: StateService) -> String {
            let cap = getQuote(listing, state: state)?.marketCap ?? 0
            let sign = data.currencies?.data.first { currency in
                currency.symbol == state.currency
            }?.sign ?? "€"

            return "\(sign)\(String(format: "%.2f", cap))"
        }

        func getAmount(_ listing: Listing, state: StateService) -> String {
            let value = Double(state.portfolio[listing.symbol] ?? "0") ?? 0

            return String(format: "%.2f", value)
        }

        func updatePortfolio(_ listing: Listing, amount: String, state: StateService) {
            state.portfolio[listing.symbol] = amount == "0" ? nil : amount
            showAmount = false
        }
        
        func getDetailUrl(_ listing: Listing) -> String {
            "https://coinmarketcap.com/currencies/\(listing.slug)/"
        }
    }
}
