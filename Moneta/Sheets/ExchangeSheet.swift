import SwiftUI

struct ExchangeSheet: View {
    var viewModel: SettingsViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.viewModel.activeExchanges(), id: \.id) { exchange in
                    SelectButton(label: exchange.name, value: self.viewModel.exchange == exchange.symbol, action: {
                        self.viewModel.exchange = exchange.symbol
                        self.viewModel.showExchanges = false
                    })
                }
            }
            .navigationBarTitle(Text("exchanges"), displayMode: .inline)
            .listStyle(DefaultListStyle())
        }
    }
}

struct ExchangeSheet_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeSheet(viewModel: SettingsViewModel())
    }
}
