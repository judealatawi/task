
import Fluent
import Vapor


final class Logs: Model {
    
    static let schema = "logs"
    
    @ID
    var id: UUID?
    
    @Field(key: "deviceId")
    var deviceId: String
    
   
    init() {
    }

   
    init(id: UUID? = nil, deviceId: String) {
        self.id = id
        self.deviceId = deviceId
    }
      
}


extension Logs: Content {}


