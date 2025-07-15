public enum NodeInfoProtocol {
	public struct Link: Codable, Sendable, Hashable {
		public let rel: String
		public let href: String

		public init(rel: String, href: String) {
			self.rel = rel
			self.href = href
		}
	}

	public struct Document: Codable, Sendable, Hashable {
		public let links: [Link]

		public init(links: [Link]) {
			self.links = links
		}
	}
}

public enum NodeInfoVersion: String, Codable, Sendable, Hashable {
	case version_2_1 = "2.1"
	case version_2_0 = "2.0"
	case version_1_1 = "1.1"
	case version_1_0 = "1.0"

	public var uri: String {
		"http://nodeinfo.diaspora.software/ns/schema/\(self.rawValue)"
	}

	public var uriProfile: String {
		"\(uri)#"
	}
}
