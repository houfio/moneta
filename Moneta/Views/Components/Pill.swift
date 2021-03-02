import SwiftUI

struct Pill: View {
    var value: Double

    var body: some View {
        Text("\(value >= 0 ? "+" : "")\(String(format: "%.2f", value))%")
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .foregroundColor(Color(.systemBackground))
            .background(Color(value >= 0 ? .systemGreen : .systemRed))
            .clipShape(Capsule())
    }
}

struct Pill_Previews: PreviewProvider {
    static var previews: some View {
        Pill(value: 100)
    }
}
