//
//  FakeTodoService.swift
//  CleanTodoList
//
//  Created by Guye Raphael, I233 on 11.06.21.
//

import Foundation
import Combine

class FakeTodoService : TodosService {
    
    func getAll() -> AnyPublisher<[Todo], Error> {
        return fetchTodos().eraseToAnyPublisher()
    }
    
    func get(_ todoId: String) -> AnyPublisher<Todo?, Error> {
        return fetchTodo(todoId).eraseToAnyPublisher()
    }
    
}

extension FakeTodoService {
    
    private func fetchTodos() -> Future<[Todo], Error> {
        NSLog("FakeTodoService: fetchTodos")

        return Future() { promise in
            DispatchQueue.main.asyncAfter(deadline: .now()+2) {
                NSLog("FakeTodoService: fake todos fetched")
                let todos = [
                    Todo(id: "1", title: "First todo item", isDone: false, createdDate: Date()),
                    Todo(id: "2", title: "Second todo item", isDone: false, createdDate: Date()),
                    Todo(id: "3", title: "Third todo item", isDone: false, createdDate: Date()),
                    Todo(id: "4", title: "Fourth todo item", isDone: false, createdDate: Date()),
                ]
                promise(Result.success(todos))
            }
        }
    }

    private func fetchTodo(_ todoId: String) -> Future<Todo?, Error> {
        NSLog("FakeTodoService: fetchTodo for id \(todoId)")

        return Future() { promise in
            DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                NSLog("FakeTodoService: fake todo fetched")
                let todo = Todo(id: "1", title: "This is a mock", isDone: false, createdDate: Date())
                promise(Result.success(todo))
            }
        }
    }
    
}

enum FakeError: Error {
    case none
}
