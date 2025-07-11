
import SwiftUI

struct SearchBarView: View {
    @Environment(\.colorScheme) var colorScheme
    
    enum FocusedField {
        case search
    }
    
    @Binding var text: String
    var prompt: String
    var isShownInSheet: Bool
    
    @FocusState private var focusedField: FocusedField?
    @State private var isShowingXButton = false
    @State private var isShowingCancelButton = false
    
    init(text: Binding<String>, prompt: String = "Search", isShownInSheet: Bool = false) {
        _text = text
        self.prompt = prompt
        self.isShownInSheet = isShownInSheet
    }
    
    var body: some View {
        HStack {
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField(prompt, text: $text)
                        .focused($focusedField, equals: .search)
                        .foregroundStyle(Color.primary)
                }
                .onTapGesture {
                    focusedField = .search
                }
                if isShowingXButton {
                    Button {
                        text = ""
                        focusedField = .search
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .foregroundStyle(Color(hex: "#87868B"))
            .padding(.horizontal, 6)
            .frame(height: 35)
            .background(isShownInSheet ? Color(.systemGray6) : Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .onChange(of: text) {
                if !text.isEmpty {
                    withAnimation {
                        isShowingXButton = true
                    }
                } else {
                    withAnimation {
                        isShowingXButton = false
                    }
                }
            }
            .onChange(of: focusedField) {
                withAnimation(.easeInOut(duration: 0.3)) {
                    isShowingCancelButton.toggle()
                }
            }
            
            if isShowingCancelButton {
                Button {
                    focusedField = nil
                    text = ""
                } label: {
                    Text("Cancel")
                        .font(.system(size: 18))
                        .foregroundStyle(Color.primary)
                }
                .buttonStyle(PlainButtonStyle())
                .transition(.move(edge: .trailing).combined(with: .opacity))
                .padding(.leading, 2)
                .frame(height: 35)
            }
        }
    }
}

//#Preview {
//    @Previewable @State var searchText: String = ""
//    @Previewable @State var showSheet = false
//    NavigationStack {
//        VStack {
//            SearchBarView(text: $searchText)
//                .padding(.horizontal)
//                .searchable(text: $searchText)
//            Spacer()
//            Button("Show Sheet") {
//                showSheet = true
//            }
//            .sheet(isPresented: $showSheet) {
//                NavigationStack {
//                    VStack {
//                        SearchBarView(text: $searchText, isShownInSheet: true)
//                            .padding(.horizontal)
//                        Spacer()
//                    }
//                    .searchable(text: $searchText)
//                }
//            }
//            Spacer()
//        }
//        .searchable(text: $searchText)
//    }
//}
