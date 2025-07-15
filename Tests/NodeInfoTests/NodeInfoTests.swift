import Testing
import NodeInfo

import Foundation

struct NodeInfoTests {
	@Test func decode2_0() throws {
		let content = """
{"version":"2.0","software":{"name":"mastodon","version":"4.5.0-nightly.2025-07-11"},"protocols":["activitypub"],"services":{"outbound":[],"inbound":[]},"usage":{"users":{"total":2805128,"activeMonth":278110,"activeHalfyear":811772},"localPosts":138439181},"openRegistrations":true,"metadata":{"nodeName":"Mastodon","nodeDescription":"The original server operated by the Mastodon gGmbH non-profit"}}   
"""

		let document = try JSONDecoder().decode(NodeInfo_2_0.Document.self, from: Data(content.utf8))

		let expected = NodeInfo_2_0.Document(
			software: NodeInfo_2_0.Software(
				name: "mastodon",
				version: "4.5.0-nightly.2025-07-11"
			),
			protocols: [.activitypub],
			services: NodeInfo_2_0.Services(inbound: [], outbound: []),
			openRegistrations: true,
			usage: NodeInfo_2_0.Usage(
				users: NodeInfo_2_0.Usage.Users(
					total: 2805128,
					activeHalfyear: 811772,
					activeMonth: 278110
				),
				localPosts: 138439181,
				localComments: nil
			)
		)

		#expect(document == expected)
	}

	@Test func encode2_1() throws {
		let document = NodeInfo_2_1.Document(
			software: NodeInfo_2_1.Software(name: "system", version: "1.0", repository: "some_repo", homepage: "some_site"),
			protocols: [.xmpp],
			services: NodeInfo_2_1.Services(inbound: [.pop3], outbound: [.blogger]),
			openRegistrations: false,
			usage: NodeInfo_2_1.Usage(
				users: NodeInfo_2_1.Usage.Users(
					total: 5,
					activeHalfyear: 4,
					activeMonth: 3
				),
				localPosts: 40,
				localComments: 50
			)
		)

		let data = try JSONEncoder().encode(document)
		let output = try JSONDecoder().decode(NodeInfo_2_1.Document.self, from: data)

		#expect(document == output)
	}

	@Test func schemaURI() throws {
		#expect(NodeInfoVersion.version_2_1.uriProfile == "http://nodeinfo.diaspora.software/ns/schema/2.1#")
	}

	@Test func protocolDocument() throws {
		let document = NodeInfoProtocol.Document(links: [
			NodeInfoProtocol.Link(rel: "a", href: "b")
		])

		let data = try JSONEncoder().encode(document)
		let output = try JSONDecoder().decode(NodeInfoProtocol.Document.self, from: data)

		#expect(document == output)

	}
}
