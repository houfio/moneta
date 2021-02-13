import SwiftUI

struct CurrencySheet: View {
    var viewModel: SettingsViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.viewModel.currencies(), id: \.self) { currency in
                    SelectButton(label: currency.uppercased(), value: self.viewModel.currency == currency, action: {
                        self.viewModel.currency = currency
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
