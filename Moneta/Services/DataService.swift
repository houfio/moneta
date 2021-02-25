import Foundation

class DataService: ObservableObject {
    var currencies: Currencies
    var cryptocurrencies: Cryptocurrencies

    init() {
        currencies = Bundle.main.decode("fiat.json")
        cryptocurrencies = Bundle.main.decode("listings.json")
    }
}
