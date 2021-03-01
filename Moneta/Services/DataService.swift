import Foundation
import Combine

class DataService: ObservableObject {
    @Published var currencies: Currencies?
    @Published var cryptocurrencies: Cryptocurrencies?
    
    var cancellables: [AnyCancellable] = []

    func initialize(state: StateService) {
        fetchCurrencies()
        fetchCryptocurrencies(state: state)
    }

    func fetchCurrencies() {
        cancellables.append(receiveData("/fiat/map", query: [URLQueryItem(name: "sort", value: "name")]).sink(receiveCompletion: { completion in
            print(completion)
        }, receiveValue: { data in
            self.currencies = data
        }))
    }

    func fetchCryptocurrencies(state: StateService) {
        cancellables.append(receiveData("/cryptocurrency/listings/latest", query: [URLQueryItem(name: "convert", value: "\(state.currency)")]).sink(receiveCompletion: { completion in
            print(completion)
        }, receiveValue: { data in
            self.cryptocurrencies = data
        }))
    }

    func fetchCryptocurrency(id: Int) {
    }

    private func receiveData<T: Decodable>(_ path: String, query: [URLQueryItem] = []) -> AnyPublisher<T, Error> {
        guard let url = createURL(path, query: query) else {
            fatalError()
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
