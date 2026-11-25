Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795633014;
	b=EMq/SPfKKaqDqNJ45pinCxyStR93oeXBGDYeAa4lCnt1yN7Kna4iHb0+GTeqnf+4V/pw
	 03dV/UaM/rLspQ9i5LIMI1MRh0A14f9SJ0aP5uKG7x0j2NG6ZgDqigWyQ7K2g9tefQ1Qt
	 rI8HTTVvAFDexNUpFG3EiTn5M/x/vtmQuzu6msULo4aHYH6VLOBNOTfkAkxpELcap5Wjo
	 z5z/hgU3b4/cBdZA9nIK0ef+kn5eVCs/mSDkcRL6dpUnNL1f+lIdy4FPb3DTRBtciRfGa
	 5R5IDjh08XzJS51Riwx4wtDjhHAfGEXCzS2aeGFztVdnGo/owvWMClgLfzSlxtnQdnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795633014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:Mail-Followup-To:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=x2h3D7iH3Wc1HTtPjxPO82bLSMmVOqCjIHCRJWs8yZY=;
	b=qlot1vTVgy8M3rDTYNOXsBzOpMIW4l2PYazUzBWYHi4R8kZe5XPF7DblrKSCIWPnJhWX
	 bDb2FYss7b6PM36aQghfErmWHWLfZVj9g9mvVqDUH6OqChAzm28D1qQ7nAbAdeQNEo4ZF
	 Q6MJmy8dVILVd2QQNwIAZlMNL4XROb073MICxOTg+fHjfB1bqL3FZeUIAQusxjLuPkVej
	 Pncxq7ShhqsLay4q1fFTwenM0K9l/gq9Fu6kOI6MCEGEufexBek8dNSDkmrzTVv1GxQH0
	 vM9M46ElJfHbFcBYYgtHERD4NdBnGyigYDw1Iq5rpCL0RGISdNR4T5y7NHQ7/P8qcxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=b5Wmhyhn;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B71606A327
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 18:56:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30B71606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=b5Wmhyhn
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f0918f9e6cso16669195ad.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 10:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795633012; x=1796237812; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x2h3D7iH3Wc1HTtPjxPO82bLSMmVOqCjIHCRJWs8yZY=;
        b=b5WmhyhnSs8usJCaJ7KbKAhmll/C/7YWMVAQRARG7p5UNbK6itmqgFoatTQX5p/Iq1
         KoAKn3SnqD2uIElQ6be6THf6gL4V+4jboRwBsLXWZY7YTMHd5KX7QXBzlkfuOyVRAi55
         1H0GMMVtlzh2jMYKU3X2WTWt7moR122iHeUE4tBA2NvhhmNnjeQ3e4YIaLfgxgC25P2u
         rC8O/JJZYsmAYoUJ2fo61Puyx1KbesMy+A7Vf1f6OMwfWeD0IcnO45eS5/C7etAWUGRn
         g/RmSddNhVJcPjfNwVYs2jc7RG/tw3ph+62jKnCom0D/aSe9jEnzFmF/fHlGyQdanihT
         2cKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795633012; x=1796237812;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=x2h3D7iH3Wc1HTtPjxPO82bLSMmVOqCjIHCRJWs8yZY=;
        b=zw0xNVJBIFNH133udN1/iKzY5pp6qAKK+854R0kDgtF5uxLQeXxelPQB7wn1g12Dw9
         DqfxGKd8Bt2g0SnmA0F5eA8H5LuoQk5/RGVyUJn+TKErIilscMZSTp/pFy//b77K5IuF
         W5E1TfNaTKxJEA83vPZZpYAngs5EzyD7WF3rvntGyhUcAyjTG4p00+iOoB1acIs/piSe
         j2Jqv+nEMVq6WRYWIgLlQQvnQubZRb/bl7KQgPDL1V4i+DWQmVtHMQQA66gRQefRcis5
         X3jhV28+p1y2UW5IQCmdNzFrHe3c3xwHGnn0OkAgkTtIUzIGhAnkdelf6X+OchnVka92
         BESw==
X-Gm-Message-State: APuU4Z+A6VMQk6AcsVCpH8cYFDMQkI3HwMkY96q2Ad6gdlHWK+nr2Vsu
	2zftxpHc9h6k2/VFK45eds9XqRljS2jzexZyNOOZZPAd1weE1v+tUXG/qzzBvBVG5cI=
X-Gm-Gg: AZFdTZdQ3xT9HM3z0MdeT30Sp+iWaAIou2u54ErcxL4rcSf85Z2PeLGVbUYARVtkqDQ
	A70h0TQBYGu1f/D+3OtH/zOG9Y9yIoC/bJ5AaWmoRq8gnbqU2XLIB/xUTZzAeX5X2mpmdfG8ips
	Ji5IhWMPh1gqH9VqTJWdkVsEUyfWUl2YKi1KeMPRs7f/AZPWaSzm9aV5vTq+kzZum5WKTmHBsNk
	9bv9Z+lQWyqIplqvsNtnLnZyjOkUS/DtkrKdBgkeWns7AbFAVyXoQD59q5XqbHytYpBzSNMRwus
	KGQIjh9qI7NC41HzoqNH7hPo3CupZdd6it2ct/HtJg3Y25+XuEnvPaoe+DzYqfce2EmsSGwmPRy
	5fVN5Mi4Eb3y3QuJcG8JJ/gj7nP1uaq1wcsVJUEKbhkFiu/8iTqVDXn3oH5/8YIxysqVj2ck79z
	YpYpy3D/VwPJLuEAazguxXS7P0qWLKduXifglqajpda86OxoBMWet85jtB4ktSzNeqHE52rjBJh
	mFJiY5RrQn6RF5gjwLfza5Ja8spSI3LuDrIy1MAxvJCFMsYjf6f+F6suV8wwlgb/XVlHNLGPN0j
	JZLPKbZQpx6s/Al7Edn5KURVycL3KVtwhb+zFbtBDjFLHHxGs+vQ+eZpk8b+5Qs=
X-Received: by 2002:a17:902:ce0a:b0:2f0:dc93:78a4 with SMTP id d9443c01a7336-2f0dc937b50mr22557595ad.26.1795633012514;
        Wed, 25 Nov 2026 10:56:52 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:4::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d05782asm9137503a12.24.2026.11.25.10.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:56:50 -0800 (PST)
Date: Wed, 25 Nov 2026 10:56:49 -0800
From: Joe Damato <joe@dama.to>
To: Joshua Washington <joshwash@google.com>
Cc: netdev@vger.kernel.org, Harshitha Ramamurthy <hramamurthy@google.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Jordan Rhee <jordanrhee@google.com>,
	Willem de Bruijn <willemb@google.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Matt Olson <maolson@google.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Debarghya Kundu <debarghyak@google.com>,
	Ankit Garg <nktgrg@google.com>,
	Eddie Phillips <eddiephillips@google.com>, bpf@vger.kernel.org
Subject: Re: [PATCH net-next] gve: add rx_critical_low_bufs ethtool statistic
Message-ID: <awcvcbCfQDQFrv/1@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Joshua Washington <joshwash@google.com>, netdev@vger.kernel.org,
	Harshitha Ramamurthy <hramamurthy@google.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Jordan Rhee <jordanrhee@google.com>,
	Willem de Bruijn <willemb@google.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Matt Olson <maolson@google.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Debarghya Kundu <debarghyak@google.com>,
	Ankit Garg <nktgrg@google.com>,
	Eddie Phillips <eddiephillips@google.com>, bpf@vger.kernel.org
References: <20261124223009.331936-1-joshwash@google.com>
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
In-Reply-To: <20261124223009.331936-1-joshwash@google.com>

On Tue, Nov 24, 2026 at 02:30:09PM -0800, Joshua Washington wrote:
> From: Eddie Phillips <eddiephillips@google.com>
> 
> Commit b65352a1bac6 ("gve: fix Rx queue stall on alloc failure") added a
> starvation recovery timer to the DQO Rx path to prevent permanent queue
> stalls under severe memory pressure.
> 
> Existing allocation failure counters (such as rx_buf_alloc_fail and
> netdev queue alloc_fail) count every individual failed buffer allocation
> and do not distinguish transient, recoverable failures from severe
> buffer exhaustion where fewer than GVE_RX_BUF_THRESH_DQO (32) buffers
> remain available to hardware and starvation recovery is required.
> 
> Add a new "rx_critical_low_bufs" ethtool statistic for the DQO Rx path
> in gve_rx_post_buffers_dqo(). The counter increments on each refill
> attempt that leaves fewer than GVE_RX_BUF_THRESH_DQO buffers available
> to hardware and arms or reschedules the starvation recovery timer via
> mod_timer(). It is exposed both per-queue (rx_critical_low_bufs[%u]) and
> as an interface-wide aggregate (rx_critical_low_bufs).
> 
> Signed-off-by: Eddie Phillips <eddiephillips@google.com>
> Signed-off-by: Jordan Rhee <jordanrhee@google.com>
> Signed-off-by: Joshua Washington <joshwash@google.com>
> ---
>  drivers/net/ethernet/google/gve/gve.h         |  1 +
>  drivers/net/ethernet/google/gve/gve_ethtool.c | 17 ++++++++++++++---
>  drivers/net/ethernet/google/gve/gve_rx_dqo.c  |  3 +++
>  3 files changed, 18 insertions(+), 3 deletions(-)

Reviewed-by: Joe Damato <joe@dama.to>
