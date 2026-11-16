Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794840350;
	b=Z6cXI1kfeOdeFHrSZIGKwkQ6+iWRTRQTp70e8CBmgz/6rR41acpiVX0pNOPbV4wHHS0S
	 JLweq6W/69k6Ou/39TGI7TkdY9+uuMn+E8NKV8yXpmgFNOo/8LmnQcW/IZjLlAv8X/7qj
	 j5DGr0H3sHRHNgQa0E3WOUoLQc645Vl3UZYLVzU9qYTnKSkNTbrAB3BNq/Rz6wGD6THN5
	 +XSOO9zLWqZZ6HD7Xmq6BqS1F2ksnIspUfRsSrxp9cQBlboksEWS8yOV8OKO/abQkJ1eK
	 6vCuireduT9Le0MBymCpS0fJdOEZUJADPElzWUh4Y/u7p6Qf0Hl5vOUkflWf0j57YpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794840350;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=wlt8ntB/g5a2qjkl+7ERXzbcCc95yBGeOSybskcpiCY=;
	b=HF3OOxFMBdwHxYA0Y6erUFDN525367XpGnjQOBbjTkEV320hhZuyVopTp4vRnjTnNTHr
	 8tvtl+lzQ8l5iCpaz5N59mcM1G0IygA4Bu7yVERjS19UxAMx6tarrR8dsLLm09TvkXd1H
	 vG8VQDHKqMIYt6E9YASM9pGgg2B8Ji6+fnbDDPBMSwa6aDjgg3Oswk3p+MhnMBx+pBSDI
	 MBRZXZZB43o4p6CXPZqtJlltEvc23Y/TKMxiC+7qBYG7DPknkj0jDlALp859NiExRFmve
	 e6EA8iUrnKkMh8sExqUVw8a5SJv0Ns8No9mu+iQ0Ux3jZo9qbrU3bEPoNjGp3/kWuUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nf5ey+fQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B1B606A33A
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 14:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nf5ey+fQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F5C31F000C4;
	Mon, 16 Nov 2026 14:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794840350;
	bh=wlt8ntB/g5a2qjkl+7ERXzbcCc95yBGeOSybskcpiCY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Nf5ey+fQvsWHrSrgjpAgACeP8oNcLqcW/UJ8DGQk0qyN6IaWrFOWRgT3lRUXS2NJo
	 Qliaw7HhgbHGNEvERJyDfzrTwGWnLqTwIQHxtJ8+nYhlGOYxcgywazgwfZG6Yakw6e
	 9O+ur+oTofGbOSrh2JdKZMU5URb8n33T3kP7go4bCXRDVyLSl3pVkbO3FavCeVwcE3
	 jSof68eO/RgOi+6LCBkdHXhbnp0+gQ58EXkf9/TR51OeNZYP+72IFWXAZagAfON/eG
	 JNRng1P6SXW5Lc8QP5tKOPP6sa6yu0u5Q9z5ic3N33XqTjmJeZ1FHb8+vyuL9BbpyK
	 EWxX23JAzJeAw==
Subject: Re: [PATCH net-next v8 11/19] net: ethernet: cortina: Validate RX
 fragment lengths
From: netdev-bot+sashiko@kernel.org
To: linusw@kernel.org
Cc: ulli.kroll@googlemail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, mirq-linux@rere.qmqm.pl,
 mhun512@gmail.com, edumazet@kernel.org, netdev@vger.kernel.org
Date: Mon, 16 Nov 2026 14:45:49 +0000
Message-ID: <179484034918.3136.1025801687896166519@kernel.org>
In-Reply-To: <20261112-gemini-ethernet-fixes-3-v8-11-f55bd43e02d3@kernel.org>
References: <20261112-gemini-ethernet-fixes-3-v8-11-f55bd43e02d3@kernel.org>
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

- [Low] In drivers/net/ethernet/cortina/gemini.c, gmac_rx() calls
  gmac_skb_if_good_frame() on the SOF descriptor.

--

net: ethernet: cortina: Validate RX fragment lengths

This patch adds checks in gmac_rx() so that an RX fragment cannot run
past its posted free queue fragment or past the page. Zero-length
non-final descriptors are now dropped, and an empty EOF descriptor
completes the frame that is already assembled.

> diff --git a/drivers/net/ethernet/cortina/gemini.c b/drivers/net/ethernet/cortina/gemini.c
> index 72d2c002f8fc2..364504c9d441a 100644
> --- a/drivers/net/ethernet/cortina/gemini.c
> +++ b/drivers/net/ethernet/cortina/gemini.c

[ ... ]

> @@ -1864,6 +1865,9 @@ static unsigned int gmac_rx(struct net_device *netdev, unsigned int budget,
>  			if (!skb)
>  				goto err_drop;
>  
> +			if (frag_len < NET_IP_ALIGN)
> +				goto err_drop;
> +
>  			page_offs += NET_IP_ALIGN;
>  			frag_len -= NET_IP_ALIGN;
>  			frag_nr = 0;

[Severity: Low]
Is this frame now counted as both received and dropped?

By the time this check runs, gmac_skb_if_good_frame() has already counted
the frame as received:

drivers/net/ethernet/cortina/gemini.c:gmac_skb_if_good_frame() {
    ...
update_exit:
	port->stats.rx_bytes += frame_len;
	port->stats.rx_packets++;
	return skb;
}

err_drop then frees the skb and increments rx_dropped. The dropping flag
was reset to false on SOF, so that increment always happens:

err_drop:
	if (skb) {
		napi_free_frags(&port->napi);
	...
	if (!dropping) {
		port->stats.rx_dropped++;
		dropping = true;
	}

Nothing takes back the earlier rx_packets and rx_bytes increments. The
rx_bytes value also comes from the hardware byte_count, which this patch
otherwise treats as untrusted.

The other new paths into err_drop that this patch adds later in gmac_rx()
do the same thing:

- the frame_len < ETH_ZLEN || frame_len < skb->len check on EOF
- the zero-length non-final descriptor
- the freeq_frag_len / PAGE_SIZE bounds check

The commit message says:

    Account descriptor inconsistencies as drops rather than wire length
    errors.

Is that accurate, given that these frames also show up in rx_packets and
rx_bytes?

The napi_get_frags() failure path and failures on later descriptors
already double count like this. This patch adds more ways to reach it. The
problem is also still there at the end of the series: "net: ethernet:
cortina: Scope RX statistics updates" only wraps the same update_exit
increments in u64_stats_update_begin()/u64_stats_update_end().

Could the rx_packets/rx_bytes update move to the napi_gro_frags()
completion point instead?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112-gemini-ethernet-fixes-3-v8-0-f55bd43e02d3%40kernel.org
