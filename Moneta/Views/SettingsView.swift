import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var data: DataService
    @EnvironmentObject var state: StateService
    @ObservedObject var viewModel = ViewModel()

    var body: some View {
        List {
            Section(header: Text("general")) {
                ListButton(label: "currency", value: viewModel.currentCurrency(data: data, state: state).symbol) {
                    viewModel.showCurrencies.toggle()
                }
                    .sheet(isPresented: self.$viewModel.showCurrencies) {
                        CurrencySheet(data: data, state: state, viewModel: viewModel)
                    }
                HStack {
                    Text("range")
                    Picker("range", selection: $state.range) {
                        ForEach(viewModel.ranges, id: \.self) { range in
                            Text(range).tag(range as String?)
                        }
                    }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding(.leading, 10)
                }
            }
            Section(header: Text("portfolio")) {
                Toggle(isOn: $state.showAmounts) {
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
