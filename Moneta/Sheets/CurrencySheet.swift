import SwiftUI

struct CurrencySheet: View {
    var viewModel: SettingsViewModel

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.fiatCurrencies(), id: \.id) { currency in
                    SelectButton(label: currency.name.capitalized, value: viewModel.isCurrentCurrency(currency), action: {
                        viewModel.state.currency = currency.symbol
                        viewModel.showCurrencies = false
                    })
                }
            }
                .navigationBarTitle(Text("currencies"), displayMode: .inline)
                .listStyle(DefaultListStyle())
        }
    }
}

struct CurrencySheet_Previews: PreviewProvider {
    static var previews: some View {
        CurrencySheet(viewModel: SettingsViewModel())
    }
}
