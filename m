Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795628414;
	b=ckkaR3PfMLGDC+XR7JNOYxg6ZbQ4QK7q39lGrmoSEbfgEWBudGjX7PN3qY1NLijR4wES
	 9jbESLy2A0ArYNm/+Q1ELpm7K72pLLzz0iUZP+5Ny/OH85AF8U7VAAhm/16WNKefEM8EF
	 2Kedk6w56cNr5Pv8meWlJLC4mKVMr9KL8psYLacewSc2r3U3WlzCm4jCFbr1ZyhhQypPu
	 R78tFzkMS45VLS9btVUFSvsDOGOy8SgUaYqvAtQbY/Aehm5vMlOH+MCWo0ujaDTkfKiV/
	 SsC6a6MARlDeJL3+4pGiW6qF2UzVNCFWszylBpPxC+ibI5MxsjHZsL8Xupwxn9vQitQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795628414;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=HoQUopBi51dF73r3Zj1/3djqaVpT5av8FoAZ7EzGDzY=;
	b=bGiWcKjrAFKHCD1OqFIlJQsdi2D9kGjM8wSH+Sfs20fiagXTl8SqbMKR0g/yx/U/m+yg
	 Hh3lG4GLHdlZEyPODckV+/2SiRDgiPZkZwJIZPJ4kBQ0QdfJQlJVLJAYBaxPrtFHdZ2m4
	 keX6UBNz+aPB+VCEDqUdtA1hy+12Ewf1Xax/MIBJoFVc0JSDrZ4E4CIspQFzCdkpaSHlc
	 I67Sk/RG4y9F7Rg002mU1g2dQtq5HhlQ3RhAqnxjRmwBQ1AAI1StGdFPZ7d33nxuGuVem
	 7lraHwamhBwYk3gGPhV9ptfvUGGKbrlQ5WKOQaCW8b2c3J9BoFvpOwKvkwZRqxyM6Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=queasysnail.net;
	spf=pass smtp.mailfrom=queasysnail.net;
	dkim=pass header.d=queasysnail.net header.i=@queasysnail.net header.a=rsa-sha256 header.s=fm1 header.b="OFU/xVB5";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=kDO+O3iy;
	arc=none smtp.remote-ip=202.12.124.147
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4AA606A32D
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 17:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF4AA606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=queasysnail.net header.i=@queasysnail.net header.a=rsa-sha256 header.s=fm1 header.b=OFU/xVB5;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=kDO+O3iy
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id 0908E1D005D9
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 12:40:12 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Wed, 25 Nov 2026 12:40:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=queasysnail.net;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1795628411; x=
	1795714811; bh=HoQUopBi51dF73r3Zj1/3djqaVpT5av8FoAZ7EzGDzY=; b=O
	FU/xVB5oYWl2tsCLuNfzIiTgwr27uXblPTa+7rrcPVNeCip76etvj7QAIwSWKcvT
	PMJdlRKEqamCBD1hesKMf3NEcSmySm5gEU+7WotZJHNDd7xjoX2ARtvD6gBwWeit
	ANeZxXYtwjZkCJCH6TBa87CyOyit4TcSe9WKlg2EQUzGeHh0TAQ0n+KyOGOTZeXD
	9PxF7AaBESUAcNSHyS0BEeRIVYTny2IEjKCqIKEX3jx1J5mqATNIGINXUZfSYsyE
	s8NIpLK2dIDUvIwaGS/JQgYFWAJ1qAB9GwrrhItJbS4hO5C2ZWg6f5yfkfY8oZNz
	aSPy3iNVMQsKd/tMCY6aw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795628411; x=1795714811; bh=HoQUopBi51dF73r3Zj1/3djqaVpT5av8FoA
	Z7EzGDzY=; b=kDO+O3iycVG06I5IWKoAEFypDQyZNtPv2AkvT/nMcSp/LRmphw5
	Z8UTPg97rgla+GPyY32B2Gc3GH/TfPoocGJS3Zq3UhP3F7heOrReNK+gJU8TmJMr
	ySiJSB2Sg3SHDHW1ZYhw2x2MLfJ+868d7GfChmWc2f8YeTW7Tokn4RIRHmCNCmHx
	A88qMSIVfd/DGIl4XBsTliriljb8z9JEgGA29dlrX83f4HrLSugO+AN9oMXP+QiM
	Lw1sOnFavfX75upxpLZBXjHdxKyEMR3mOTXkryYlJC/n9lRLBpqk6c2QzogCuBX9
	oB9rbIxyOT1ydJZY9/WyrOwmJH5651VUYqA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=queasysnail.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795628411; d=queasysnail.net;
	mf=PHNkQHF1ZWFzeXNuYWlsLm5ldD4=;
	rt=PG5ldGRldkB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:XxfGRyxKY4jvI3EWCFbkphbEp2R5ihpLOcdnIBTzvXO40IP
	QEHdVP9FJ++10axEROkIOjfP55a5RupXU/zDZHVjqu4Y/uj0D3+BD+ANjGwTUCP1
	U6wEwA+jSf2pV4Bvah3Hwc715eRPhwTKoZlozfdg3gMq5BwCrWxHGL2O9RFcqGlG
	v0DAbThmMyPKdrKP0PD/nhI5nweXq3ef4kzkjQgBXfN3OCz1IH0QDjalrk6/eZQO
	6y1DLjtDMMYnuAycfnVxAMEzepRiNf8XpfCApGdyedHxO3Rs8DdK6eSTHfrw9LqW
	SLtchLkJNwSTiMeRjo9QAsltW+eRz+IYESpDnyA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:nlB6kU06KBpjR7oTIp8lD3RAB7CYydGUzsyPfG6enjI=:MLqJi7BkavG3iL1513AuRBtfDKRr27qAm2+leZMVcKo=;
X-ME-Sender: <xms:eh0Ha7np3sZHY0tlzbuxdBh14WgESHoZDCx34ndr41ybSGAa77PMAQ>
    <xme:eh0Ha3DK45llMAFSa5Q27mqnaqkJZUrjidKQzFNXg8kpW2WzrOQmZVjh7B9rK_UWc
    M-rmWyaFE27letYJtBbp3Y9HSU3D9bIp06f1azg1gHWx_NjpG7hzSab>
X-ME-Received: <xmr:eh0Ha9OTmHZkYVZQ9XhYgMk6Mt4FO0lwm13w3dxvg2FqBhdx2HwU_I7w7vA>
X-ME-Proxy-Cause: dmFkZTEs+SHHSfdrN5LoarBNU6r6WXUYqJLC8YB/Avm+3cckz5o2duYyWoJs/kimcjNA8e
    He7LPQYCQIbsBgV4QII62YaQhZYccdNuSXIsp3RoCPIr0OWT/SN4EUMqCmUGXK/pjUQdLd
    jgzLmFYn3c+gLHjIXW0Vs+lbRGkKGNxLni4EZCYgFVAELj0iam3eyIKZxf41P6W6elQolx
    FpRrnH6sahj3tp5E1umBIEryjmo9DeDggeBYkD7MT9DzMKLTJ/7oIN+VbIjGSCAusDB5qg
    Ln/aUWttelh6J0tm4/Y0RZYx3+H8EokQc+zXP1djPwB0OgrwCYCWptNBYEAF94Q2+bc/Zp
    WIZO60XU14IOZFzoEEDISKnlQcM1JZiu8j/VLcKkqZuHFIbWOn8KUIRMzHotKrwy2VTP5j
    MfHX+m81P0hGAUytPAOhyUUlPvNcWhLpYoyr0KPFNTG7SC19BF6rGIvGg1VLDdJNXZsolk
    ip1nbmiyCbYIOYZYhKrHMVLjN2d0mpV4knRrw9xQLvv/oLWet+41aSdGgdRtZGvBlAUIvs
    HVjesM2brfYLBUtiuLcsWaKOYL0587ahpGDUAqbeVsWaFoLoHzRwoj0PHbT54+9QVLmQQ4
    oodDDLauMn2jbvQoIHh5+Girj3ZqCw12YGauv7RDdt5yxLRVZGXPhST3qbNQ
X-ME-Proxy: <xmx:eh0Ha-MIwzYKgVZA9w0MDV6-kE_N9uBHXiV5pdrw5ZcNOC66_RQQHA>
    <xmx:eh0Ha1n-mI2o3tBoCGlRdcZdYL1UxWWro1PxljobQYF2IZZiSpbwEg>
    <xmx:eh0Ha8sUmV3_swFVz_socTbeuH9UPGUx-9CteJRov5mg91zalfpYJg>
    <xmx:eh0Ha4pXy2fhmaqCqLW2HO8y5i_ZhbXKEqiOEPOPOZbZjZZo9TTKEw>
    <xmx:ex0Ha6zNWAKLrle0ZDIZqfWC-FTeCXEiuodCN4GvUazz3avHsntpn09D>
Feedback-ID: i934648bf:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Nov 2026 12:40:09 -0500 (EST)
Date: Wed, 25 Nov 2026 18:40:08 +0100
From: Sabrina Dubroca <sd@queasysnail.net>
To: Zihan Xi <zihanx@nebusec.ai>
Cc: netdev@vger.kernel.org, ipsec@lists.linux.dev,
	steffen.klassert@secunet.com, herbert@gondor.apana.org.au,
	davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com,
	horms@kernel.org, vega@nebusec.ai
Subject: Re: [PATCH net 1/1] xfrm: espintcp: select receive path by skb
 protocol
Message-ID: <awcdeKGkqFt-uZSy@krikkit>
References: <20261116155229.318582-1-zihanx@nebusec.ai>
 <20261116155229.318582-2-zihanx@nebusec.ai>
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
In-Reply-To: <20261116155229.318582-2-zihanx@nebusec.ai>

2026-11-16, 15:52:29 +0000, Zihan Xi wrote:
> An IPv6 socket can accept an IPv4 connection through a v4-mapped
> address. Such a socket still receives IPv4 skbs, but espintcp selected
> the XFRM receive path from the socket family.
> 
> Use the skb protocol when selecting the receive path so IPv4 packets are
> not passed to the IPv6 XFRM parser.
> 
> Fixes: 26333c37fc28 ("xfrm: add IPv6 support for espintcp")
> Cc: stable@vger.kernel.org
> Reported-by: Vega <vega@nebusec.ai>
> Signed-off-by: Zihan Xi <zihanx@nebusec.ai>
> ---
>  net/xfrm/espintcp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Sabrina Dubroca <sd@queasysnail.net>

-- 
Sabrina
