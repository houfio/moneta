import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var data: DataService
    @EnvironmentObject var state: StateService
    @ObservedObject var viewModel = ViewModel()

    var body: some View {
        VStack {
            if let current = viewModel.currentCurrency(data: data, state: state) {
                List {
                    Section(header: Text("general")) {
                        ListButton(label: "currency", value: current.symbol) {
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
                    .listStyle(InsetGroupedListStyle())
            } else {
                ProgressView()
            }
        }
            .navigationTitle("settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
