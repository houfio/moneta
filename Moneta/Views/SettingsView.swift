import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel = SettingsViewModel()

    var body: some View {
        List {
            Section(header: Text("general")) {
                ListButton(label: "exchange", value: viewModel.currentExchange()!.name, action: {
                    viewModel.showExchanges.toggle()
                })
                    .sheet(isPresented: self.$viewModel.showExchanges) {
                        ExchangeSheet(viewModel: viewModel)
                    }
                ListButton(label: "currency", value: viewModel.currentCurrency()!.symbol.uppercased(), action: {
                    viewModel.showCurrencies.toggle()
                })
                    .sheet(isPresented: self.$viewModel.showCurrencies) {
                        CurrencySheet(viewModel: viewModel)
                    }
            }
            Section(header: Text("portfolio")) {
                Toggle(isOn: self.$viewModel.state.showAmounts) {
                    Text("show_amounts")
                }
            }
        }
            .navigationTitle("settings")
            .listStyle(InsetGroupedListStyle())
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
