Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795519546;
	b=sF9zkLDi7/uodtXXxIX8o2UP+B3zcJo2MIdugwU/0gMFl6M13NDt2W+I9mHPOIWfX1SL
	 EN88Worc2BG9RrjneH2GEPtJwtl21O8jS0xnxB55X8YQeOLwXEzjBhHb7nBxLbIF4aF+h
	 MTkC13eASlGDT/3XuGvmJX5tFJQaPNQxtTJ8Dvl8YG9+3PUSSczu+N5rrLKv8JJSu35WS
	 qmNjWQAs1qFc8x4kNMI00CqKrIzx46vdyyJA1+Eyfmuu51N1ZIIJ4vewmiuCXaBKP41m7
	 IqK2C7LFDmh7IoJ0rWSMhSEvWCBGl9CPB9+oXDtJ3fkG3wZvG9T6AT3+sQl0h0F0e1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795519546;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=dxrPMgbdDH4wG1jSOMnOIFvif3gMHQK0F5B7UbIVwfM=;
	b=3wBdbONzfwAnyApCuSVTxl6OS4/J/4xqHxysdv+wLw0Rlho3sMYZsaPkY2sdWsOS7UOv
	 XevNXKsjeqTYOAQhY4OrKG60xhOv4p+Nh/rEhvP3lnr2CJAPEzuhPbXWjY38UIHSiGMkK
	 6JlFBMU8k9rTgI3dN+qUass+2vG3O2Qnje4/l0qYC/OdqVprWdP44069J2EL7Vt3q+FlK
	 N6PspldwmJANhYKLZqZylJ8NKBbRizEYvQd980BMwzk+YdWz+DJXTM8O9YTgh6iHSUkNn
	 g9p9s7ddZu13BL/jORMTINCg8oeZWkFIUbKlWROBwUKlb+74Yf9LLHluq6KQgyPV9eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hx9zw5U7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F15606A322
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 11:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hx9zw5U7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6695D1F000D1;
	Tue, 24 Nov 2026 11:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795519545;
	bh=dxrPMgbdDH4wG1jSOMnOIFvif3gMHQK0F5B7UbIVwfM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hx9zw5U7QFTZPY1hz51bSlUMRbeF2wSBJdNlNT9jFyOUubKEowLrPJUMbSe3ZVc99
	 VPuH0e7o0kP9eZMSwJ/JTsHykyi6jVFgQTbFp08BT0UZ4zvM0aqrlS8U6+xN24qCzn
	 KjV3Kp8+yNOnv1zAPSQ6LPzZ60IvA+Vl7u1JLpV3s/VliJoQFjWfQooGahoboAh9aS
	 3K3HM71EhqGjw3h4dUbYS78n0cy520ILZ2+zKUQ6AiA8qMA+teoQGf8A2c9/XlDnfC
	 s6Ui9oRb9X1LsAY4Cv/Is5o6Dwefr+kpXKEY2OK/STfi/OsS/5xxP6t7pHhkZtI4R2
	 cfKgRrBj+ioOw==
Subject: Re: [PATCH net-next v11 5/8] hsr: Use the port and header information
 in hsr_forward_skb()
From: netdev-bot+sashiko@kernel.org
To: bigeasy@linutronix.de
Cc: netdev@vger.kernel.org, j-rameshbabu@ti.com, andrew+netdev@lunn.ch,
 danishanwar@ti.com, d-qiu@ti.com, davem@davemloft.net, fmaurer@redhat.com,
 kuba@kernel.org, neelima@ti.com, pabeni@redhat.com, praneeth@ti.com,
 pratheesh@ti.com, richardcochran@gmail.com, horms@kernel.org, vigneshr@ti.com,
 willemdebruijn.kernel@gmail.com, daniel.machon@microchip.com,
 edumazet@kernel.org
Date: Tue, 24 Nov 2026 11:25:43 +0000
Message-ID: <179551954393.3135.14245872279309105973@kernel.org>
In-Reply-To: <20261120-hsr_ptp-v11-5-264c88f4f1d0@linutronix.de>
References: <20261120-hsr_ptp-v11-5-264c88f4f1d0@linutronix.de>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The commit message says the new path "is only used in the pure
  software version" and that NETIF_F_HW_* offload "need[s] to be…
- [Low] The has_hsr_header semantics added by this patch are implemented
  for HSR only, not PRP.

--

hsr: Use the port and header information in hsr_forward_skb()

This commit makes hsr_forward_skb() honour a TX port requested by the
upper layer and a flag saying the frame already carries an HSR header.
Frames that already have a header are cloned and sent unchanged on the
requested port. They skip sequence number assignment, source address
substitution and the node_db lookup.

> diff --git a/net/hsr/hsr_forward.c b/net/hsr/hsr_forward.c
> index f49d962337f8b..1d1d75ed8cd06 100644
> --- a/net/hsr/hsr_forward.c
> +++ b/net/hsr/hsr_forward.c

[ ... ]

> @@ -570,6 +571,20 @@ static void hsr_forward_do(struct hsr_frame_info *frame)
>  		if ((port->dev->features & NETIF_F_HW_HSR_DUP) && sent)
>  			continue;
>  
> +		/* If this frame has a specific outgoing port specified (by the
> +		 * sender) then send it on this port only.
> +		 */
> +		if (frame->req_tx_port != HSR_PT_NONE &&
> +		    frame->req_tx_port != port->type)
> +			continue;
> +		/* If this TX frame already has a HSR header then forward the
> +		 * frame with it and don't add one.
> +		 */
> +		if (frame->has_hsr_header && frame->skb_std) {
> +			skb = skb_clone(frame->skb_std, GFP_ATOMIC);
> +			goto inject_into_stack;
> +		}
> +

[Severity: Medium]

The commit message says:

  This is only used in the pure software version. Hardware with any kind
  of NETIF_F_HW_* offload support need to be addressed separately.

Does anything in the code actually limit this to software?
hsr_dev_xmit() accepts the inline header for ETH_P_1588 frames on any HSR
device. Neither the req_tx_port filter nor the has_hsr_header shortcut
here checks port->dev->features.

When a slave has NETIF_F_HW_HSR_DUP (ksz9477 and xrs700x through DSA),
software sends one clone to the requested port only. However,
dsa_xmit_port_mask() in net/dsa/tag.h ORs every HSR member port into the
TX mask:

    if (IS_ENABLED(CONFIG_HSR) &&
        unlikely(dev->features & NETIF_F_HW_HSR_DUP)) {
        ...
        dsa_hsr_foreach_port(other_dp, dp->ds, hsr_dev)
            mask |= BIT(other_dp->index);
    }

icssg also switches to PRUETH_UNDIRECTED_PKT_DST_TAG in that mode.
Wouldn't a PTP frame meant for one ring port then go out on both?

For NETIF_F_HW_HSR_TAG_INS (xrs700x, icssg), hsr_create_tagged_frame()
hands these devices untagged frames so the hardware can insert the tag:

    if (port->dev->features & NETIF_F_HW_HSR_TAG_INS)
        return skb;

The shortcut above passes a clone of the already tagged skb_std straight
to the slave. icssg sets PRUETH_UNDIRECTED_PKT_TAG_INS whenever it is in
HSR offload mode.

Could the frame then get a second tag and lose the sequence number that
the commit says must be preserved?

The later commit "hsr: Move struct hsr_ethhdr to a global header" says
drivers will need to inspect the header and suppress offloading. No
driver in the series does that, so these requests are accepted and then
mishandled without any error.

Should hsr_dev_xmit() reject inline header requests when a slave has
NETIF_F_HW_HSR_* features set?

As a side note, skb_hsr frames from the master in hsr_create_tagged_frame()
already skip the TAG_INS check, so that part is pre-existing behaviour.

[ ... ]

> @@ -661,6 +677,13 @@ int hsr_fill_frame_info(__be16 proto, struct sk_buff *skb,
>  	struct hsr_port *port = frame->port_rcv;
>  	struct hsr_priv *hsr = port->hsr;
>  
> +	if (frame->has_hsr_header) {
> +		frame->skb_std = skb;
> +
> +		WARN_ON_ONCE(port->type != HSR_PT_MASTER);
> +		WARN_ON_ONCE(skb->mac_len < sizeof(struct hsr_ethhdr));
> +		return 0;
> +	}

[Severity: Low]

This early return exists only in hsr_fill_frame_info(). On a PRP device,
proto_ops->fill_frame_info is prp_fill_frame_info(), and that function
ignores has_hsr_header.

hsr_ptp_parse_header() in net/hsr/hsr_device.c doesn't check
hsr->prot_version either. It also adds HSR_HLEN to the header length,
although PRP frames have no HSR tag.

What is supposed to happen to a PRP frame with has_hsr_header set?

Without a valid RCT, handle_std_frame() still takes a sequence number:

    frame->sequence_nr = hsr->sequence_nr;
    WRITE_ONCE(hsr->sequence_nr, hsr->sequence_nr + 1);

The frame is then sent unchanged through the skb_std shortcut in
hsr_forward_do(). The counter still advances, which leaves gaps in the
sequence numbers.

With a valid RCT, skb_std stays NULL, so this check in hsr_forward_do()
is false:

    if (frame->has_hsr_header && frame->skb_std) {

The frame then goes down the normal register_frame_out, drop_frame and
prp_create_tagged_frame() path with node_src still NULL.
prp_set_lan_id() then rewrites the trailer the user supplied.

A NULL dereference of node_src seems to be avoided only by accident:

- prp_register_frame_out() returns early because port_rcv is
  HSR_PT_MASTER.
- req_tx_port limits egress to HSR_PT_SLAVE_A/B, so
  hsr_handle_sup_frame() isn't reached.
- hsr_xmit() now skips hsr_addr_subst_dest().

The later commit "hsr: Assign a socket for cloned skbs" says PRP is not
considered, but the parser still accepts the flag on PRP devices. Should
hsr_ptp_parse_header() reject has_hsr_header on PRP, or should
prp_fill_frame_info() get a matching branch?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120-hsr_ptp-v11-0-264c88f4f1d0%40linutronix.de
