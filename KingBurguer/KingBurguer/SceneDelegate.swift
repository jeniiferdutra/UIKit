//
//  SceneDelegate.swift
//  KingBurguer
//
//  Created by Jenifer Rocha on 06/09/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow? // <- storyboard colocava a viewcontroller nesse objeto


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let viewModel = SigninViewModel()
        // O ViewModel serve como um intermediário entre a View (interface gráfica) e os dados (Model). Ele não interage diretamente com a interface, mas processa os dados que a View vai exibir e lida com eventos da interface (como cliques em botões ou entradas do usuário)
        
        let signinVC = SigninViewController() // criar a instancia e associando o viewmodel a controladora de visualizacao
        signinVC.viewModel = viewModel
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds) // frame: largura e altura do iphone
        window?.rootViewController =  signinVC// controlador principal 
        window?.windowScene = windowScene // cena principal do app
        window?.makeKeyAndVisible() // se nao chamar a tela n aparece
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

