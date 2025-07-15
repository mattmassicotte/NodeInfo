public enum NodeInfo_2_1 {
	public static let version: String = "2.1"

	public typealias Services = NodeInfo_2_0.Services
	public typealias Usage = NodeInfo_2_0.Usage

	public struct Software: Codable, Sendable, Hashable {
		public let name: String
		public let version: String
		public let repository: String
		public let homepage: String

		public init(name: String, version: String, repository: String, homepage: String) {
			self.name = name
			self.version = version
			self.repository = repository
			self.homepage = homepage
		}
	}

	public struct Document: Codable, Sendable, Hashable {
		public enum CodingKeys: CodingKey {
			case version
			case software
			case protocols
			case services
			case openRegistrations
			case usage
		}

		public let version = NodeInfo_2_0.version
		public let software: Software
		public let protocols: [ServiceProtocol]
		public let services: Services
		public let openRegistrations: Bool
		public let usage: Usage

		public init(software: Software, protocols: [ServiceProtocol], services: Services, openRegistrations: Bool, usage: Usage) {
			self.software = software
			self.protocols = protocols
			self.services = services
			self.openRegistrations = openRegistrations
			self.usage = usage
		}
	}
}
