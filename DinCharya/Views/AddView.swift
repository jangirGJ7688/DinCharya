//
//  AddView.swift
//  DinCharya
//
//  Created by Ganpat Jangir on 02/05/24.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presationMode
    @EnvironmentObject var listVM: ListViewModel
    @State var addItemTitle: String = ""
    @State var isShowAlert: Bool = false
    @State var alertString: String = ""
    var body: some View {
        ScrollView {
            VStack {
                TextField(Constants.addItemPlaceholder, text: $addItemTitle)
                    .frame(height: 55)
                    .font(.system(size: 20,weight: .semibold))
                    .padding(.horizontal)
                    .background(Color(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 0.5)))
                    .cornerRadius(8.0)
                Button(action: submitClick, label: {
                    Text(Constants.submitBtnTitle.uppercased())
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .foregroundColor(.white)
                        .font(.system(size: 20,weight: .bold))
                        .background(Color.accentColor).cornerRadius(8.0)
                })
            }
            .padding(14)
        }
        .navigationTitle(Constants.addNavigationViewTitle)
        .alert(isPresented: $isShowAlert, content: getAlert)
    }
    
    func submitClick() {
        if validText() {
            listVM.addItem(title: addItemTitle)
            presationMode.wrappedValue.dismiss()
        }
    }
    
    func validText() -> Bool{
        if addItemTitle.count < 5 {
            alertString = Constants.emptyItemAlertTitle
            isShowAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        let alert = Alert(title: Text(alertString))
        return alert
    }
}

#Preview {
    NavigationView {
        AddView()
    }
    .environmentObject(ListViewModel(DatabaseManager()))
}
