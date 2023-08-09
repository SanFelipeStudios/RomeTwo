import AuthenticationServices
import RealmSwift
import SwiftUI
import os

//extension View {
//    func Print(_ vars: Any...) -> some View {
//        var log = ""
//        for v in vars { log.append("\(v) | ") }
//        print(log)
//        return EmptyView()
//    }
//}
//
//struct LoginView: View {
//
//    @AppStorage("userId") var userId: String = ""
//
//    private var isSignedIn: Bool {
//        !userId.isEmpty
//    }
//
//    // Hold an error if one occurs so we can display it.
//    @State var error: Error?
//    
//    // Keep track of whether login is in progress.
//    @State var isLoggingIn = false
//
//    var body: some View {
//        
//        
//        VStack {
//            if isLoggingIn {
//                let _ = Print(String(describing: LoginView.self),
//                      "User is logging in...")
//                ProgressView()
//            } else {
//                let _ = Print(String(describing: LoginView.self),
//                      "User is NOT logging in...", "isSignedIn: \(isSignedIn)")
//            }
//            
//            if let error = error {
//                let _ = Print(String(describing: LoginView.self),
//                      "Error in Login View: \(error.localizedDescription)")
//                Text("Error: \(error.localizedDescription)")
//            }
//
//            if !isSignedIn {
//                let _ = Print(String(describing: LoginView.self),
//                      "Awaiting for user sign in")
//                SignInWithAppleButtonView(isLoggingIn: $isLoggingIn)
//                SignInAnonymouslyButtonView(isLoggingIn: $isLoggingIn, error: $error)
//            }
//        }
//    }
//}

//struct SignInWithAppleButtonView: View {
//    @Binding var isLoggingIn: Bool
//
//    // Ability to support light and dark mode
//    // Here we are Observing the 'colorScheme' environment
//    @Environment(\.colorScheme) var colorScheme
//
//    @AppStorage("userId") var userId: String = ""
//    @AppStorage("email") var email: String = ""
//    @AppStorage("firstName") var firstName: String = ""
//    @AppStorage("lastName") var lastName: String = ""
//
//    var body: some View {
//        SignInWithAppleButton(.continue) { request in
//            isLoggingIn = true
//
//            // What scopes do we want to get out of the request (What user info)
//            request.requestedScopes = [.email, .fullName]
//
//        } onCompletion: { result in
//            switch result {
//            case .success(let auth):
//
//                guard let credentials = auth.credential as? ASAuthorizationAppleIDCredential, let identityToken = credentials.identityToken, let identityTokenString = String(data: identityToken, encoding: .utf8) else { return }
//
//                switch auth.credential {
//                case let credential as ASAuthorizationAppleIDCredential:
//                    // The userId is the only information your app gets if the user deletes your app and signs in again
//                    self.userId = credential.user
//
//                    // This information is only collected the FIRST time a user signs in to your app
//                    // Make sure to cache these in either your app or your database
//                    self.email = credential.email ?? ""
//                    self.firstName = credential.fullName?.givenName ?? ""
//                    self.lastName = credential.fullName?.familyName ?? ""
//
//                    sign(token: identityTokenString)
//
//                default:
//                    break
//                }
//
//            case .failure(let error):
//                let _ = Print(String(describing: SignInWithAppleButtonView.self),
//                      "Error: \(error)")
//            }
//
//        }
//        .signInWithAppleButtonStyle(
//                colorScheme == .dark ? .white : .black)
//        .frame(height: 50)
//        .padding()
//        .cornerRadius(8)
//        .disabled(isLoggingIn)
//    }
//
//    func sign(token: String) {
//
//        // Fetch IDToken via the Apple SDK
//        let credentials = Credentials.apple(idToken: token)
//        app?.login(credentials: credentials) { (result) in
//            switch result {
//            case .failure(let error):
//                let _ = Print(String(describing: SignInWithAppleButtonView.self),
//                      "Login failed: \(error.localizedDescription)")
//            case .success(let user):
//                let _ = Print(String(describing: SignInWithAppleButtonView.self),
//                      "Successfully logged in as user: \(user)")
//                // Now logged in, do something with user
//                // Remember to dispatch to main if you are doing anything on the UI thread
//            }
//        }
//
//    }
//}
//
//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}

