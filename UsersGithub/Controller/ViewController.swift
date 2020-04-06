//
//  ViewController.swift
//  UsersGithub
//
//  Created by Glayce on 31/03/20.
//  Copyright © 2020 Glayce. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Controles da view
    @IBOutlet weak var tfUserName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Fecha o teclado ao sair da tela
        tfUserName.resignFirstResponder()

        //Envia o conteudo da textfield para a proxima tela
        let viewUserViewController = segue.destination as! UserViewController
        viewUserViewController.userName = tfUserName.text
    }
}
