public enum NodeInfo_2_0 {
	public static let version: String = "2.0"

	public struct Software: Codable, Sendable, Hashable {
		public let name: String
		public let version: String

		public init(name: String, version: String) {
			self.name = name
			self.version = version
		}
	}

	public struct Services: Codable, Sendable, Hashable {
		public let inbound: [InboundService]
		public let outbound: [OutboundService]

		public init(inbound: [InboundService], outbound: [OutboundService]) {
			self.inbound = inbound
			self.outbound = outbound
		}
	}

	public struct Usage: Codable, Sendable, Hashable {
		public struct Users: Codable, Sendable, Hashable {
			public let total: Int
			public let activeHalfyear: Int
			public let activeMonth: Int

			public init(total: Int, activeHalfyear: Int, activeMonth: Int) {
				self.total = total
				self.activeHalfyear = activeHalfyear
				self.activeMonth = activeMonth
			}
		}

		public let users: Users
		public let localPosts: Int?
		public let localComments: Int?

		public init(users: Users, localPosts: Int?, localComments: Int?) {
			self.users = users
			self.localPosts = localPosts
			self.localComments = localComments
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

