<div align="center">

[![Build Status][build status badge]][build status]
[![Platforms][platforms badge]][platforms]
[![Documentation][documentation badge]][documentation]
[![Matrix][matrix badge]][matrix]

</div>

# NodeInfo
A NodeInfo library for Swift.

This is an implementation of the [NodeInfo](https://nodeinfo.diaspora.software) protocol. Currently supports versions 2.1 and 2.0, but open up an issue if you need something else and I'll try to add it!

## Integration

```swift
dependencies: [
    .package(url: "https://github.com/mattmassicotte/NodeInfo", branch: "main")
]
```

## Usage

```swift
import NodeInfo

// decode
let document = try JSONDecoder().decode(NodeInfo_2_0.Document.self, from: nodeInfoData)

print(document.software)

// encode
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
```

## Contributing and Collaboration

I would love to hear from you! Issues or pull requests work great. Both a [Matrix space][matrix] and [Discord][discord] are available for live help, but I have a strong bias towards answering in the form of documentation. You can also find me on [the web](https://www.massicotte.org).

I prefer collaboration, and would love to find ways to work together if you have a similar project.

I prefer indentation with tabs for improved accessibility. But, I'd rather you use the system you want and make a PR than hesitate because of whitespace.

By participating in this project you agree to abide by the [Contributor Code of Conduct](CODE_OF_CONDUCT.md).

[build status]: https://github.com/mattmassicotte/NodeInfo/actions
[build status badge]: https://github.com/mattmassicotte/NodeInfo/workflows/CI/badge.svg
[platforms]: https://swiftpackageindex.com/mattmassicotte/NodeInfo
[platforms badge]: https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fmattmassicotte%2FNodeInfo%2Fbadge%3Ftype%3Dplatforms
[documentation]: https://swiftpackageindex.com/mattmassicotte/NodeInfo/main/documentation
[documentation badge]: https://img.shields.io/badge/Documentation-DocC-blue
[matrix]: https://matrix.to/#/%23chimehq%3Amatrix.org
[matrix badge]: https://img.shields.io/matrix/chimehq%3Amatrix.org?label=Matrix
[discord]: https://discord.gg/esFpX6sErJ

