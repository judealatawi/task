import Fluent

struct CreateLogs: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("logs")
            .id()
            .field("deviceId", .string, .required)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("logs").delete()
    }
}
