Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795150128;
	b=lSF5iMF07kc6H/99SMD/hVM5fPHYQ9xpgas9Whca2Te5RjBlw9LXFNHxZ6J8J1rrYWuv
	 aF7TslbGi4JKP7/c+jzNM0RjhDej9E4wVxR2Qcam4z8p09w5FCKTlkKcjJKudB1v94xkY
	 R3+X8kwjfCOBrsgB3H4E+dm6Shmjsk9mJvhlSuQHHbxyOsXUlyR0SJe8Sjy0KThow3U8S
	 xFkHynRh57jgNtEY1/sPsMSc7Ld+8mWqRnMIeJvzAr7e0omVV4dAGyhKhewMZbzPWsKMW
	 kUPdALLiWDJrR5sWDgbqsVDcLubs9gISq5MLQBeEOtHM6JL+JDZoWjXCcyXaXvBd9DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795150128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=DRQ8FJYGIZUkw4F+I+/Zgmh7s38pPQn6pzLuYXKpMfs=;
	b=k/fXWokYiqwpX/7BOcYaDGRIc8hCkZFe5kUfg4blrwrCCFbr7tuMLr0lvO55EO3IxNq5
	 FogNVVlQDISUfcPu3LnAx95mMBfCOs+Ixw7k4tSUkP4S+KIkVypSGwwPMnAPBC/+Xhj9y
	 0cgZs5cUSPdzePMMHpD8z4y7FIRv4+vrRa7QpF6ZLRKCZhvL1FzJEMVnS0t3ZvzmZw2mS
	 cNcEJTp2JByb0y87d8HIquQWKIKKOCabtZ4u7Tn2KSOhkMFVTMSphYaSoprxRvsq+KkA+
	 B54tt2GgDdbqtLxJPnX1Nv2JqQsl3SFkheJOZnDZfxYINp97JJvvY0zSd8Ld9z78ZoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a1eR9bRU;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B586A606A33E
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 04:48:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B586A606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a1eR9bRU
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b3b4944a0eso445541c88.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 20:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795150127; x=1795754927; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DRQ8FJYGIZUkw4F+I+/Zgmh7s38pPQn6pzLuYXKpMfs=;
        b=a1eR9bRUgrHLFXzjPI0/J37qkzhcDJ6vQhaX0eYOSoBcAofQNz4LAWcL8koUKFBSCA
         UKTOHCsl/jFThHWhR3uOouyLaagiyrV1R5Bs5QJga2dYScelfvrHq+4nP6W2mxm+2yWa
         Ps3HEVjMpahzvtZgUrjHsbWVDck8ZN67Oxc+nxFd+x0pEze3L3Q0kTbQb9OepwZSt+4m
         rKmnPD+jt8yNoQ96ZzHSAix/ySc3o/gGPyQ/uMnkEdc+8/aYVXUAZFS1odFd7XEiCYUM
         4Vy2XVVghXdcJ9xjPNN0zNZfh+6bYi5XM/cOXqWYOOj4fWmmELmkos0okFeD0gJW8ZuV
         LMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795150127; x=1795754927;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DRQ8FJYGIZUkw4F+I+/Zgmh7s38pPQn6pzLuYXKpMfs=;
        b=TIzXPrVxDj7UE7ltkRWgShuMTlee9aG08bPkfjla+Sk1uEBo3bGmLsQV63LaWAGklU
         u8t3UKWdnEGtB+odj5i3kcAxnEc5sIxqSQEffyQpUyM5wcolhqAgtCPiiLL8CsW3ww/9
         cnUn30GT9S+/b3RnDZ9JblyZvZ4MG0q/LhibWOj8FXrPVOTtGBjaGNdRYNdbz0O9D6a6
         NdvbdWT43H4KVLjTeNIESHhlmHoQhOYy5UeJcJV+U8RuQHmddUNgiprmdy8n1CjWVBnR
         1VcrnkPthcyd4ktzKeg+g9G79kYqwhzIKjYc5mdlzs860OhX6+1kIYigWVh6Br+4uNQK
         bIQg==
X-Forwarded-Encrypted: i=1; AL+hErEaijjN1NQJkweY3/TnXF37Aivc0BcH22abAmEcWtSRmRiphpkyWIBF9+rfnB32vnr8szyrOZg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+EwFyQU6b7a/x33Isy/M/Gm5tJ3Iv6ir0l+M3JjGEUT/d5D2s
	EVcec/VbT0rOR25CfxoDTVe6C8KPQlan8eK8DuKVXvFWTR/WZawcW90O
X-Gm-Gg: AYBFou1VOgquIJsMeBf5uFmGEjdBkQdXiWREoPmSVxKIxX+zAe+dlScqPUvln4rWCZa
	p82M6TujdwBUFM2v3wk6sUXXfnbyG7zhE11yMa0+jpVyRP4UxNdAFp7szF8eu/IS5n2/aQbZPRo
	GoOTWVRIm/nW1dIo6wC3YjYzxvT+LN4+J/7Qcgddq+HU+YFngbSwjOirMOo2b6oMmwGtcWlQiLh
	YMXxFWxcxGIsta+hRQtkHPnBKAdIMEYgG4UarLm9DFMnNZJNv3nFCjWWBrt5+2cE1HFyyQDA3Z9
	qu0TSfagJuIvCSj4fPiBE5MUifzh82IoggkAuDfngFM8QtvOhb1nx9xIWKKdTlFiTpHvbLDL2EN
	5MefOO6Uyy12ao+W38SIMq10w/O63it5o6aRVqX84Kg/i7cIpPmAMYv/WA5tMVcYVSZJBzLGo1Q
	gG3uQxN4ovwvziBT09EcE5dMNFUGwliKWcnwRiT0YK3CUEsCaAVwfRjljsbJPEmdU0JazKfZsJW
	/iwNtoi/w7s6vL3IAw4ESicUnGUtcyfUeryH7K+B2r5MuF2aAO2EShA1tYnoEPE8oka50DseDDw
	FN1LDxziSX+LsIt7DDggAzE7FkHYtw==
X-Received: by 2002:a05:701b:2901:b0:143:3c9f:10a6 with SMTP id a92af1059eb24-1b5567b315cmr1736664c88.4.1795150126565;
        Thu, 19 Nov 2026 20:48:46 -0800 (PST)
Received: from gmail.com ([2a03:2880:9ff:64::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm3953343c88.13.2026.11.19.20.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 20:48:46 -0800 (PST)
Date: Thu, 19 Nov 2026 20:48:03 -0800
From: Narcisa Vasile <narcisav.kernel@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: narcisav.kernel@gmail.com, michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] eth: bnxt: report TX HW GSO queue stats
Message-ID: <av/RAwaDfiQnPmbF@gmail.com>
References: <20261116204313.23023-1-narcisav.kernel@gmail.com>
 <179499144094.3136.198428718668517773@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179499144094.3136.198428718668517773@kernel.org>

On Wed, Nov 18, 2026 at 08:44:00AM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 (1) · Medium: 1 · Low: 1
> 
> > diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> > index 6846a27bfef4c..1a7a93bf684ac 100644
> > --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> > +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> > @@ -869,6 +869,11 @@ static bool __bnxt_tx_int(struct bnxt *bp, struct bnxt_tx_ring_info *txr,
> >  		cons = NEXT_TX(cons);
> >  		tx_pkts++;
> >  		tx_bytes += skb->len;
> > +		if (skb_is_gso(skb) && !tx_buf->is_sw_gso) {
> > +			txr->tx_hw_gso_packets++;
> > +			txr->tx_hw_gso_wire_packets +=
> > +				skb_shinfo(skb)->gso_segs;
> > +		}
> >  		tx_buf->skb = NULL;
> >  		tx_buf->is_ts_pkt = 0;
> 
> [Severity: Medium]
> Can this over-count wire packets for GSO skbs that were sent through the
> TX push path?
> 
> This block runs before the is_push early-out. It treats every completed
> skb with skb_is_gso() && !is_sw_gso as segmented by the hardware.
> However, the push path gate in bnxt_start_xmit() does not exclude GSO
> skbs:
> 
> 	if (free_size == bp->tx_ring_size && length <= bp->tx_push_thresh &&
> 	    skb_frags_readable(skb) && !lflags) {
> 
> The push BDs never set TX_BD_FLAGS_LSO or tx_bd_mss, so the NIC sends
> the skb as a single frame.
> 
> Take an idle ring with tx_push_thresh at 164 and a GSO skb of 164 bytes
> or less. Two examples are TCP with a peer-advertised MSS of 48 and 96
> bytes of payload, or UDP_SEGMENT with gso_size=8 and 80 bytes of
> payload. Either skb would be counted as 1 hw_gso_packet plus gso_segs
> hw_gso_wire_packets, even though only one frame went on the wire.
> 
> tso.py reads these counters, so could this give misleading results
> there? Fixing the push path issue described below would also fix this.
> 

This couldn't give misleading results there, since no GSO skb in tso.py
can be 164 bytes or less, so none can take the push path.

> [Severity: High]
> This is a pre-existing issue and was not introduced by this patch, but
> should bnxt_start_xmit() keep GSO skbs out of the push path?
>

This patch doesn't introduce the push path issue (the high severity one).
The medium severity issue is a symptom of this pre-existing high one.
Both need a GSO skb of 164 bytes or less sent on an idle TX ring to manifest.
If the preexisting push path bug is ever hit, the stats added by this patch
would cause hw_gso_wire_packets to be over-reported by gso_segs - 1 for the
skbs which take the push path.

I think this patch can be merged as is.
If it's worth fixing, the push path issue can be addressed independently
with a one line change in bnxt_start_xmit(). With that fix in place, the
stats would also report correctly, with no other change needed.

> 
> -- 
> Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116204313.23023-1-narcisav.kernel%40gmail.com
