Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.208.142.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795525597;
	b=4pQ1rizBZJYUoH3mQSTEBG8fzsEXx3CziZ5jjVCK7XooRd5V+FZZFTve3WscBioOJIX3
	 RCmiqg+bo51YHIbX+Xjsg9tdGKdEomyQqOf05nNs/SXkaOQ2OkgUEoJm1MOt+nohkPwDe
	 nBRArnOeLdgx+5kA0u6LOJh1/ykhic4rwOqQiFkWegcYpRWwul+PwBfXq+v7ENvtajZb6
	 XWCCedOyIHpIUUEmzsJLqZg1QbeZg78O9VJG+ZKKvlZ5WuGYh1HR0WvzHgDw29Tj7K2yT
	 ONmK0Iy+vFVTFDNU//N+R6JS5jyiv4yAzeJ1s0hX+YoDcDe7JrSpUpROgLwftXDa0oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795525597;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6gTe3OIXtvUr8l7NQ+B00W/LQtsjPBr3owczjn6ZYLY=;
	b=fp+4KmK8+okrEUTWctQR7CMQQuF1VYvMo9fFzcwlVMBls7ZAmoJOKByBESsB39D0gnC0
	 rBywOanLUquCQxfSklVm4mgMzokX/0GvtHq3D2H/7wC7wkyA1KzoQmYg7gmbkmgVtz6ud
	 o/Ptxz2BuZ4jcfH7XTBGn5hzhygaMZ/gEkXQgEkcFq0V8FyxSRKcuj79qEZ24XkJiTa2T
	 41+UkVvdLOZEV7a505oo5mML9lqsOOajgfjSmr2pABYA3isPEr9GEG0PzwVlj1qx8whTI
	 grRiOGRkblMuWmMI/JYf+ayxICKtxfCbK6QTfhD6UlpJIT1R7qrTZKWjzJFVOPnq+xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelriot.com;
	spf=pass smtp.mailfrom=kernelriot.com;
	dkim=pass header.d=kernelriot.com header.i=@kernelriot.com header.a=rsa-sha256 header.s=kr2026 header.b=FGEemmNH;
	arc=none smtp.remote-ip=74.208.142.49
Received: from mail.kernelriot.com (mail.kernelriot.com [74.208.142.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6F9606A321;
	Tue, 24 Nov 2026 13:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D6F9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernelriot.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelriot.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelriot.com header.i=@kernelriot.com header.a=rsa-sha256 header.s=kr2026 header.b=FGEemmNH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernelriot.com;
	s=kr2026; t=1795525589;
	bh=6gTe3OIXtvUr8l7NQ+B00W/LQtsjPBr3owczjn6ZYLY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:From;
	b=FGEemmNHrmqUTdaDHo8qr+JUyTMRQdHosYEikuWqodR9P94M0ApDiye/zX8oWbfQA
	 /vaqU8IUajnrnL+Qx7DARKZLyeuKAFrwxWP/EvPc26jj+G2/g6zmx8mJ1AImARC8Gz
	 oZbUSjVVxXL7CuOnDsXKpvjKsJFEHIsy2PhbAffGiiIov4JGxYGwwjd3LXSeMzCKKq
	 PeGoMF8IfDbXPY7MTHw5IZ1nsceyRnRYNcTUrNd25mwoqojr051sjiu/lvhkkYCJqs
	 V41rfQjJ/wdOt0uapbJA4EaSi7uzSM+MpLAS1HcFMQyN4JnaXrxLWXtZmi5yUDZFAI
	 TPslTPJhYnuPA==
Received: by mail.kernelriot.com (Postfix, from userid 995)
	id B8FB981A0D; Tue, 24 Nov 2026 13:06:29 +0000 (UTC)
From: Magnus Leatti <magnusleatti@kernelriot.com>
To: netdev-bot+sashiko@kernel.org
Cc: Yao Zi <me@ziyao.cc>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Nespolino <g.nespolino@gmail.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/2] net: stmmac: dwmac-motorcomm: remove the device at shutdown
Date: Tue, 24 Nov 2026 10:06:10 -0300
Message-ID: <20261124130610.3254004-1-magnusleatti@kernelriot.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <179551786477.3135.6652175828683602957@kernel.org>
References: <20261120102754.778283-2-magnusleatti@kernelriot.com> <179551786477.3135.6652175828683602957@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Nov 24, 2026 at 10:57:44AM +0000, netdev-bot+sashiko@kernel.org wrote:
> [Severity: Low]
> Should this carry a Fixes: tag?

No. I never saw anything break without the hook, so it's not a fix.
net-next, no tag.

> [Severity: Medium]
> With this change, can stmmac_dvr_remove() run twice on the same
> binding?

Only if something unbinds or unplugs the NIC *after* .shutdown ran, in
the middle of a power-off. funeth, otx2, nfp VF and ps3_gelic wire
.shutdown to their remove the same way, and it's the design that came
out of the v1 review [1]. Keeping it.

[1] https://lore.kernel.org/netdev/avsebFtnIASV-KpV@pie/

Magnus
