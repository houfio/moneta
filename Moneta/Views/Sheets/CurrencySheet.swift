import SwiftUI

struct CurrencySheet: View {
    var viewModel: SettingsView.ViewModel

    var body: some View {
        NavigationView {
            List(viewModel.state.currencies.data, id: \.id) { currency in
                SelectButton(label: currency.name.capitalized, value: viewModel.isCurrentCurrency(currency), action: {
                    viewModel.state.currency = currency.id
                    viewModel.showCurrencies = false
                })
            }
                .navigationBarTitle(Text("currencies"), displayMode: .inline)
                .listStyle(DefaultListStyle())
        }
    }
}

struct CurrencySheet_Previews: PreviewProvider {
    static var previews: some View {
        CurrencySheet(viewModel: SettingsView.ViewModel())
    }
}