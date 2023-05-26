//
//  ContentView.swift
//  LoginApp#1
//
//  Created by Alonso Alas on 5/24/23.
//

import SwiftUI
import Firebase

struct ContentView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    
    var body: some View {
        
        ZStack {
            
            RadialGradient(colors: [.indigo, .black], center: .center, startRadius: 2, endRadius: 650)
            
            RoundedRectangle(cornerRadius: 60, style: .continuous)
                .foregroundStyle(LinearGradient(colors: [.white, .white], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 400, height: 400)
                .rotationEffect(.degrees(135))
                .shadow(color: .purple, radius: 2)
                .offset(x: -100, y: -10)
            
            Image("logo")
                .resizable()
                .frame(width: 100, height: 100)
                .offset(x: 100, y: -250)
            
            VStack{
                VStack{
                    Text("Welcome To")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .bold, design: .rounded))
                        .opacity(0.7)
                    
                    HStack {
                        Text("Health")
                            .foregroundColor(.black)
                            .font(.system(size: 25, weight: .bold, design: .rounded))
                        Text("Care")
                            .foregroundColor(.red)
                            .font(.system(size: 25, weight: .bold, design: .rounded))
                            .opacity(0.8)
                    }// end of hstack for black and red text
                    
                    Text("Please sign in to continue")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                        .opacity(0.6)
                        .offset(x: 10)
                        .padding(.top, 3)
                } // end of vstack for text an etc
                .offset(x: -95, y: -110)
                
                
                Group{
                    TextField("Enter Email", text: $email)
                        .foregroundColor(.purple)
                        .textFieldStyle(.plain)
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true)
                        .textInputAutocapitalization(.never)
                        .frame(width: 250)
                        .overlay(Rectangle().frame(height: 2).padding(.top, 35))
                        .foregroundColor(.darkPurple)
                        .padding(.vertical, 20)
                    
                    SecureField("Enter Password", text: $password)
                        .foregroundColor(.purple)
                        .textFieldStyle(.plain)
                        .disableAutocorrection(true)
                        .textInputAutocapitalization(.never)
                        .frame(width: 250)
                        .overlay(Rectangle().frame(height: 2).padding(.top, 35))
                        .foregroundColor(.darkPurple)
                    
                } //end of group containng buttons and field texts
                .offset(x: -40, y: -80)
                
                // start of sign in and sign out buttons
                HStack {
                    
                    Button {
                        // login function
                        
                    } label: {
                        Text ("Login")
                            .bold()
                            .frame(width: 120, height: 30)
                            .background(
                                RoundedRectangle(cornerRadius: 8, style: .continuous)
                                    .fill(.linearGradient(colors: [.purple, .indigo], startPoint: .top, endPoint: .bottom))
                            )
                            .foregroundColor(.white)
                    }
                    
                    Button {
                        // register function
                        register()
                    } label: {
                        Text ("Signup")
                            .bold()
                            .frame(width: 120, height: 30)
                            .background(
                                RoundedRectangle(cornerRadius: 8, style: .continuous)
                                    .fill(.linearGradient(colors: [.purple, .indigo], startPoint: .top, endPoint: .bottom))
                            )
                            .foregroundColor(.white)
                    }
                } // end of hstack buttons login and logout
                .offset(x: -45, y: -30)
                
                
            } // end of main vstack
            .frame(width: 350)
            
            VStack{
                Text("Or signup using social links")
                    .foregroundColor(.white)
                    .font(.system(size: 12, weight: .bold, design: .rounded))
                    .opacity(0.7)
                    .offset(x: 5)
                    .padding(.top, 3)
                
                Image("128")
                    .resizable()
                    .frame(width: 140, height: 40)
                
            } //end of vstack for social icons
            .offset(x:70, y:280)
            
        } // end of main Zstack
        .ignoresSafeArea()
    }
    
    // Alonso: - start of functions for the buttons

    func register() {
        
        Auth.auth().createUser(withEmail: email, password: password){ result, error in
            if let error = error { // login error
                print("Signup Error \(error.localizedDescription)")
                alertMessage = "Sign Up Error Ocurred \(error.localizedDescription)"
                showingAlert = true
            }else {
                print("Registration successfull")
            }
        }
        
        
    } //end of register function
    
}

extension Color {
    static let darkPurple = Color(red: 208/255, green: 45/255, blue: 208/255)
}

extension View {
    func underlineTextField() -> some View {
        self
            .padding(.vertical, 10)
            .overlay(Rectangle().frame(height: 2).padding(.top, 35))
            .foregroundColor(.darkPurple)
            .padding(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
