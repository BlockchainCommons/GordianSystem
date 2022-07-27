# The Gordian Architecture

The Gordian architecture is an overall plan for interoperable specifications and design patterns that support the [Gordian Principles](https://github.com/BlockchainCommons/Gordian#gordian-principles), ensuring the independence, privacy, resilience, and openness of digital assets. The ultimate goal is to prevent vendor lock-in and to remove the threats of single points of compromise, failure, and denial so that users can personally protect their self-sovereign digital assets without the fear of loss.

_As Above, So Below:_ the Gordian Architecture ultimately comes in two parts. At the high level, the _Macro-Architecture_ and specific services such as the _Key Management Services_, are designed and built to fulfill the Gordian Principles. However, in order for the Macro-Architecture to interoperate, its participates must agree on a series of _Encoding Specifications_, the heart of which is the self-describing, self-certifying UR system. Orthogonal to this, _Visual Specifications_ offer additional ways to fulfill the Gordian Principles.

## Macro-Architecture

The Gordian Macro-architecture is built on a design pattern of functional partition.

Rather than following the design pattern of classic services, which group multiple services into singular applications, the Gordian Architecture instead separates both services and confidential data from each other, paritioning them with airgaps and torgaps. Doing so improves privacy and security by reducing the value of honeypots and also improves functional design by ensuring that each application is precisely and concisely able to perform a specific function. Many of the Gordian reference apps are actually microservices, intended to perform small and simple but necessary activities as part of the blockchain ecosystem.

Using functionally partitioned services, linked by airgaps and torgaps to minimize attacks in transit and to improve partitioning, the Gordian architecture creates a powerful and safe new methodology for financial, data, and information operations on the internet. It also creates an ecosystem that allows for the inclusion of multiple developers, each producing their own applications that are all interoperable thanks to usage of Gordian Encoding Specifications. This improves the overall architecture through these competitive designs and ensures survivability of the model as a whole.

* **Service.** A service that fulfills some large-scale need for digital-asset management, most commonly the ability to create transactions, sign transactions, and send transactions. *Examples:* [Gordian Seed Tool](https://github.com/BlockchainCommons/GordianSeedTool-iOS) (signing device), Gordian Coordinator (transaction coordinator).

* **Microservice.** A service that fulfills a small need in the overall Gordian ecosystem such as price lookups. *Examples:* [SpotBit](https://github.com/BlockchainCommons/spotbit).

* **AirGap.** A physical gap between services or microservices, where either side might not even be networked. A service protected by an AirGap is usually communicated with via the reading of QR Codes or through transmission of data on MicroSD cards, NFC tags, or other removable media.

* **TorGap.** A link between services or microservices that connect via [Tor](https://www.torproject.org/), maximizing their partitioning by ensuring mutual anonymity of the services.

### Key Management Services

Traditionally, digital-asset architectures have focused on multi-function wallets that act as both transaction coordinators and signing devices. Breaking apart features through the design pattern of functional partition reveals that there's much more. The Collaborative Seed Recovery (CSR) service and the future Collaborative Key Management (CKM) service demonstrate how a Gordian Macro-architecture can purposefully fulfill the Gordian Principles of independence, privacy, resilience, and openness.

* **Collaborative Seed Recovery (CSR).** CSR is a service that improves the resilience of seeds and other secrets by using SSKR to distribute shares of the secret to a variety of Share Servers. The goal is to automate the backup and reconstruction of secrets in order to protect the self-sovereign control of digital assets. See [Collaborative Seed Recovery Overview](https://github.com/BlockchainCommons/Gordian/blob/master/Docs/CSR.md).

* **Collaborative Key Management.** CKM is a future technology that will introduce key-management servers that generate and use secrets without those secrets ever existing prior to their usage. It continues the pattern of resilience introduced by CSR but takes it to the next step by also offering strong protections against compromise.

## Visual Specifications

Visual Specifications are intended to improve the usability of digital assets by making it easy for the user to recognize one without having to memorize a long hex code.

* **Object Identity Block.** An Object Identity Block (OIB) is a collection of readable data and images which together make it easy to recognize the digital object being described. See [BCR-2021-02: Digests for Digital Objects](https://github.com/BlockchainCommons/Research/blob/master/papers/bcr-2021-002-digest.md).

* **Lifehash.** A Lifehash appears as part of an OIB. It's a visual hash of a digital object that is intended to make it possible to recognize an object at a glance thanks to the patterning and coloring. See [Lifehash.info](https://lifehash.info/) and the [Lifehash.info README](https://github.com/BlockchainCommons/lifehash.info#lifehash-beautiful-visual-hashes).

## Encoding Specifications

The interoperability of the Gordian Macro-Architecture is only made possible if the individual servers speak the same language. That's where Encoding Specifications come into play: they standardize communication, not only so that current servers can communicate, but also so that future servers can recognize messages (or more importantly: digital assets) archived in the past.

The most common pattern for data encoding in the Gordian Architecture is:

1. Data is encoded in CBOR.
2. CBOR is converted to minimal bytewords.
3. Minimal bytewords are prefixed with a UR type to generate a URI.
4. (Optionally) UR is encoded in a QR code.

* **CBOR.** Concise Binary Object Representation, or CBOR, is a data format that Blockchain Commons has adopted as its lowest level format. It's a stable, concise binary encoding method that allows typing of data. See [CBOR.io](https://cbor.io/) and [RFC 8949](https://www.rfc-editor.org/rfc/rfc8949.html).

* **Bytewords.** Bytewords are a method for encoding binary data as English words, with special care taken to ensure that the words are unique and recognizable. Bytewords can be used to encode any data, allowing users to etch or write out English-language representations of their digital-asset keys, so they're harder to confuse. However, in the Gordian Architecture the most important purpose of Bytewords is to encode binary CBOR as alphabetic characters. This is done with a "minimal" representation of Byteowrds, which uses just the first and last letter of each word (e.g., "tuna" becomes "ta", "acid" becomes "ad", etc.). See [BCR-2020-12: Bytewords](https://github.com/BlockchainCommons/Research/blob/master/papers/bcr-2020-012-bytewords.md).

* **URs.** A UR wraps and tags data that is encoded with CBOR and then translated into minimal Bytewords. In doing so, it ensures that the data is self-describing and self-certifying. This is what enables the interoperability of the Gordian Architecture, including the ability to examine data in some future app other than the one that created it. URs also include a method for sequencing larger data. See [BCR-2020-05: UR](https://github.com/BlockchainCommons/Research/blob/master/papers/bcr-2020-005-ur.md) and [BCR-2020-06: Registry of UR Types](https://github.com/BlockchainCommons/Research/blob/master/papers/bcr-2020-006-urtypes.md). Also see [Introduction: How Are URs Encoded?](https://github.com/BlockchainCommons/crypto-commons/blob/master/Docs/ur-1-overview.md#how-are-urs-encoded) for the precise process of converting data to CBOR, Bytewords, and ultimately URs, as well as our [UR Docs Overview Page](https://github.com/BlockchainCommons/crypto-commons/blob/master/Docs/ur-overview.md).
 
* **QR Codes.** Part of the design of URs was to ensure that they could be efficienctly stored as QR codes. The sequencing design of URs also allows for the creation of animated QRs. Though QRs are not required for the Gordian Architecture, they're crucial if Airgaps are introduced into the Macro-Architecture.

### Sharding Specifications

* **SSKR.**

### UR Specifications

* **Crypto-Envelopes.**

* **Crypto-Request** & **Crypto-Response.**