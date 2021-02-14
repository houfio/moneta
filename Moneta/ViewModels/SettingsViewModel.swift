import SwiftUI
import Resolver

class SettingsViewModel: ObservableObject {
    @Injected var state: StateService

    @Published var showExchanges = false
    @Published var showCurrencies = false
    @Published var showCoins = false

    func activeExchanges() -> [Exchange] {
        state.exchanges.result.filter { exchange in
            exchange.active
        }.sorted { a, b in
            a.symbol < b.symbol
        }
    }

    func currentExchange() -> Exchange? {
        activeExchanges().first { exchange in
            exchange.symbol == state.exchange
        }
    }

    func isCurrentExchange(_ exchange: Exchange) -> Bool {
        exchange.symbol == state.exchange
    }

    func fiatCurrencies() -> [Asset] {
        state.assets.result.filter { asset in
            asset.fiat
        }.sorted { a, b in
            a.symbol < b.symbol
        }
    }

    func currentCurrency() -> Asset? {
        fiatCurrencies().first { asset in
            asset.symbol == state.currency
        }
    }

    func isCurrentCurrency(_ currency: Asset) -> Bool {
        currency.symbol == state.currency
    }
}
