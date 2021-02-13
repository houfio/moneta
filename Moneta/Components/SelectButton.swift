import SwiftUI

struct SelectButton: View {
    var label: String
    var value: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(self.label)
                Spacer()
                if self.value {
                    Image(systemName: "checkmark")
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
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
