//
//  GithubAPI.swift
//  UsersGithub
//
//  Created by Glayce on 31/03/20.
//  Copyright © 2020 Glayce. All rights reserved.
//

import Foundation
import Alamofire

class GithubAPI {
    static private let basePath = "https://api.github.com/users/"
    
    class func loadUser(userName: String?, onComplete: @escaping (Users?) -> Void) {
        let url: String
        
        if let user = userName, !user.isEmpty {
            url = basePath + user
        } else {
            url = ""
        }
        
        //Realiza a comunicacao com a api do github atraves do alamofire
        AF.request(url).responseJSON { (response) in
            //Obtem o retorno da api
            guard let data = response.data else {
                onComplete(nil)
                return
            }
            
            do {
                //Convertendo o tipo para o objeto
                let users = try JSONDecoder().decode(Users.self, from: data)
                onComplete(users)
            } catch {
                print(error.localizedDescription)
                onComplete(nil)
            }
        }
    }
    
    class func loadRepos(reposUrl: String?, onComplete: @escaping ([Repos]?) -> Void) {
        let urlRepos: String
        
        if let repos = reposUrl, !repos.isEmpty {
            urlRepos = repos
        } else {
            urlRepos = ""
        }
                
        //Realiza a comunicacao com a api do github atraves do alamofire
        AF.request(urlRepos).responseJSON { (response) in
            //Obtem o retorno da api
            guard let data = response.data else {
                onComplete(nil)
                return
            }
            
            do {
                //Convertendo o tipo para o objeto
                let repos = try JSONDecoder().decode([Repos].self, from: data)
                onComplete(repos)
            } catch {
                print(error.localizedDescription)
                onComplete(nil)
            }
        }
    }
}
