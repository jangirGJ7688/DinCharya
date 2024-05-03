//
//  HomeView.swift
//  DinCharya
//
//  Created by Ganpat Jangir on 02/05/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var listVM: ListViewModel
    var body: some View {
        ZStack {
            if listVM.items.isEmpty {
                EmptyItemsView()
                    .transition(AnyTransition.opacity.animation(.easeInOut))
            }else {
                List {
                    ForEach(listVM.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear){
                                    listVM.markTaskDone(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listVM.deleteItem)
                    .onMove(perform: listVM.moveItem)
                }
                .listStyle(.plain)
                .padding()
                .navigationBarItems(leading: EditButton(), trailing: NavigationLink(Constants.addItemBtnTitle, destination: AddView()))
            }
        }
        .navigationTitle(Constants.navigationViewTitle)
    }
}

#Preview {
    NavigationView{
        HomeView()
    }
    .environmentObject(ListViewModel(DatabaseManager()))
}
