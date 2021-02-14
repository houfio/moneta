import SwiftUI

struct ExchangeSheet: View {
    var viewModel: SettingsViewModel

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.activeExchanges(), id: \.id) { exchange in
                    SelectButton(label: exchange.name, value: viewModel.isCurrentExchange(exchange), action: {
                        viewModel.state.exchange = exchange.symbol
                        viewModel.showExchanges = false
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
