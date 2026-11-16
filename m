Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794840352;
	b=N03OMgG+Uu1CK4UcXEzLGw64qmG/rUzSDcVP6zDcsApoRnAWtMnIdqMJQw8TrGrxAT/V
	 imDG2sxcLrY+cvByV8lJZhD407yIHbEyT6xvZu+bxaM0oeMrOgo9/NTzMu4NNjVrwzEtj
	 7eOj+ZBMW+O55lszYUd+JBmtixdwTJRf5EYucYzmb+znJ08BV3r+YxI+bei7LtZ3ITb7E
	 UgRVXnsglGWex8448uCfE2+NKkTh2JNeXzgq2ZK9nJ4cGMv8gF1JHDeaTg5s3RPZFKt58
	 XoclFvhg3i9/a1cN0B8mj44IUoIPmh8soT5moc94hqrbKYNQOxwssLt4utjPnuuBmhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794840352;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Gn8+M7wLxZ4BVjE1ZTyNRMg8KRJSYRjgfhn9SubttWE=;
	b=pXdIWWViCqEpAeokMPKmOAJEMVdhLEX9oPbbhwcHpLcQdOusyKnTtjXo5ecaRFVrEKVk
	 aDgSlbvs8aZDsBNA7xbLRd8edvXWSf8tyw6qLslL1YQV6f2kSuC5koo2q6jzVkqTEPAPb
	 avw4EOJhi8dT9WClvjFbCTGdxqp+8EX0ZVJAzyv8WvZJgLhOiuUUgOnOLIEoSDZhODZj9
	 JG1b3vf0ZgURCvC2N/fjKkqFLTEF2IKNkDbn3vu1+k3ieG/QL5Ukm+borTPMMmXnRsOWa
	 X78Qr6mGLjY4UqDK+uSNhNdBxSFQCHsBveOqEBAPjdlloEK2iWxttD/VVlOnD6gewgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="jwcR/2LQ";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6961606A888
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 14:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jwcR/2LQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C9901F000C6;
	Mon, 16 Nov 2026 14:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794840352;
	bh=Gn8+M7wLxZ4BVjE1ZTyNRMg8KRJSYRjgfhn9SubttWE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=jwcR/2LQSZYWZzDFcTqmfqZgNfncRGM4DPcWU47MseLSGxjZyU4Xl7zsXCCQ6Erys
	 D0Hxi5pOKPxrCWV55JbvreKPFfuWcE7sJgIuBWSlB3A3GsmDh4YfirZQhchhtZyrZO
	 YCKL1E5IL9/TtoqMdJjXrk/SqmSHX1eP9teiucouNMMZSMljWWilNmH1R/sc5d+vOA
	 3A8+yZvSic8rhEXvhpqbl6NEglJ9vxrfaWQBNAjlOBJrRLtgiZ2XnigdePzLzFUx2h
	 Ujyt62MyA1VQG0VCeS+359FWr/nfnBqTM2KJ6Ey3GQpDeCFFKkU+hmX8fLkoEBPYL2
	 UswocgyY9ilXA==
Subject: Re: [PATCH net-next v8 19/19] net: ethernet: cortina: Fix ethtool
 statistics reads
From: netdev-bot+sashiko@kernel.org
To: linusw@kernel.org
Cc: ulli.kroll@googlemail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, mirq-linux@rere.qmqm.pl,
 mhun512@gmail.com, edumazet@kernel.org, netdev@vger.kernel.org
Date: Mon, 16 Nov 2026 14:45:51 +0000
Message-ID: <179484035158.3136.6315312321959459543@kernel.org>
In-Reply-To: <20261112-gemini-ethernet-fixes-3-v8-19-f55bd43e02d3@kernel.org>
References: <20261112-gemini-ethernet-fixes-3-v8-19-f55bd43e02d3@kernel.org>
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

- [Low] In gmac_get_ethtool_stats()
  (drivers/net/ethernet/cortina/gemini.c), the patch adds `tx_hw_csummed…

--

net: ethernet: cortina: Fix ethtool statistics reads

This fixes the TX statistics retry loop in gmac_get_ethtool_stats(). The
loop wrote through values instead of p, so a seqcount retry could write
past the end of the ethtool stats array. It also stops clearing
tx_frag_stats[] from the reader, and now snapshots tx_hw_csummed under
ir_stats_syncp to match its writer.

> diff --git a/drivers/net/ethernet/cortina/gemini.c b/drivers/net/ethernet/cortina/gemini.c
> index 899d96420b1b8..d4aa283ccb7b7 100644
> --- a/drivers/net/ethernet/cortina/gemini.c
> +++ b/drivers/net/ethernet/cortina/gemini.c

[ ... ]

> @@ -2532,6 +2533,7 @@ static void gmac_get_ethtool_stats(struct net_device *netdev,
>  
>  		for (i = 0; i < RX_STATS_NUM; i++)
>  			*p++ = port->hw_stats[i];
> +		tx_hw_csummed = port->tx_hw_csummed;
>  
>  	} while (u64_stats_fetch_retry(&port->ir_stats_syncp, start));
>  	values = p;

[Severity: Low]
This isn't a bug, but should the comment above this loop be updated as
well? It still says only:

	/* Racing with MIB interrupt */
	do {
		p = values;
		start = u64_stats_fetch_begin(&port->ir_stats_syncp);

The MIB path, gmac_update_hw_stats(), never writes tx_hw_csummed. The
only writer is gmac_clean_txq(), which is reached from gmac_start_xmit()
and gmac_cleanup_txqs():

drivers/net/ethernet/cortina/gemini.c:gmac_clean_txq() {
    ...
	spin_lock_irqsave(&geth->irq_lock, flags);
	u64_stats_update_begin(&port->ir_stats_syncp);
	...
	port->tx_hw_csummed += hwchksum;
	u64_stats_update_end(&port->ir_stats_syncp);
    ...
}

Before this patch the loop only read hw_stats[], so the comment was
accurate. The other ir_stats_syncp reader, gmac_get_stats64(), already
lists both writers:

	/* Racing with MIB and TX completion interrupts */

Could this loop's comment name the TX completion writer too, so the two
readers describe the same seqcount the same way?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112-gemini-ethernet-fixes-3-v8-0-f55bd43e02d3%40kernel.org
