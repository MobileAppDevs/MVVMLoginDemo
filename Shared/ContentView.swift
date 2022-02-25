//
//  ContentView.swift
//  Shared
//
//  Created by Ongraph on 25/02/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
          CustomController()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CustomController :UIViewControllerRepresentable{
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let Vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
        let navi = UINavigationController(rootViewController: Vc)
        return navi
    }
}
