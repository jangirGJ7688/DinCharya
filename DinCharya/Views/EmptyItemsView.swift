//
//  EmptyItemsView.swift
//  DinCharya
//
//  Created by Ganpat Jangir on 03/05/24.
//

import SwiftUI

struct EmptyItemsView: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text(Constants.noTaskToShow)
                    .font(.title)
                    .fontWeight(.bold)
                Text(Constants.noTaskToShowSubtitle)
                    .font(.title3)
                    .padding(.bottom,20)
                NavigationLink(destination: AddView()) {
                    Text(Constants.addSomething.uppercased())
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color.accentColor : Color.secondaryAccent)
                        .cornerRadius(10)
                }
                .padding(.horizontal,animate ? 30 : 50)
                .scaleEffect(animate ? 1.1 : 1.0)
                .shadow(color: animate ? Color.accentColor.opacity(0.5) : Color.secondaryAccent.opacity(0.5),
                        radius: animate ? 30 : 10,
                        x: 5,
                        y: animate ? 30 : 50)
                .offset(y: animate ? -5 : 0)
            }
            .frame(maxWidth: 400)
            .padding(40)
            .multilineTextAlignment(.center)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else {
            return
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    NavigationView() {
        EmptyItemsView()
            .navigationTitle("Title")
    }
}
