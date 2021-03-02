import SwiftUI

struct CurrencySheet: View {
    var data: DataService
    var state: StateService
    var viewModel: SettingsView.ViewModel

    var body: some View {
        NavigationView {
            VStack {
                if let currencies = data.currencies {
                    List(currencies.data, id: \.id) { currency in
                        SelectButton(label: currency.name.capitalized, value: viewModel.isCurrentCurrency(currency, state: state)) {
                            viewModel.updateCurrency(currency, data: data, state: state)
                        }
                    }
                } else {
                    ProgressView()
                }
            }
                .navigationTitle("currencies")
                .navigationBarTitleDisplayMode(.inline)
                .listStyle(DefaultListStyle())
        }
    }
}

struct CurrencySheet_Previews: PreviewProvider {
    static var previews: some View {
        CurrencySheet(data: DataService(), state: StateService(), viewModel: SettingsView.ViewModel())
    }
}
