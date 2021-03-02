import SwiftUI

struct PriceHeader: View {
    @EnvironmentObject var data: DataService
    @EnvironmentObject var state: StateService
    var value: Double
    var change: Double
    var show = true

    private var sign: String {
        data.currencies?.data.first { currency in
            currency.symbol == state.currency
        }?.sign ?? "€"
    }

    var body: some View {
        HStack {
            Spacer()
            Text("\(sign)\(String(format: "%.2f", value))")
                .font(.title)
                .blur(radius: show ? 0 : 10)
            Pill(value: change)
            Spacer()
        }
            .padding(.vertical, 20)
    }
}

struct PriceHeader_Previews: PreviewProvider {
    static var previews: some View {
        PriceHeader(value: 1000, change: 50)
    }
}
