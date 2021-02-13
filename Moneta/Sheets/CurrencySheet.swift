import SwiftUI

struct CurrencySheet: View {
    var viewModel: SettingsViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.viewModel.fiatCurrencies(), id: \.id) { currency in
                    SelectButton(label: currency.name.capitalized, value: self.viewModel.currency == currency.symbol, action: {
                        self.viewModel.currency = currency.symbol
                        self.viewModel.showCurrencies = false
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
