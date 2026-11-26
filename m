Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704036;
	b=NIp6mgmnh2V4rCh34ZXMdKkBfMyA3PWLMQYeGMvPTOtisVYt7bDjD00GHlKIK0F3/U/K
	 OLjwfu2YnNj/MlSqvnq5NiTUpbNgZ7rE+3D7ZGcfZvRiMTVNvMfO3tzLDon1X/Cm2omuH
	 pXQNomlfp0HHtnOD7oG71mHByKHajj2+GkL8DhKG7Q4uXjMmVsPVZncs71bZPCSO1XZl+
	 HMG4cq5MF2bTnzhUrPK3vyyWD2O6vo0xpCStLvC53tYIG6EsqoG0dpT1Ka8DpXaHbat9b
	 P/jeYypD6VN8wsgY3d3+7N4XLo45bp5rpZMoSYFFqtr4OIfKBlMoxynTIhYM8fI5pUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704036;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Wr5cCj9J1rMJbAydz19xYhAO0DwU7uHqsnozxoxVbqo=;
	b=4dLYhWzFYz2SCHYE4nmJg7M7tMPJ+jnQC3+K0OnUHx1Cf3kUKxngpmHV4WzTSVJxIfQX
	 1IBFiZqbXpyv2LVx2YgUXBc+enZ26VcpPs0FY2+r29NM+o9MmrOBdBejCWSADV+1h7JXU
	 6UIcYbZW2nfIWUvpSFMbFwtcObI614M4RdZJN0wXfswNezbUno8+kL+w/2e3GZ7Nc9BYv
	 wyZYphIwgxjittHcBr6x79U4of0tYJcSnn0Bg2/u4Uj8XqMT+imXk4Z7liH2wDzB6Han9
	 GBgIXm0oQ2JRLBZogwonh0rabuSnteV2Cf1UL0SSEsg+ynTOCxOyYd4qFuFLFRuqQmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L06UuMVs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149D3606A32D
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 14:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L06UuMVs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6F691F000D0;
	Thu, 26 Nov 2026 14:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795704035;
	bh=Wr5cCj9J1rMJbAydz19xYhAO0DwU7uHqsnozxoxVbqo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=L06UuMVsNYzraBK6oy5/Ob55QwuitcaezrP0FXugqfMF7C3l1tVZ6895Bt8CSZsux
	 lXgLVw+nUkC10plDi+e0xBIChRStMgRj/hQimzpsCUuBE4FE8ky1Xy8g1qvA/nrC3g
	 dJxkP+sMgiGufZVYtvvlCHw7Ns0ov/3fZNl2yXO8gp7vH7uMcurZzXGkINF2bQYMu3
	 6iyuLBwu3sh2XTZ94gySoyH2EiyROlV8RhsQVuVnhv8NYUm6rRFECu2JHQnrEgiqTr
	 7g5czQ3Apd/EUt333wOScGlbwEydDeHhMTIBZ5mgY9pDxMHAlb9WBY94BGrzGjgtvX
	 02mLQjRmUhStg==
Subject:
 Re: [PATCH net-next v12 3/8] hsr: Add a magic header for sending PTP packets
From: netdev-bot+sashiko@kernel.org
To: bigeasy@linutronix.de
Cc: netdev@vger.kernel.org, j-rameshbabu@ti.com, andrew+netdev@lunn.ch,
 danishanwar@ti.com, d-qiu@ti.com, davem@davemloft.net, fmaurer@redhat.com,
 kuba@kernel.org, neelima@ti.com, pabeni@redhat.com, praneeth@ti.com,
 pratheesh@ti.com, richardcochran@gmail.com, horms@kernel.org, vigneshr@ti.com,
 willemdebruijn.kernel@gmail.com, daniel.machon@microchip.com,
 edumazet@kernel.org
Date: Thu, 26 Nov 2026 14:40:34 +0000
Message-ID: <179570403442.3135.2210968981071284500@kernel.org>
In-Reply-To: <20261125-hsr_ptp-v12-3-9ddd2a73cb90@linutronix.de>
References: <20261125-hsr_ptp-v12-3-9ddd2a73cb90@linutronix.de>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] In hsr_ptp_parse_header() (net/hsr/hsr_device.c), the req_tx_port
  byte from userspace is stored straight into an enum hsr_port_type.
- [Low] hsr_ptp_parse_header() does not strictly validate the new uAPI
  header, even though it does require __pad0 and __pad1 to be zero.
- [Low] Not confirmed by baseline review; kept because this concern needs
  separate validation.
- [Low] Not confirmed by baseline review; kept because this concern needs
  separate validation.
- [Low] Not confirmed by baseline review; kept because this concern needs
  separate validation.
- [Low] Not confirmed by baseline review; kept because this concern needs
  separate validation.

--

hsr: Add a magic header for sending PTP packets

This patch adds a uAPI struct hsr_inline_header. PTP (ETH_P_1588) frames
sent through an HSR/PRP master device must now start with it. The header
carries the requested transmit port and whether the following frame
already has an HSR tag. hsr_dev_xmit() parses and strips the header,
drops PTP frames that lack it, and passes the two values on to
hsr_forward_skb() for later patches in the series to use.

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
> +} __attribute__ ((packed));
> +
> +#endif
> diff --git a/net/hsr/hsr_device.c b/net/hsr/hsr_device.c
> index 59df647d2fd45..7e79d5b34e8bb 100644
> --- a/net/hsr/hsr_device.c
> +++ b/net/hsr/hsr_device.c

[ ... ]

> @@ -221,26 +223,81 @@ static netdev_features_t hsr_fix_features(struct net_device *dev,
>  	return hsr_features_recompute(hsr, features);
>  }
>  
> +static int hsr_ptp_parse_header(struct sk_buff *skb, bool *has_hsr_header,
> +				enum hsr_port_type *req_tx_port)
> +{
> +	struct hsr_inline_header *hsr_inline_hdr;
> +	struct ethhdr *eth_hdr;
> +	unsigned int hdr_len;
> +
> +	BUILD_BUG_ON(sizeof(struct hsr_inline_header) != sizeof(struct ethhdr));
> +
> +	skb_reset_mac_header(skb);
> +	if (!skb->sk)
> +		return -EINVAL;

[Severity: Low]
Is this socket check meant as an extra policy on top of the magic check?
PTP frames that reach hsr_dev_xmit() without a socket are dropped here.
That happens, for example, when hsr0 is a bridge port or a mirred target.

Those frames would not carry the HSR_INLINE_HDR magic either, so the
magic check below would drop them anyway. The commit message already
says "PTP packets missing this information will be dropped".

The socket requirement also seems to match "hsr: Assign a socket for
cloned skbs" later in the series, which needs skb->sk to route the
timestamp back.

Could a short comment here say why skb->sk is required?

> +
> +	/* need to access the magic header */
> +	if (!pskb_may_pull(skb, sizeof(struct hsr_inline_header)))
> +		return -EINVAL;
> +
> +	hsr_inline_hdr = (struct hsr_inline_header *)skb_mac_header(skb);
> +	if (hsr_inline_hdr->magic != htonl(HSR_INLINE_HDR))
> +		return -EINVAL;
> +
> +	*has_hsr_header = hsr_inline_hdr->has_hsr_header;
> +	*req_tx_port = hsr_inline_hdr->req_tx_port;
> +	if (*req_tx_port != HSR_PT_SLAVE_A && *req_tx_port != HSR_PT_SLAVE_B)
> +		return -EINVAL;

[Severity: Low]
Should this check use the uAPI constants rather than the internal enum?

The byte from userspace goes straight into an enum hsr_port_type. It is
then compared against HSR_PT_SLAVE_A and HSR_PT_SLAVE_B from
include/linux/if_hsr.h.

HSR_INLINE_HDR_PORT_A and HSR_INLINE_HDR_PORT_B, exported in
include/uapi/linux/hsr_ptp.h, are not used by any kernel code. Only the
selftest and the tools/ copy of the header refer to them.

The two only agree because of the current enum layout:

include/linux/if_hsr.h:
enum hsr_port_type {
	HSR_PT_NONE = 0,	/* Must be 0, used by framereg */
	HSR_PT_SLAVE_A,
	HSR_PT_SLAVE_B,
	...

Later in the series, hsr_forward_do() also compares frame->req_tx_port
directly against port->type. If enum hsr_port_type is ever reordered or
extended, the meaning of the exported values would change silently.

There are two ways to make the coupling visible. One is an explicit
translation from HSR_INLINE_HDR_PORT_A/B. The other is
BUILD_BUG_ON(HSR_INLINE_HDR_PORT_A != HSR_PT_SLAVE_A) and the same for B.
Would either of these work here?

> +
> +	if (hsr_inline_hdr->__pad0 != 0 || hsr_inline_hdr->__pad1 != 0)
> +		return -EINVAL;
> +
> +	hdr_len = ETH_HLEN;
> +	if (*has_hsr_header)
> +		hdr_len += HSR_HLEN;

[Severity: Low]
How strictly should the new uAPI header be validated here? __pad0 and
__pad1 must be zero, but the other fields are looser.

This assignment turns any value from 1 to 255 into true:

	*has_hsr_header = hsr_inline_hdr->has_hsr_header;

Once this ships, can those values ever get another meaning, such as
future flags? Would it be better to reject anything other than 0 or 1?

eth_type is never checked. It only matters indirectly, when AF_PACKET
sends with protocol 0 and the hsr parse_protocol callback reads offset
12. If sll_protocol is set to ETH_P_1588 explicitly, any eth_type is
accepted. Is eth_type meant to be validated?

has_hsr_header is also accepted on PRP devices, which have no front HSR
tag (PRP uses a trailer). HSR_HLEN is still added to hdr_len, so
skb->network_header and skb->mac_len (20) do not match the real frame
layout.

I followed this to the end of the series and it does not appear to
crash. prp_register_frame_out() returns 0 when port_rcv is the master,
and the skb_std path is injected directly. Even so, should
has_hsr_header be rejected for PRP?

None of these semantics are documented in include/uapi/linux/hsr_ptp.h.

> +
> +	/* Ensure the real header after the stripped one can be
> +	 * accessed
> +	 */
> +	if (!pskb_may_pull(skb, sizeof(struct hsr_inline_header) +
> +			   hdr_len))
> +		return -EINVAL;
> +
> +	eth_hdr = skb_pull(skb, sizeof(struct hsr_inline_header));
> +	skb_set_network_header(skb, hdr_len);
> +	skb->protocol = eth_hdr->h_proto;
> +	return 0;
> +}
> +
>  static netdev_tx_t hsr_dev_xmit(struct sk_buff *skb, struct net_device *dev)
>  {

[ ... ]

> +	skb->dev = master->dev;
> +	if (skb->protocol == htons(ETH_P_1588) &&
> +	    hsr_ptp_parse_header(skb, &has_hsr_header, &req_tx_port))
> +		goto drop;

[Severity: Low]
Is the mandatory inline header meant to depend on skb->protocol rather
than on the ethertype in the frame?

Here skb->protocol comes from the AF_PACKET sll_protocol (or po->num). A
PTP frame sent with a different sll_protocol therefore skips
hsr_ptp_parse_header() and is forwarded to both ports, as it was before
this patch.

The receive side in hsr_handle_frame() classifies by the frame's
ethertype instead:

		if (hsr_ethhdr->hsr_tag.encap_proto == htons(ETH_P_1588))
			goto finish_free_consume;

This looks deliberate, given "hsr: Add header_ops::parse_protocol"
earlier in the series. The sender also needs CAP_NET_RAW, and the result
is only the behaviour from before this patch.

Could the commit message wording "if the ether type is ETH_P_1588" say
that it refers to skb->protocol?

> +
> +	skb_reset_mac_header(skb);
> +	skb_reset_mac_len(skb);

[Severity: Low]
At this commit, can a sender with has_hsr_header set put a sequence
number of its choosing into the duplicate-discard state?

has_hsr_header is trusted without checking that a real HSR tag follows.
skb_reset_mac_len() here turns hdr_len into skb->mac_len == 20.

A user-crafted ETH_P_HSR frame from the master port then passes this
check in hsr_fill_frame_info():

		if (skb->mac_len < sizeof(struct hsr_ethhdr))
			return -EINVAL;
		...
		frame->skb_hsr = skb;
		frame->sequence_nr = hsr_get_skb_sequence_nr(skb);

The frame then goes through hsr_get_node(), hsr_register_frame_in() and
hsr_register_frame_out()/hsr_check_duplicate(), possibly for a spoofed
node.

This seems limited to this intermediate commit. After "hsr: Use the port
and header information in hsr_forward_skb()", a frame with
has_hsr_header set is handled differently:

- fill_frame_info() skips hsr_get_node().
- hsr_fill_frame_info() returns early with skb_std = skb, before it
  reads the sequence number.
- hsr_forward_skb() skips hsr_register_frame_in().
- hsr_forward_do() sends the frame as a plain clone through
  inject_into_stack.

What remains at that point is a CAP_NET_RAW sender choosing the bytes
that go out of a chosen slave port. It could already do that on the
slave device directly.

Is it worth reordering the series so a bisect does not land on this
state?

> +	spin_lock_bh(&hsr->seqnr_lock);
> +	hsr_forward_skb(skb, master, req_tx_port, has_hsr_header);
> +	spin_unlock_bh(&hsr->seqnr_lock);

[ ... ]

> diff --git a/net/hsr/hsr_forward.c b/net/hsr/hsr_forward.c
> index b183358207506..f49d962337f8b 100644
> --- a/net/hsr/hsr_forward.c
> +++ b/net/hsr/hsr_forward.c
> @@ -771,7 +771,8 @@ static int fill_frame_info(struct hsr_frame_info *frame,
>  }
>  
>  /* Must be called holding rcu read lock (because of the port parameter) */
> -void hsr_forward_skb(struct sk_buff *skb, struct hsr_port *port)
> +void hsr_forward_skb(struct sk_buff *skb, struct hsr_port *port,
> +		     enum hsr_port_type req_tx_port, bool has_hsr_header)
>  {
>  	struct hsr_frame_info frame;
>  

[Severity: Low]
At this commit, req_tx_port and has_hsr_header are accepted here but not
used. The body still calls:

	if (fill_frame_info(&frame, skb, port) < 0)
		goto out_drop;

So hsr_dev_xmit() parses and validates the new uAPI fields, but they
have no effect until "hsr: Use the port and header information in
hsr_forward_skb()" later in the series. In that patch, fill_frame_info()
stores them, and hsr_forward_do() skips ports that do not match
req_tx_port. Frames with has_hsr_header set also skip
hsr_register_frame_in() and re-tagging there.

The commit message does say the values "will be used later". Would it be
easier for bisection to add the uAPI and the forwarding changes in the
same patch?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261125-hsr_ptp-v12-0-9ddd2a73cb90%40linutronix.de
