import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var viewModel: SettingsViewModel
    @ObservedObject var searchBar = SearchBar()
    
    var body: some View {
        List {
            Section(header: Text("general")) {
                ListButton(label: "exchange", value: self.viewModel.currentExchange()!.name, action: {
                    self.viewModel.showExchanges.toggle()
                })
                .sheet(isPresented: self.$viewModel.showExchanges) {
                    ExchangeSheet(viewModel: self.viewModel)
                }
                ListButton(label: "currency", value: self.viewModel.currentCurrency()!.symbol.uppercased(), action: {
                    self.viewModel.showCurrencies.toggle()
                })
                .sheet(isPresented: self.$viewModel.showCurrencies) {
                    CurrencySheet(viewModel: self.viewModel)
                }
            }
            Section(header: Text("portfolio")) {
                Toggle(isOn: self.$viewModel.showAmounts) {
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
            .environmentObject(SettingsViewModel())
    }
}
