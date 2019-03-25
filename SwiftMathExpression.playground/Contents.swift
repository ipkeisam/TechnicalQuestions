import Foundation
class Stack {
    
    var localStack: [String] = []
    var peek: String {
        get {
            if localStack.count != 0 {
                return localStack[localStack.count-1]
            } else {
                return ""
            }
        }
    }
    var empty: Bool {
        get {
            return localStack.count == 0
        }
    }
    
    func push(value: String) {
        localStack.append(value)
    }
    
    func pop() -> String {
        var temp = String()
        if localStack.count != 0 {
            temp = localStack[localStack.count-1]
            localStack.remove(at:localStack.count-1)
        } else if localStack.count == 0 {
            temp = ""
        }
        return temp
    }
    
}

extension String {
    
    var precedence: Int {
        get {
            switch self {
            case "+":
                return 1
            case "-":
                return 1
            case "*":
                return 0
            case "/":
                return 0
            default:
                return 100
            }
        }
    }
    
    var isOperator: Bool {
        get {
            return ("+-*/" as NSString).contains(self)
        }
    }
    
    var isNumber: Bool {
        get {
            return !isOperator && self != "(" && self != ")"
        }
    }
    
}


extension String {
    
    subscript (i: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    subscript (r: Range<Int>) -> String {
        let strRange = NSRange(location: self.startIndex.encodedOffset + r.startIndex, length: r.endIndex - r.startIndex )
        return (self as NSString).substring(with:strRange)
    }
}


extension Array {
    func get(index: Int) -> Element? {
        if 0 <= index && index < count {
            return self[index]
        } else {
            return nil
        }
    }
}

class ExpressionSolver {
    
    func parseExpression(expression: String) -> String {
        
        func findBrackets(exp: String) -> [String] {
            var finalStrings = [""]
            for char in exp {
                let tokAsString = "\(char)"
                if tokAsString == "(" {
                    finalStrings.append(tokAsString)
                } else if !finalStrings[finalStrings.count-1].contains(")") && finalStrings[finalStrings.count-1].contains("(") {
                    finalStrings[finalStrings.count-1] += tokAsString
                }
            }
            finalStrings.remove(at: 0)
            return finalStrings
        }
        
        func parseBrackets(brackets: [String]) -> String {
            var finalString = expression
            for i in brackets {
                let result = solveExpression(expression: i.replacingOccurrences(of:"(", with: "").replacingOccurrences(of:")", with: ""))
                finalString = finalString.replacingOccurrences(of:i, with: "\(result)")
            }
            return finalString
        }
        
        return parseBrackets(brackets: findBrackets(exp: expression))
        
    }
    
    func solveExpression(expression: String) -> Int {
        let newExpression = expression.contains("(") ? parseExpression(expression: expression) : expression
        let operatorStack = Stack()
        let operandStack = Stack()
        let tokens = newExpression.components(separatedBy: " ")
        
        for (_, token) in tokens.enumerated() {
            
            if token.isNumber {
                operandStack.push(value: token)
            }
            
            if token.isOperator {
                while operatorStack.peek.precedence <= token.precedence {
                    if !operatorStack.empty {
                        var res = 0
                        switch operatorStack.peek {
                        case "+":
                            res = Int(operandStack.pop())! + Int(operandStack.pop())!
                        case "-":
                            res = Int(operandStack.localStack[operandStack.localStack.count-2])! - Int(operandStack.pop())!
                            operandStack.pop()
                        case "*":
                            res = Int(operandStack.pop())! * Int(operandStack.pop())!
                        case "/":
                            res = Int(operandStack.localStack[operandStack.localStack.count-2])! / Int(operandStack.pop())!
                            operandStack.pop()
                        default:
                            res = 0
                        }
                        operatorStack.pop()
                        operandStack.push(value: "\(res)")
                    }
                }
                operatorStack.push(value: token)
            }
            
        }
        
        while !operatorStack.empty {
            var res = 0
            switch operatorStack.peek {
            case "+":
                res = Int(operandStack.pop())! + Int(operandStack.pop())!
            case "-":
                res = Int(operandStack.localStack[operandStack.localStack.count-2])! - Int(operandStack.pop())!
                operandStack.pop()
            case "*":
                res = Int(operandStack.pop())! * Int(operandStack.pop())!
            case "/":
                res = Int(operandStack.localStack[operandStack.localStack.count-2])! / Int(operandStack.pop())!
                operandStack.pop()
            default:
                res = 0
            }
            operatorStack.pop()
            operandStack.push(value: "\(res)")
        }
        
        
        return Int(operandStack.pop())!
        
    }
    
}

let solver = ExpressionSolver()
solver.solveExpression(expression: "2 + 4 * 3 / 6 + 2 - 4")
solver.solveExpression(expression: "2 + 5 * 3 - 1")
solver.solveExpression(expression: "3 - 6 / 3")
solver.solveExpression(expression: "1 - 6 / 2 + 2 * 3")

