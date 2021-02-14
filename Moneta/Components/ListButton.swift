import SwiftUI

struct ListButton: View {
    var label: LocalizedStringKey
    var value: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Text(label)
                        .foregroundColor(.primary)
                Spacer()
                Text(value)
                        .foregroundColor(Color(.systemGray))
                Image(systemName: "chevron.right")
                        .font(.system(size: 14))
                        .foregroundColor(Color(.systemGray2))
            }
        }
    }
}

struct ListButton_Previews: PreviewProvider {
    static var previews: some View {
        List {
            ListButton(label: "Label", value: "Value", action: {})
        }
    }
}
