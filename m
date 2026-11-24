Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795519541;
	b=1YUGX48YySXQQmlBx7OSOzp913+wWGKqwOFmVwJx1fV0ZBij7jYjV+KFMt/rnJ+kSZtX
	 FgtyhhRUojbXpEOMWfwATLVJpyJmHJXl4g2npn/FDT6bMt29kz1IFI6I0zrP5ZfhcPv3K
	 B0729mdZ71a6HiOPjYPzWqE49051JqIZWhmrjLFMISQCXLREfpk5MNNdeAnOT8epY3OuM
	 JUzHhJpKrOBuUkb7U1OYLItmsrVQPhltWE/l9uTHDRjCZU3jijkrBZOkL11D0C++I38r/
	 F8guwbQelJiW5LHIwpn6P2IcJkvSZQkgCHTfjpPdx1DhRTsbW3aERTwBD0H9KVcnVEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795519541;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=o1S7wDU2KrA4zyovBiwAlF9PeAAlPkiC7zGxSOUoTjA=;
	b=htJmdhioPzmdonUc7Dj5zbZn91td7VsYAKGBlwzpYRu7KMqbNQHzZp+bgQC1TDk12Gv3
	 jK/u+62DNVk7M5B9/0OJLl6vYyYdxMs3gTxs6hxdzYxnFo5DIayxM7GJSbyA9t2jlqUpx
	 MX5kiFAmI56ggtKhq+rYmeL3dOh5Wv/wAh8DTA2fWFMxu/SJZVI+CX6obCO9XzYC/VU9p
	 0J42rkF+VPqbfJJyg9YS1hvVT7JebWgBC9s3yMkxjDaJ40jFIl2kR2a9T80s5DTqXZwdk
	 fyrnlp9LpvVdybJId1AT3hI+067oSyl9pcSdyREJnBPDOkYcERktDPQ11AunKvuuMag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="a3u+J/Nz";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CFD606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 11:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a3u+J/Nz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2A791F000C0;
	Tue, 24 Nov 2026 11:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795519540;
	bh=o1S7wDU2KrA4zyovBiwAlF9PeAAlPkiC7zGxSOUoTjA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=a3u+J/NzwMdWUj/uDwZkUk2DpPr+PWuvRBR/dhNQFDwBzAbu/a3GB1OD/jxwPpu6o
	 5+MqhdAwFJpcAXlrzQJ1rgV06vOe04cyPu+0oziAhtEicSWkSDPMDcN4P22jlJYG7I
	 1o6Znp9d8MIObSTDsKkWojQ3ZRPUk2XSJ/aUkQy+0xuDgpqLwHLDieAAC0uWayaFMl
	 qo1gkWQHMSMfE2y9zjv5h7mevNvTEBOaaDkRejzyoytB64Ly2IPk4wIR8A605DsNNj
	 JUTCALLMoVQDHu5uxwkaM+NZOBWE/krgs7z3VCmN79UwlWErN9Ae7mvtIIkKObJgyp
	 QY77JZqnaiSSQ==
Subject:
 Re: [PATCH net-next v11 3/8] hsr: Add a magic header for sending PTP packets
From: netdev-bot+sashiko@kernel.org
To: bigeasy@linutronix.de
Cc: netdev@vger.kernel.org, j-rameshbabu@ti.com, andrew+netdev@lunn.ch,
 danishanwar@ti.com, d-qiu@ti.com, davem@davemloft.net, fmaurer@redhat.com,
 kuba@kernel.org, neelima@ti.com, pabeni@redhat.com, praneeth@ti.com,
 pratheesh@ti.com, richardcochran@gmail.com, horms@kernel.org, vigneshr@ti.com,
 willemdebruijn.kernel@gmail.com, daniel.machon@microchip.com,
 edumazet@kernel.org
Date: Tue, 24 Nov 2026 11:25:39 +0000
Message-ID: <179551953943.3135.5171650811556628454@kernel.org>
In-Reply-To: <20261120-hsr_ptp-v11-3-264c88f4f1d0@linutronix.de>
References: <20261120-hsr_ptp-v11-3-264c88f4f1d0@linutronix.de>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In hsr_dev_xmit() (net/hsr/hsr_device.c:282-284), every skb
  with skb->protocol == htons(ETH_P_1588) must start with a struct…
- [Medium] Inline-header parsing in hsr_dev_xmit() is triggered only by
  skb->protocol == ETH_P_1588.
- [Low] The new uAPI struct hsr_inline_header
  (include/uapi/linux/hsr_ptp.h) has an eth_type field at offset 12,…
- [Low] The uAPI header defines HSR_INLINE_HDR_PORT_A=1 and
  HSR_INLINE_HDR_PORT_B=2, and the selftest uses them.
- [Low] hsr_ptp_parse_header() copies the user-supplied has_hsr_header
  byte into a bool with no validation (`*has_hsr_header =…

--

hsr: Add a magic header for sending PTP packets

This patch adds a uAPI struct hsr_inline_header. It must be prepended to
ETH_P_1588 frames sent through an HSR device, and is identified by a magic
value. It carries the requested transmit port and whether an HSR header is
already present. PTP frames without a valid inline header are dropped, and
the parsed values are passed to hsr_forward_skb() for later use.

> diff --git a/include/uapi/linux/hsr_ptp.h b/include/uapi/linux/hsr_ptp.h
> new file mode 100644
> index 0000000000000..95e905441ebdc
> --- /dev/null
> +++ b/include/uapi/linux/hsr_ptp.h
> @@ -0,0 +1,20 @@

[ ... ]

> +#define HSR_INLINE_HDR  0xaf485352
> +#define HSR_INLINE_HDR_PORT_A	1
> +#define HSR_INLINE_HDR_PORT_B	2
> +
> +struct hsr_inline_header {
> +	__u8 req_tx_port;
> +	__u8 has_hsr_header;
> +	__be32 __pad0;
> +	__be32 magic;
> +	__be16 __pad1;
> +	__be16 eth_type;

[Severity: Low]
Should eth_type be validated? hsr_ptp_parse_header() checks __pad0 and
__pad1 strictly but never reads eth_type. Whether the inline header is
parsed at all depends only on skb->protocol.

For AF_PACKET SOCK_RAW bound to ETH_P_ALL or 0, packet_parse_headers() takes
skb->protocol from bytes 12-13, so eth_type ends up deciding whether the
frame is parsed.

With an explicit sll_protocol, packet_snd() sets skb->protocol = proto and
eth_type has no effect:

  - sll_protocol = ETH_P_1588 is accepted whatever eth_type holds.

  - A valid inline header sent with a different sll_protocol (ETH_P_IP, for
    example) is not parsed. It goes into the ring as an Ethernet header with
    h_dest = {req_tx_port, has_hsr_header, 0, 0, 0, 0} and
    h_source = af:48:53:52:00:00.

Since this is uAPI, would it make sense to require
eth_type == htons(ETH_P_1588) now? Adding the check later could break
userspace that relies on the current loose behaviour.

> +} __attribute__ ((packed));

[ ... ]

> diff --git a/net/hsr/hsr_device.c b/net/hsr/hsr_device.c
> index 59df647d2fd45..be29d73bef76a 100644
> --- a/net/hsr/hsr_device.c
> +++ b/net/hsr/hsr_device.c

[ ... ]

> @@ -221,26 +223,78 @@ static netdev_features_t hsr_fix_features(struct net_device *dev,
>  	return hsr_features_recompute(hsr, features);
>  }
>  
> +static int hsr_ptp_parse_header(struct sk_buff *skb, bool *has_hsr_header,
> +				enum hsr_port_type *req_tx_port)
> +{

[ ... ]

> +	hsr_inline_hdr = (struct hsr_inline_header *)skb_mac_header(skb);
> +	if (hsr_inline_hdr->magic != htonl(HSR_INLINE_HDR))
> +		return -EINVAL;
> +
> +	*has_hsr_header = hsr_inline_hdr->has_hsr_header;
> +	*req_tx_port = hsr_inline_hdr->req_tx_port;
> +	if (*req_tx_port != HSR_PT_SLAVE_A && *req_tx_port != HSR_PT_SLAVE_B)
> +		return -EINVAL;

[Severity: Low]
The uAPI header exports HSR_INLINE_HDR_PORT_A (1) and HSR_INLINE_HDR_PORT_B
(2), but this check compares the raw user byte against the kernel-internal
enum from include/linux/if_hsr.h:

enum hsr_port_type {
	HSR_PT_NONE = 0,	/* Must be 0, used by framereg */
	HSR_PT_SLAVE_A,
	HSR_PT_SLAVE_B,
	...

The values match today only because of the enum's implicit ordering. If an
entry in enum hsr_port_type is added or reordered, the userspace ABI would
change silently.

Would it be better to compare against the HSR_INLINE_HDR_PORT_* defines and
map them to HSR_PT_SLAVE_A/B explicitly, or at least add a BUILD_BUG_ON()?

> +
> +	if (hsr_inline_hdr->__pad0 != 0 || hsr_inline_hdr->__pad1 != 0)
> +		return -EINVAL;
> +
> +	hdr_len = ETH_HLEN;
> +	if (*has_hsr_header)
> +		hdr_len += HSR_HLEN;

[Severity: Low]
The has_hsr_header byte is converted to bool with no range check, so values
0x02-0xff are silently treated as true. That rules out giving those values
a meaning later. Should anything other than 0 or 1 be rejected?

The parser also doesn't check that the following header really is an HSR
header (h_proto == ETH_P_HSR, or ETH_P_PRP for HSRv0). The flag isn't
rejected on PRP devices either.

This flag alone decides hdr_len, the network header offset and mac_len.
Later in the series it also makes the stack skip HSR processing:

  - hsr_fill_frame_info() returns early with skb_std = skb.
  - hsr_forward_do() transmits a clone directly.
  - hsr_xmit() skips address substitution.

Could a frame marked has_hsr_header but carrying no HSR tag then be sent
untagged into the ring, with mac_len and network_header off by 6 bytes?

On a PRP device, prp_fill_frame_info() ignores the flag. handle_std_frame()
then consumes a PRP sequence number and the frame is sent without an RCT.

[ ... ]

>  static netdev_tx_t hsr_dev_xmit(struct sk_buff *skb, struct net_device *dev)
>  {

[ ... ]

> +	skb->dev = master->dev;
> +	if (skb->protocol == htons(ETH_P_1588) &&
> +	    hsr_ptp_parse_header(skb, &has_hsr_header, &req_tx_port))
> +		goto drop;

[Severity: Medium]
Every skb with skb->protocol == ETH_P_1588 now has to start with a struct
hsr_inline_header. If it doesn't, tx_dropped is incremented and the frame is
freed, while hsr_dev_xmit() still returns NETDEV_TX_OK. Before this patch
these frames were forwarded into the ring.

Can this drop PTP frames from senders that have no way to add the inline
header? A few cases:

  - AF_PACKET SOCK_DGRAM senders. The device's own header_ops build a plain
    ethhdr, where bytes 6-9 are h_source, so the magic check can never pass:

    static const struct header_ops hsr_header_ops = {
    	.create	 = eth_header,
    	.parse	 = eth_header_parse,
    	.parse_protocol = eth_header_parse_protocol,
    };

  - Unmodified SOCK_RAW senders bound to ETH_P_ALL, such as linuxptp.
    packet_parse_headers() sets skb->protocol to ETH_P_1588 from bytes
    12-13.

  - VLAN devices stacked on hsr0. hsr_dev_setup() advertises
    NETIF_F_HW_VLAN_CTAG_TX, so the tag stays in hwaccel and skb->protocol
    is still ETH_P_1588 in front of a plain ethhdr.

  - PTP frames forwarded into hsr0 by a bridge, tc mirred or OVS.

The commit message does say the header is "expected and mandatory if the
ether type is ETH_P_1588". The reason it gives for dropping is "the
requested PTP timestamp is not routed to the sender", which only covers
local senders that want a TX timestamp. Forwarded and stacked-device frames
never ask for one.

Is it intended to drop those as well? No later patch in the series touches
hsr_device.c, so this is still the behaviour at the end of the series.

[Severity: Medium]
Can a remote host reach this parser? The only trigger is skb->protocol.
Nothing checks where the skb came from, for example skb->sk, a socket
option or a cmsg.

For a frame redirected into hsr0 from another interface, eth_type_trans()
set skb->protocol from bytes 12-13. Those are exactly the inline header's
eth_type bytes.

Suppose tc mirred, OVS or nft fwd/dup forwards untrusted traffic into hsr0.
A remote sender could transmit a frame laid out as:

  byte 0       1 or 2 (req_tx_port)
  byte 1       has_hsr_header
  bytes 2-5    0
  bytes 6-9    af:48:53:52
  bytes 10-11  0
  bytes 12-13  0x88f7

hsr_ptp_parse_header() would accept this, strip the outer 14 bytes, and
forward the inner frame with the req_tx_port and has_hsr_header the sender
chose.

Later in the series, has_hsr_header = 1 makes hsr_fill_frame_info() and
hsr_forward_do() send the inner frame unchanged on the chosen slave.
hsr_xmit() also skips the h_source substitution:

hsr_xmit()
    if (frame->port_rcv->type == HSR_PT_MASTER && !frame->has_hsr_header) {

Wouldn't that let a remote sender inject HSR-tagged frames into the ring
with a forged source MAC and sequence number, and pick the egress port?

The Linux bridge path doesn't appear to be affected. br_handle_frame() drops
frames with a multicast h_source, and 0xaf has the multicast bit set. tc
mirred and OVS don't do that check.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120-hsr_ptp-v11-0-264c88f4f1d0%40linutronix.de
