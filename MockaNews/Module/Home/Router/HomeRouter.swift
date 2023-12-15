//
//  HomeRouter.swift
//  MockaNews
//
//  Created by Rivaldo Fernandes on 16/12/23.
//

import UIKit

typealias BeginEntry = HomeViewProtocol & UIViewController

protocol HomeRouterProtocol {
    var begin: BeginEntry? { get set }
    
    static func start() -> HomeRouterProtocol
}

