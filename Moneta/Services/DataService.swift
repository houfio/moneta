import Foundation
import Combine

class DataService: ObservableObject {
    @Published var currencies: Response<Currency>?
    @Published var listings: Response<Listing>? {
        didSet {
            if let encoded = try? JSONEncoder().encode(listings) {
                UserDefaults.standard.set(encoded, forKey: "listings")
            }
        }
    }
    @Published var loading = false

    var cancellables: [AnyCancellable] = []

    func initialize(state: StateService) {
        fetchCurrencies()
        fetchListings(false, state: state)
    }

    func fetchCurrencies() {
        cancellables.append(receiveData("/fiat/map", query: [URLQueryItem(name: "sort", value: "name")]).sink(receiveCompletion: { _ in }, receiveValue: { data in
            self.currencies = data
        }))
    }

    func fetchListings(_ force: Bool = true, state: StateService) {
        if let data = UserDefaults.standard.data(forKey: "listings") {
            if let decoded = try? JSONDecoder().decode(Response<Listing>.self, from: data) {
                listings = decoded
            }
        }

        if (listings != nil && !force) {
            return
        }
        
        loading = true

        cancellables.append(receiveData("/cryptocurrency/listings/latest", query: [URLQueryItem(name: "convert", value: "\(state.currency)")]).sink(receiveCompletion: { completion in
            self.loading = false
        }, receiveValue: { data in
            self.listings = data
        }))
    }

    private func receiveData<T: Decodable>(_ path: String, query: [URLQueryItem] = []) -> AnyPublisher<T, Error> {
        guard let url = createURL(path, query: query) else {
            fatalError("invalid url")
        }

        let decoder = JSONDecoder()

        decoder.keyDecodingStrategy = .convertFromSnakeCase

        var request = URLRequest(url: url)

        request.addValue(Environment.apiKey, forHTTPHeaderField: "X-CMC_PRO_API_KEY")

        return URLSession.shared.dataTaskPublisher(for: request)
            .map { response in
                response.data
            }
            .decode(type: T.self, decoder: decoder)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    private func createURL(_ path: String, query: [URLQueryItem]) -> URL? {
        var components = URLComponents()

        components.scheme = "https"
        components.host = "pro-api.coinmarketcap.com"
        components.path = "/v1\(path)"
        components.queryItems = query

        return components.url
    }
}
