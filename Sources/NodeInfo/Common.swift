public enum ServiceProtocol: String, Codable, Sendable, Hashable {
	case activitypub
	case buddycloud
	case dfrn
	case diaspora
	case libertree
	case ostatus
	case pumpio
	case tent
	case xmpp
	case zot
}

public enum InboundService: String, Codable, Sendable, Hashable {
	case atom1_0 = "atom1.0"
	case gnusocial
	case imap
	case pnut
	case pop3
	case pumpio
	case rss2_0 = "rss2.0"
	case twitter
}

public enum OutboundService: String, Codable, Sendable, Hashable {
	case atom1_0 = "atom1.0"
	case blogger
	case buddycloud
	case diaspora
	case dreamwidth
	case drupal
	case facebook
	case friendica
	case gnusocial
	case google
	case insanejournal
	case libertree
	case linkedin
	case livejournal
	case mediagoblin
	case myspace
	case pinterest
	case pnut
	case posterous
	case pumpio
	case redmatrix
	case rss2_0 = "rss2.0"
	case smtp
	case tent
	case tumblr
	case twitter
	case wordpress
	case xmpp
}

