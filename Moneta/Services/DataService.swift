import Foundation

class DataService: ObservableObject {
    @Published var loading = false

    @Published var currencies: Currencies
    @Published var cryptocurrencies: Cryptocurrencies

    init() {
        currencies = Bundle.main.decode("fiat.json")
        cryptocurrencies = Bundle.main.decode("listings.json")
    }

    func refreshCryptocurrencies() {
        loading = true
    }

    func refreshCryptocurrency(id: Int) {
        loading = true
    }
}
