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
                HStack {
                    Text("range")
                    Picker("range", selection: $viewModel.state.range) {
                        ForEach(viewModel.ranges, id: \.self) { range in
                            Text(range).tag(range as String?)
                        }
                    }
                        .pickerStyle(SegmentedPickerStyle())
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
