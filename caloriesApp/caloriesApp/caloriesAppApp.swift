
import SwiftUI
import Firebase

@main
struct caloriesAppApp: App {
    @StateObject var viewModel = AuthViewModel()
    @StateObject var vm : cddatamodel = cddatamodel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(cddatamodel())
                .environmentObject(viewModel)
            
        }
    }
}
