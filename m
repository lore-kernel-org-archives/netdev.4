Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795624673;
	b=rstxnsOurbRuc1Ue6rj5CM3Lj7h4R9AflVEFwapNAPWgq2MfCx+7US8AVne93rcVGmak
	 awmA1TcGZlGIjByzr01d3/AC9c2T16YTgHBSFuU2gpfjNaj5jFegfFdvfYOOUneRuVLL9
	 IE1+Ua7cccUtMJa+OX78nU5ygeDDpyohoCDAZfdpykWrwXOsgkw0xNe52BhRqHku+/uyJ
	 02u7118kgbWMKU0lDdX0ckFuanr568Yr9zAbxY6Eh3E9KliU6kcY0skbIxsbP4k3mhwnr
	 luG1a7/Aiu+mqt9467Yky1gJ+YUQmJ4JB3NW0L2QGMJBcmXyc7NNmQNal6rUmjLgfrg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624673;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Zoho-Virus-Status:X-Zoho-AV-Stamp:X-ZohoMailClient;
	bh=wZU6CfzaUrTUM9Uw9d24QCgARMhh95qEdCVI0vhQmpg=;
	b=L7jmZoINbfM9Os5peT/Ivh5Dv5q77QepkU5Q1ojr/kIuUEDTldr0kYEYYoTRUQks5eOD
	 FxMzECVwbNnkcZdvKABQ+iJyLbtRBQGGoxFDIfm1E4Q4vpmvq93jLTNl2pJ34Smf0RD3H
	 51u15ysIoIMI9Nkn1FOk7GxV1uW6Gkk84j2RGdasCPENAGNAdJUtR3t4JmECfr7MPG4Sr
	 aERULmvTxiEL4xU22jZPnd4rkOq5FaVJ436daWMM4pAhF0rqg6zw29oZw1V7DPVAc/2uj
	 DM6tCtjb61r/ekSwrXFP3jp1wmMuSZJWkRGvyYLycvw62DGmTz90GjvTKRjGGuLas+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ziyao.cc;
	spf=pass smtp.mailfrom=ziyao.cc;
	dkim=pass header.d=ziyao.cc header.i=@ziyao.cc header.a=rsa-sha256 header.s=zmail header.b=Jc6+q7o4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.12
Received: from sender5-op-o12.zoho.com (sender5-op-o12.zoho.com [165.173.182.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC4D606A331;
	Wed, 25 Nov 2026 16:37:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EC4D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=@ziyao.cc header.a=rsa-sha256 header.s=zmail header.b=Jc6+q7o4
ARC-Seal: i=1; a=rsa-sha256; t=1795624635; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fn8wmiECVHUD3QkyvELPPxKwwuZ9DNuC5BsZ/LyEsXtY8cg2aYjoBxEJgwLN+3JYGlUBQKiSs3HmFqpwYHfmyMXKcBzyl+8S8QravXTlQ+rw2jrUs8q5t1a7q53p7LzuUkgpSyyLv+VJAlOvU5NrIEklfwjwfx5QW2+onexAftU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795624635; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wZU6CfzaUrTUM9Uw9d24QCgARMhh95qEdCVI0vhQmpg=; 
	b=kUmBJtZoJjiy/JIw5a8E5V4T6B6xWVXg7fwLLgn1GiEt4TaGh2Od91Iak/9qP4iGZNp3Zx9PBhiT7fhQ8Bk4Ky/mHZ2QlPXpfwSnSkiB4w11tIefldkFFQzddMRS+FchMJ7yvzOgdl/Bf8HkGNxast9SSTj/IRN3BYXewdCk9Eo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: a=rsa-sha256; b=Jc6+q7o4s8WHJKTxEGWlOILKLZcb5akXj8pQFhixA8NBV12hkF+n5+8amlMh/gP12gne7slcWjdD3t+XTcJSIQZMar5ML3PLiGY75We8IDTMUCvZXteDOZmNSts4HFe3nYeuf40049rpe1P4JusK/SeIjBsqUUGo5/DqAgqRYd0=; c=relaxed/relaxed; s=zmail; d=ziyao.cc; v=1; bh=wZU6CfzaUrTUM9Uw9d24QCgARMhh95qEdCVI0vhQmpg=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795624633139428.14929217459655;
	Wed, 25 Nov 2026 08:37:13 -0800 (PST)
Date: Wed, 25 Nov 2026 16:37:02 +0000
From: Yao Zi <me@ziyao.cc>
To: Magnus Leatti <magnusleatti@kernelriot.com>,
	netdev-bot+sashiko@kernel.org
Cc: Yao Zi <me@ziyao.cc>, Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Nespolino <g.nespolino@gmail.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/2] net: stmmac: dwmac-motorcomm: remove the
 device at shutdown
Message-ID: <awcOrnah0sKdqqSn@pie>
References: <20261120102754.778283-2-magnusleatti@kernelriot.com>
 <179551786477.3135.6652175828683602957@kernel.org>
 <20261124130610.3254004-1-magnusleatti@kernelriot.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124130610.3254004-1-magnusleatti@kernelriot.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/295.600.19
X-ZohoMailClient: External

On Tue, Nov 24, 2026 at 10:06:10AM -0300, Magnus Leatti wrote:
> On Tue, Nov 24, 2026 at 10:57:44AM +0000, netdev-bot+sashiko@kernel.org wrote:
> > [Severity: Low]
> > Should this carry a Fixes: tag?
> 
> No. I never saw anything break without the hook, so it's not a fix.
> net-next, no tag.

However, I do think this deserves a fixes tag, for the reason I stated
in replies to v1 of the series[2].

> > [Severity: Medium]
> > With this change, can stmmac_dvr_remove() run twice on the same
> > binding?
> 
> Only if something unbinds or unplugs the NIC *after* .shutdown ran, in
> the middle of a power-off. funeth, otx2, nfp VF and ps3_gelic wire
> .shutdown to their remove the same way, and it's the design that came
> out of the v1 review [1]. Keeping it.
> 
> [1] https://lore.kernel.org/netdev/avsebFtnIASV-KpV@pie/
> 
> Magnus

-- 
Thanks,
Yao Zi

Meow-mrrp-mrow, I'm a cat.

[2]: https://lore.kernel.org/netdev/avsTEglKKD_wl_Fi@pie/
