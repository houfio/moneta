import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel = ViewModel()

    var body: some View {
        List {
            Section(header: Text("general")) {
                ListButton(label: "currency", value: viewModel.currentCurrency()!.symbol, action: {
                    viewModel.showCurrencies.toggle()
                })
                    .sheet(isPresented: self.$viewModel.showCurrencies) {
                        CurrencySheet(viewModel: viewModel)
                    }
                ListButton(label: "range", value: viewModel.currentCurrency()!.symbol, action: {
                    viewModel.showRanges.toggle()
                })
                    .actionSheet(isPresented: self.$viewModel.showRanges) {
                        ActionSheet(title: Text("ranges"), buttons: [
                            .default(Text("change_1h")),
                            .default(Text("change_24h")),
                            .default(Text("change_7d")),
                            .cancel()
                        ])
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
