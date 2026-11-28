Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795825498;
	b=c3wcQWJyZe2joeNlzlKEhAN9fPDOHpUf9TSjTIcLRBWNKUOeljF1SOQ/WYoOe0akYq7D
	 bRPt9gDyCxFFE12rjaBjTyUYl1kOkAXoXQmCFMw/YLetNsyA25JD6tmj1nqwuZ7ipdEh0
	 7U1aGwGQxp3mEaGWRDfzL8mKmV/Id03aDXTcEBi+vi6VwmeISsUXIm9h6ERR6kRhdqOSK
	 OQMv02M6FOjd4Ty7i35sbsdvWrspd28usgQ28nUrcFkVnRffQCTgCNSgF6R/ebHVqLg8T
	 wPbaiaU17mIxAkDvHOgTXO2QcEEMjPe45atSab08pIhprdk2j/LHv+b7uMXJJD7Vssg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795825498;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=09L5HUBZ1BCUQ/t+HM1IWNj9IGTex2TWwdvNuHDcgtE=;
	b=crBt1jTij/B6VXWJRLO53mnUCzVpeZv4m0gbgXMHQsLXZgmo4SVHZS3uiPp+WXJWpyMW
	 3n9P8pI2hm9S3e5ptUmILllEJU1LzTM7xhK1YHd7efRTYJhqbJPRLXaj8j8hmFfOSqqLa
	 ny7ZPXeZ+HpOetn3OLQ5xLmP0q56XMMsjPXew1xQacJLdITT/vPzd/18xgqFPE4KV0af8
	 wOejdx3uEjeGvtlAVKPfr0W3nP1x1Apd6uWg5RIJw1gtHspLnJNbaFMKt8xWK+F/BLWu7
	 4rwXQetOhZdhbqYnrR03BRHbZjAYEi01IvyEJGFE8sy24UC20OWMrToaRndG97Eb0mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D7DA+YQU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F79606A31E
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 00:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D7DA+YQU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 263381F000C1;
	Sat, 28 Nov 2026 00:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795825497;
	bh=09L5HUBZ1BCUQ/t+HM1IWNj9IGTex2TWwdvNuHDcgtE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=D7DA+YQUc+Iys2PNYLV0X5cMtL87crcPRffaJ2xMo/8ESV8BK1IkasQMCp5roRz3w
	 cUAkys3g92rXfItcs3r6G3jFUWJvtBs2J1P+kD68tHOSlKsvtCyNNXnhF24snOfHnE
	 PtJG4up9FbCYqj+DAX2dyZx3+Drio6/ds74mV72nvO7/SZJJFPVCziYb64hhJt1HBk
	 hnEK0BKNWzpcXt64Chp0pa25o9OqsK+ttBNepMuObfI5PqLh2hj1Gh1ToIiZm441uY
	 Q2bWytahJGu9ANsNCHUjGj996nYVj2HGJxsDAlnsb78H2QmyQOXMHE/PdiRgbm+8zE
	 pg+eQIM9RNwRw==
Subject:
 Re: [PATCH net] net/ncsi: validate GMCMA address_count against packet length
From: netdev-bot+sashiko@kernel.org
To: yuxiaozhang@google.com
Cc: sam@mendozajonas.com, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, willemb@google.com, fercerpav@gmail.com,
 horms@kernel.org, peter@pjd.dev, patrick@stwcx.xyz, netdev@vger.kernel.org
Date: Sat, 28 Nov 2026 00:24:56 +0000
Message-ID: <179582549670.3135.13198667418552327597@kernel.org>
In-Reply-To: <20261124211830.3298822-1-yuxiaozhang@google.com>
References: <20261124211830.3298822-1-yuxiaozhang@google.com>
X-sashiko-severity: High
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 (1) · High: 1 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The patch does not close the GMCMA out-of-bounds read it
  describes.

Pre-existing issues:
- [Critical] This problem wasn't introduced by this patch, but the
  sibling variable-length handler ncsi_rsp_handler_gp() (net/ncsi/ncsi-…

--

net/ncsi: validate GMCMA address_count against packet length

This patch adds pskb_may_pull() and NC-SI length checks to
ncsi_rsp_handler_gmcma(), so that address_count can no longer index past
the received data. It also unshares the skb in ncsi_rcv_rsp() with
skb_share_check(), and logs nrh->type instead of hdr->type after the
handler runs.

> diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
> index 33921dc169e3d..df915fdbbf276 100644
> --- a/net/ncsi/ncsi-rsp.c
> +++ b/net/ncsi/ncsi-rsp.c
> @@ -1085,8 +1085,19 @@ static int ncsi_rsp_handler_gmcma(struct ncsi_request *nr)
>  	struct sockaddr_storage *saddr = &ndp->pending_mac;
>  	struct net_device *ndev = ndp->ndev.dev;
>  	struct ncsi_rsp_gmcma_pkt *rsp;
> +	size_t hdr_len, needed;
>  	int i;
>  
> +	hdr_len = offsetof(struct ncsi_rsp_gmcma_pkt, addresses);
> +	if (!pskb_may_pull(nr->rsp, hdr_len))
> +		return -EINVAL;
> +
> +	rsp = (struct ncsi_rsp_gmcma_pkt *)skb_network_header(nr->rsp);
> +	needed = hdr_len + (size_t)rsp->address_count * ETH_ALEN;
> +	if (ntohs(rsp->rsp.common.length) < needed - sizeof(struct ncsi_pkt_hdr) ||
> +	    !pskb_may_pull(nr->rsp, needed))
> +		return -EINVAL;

[Severity: High]
Do these checks run too late to stop the short-skb out-of-bounds read
that the commit message describes?

GMCMA is registered with a variable payload:

net/ncsi/ncsi-rsp.c:ncsi_rsp_handlers[] {
    ...
	{ NCSI_PKT_RSP_GMCMA,  -1, ncsi_rsp_handler_gmcma   },
    ...
}

So ncsi_rcv_rsp() takes the payload length from the packet and passes it
to the validator before it calls the handler:

net/ncsi/ncsi-rsp.c:ncsi_rcv_rsp() {
    ...
	payload = nrh->payload;
	if (payload < 0)
		payload = ntohs(hdr->length);
	ret = ncsi_validate_rsp_pkt(nr, payload);
    ...
}

The validator's length check compares hdr->length with itself, so it
always passes. The validator then reads a checksum word at an offset
derived from that length, and may checksum the whole range. Neither step
is compared against skb->len:

net/ncsi/ncsi-rsp.c:ncsi_validate_rsp_pkt() {
    ...
	pchecksum = (__be32 *)((void *)(h + 1) + ALIGN(payload, 4) - 4);
	if (ntohl(*pchecksum) == 0)
		return 0;

	checksum = ncsi_calculate_checksum((unsigned char *)h,
					   sizeof(*h) + payload - 4);
    ...
}

For example, take a 60-byte GMCMA frame with address_count = 255 and
length = 1538. It passes the new length check here. The checksum load
lands about 1552 bytes past the network header. That is beyond the skb
data and beyond the 1536-byte ftgmac100 RX buffer.

With length = 0xffff the read can reach about 64 KiB past the buffer,
which can hit unmapped memory in softirq context. If the out-of-bounds
word is non-zero, it is also printed through netdev_dbg().

The pskb_may_pull(nr->rsp, needed) above fails only after that read has
already happened.

Would it be better to check or pull sizeof(struct ncsi_rsp_pkt_hdr) +
ALIGN(payload, 4) bytes in ncsi_rcv_rsp() before calling
ncsi_validate_rsp_pkt()? The new skb_share_check() makes a pull safe at
that point.

A central check would also cover the other payload == -1 handlers (OEM,
PLDM, QPNPR, SNPR, GP). With it in place, this handler would only need to
check address_count against the length.

> +
>  	rsp = (struct ncsi_rsp_gmcma_pkt *)skb_network_header(nr->rsp);
>  	ndev->priv_flags |= IFF_LIVE_ADDR_CHANGE;
>  
> @@ -1174,6 +1185,10 @@ int ncsi_rcv_rsp(struct sk_buff *skb, struct net_device *dev,
>  		goto err_free_skb;
>  	}
>  
> +	skb = skb_share_check(skb, GFP_ATOMIC);
> +	if (!skb)
> +		return -ENOMEM;
> +

[Severity: Critical]
This isn't a bug introduced by this patch, but ncsi_rsp_handler_gp() has
the same kind of packet-supplied count problem. There it also writes past
heap allocations. Can a GP response overflow ncmf->addrs and ncvf->vids?

GP is also registered with payload -1, so its length is never bounded.
The handler loops over u8 counts taken from the packet:

net/ncsi/ncsi-rsp.c:ncsi_rsp_handler_gp() {
    ...
	for (i = 0; i < rsp->mac_cnt; i++, pdata += 6) {
		assign_bit(i, bitmap, enable & (0x1 << i));

		memcpy(&ncmf->addrs[i * ETH_ALEN], pdata, ETH_ALEN);
	}
    ...
	for (i = 0; i < rsp->vlan_cnt; i++, pdata += 2) {
		assign_bit(i, bitmap, enable & (0x1 << i));

		ncvf->vids[i] = ntohs(*(__be16 *)pdata);
	}
    ...
}

ncmf->addrs was sized from the earlier GC response:

net/ncsi/ncsi-rsp.c:ncsi_rsp_handler_gc() {
    ...
	size = (rsp->uc_cnt + rsp->mc_cnt + rsp->mixed_cnt) * ETH_ALEN;
	nc->mac_filter.addrs = kzalloc(size, GFP_ATOMIC);
    ...
}

ncvf->vids was sized from the vlan_cnt in the GC response. GP never
compares its own mac_cnt or vlan_cnt with those sizes. So the memcpy()
and the vids[i] stores can write past the end of both allocations.

bitmap points at a single u64 (ncmf->bitmap or ncvf->bitmap). When
i >= 64, assign_bit() writes past it into the next members of struct
ncsi_channel_mac_filter. That includes the addrs pointer, which the
following memcpy() calls then use.

pdata can also read up to 48 + 255 * 6 + 255 * 2 = 2088 bytes past the
network header, beyond the 1536-byte ftgmac100 RX buffer.

ncsi_rcv_rsp() picks the handler from hdr->type and the request from
hdr->id. It never checks that the response type matches the command that
was sent, so a GP-typed response to any outstanding request reaches this
code. If GC has not run yet, addrs is NULL and the memcpy() would oops.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261124211830.3298822-1-yuxiaozhang%40google.com
