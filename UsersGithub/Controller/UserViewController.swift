//
//  UserViewController.swift
//  UsersGithub
//
//  Created by Glayce on 31/03/20.
//  Copyright © 2020 Glayce. All rights reserved.
//

import UIKit
import Kingfisher

class UserViewController: UIViewController {
    //Controles da view
    @IBOutlet weak var ivAvatar: UIImageView!
    @IBOutlet weak var lbLogin: UILabel!
    @IBOutlet weak var lbEmail: UILabel!
    @IBOutlet weak var lbFollowers: UILabel!
    @IBOutlet weak var lbFollowing: UILabel!
    @IBOutlet weak var btnVerRepositorios: UIButton!
    
    //Variaveis da classe
    var userName: String?
    var repos_url: String = ""
    var email: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnVerRepositorios.isEnabled = false
        
        loadUser()
    }
    
    func loadUser() {
        //Realiza a comunicacao e obtem os dados da api
        GithubAPI.loadUser(userName: userName) { (info) in
            if let info = info {
                self.repos_url = info.repos_url
                self.btnVerRepositorios.isEnabled = true
                
                if let emailTeste = info.email {
                    self.email = emailTeste
                } else {
                    self.email = "E-mail não informado."
                }
                
                //Atribui os valores para os controles da view
                self.lbLogin.text = "Login: \(info.login)"
                self.lbEmail.text = "E-mail: \(self.email)"
                self.lbFollowers.text = "Seguidores: \(info.followers)"
                self.lbFollowing.text = "Seguindo: \(info.following)"
                
                //Define a foto no imageview
                if let urlAvatar = URL(string: info.avatar_url) {
                    //Realiza o download da imagem e apresenta no imageview
                    self.ivAvatar.kf.indicatorType = .activity
                    self.ivAvatar.kf.setImage(with: urlAvatar)
                } else {
                    self.ivAvatar.image = nil
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Envia o conteudo do username para a proxima tela
        let reposTableViewController = segue.destination as! ReposTableViewController
        reposTableViewController.reposUrl = repos_url
        reposTableViewController.userName = userName ?? ""
    }
}
