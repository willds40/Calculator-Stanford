import Foundation


class CalculatorBrain{
    var accumalator = 0.0
    var description = " "
    
    func setOperand(operand:Double){
        accumalator = operand
    }
    
    func clear (digit:Double)->Double{
        accumalator = 0.0
        return accumalator;
    }
    
    private var  operations:Dictionary<String, Operation> = [
        "pie" :Operation.Constant(M_PI),
        "sin": Operation.UniaryOperations(sqrt),
        "e" :Operation.Constant(M_E),
        "tan":Operation.UniaryOperations(tan),
        "log": Operation.UniaryOperations(log),
        "logten" :Operation.UniaryOperations(log10),
        "logtwo" :Operation.UniaryOperations(log2),
        "+" :Operation.BinaryOperations({$0 + $1}),
        "-": Operation.BinaryOperations({$0 - $1}),
        "/": Operation.BinaryOperations({$0 / $1}),
        "x" : Operation.BinaryOperations({$0 * $1}),
        "cos" : Operation.UniaryOperations(cos),
        "Clear":Operation.Clear,
        "Desc.":Operation.Description,
        "√":Operation.UniaryOperations(sqrt),
        "=":Operation.Equals,
        ]
    
    private enum Operation {
        case Constant(Double)
        case UniaryOperations((Double) ->Double)
        case BinaryOperations((Double, Double)->Double)
        case Equals
        case Clear
        case Description
        
    }
    
    func printDescription(oper1:String, symbol:String, secondOperand:String, result:Double )->String{
        description = description + oper1 + " " + symbol + " " + String(result)
        if description.contains("...") {
            description = description.replacingOccurrences(of: " ...", with: "")
        }
        return description
    }
    
    func preformOperation(mathematicalSymbol:String){
        
        if let operation = operations[mathematicalSymbol]{
            switch operation {
            case .Constant(let value):accumalator = value;
            
            case .BinaryOperations(let function): pending = PendingBinaryOperationInfo(binaryFunction: function, firstOperand: accumalator);
                
            case.UniaryOperations(let function):accumalator = function(accumalator);
            case.Equals:
                if pending != nil{
                    accumalator = pending!.binaryFunction(pending!.firstOperand, accumalator)
                }
            case .Clear:
                self.accumalator = 0.0
            case .Description:break
                
            }
            
        }
    }
    private var pending: PendingBinaryOperationInfo?
    
    private struct PendingBinaryOperationInfo {
        var binaryFunction: (Double, Double) ->Double
        var firstOperand: Double
        
    }
    
    var result:Double{
        get{
            return accumalator
        }
    }
//    var descriptionResult:String{
//        get{
//            return description
//        }
//    }
    
    
    
}
