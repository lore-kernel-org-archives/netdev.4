Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704040;
	b=mYinDRDEnXrvJ+SSXLRlrWFq5/b7XMiz0HscsUJmYHXrUBG//6cyW5Ft/7Hqiuoc+5XF
	 3vs4quq57qliyNFOTyIohMuggzZm1SEUAR0Lp/eThj3lJTAOm8/XWrYCZ3xS+Y8tpaOXc
	 opqgXvGR+uZAugjH9KNp/bkwlNIAy+nW+fA1wJ+8r9KwXuCZLxjItMMMuJqdhuQ2QNT6q
	 9KR/wOZlqx0qBbKjHtp8NnSwq9GH4J30AYAXxlrYSg2YUTAyzcU6+0wPHPtC5I8WtIsXG
	 bjNHnij8pVMDE8MHfF1zaADn7p+aznnSRTpOu6qh4aiv5h4o9S4M8ErIQOoj04c5d5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704040;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=X2DD/lGUjHLWVuY+OjlCk7qvtY3mDChPGPSJ1/v+790=;
	b=qXtcw5cYkZdJE6st7VDDY+LFQm7CoJB4JIdDpJ4eRtKOzFTNTzN6gG4mRg6XtXnP2jwe
	 HIRGOgKsnJV0ccb42G36RZwHMh80kr/ZAKdBTNryD3IhPm47LM2C4B0yHKsT/zZXEUlp/
	 0JU78s0dRYAjjNPGCl2k3Fp3mwTwOVhDJiGN5jjC+TKYUWX93wVsofzO2iyytaVCNm5V7
	 HXmRE8aR41uKY6Fc7tJL9L3QZd/Uus75hUIzxXTByW7Aca4ocY2Y88DI91R1vYdq9CKMs
	 8s23OYlkfPHk3LgBdOaTv6YsiBCWH4PQKraKIf9NMV5Sq5OCP1fLs3Y0LLclW7gt7Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Vje/D0OM";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5D7606A335
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 14:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vje/D0OM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11C0F1F000D0;
	Thu, 26 Nov 2026 14:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795704040;
	bh=X2DD/lGUjHLWVuY+OjlCk7qvtY3mDChPGPSJ1/v+790=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Vje/D0OMoZsgoEsAjcsHKuWBeO3UNS0+k3Y1rJJR6dfb2Ck+racQs526Y8CdygTKA
	 8MnDB2Tdkzb1nf7ga/kgL0ae0cWT+I12koKIXLwUmYPUm7r96NRZjoe6OwToOoo78F
	 EbpF+UlAANtJwSSO85bQ9ih6bu7OHaEEiPG9NxULdOYFA3NbQdduQ549m/sJla8mhv
	 l3Gy78CkqwgRlloUfqjiz4XwlBXt2yFZ8+YEGl+4A/AMjtgCZ8KzAfDMzwkVYE05Ob
	 tjJf3T7y+CKmHnsbvlo8+W6ySxMFfKYYshxUwrI4SWjUCzPI8wg967w7ETIEEl1Aoo
	 egmRHNHUHxLRw==
Subject: Re: [PATCH net-next v12 5/8] hsr: Use the port and header information
 in hsr_forward_skb()
From: netdev-bot+sashiko@kernel.org
To: bigeasy@linutronix.de
Cc: netdev@vger.kernel.org, j-rameshbabu@ti.com, andrew+netdev@lunn.ch,
 danishanwar@ti.com, d-qiu@ti.com, davem@davemloft.net, fmaurer@redhat.com,
 kuba@kernel.org, neelima@ti.com, pabeni@redhat.com, praneeth@ti.com,
 pratheesh@ti.com, richardcochran@gmail.com, horms@kernel.org, vigneshr@ti.com,
 willemdebruijn.kernel@gmail.com, daniel.machon@microchip.com,
 edumazet@kernel.org
Date: Thu, 26 Nov 2026 14:40:38 +0000
Message-ID: <179570403859.3135.16584243126137502674@kernel.org>
In-Reply-To: <20261125-hsr_ptp-v12-5-9ddd2a73cb90@linutronix.de>
References: <20261125-hsr_ptp-v12-5-9ddd2a73cb90@linutronix.de>
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

- [Medium] The commit message says the new behaviour "is only used in the
  pure software version" and that NETIF_F_HW_* offload hardware "need[s]…
- [Low] The patch makes hsr_fill_frame_info() check
  frame->has_hsr_header: it sets skb_std = skb, skips…

--

hsr: Use the port and header information in hsr_forward_skb()

This commit passes the requested TX port and the has_hsr_header flag from
the upper layer into hsr_forward_skb(). A frame is then sent only on the
requested port. When the frame already has a header, the commit skips the
sequence number assignment, the source address substitution and the node
lookup.

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

Is this limit enforced anywhere? hsr_dev_xmit() accepts the ETH_P_1588
inline header without checking hsr->fwd_offloaded or the slave features:

net/hsr/hsr_device.c:hsr_dev_xmit() {
    ...
	if (skb->protocol == htons(ETH_P_1588) &&
	    hsr_ptp_parse_header(skb, &has_hsr_header, &req_tx_port))
		goto drop;
    ...
}

The new req_tx_port filter and the has_hsr_header clone shortcut above
then apply to every slave. That includes slaves that advertise
NETIF_F_HW_HSR_DUP or NETIF_F_HW_HSR_TAG_INS.

For example, TI ICSSG in HSR offload mode does this in
emac_ndo_start_xmit():

drivers/net/ethernet/ti/icssg/icssg_common.c:emac_ndo_start_xmit() {
    ...
	if (prueth->is_hsr_offload_mode &&
	    (ndev->features & NETIF_F_HW_HSR_DUP))
		dst_tag_id = PRUETH_UNDIRECTED_PKT_DST_TAG;

	if (prueth->is_hsr_offload_mode &&
	    (ndev->features & NETIF_F_HW_HSR_TAG_INS))
		epib[1] |= PRUETH_UNDIRECTED_PKT_TAG_INS;
    ...
}

With this, wouldn't a frame requested only for SLAVE_A or SLAVE_B go out
on both ring ports? And wouldn't a frame that already carries an HSR
header get a second tag from the hardware?

Should the inline header be rejected when the slaves have HSR offload
features (ksz9477 and xrs700x are similar)? Or should the commit message
drop the claim that this is software only?

>  		/* Don't send frame over port where it has been sent before.
>  		 * Also for SAN, this shouldn't be done.
>  		 */

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

Only hsr_fill_frame_info() handles has_hsr_header. What happens on a PRP
device?

hsr_ptp_parse_header() does not check hsr->prot_version, so
has_hsr_header=true can reach hsr_forward_skb() on PRP. fill_frame_info()
then skips hsr_get_node() for both protocols. However,
prp_fill_frame_info() has no matching check:

net/hsr/hsr_forward.c:prp_fill_frame_info() {
	...
	if (rct &&
	    prp_check_lsdu_size(skb, rct, frame->is_supervision)) {
		...
		frame->skb_prp = skb;
		...
	}
	handle_std_frame(skb, frame);
	...
}

If there is no valid RCT, handle_std_frame() takes hsr->sequence_nr and
increments it. The new shortcut in hsr_forward_do() then sends the frame
unchanged. The sequence number is used up but never appears on the wire.

If there is a valid RCT, skb_std is NULL and the has_hsr_header shortcut
is skipped. The frame goes through register_frame_out, drop_frame and
prp_create_tagged_frame with node_src == NULL. It only avoids a NULL
dereference because prp_register_frame_out() returns early for frames
from the master port.

hsr_ptp_parse_header() also adds HSR_HLEN to hdr_len whenever
has_hsr_header is set:

	hdr_len = ETH_HLEN;
	if (*has_hsr_header)
		hdr_len += HSR_HLEN;

PRP uses a trailer, not a header. On PRP, wouldn't this require 6 extra
pullable bytes and put the network header 6 bytes too far into the frame?

The later commit "hsr: Assign a socket for cloned skbs" says it "does not
consider PRP part of the stack". Still, nothing in the series rejects the
inline header on PRP devices.

Should PRP reject has_hsr_header, or handle it the way
hsr_fill_frame_info() does?

>  	/* HSRv0 supervisory frames double as a tag so treat them as tagged. */
>  	if ((!hsr->prot_version && proto == htons(ETH_P_PRP)) ||
>  	    proto == htons(ETH_P_HSR)) {

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261125-hsr_ptp-v12-0-9ddd2a73cb90%40linutronix.de
