Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704038;
	b=j31ctl5cl3HXx28F6F8McXv1EdxxEk5tq95rX0q5LnS8t+mmKh+790P/1+M6SM92LVaN
	 /AYjWNDchLa+/Q1tJfABCnSNeDG4+kAHEs1b0N6UiqLpJ3XsLVAcLgPLG7pnWobOm67ZS
	 LbO6Ld1fnPyXa2soGwPhLBM/uZFskkjcPqS344/NsyKwhHB21rHx1rzVso7qTSxaw9cNz
	 lPp9OV0bZ0f2TRiZkOQN3FqU8+t7o+F95jFCcMUTpZJ6IE1AtMICxOpezTfo+11kH2Lgq
	 b2UnXRGXhM2jLLisWT5lwv7SUZLd02U3NwgANzLcziYmsXxPxMvoqXVOFSPdCMYMMKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704038;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=3wEzP5d7Bd3qZ1JpgyXs2/OeoFoYHRuNf/vP9XY7BvE=;
	b=OK5JmSXLqzX7cfjOhjm2GrU5jF1D/Xd8Vy7/bMeu727C55t5z7CP3Datb32NjO3OH4Q1
	 L6/lLdlz2f1SN2abN6Wevm+Ksi1ciF4wKn/bHx4TziXlnw2qXKyBJwkj+Uqt/sipNP9M2
	 dyZgZscD0jryqjrYj5auKpnp6VgG/NS+chV3Gc2l9icjsgFq1b33zIeXmRBYi9Aafy45S
	 jA55Vl/4FQHvmXPFQEwbvunncW+q4XD41HnySDFX0cYlb16WLmcALJKhOtQuz1NXBQNah
	 +aWKc7WmxLG52zlWOuRJAbvrFxTzVohCwOs8ronbgvhuQIRJBUg/JzuBpr7Z+SdMOkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="BQ2/N4xY";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F841606A321
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 14:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BQ2/N4xY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C8061F000D4;
	Thu, 26 Nov 2026 14:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795704038;
	bh=3wEzP5d7Bd3qZ1JpgyXs2/OeoFoYHRuNf/vP9XY7BvE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=BQ2/N4xYDbZpRkVsCSbos/hqwXeXKQyVPDMLnoXzPvzUovNJpG01NkCCMhxBVjB/u
	 7C94848l3WmduqV9xOBa1QM7x1qZhH0OQiHirubA+3lfXG3r5Uj7RQ+rnCghG/Bhe4
	 C7ix7sAC2pxKQSYxQxBlB3sfQyc7NvtBIujn74SeUIlsI7jJlXOtdqQHObr4OIfxKi
	 mcLMxnsOEDwAJWh3hx+6alx0ndJ5gvBoMEOzJtM6MKsR5FGjhxhuweVKXHYDOl0yxf
	 SN3pwDNCDSxhdUO2K2/u+uM+dpyfRf8Yc9Irql0mV57zy4b/6aLx/9n5NysD1gj4x7
	 ZE6ROvGGqwZ/w==
Subject: Re: [PATCH net-next v12 4/8] hsr: Drop received PTP packets
From: netdev-bot+sashiko@kernel.org
To: bigeasy@linutronix.de
Cc: netdev@vger.kernel.org, j-rameshbabu@ti.com, andrew+netdev@lunn.ch,
 danishanwar@ti.com, d-qiu@ti.com, davem@davemloft.net, fmaurer@redhat.com,
 kuba@kernel.org, neelima@ti.com, pabeni@redhat.com, praneeth@ti.com,
 pratheesh@ti.com, richardcochran@gmail.com, horms@kernel.org, vigneshr@ti.com,
 willemdebruijn.kernel@gmail.com, daniel.machon@microchip.com,
 edumazet@kernel.org
Date: Thu, 26 Nov 2026 14:40:36 +0000
Message-ID: <179570403670.3135.12162215727895219598@kernel.org>
In-Reply-To: <20261125-hsr_ptp-v12-4-9ddd2a73cb90@linutronix.de>
References: <20261125-hsr_ptp-v12-4-9ddd2a73cb90@linutronix.de>
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

- [Medium] The new PTP filter in hsr_handle_frame() (net/hsr/hsr_slave.c,
  lines 79-87) drops every received PTP frame before hsr_forward_skb()…
- [Low] The new deliberate PTP discard in hsr_handle_frame()
  (net/hsr/hsr_slave.c, lines 83/86) jumps to finish_free_consume.

--

hsr: Drop received PTP packets

This commit drops all received PTP frames in hsr_handle_frame(). A frame
is dropped when its HSR-encapsulated protocol is ETH_P_1588, or when its
plain ethertype is ETH_P_1588 for PRP and untagged frames. The intent is
for PTP stacks to read the frames on the slave interfaces, because
forwarding by the HSR stack adds latency that is not compensated.

> diff --git a/net/hsr/hsr_slave.c b/net/hsr/hsr_slave.c
> index 84d8a40bba0a6..86a05f3fc1cc5 100644
> --- a/net/hsr/hsr_slave.c
> +++ b/net/hsr/hsr_slave.c

[ ... ]

> @@ -64,15 +64,28 @@ static rx_handler_result_t hsr_handle_frame(struct sk_buff **pskb)
>  	skb_reset_mac_header(skb);
>  	if ((!hsr->prot_version && protocol == htons(ETH_P_PRP)) ||
>  	    protocol == htons(ETH_P_HSR)) {
> -		if (!pskb_may_pull(skb, ETH_HLEN + HSR_HLEN)) {
> -			kfree_skb(skb);
> -			goto finish_consume;
> -		}
> +		if (!pskb_may_pull(skb, ETH_HLEN + HSR_HLEN))
> +			goto finish_free_consume;
>  
>  		skb_set_network_header(skb, ETH_HLEN + HSR_HLEN);
>  	}
>  	skb_reset_mac_len(skb);
>  
> +	/* PTP packets are not supposed to be forwarded via HSR as-is. The
> +	 * latency introduced by forwarding renders the time information
> +	 * useless. Userland needs to capture the packet on the original
> +	 * interface instead of hsr.
> +	 */
> +	if ((!hsr->prot_version && protocol == htons(ETH_P_PRP)) ||
> +	    protocol == htons(ETH_P_HSR)) {
> +		hsr_ethhdr = (struct hsr_ethhdr *)skb_mac_header(skb);
> +		if (hsr_ethhdr->hsr_tag.encap_proto == htons(ETH_P_1588))
> +			goto finish_free_consume;
> +	} else {
> +		if (protocol == htons(ETH_P_1588))
> +			goto finish_free_consume;
> +	}
> +

[Severity: Medium]
This check runs before hsr_forward_skb() and applies to every port type,
including HSR_PT_INTERLINK. Doesn't that do more than stop PTP delivery
to hsr0? It looks like it also stops the kernel from relaying PTP frames
on to the other ring port and across the RedBox interlink.

On a software (non NETIF_F_HW_HSR_FWD) node, hsr_forward_skb() calls
hsr_forward_do() in net/hsr/hsr_forward.c, which would otherwise do:

	if (port->type == HSR_PT_SLAVE_A ||
	    port->type == HSR_PT_SLAVE_B)
		skb = hsr->proto_ops->create_tagged_frame(frame, port);
	else
		skb = hsr->proto_ops->get_untagged_frame(frame, port);

and then send the frame out the other slave and the interlink via
hsr_xmit().

Take a ring M - X - Y - Z - M where X, Y and Z are plain software HSR
nodes with no ptp4l running. X and Z would now both discard M's
Sync/Follow_Up/Delay messages, so Y never sees PTP at all. Before this
change, Y received PTP through the kernel relay, with uncompensated
forwarding delay.

SANs behind a RedBox would also lose PTP to and from the ring. The
"two copies" argument in the changelog doesn't seem to apply to the
interlink, which only ever has one copy. Any existing ptp4l bound to hsr0
would also stop receiving PTP.

The drop is unconditional, and there's no sysctl or netlink option to
turn it off. Is it intended that every software HSR node in a PTP ring
must now run a userspace transparent or boundary clock on its slave
interfaces?

If so, could the commit message say that this removes ring relaying and
RedBox interlink bridging of PTP, and not only delivery to the hsr
device?

>  	/* Only the frames received over the interlink port will assign a
>  	 * sequence number and require synchronisation vs other sender.
>  	 */
> @@ -84,7 +97,10 @@ static rx_handler_result_t hsr_handle_frame(struct sk_buff **pskb)
>  		hsr_forward_skb(skb, port, HSR_PT_NONE, false);
>  	}
>  
> -finish_consume:
> +	return RX_HANDLER_CONSUMED;
> +
> +finish_free_consume:
> +	kfree_skb(skb);
>  	return RX_HANDLER_CONSUMED;

[Severity: Low]
This isn't a bug, but the new PTP discard in hsr_handle_frame() shares
this label with the error drops. kfree_skb() reports it as
SKB_DROP_REASON_NOT_SPECIFIED, and no counter is incremented.

PTP Sync/Follow_Up/Delay_Req/Pdelay messages arrive continuously on every
slave port. Every HSR/PRP node would therefore emit a steady stream of
"not specified" drops on the skb:kfree_skb tracepoint and in drop
monitors. These policy drops can't be told apart from real faults.

Would a dedicated drop reason help here? Alternatively, consume_skb()
could be used if this isn't meant to count as a drop. Either could be
paired with a counter so the filtering shows up somewhere.

>  
>  finish_pass:

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261125-hsr_ptp-v12-0-9ddd2a73cb90%40linutronix.de
