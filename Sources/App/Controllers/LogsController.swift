



import Fluent
import Vapor

struct LogsController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let logs = routes.grouped("logs")
        logs.get(use: index)
        logs.post(use: create)

    }

    func index(req: Request) async throws -> [Logs] {
        try await Logs.query(on: req.db).all()
    }
   
    func create(req: Request) async throws -> HTTPStatus {
        //decode if true then cont, if not send error
        
        let users = try await Users.query(on: req.db).all()//put all the users database here
        
        let newData = try req.content.decode(CreateDeviceIds.self)
        
        for u in users {
            
            if(newData.deviceId == u.deviceId){
                //make them go to the log in
                return .ok
            }
        }
        return .notFound //make them go to the sign up

    }
    
}

struct CreateDeviceIds: Content {

    let deviceId: String

}
