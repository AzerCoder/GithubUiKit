//
//  Model.swift
//  GithubUiKit
//
//  Created by A'zamjon Abdumuxtorov on 24/02/24.
//

import Foundation

struct User: Codable {
    let login: String
    let name: String?
    let followers: Int
    let following: Int
    let location: String?
    let publicRepos: Int?
    let company: String?
    let avatarUrl: String?
    let bio: String?

    enum CodingKeys: String, CodingKey {
        case login, name, followers, following, location, company,bio
        case publicRepos = "public_repos"
        case avatarUrl = "avatar_url"
    }
}

