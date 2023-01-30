//
//  ContentView.swift
//  FaceIDTest
//
//  Created by Bradlee King on 26/10/2022.
//

import SwiftUI
import LocalAuthentication

struct ContentView: View {
    @ObservedObject var appContext: AppContext
    let friends = ["Antoine", "Bas", "Curt", "Dave", "Erica"]
    
    var body: some View {
        
        NavigationStack {
            if !appContext.appUnlocked {
                FaceIDView
            }else {
                ListView
            }
        }
        
    }
    
    
    
    
    var HomeView: some View {
        VStack{
            Text("HomeView")
        }
    }
    
    
    var ListView: some View {
        NavigationStack {
            List {
                ForEach(friends, id: \.self) { friend in
                    Text(friend)
                        .swipeActions(allowsFullSwipe: false) {
                            Button {
                                print("Muting conversation")
                            } label: {
                                Label("Mute", systemImage: "bell.slash.fill")
                            }
                            .tint(.indigo)
                            
                            Button(role: .destructive) {
                                print("Deleting conversation")
                            } label: {
                                Label("Delete", systemImage: "trash.fill")
                            }
                        }
                }
            }
        }
    }
    
    var FaceIDView: some View {
        VStack(spacing: 24) {
            Image(systemName: "faceid")
                .resizable()
                .frame(width: 75, height: 75)
            
            Button(action: {
                appContext.requestBiometricUnlock()
            }, label: {
                HStack {
                    Spacer()
                    Text("Login now")
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(10)
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            })
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(appContext: AppContext())
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}



struct HomeView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "gear")
            }
        }
    }
}
