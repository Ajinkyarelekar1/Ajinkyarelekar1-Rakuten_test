//
//  User.swift
//  CartrackChallenge
//
//  Created by venajr on 11/4/21.
//

import Foundation

struct UserResponse: Codable {
    let pagelen: Int
    let values: [User]
}

struct User: Codable {
    let scm: String?
    let website: String?
    let hasWiki: Bool?
    let uuid: String?
    let links: Links?
    let forkPolicy: String?
    let fullName: String?
    let name: String?
    let project: Project?
    let language: String?
    let created_on: String?
    let mainbranch: [String: String]
    let workspace: Workspace?
    let hasIssues: Bool?
    let owner: Owner?
    let updatedOn: String?
    let size: Int?
    let type: String?
    let slug: String?
    let isPrivate: Bool?
    let description: String?
  }

struct Links: Codable {
    let watchers: [String: String]?
    let branches: [String: String]?
    let tags: [String: String]
    let commits: [String: String]
    let clone: [[String: String]]?
    let source: [String: String]?
    let html: [String: String]?
    let avatar: [String: String]?
    let hooks: [String: String]?
    let forks: [String: String]?
    let downloads: [String: String]?
    let pullrequests: [String: String]?
  }

struct Project: Codable {
    let links: Links?
    let type: String?
    let name: String?
    let key: String?
    let uuid: String?
  }

struct Workspace: Codable {
    let slug: String?
    let type: String?
    let name: String?
    let links: Links?
    let uuid: String?
  }

struct Owner: Codable {
    let displayName: String?
    let uuid: String?
    let links: Links?
    let type: String?
    let nickname: String?
    let accountId: String?
  }
