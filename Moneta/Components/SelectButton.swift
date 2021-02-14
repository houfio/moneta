import SwiftUI

struct SelectButton: View {
    var label: String
    var value: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Text(label)
                Spacer()
                if value {
                    Image(systemName: "checkmark")
                            .foregroundColor(.blue)
                            .font(.system(size: 16, weight: .medium))
                }
            }
        }
    }
}

struct SelectButton_Previews: PreviewProvider {
    static var previews: some View {
        SelectButton(label: "Label", value: true, action: {})
    }
}
