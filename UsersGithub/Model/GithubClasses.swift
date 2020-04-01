//
//  GithubClasses.swift
//  UsersGithub
//
//  Created by Glayce on 31/03/20.
//  Copyright © 2020 Glayce. All rights reserved.
//

import Foundation

struct Users: Codable {
    let login: String
    let avatar_url: String
    let repos_url: String
    let email: String
    let followers: Int
    let following: Int
}

struct Repos: Codable {
    let name: String
    let language: String
    let description: String
}
