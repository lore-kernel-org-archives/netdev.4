Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794674154;
	b=QxZhNmKeqhKQVk4ewdf+FOSlDyYHFQVnyaGVW7iErjhDGiIwAPho/6mgWNljsxqhcCLM
	 JjVD8Ysw+E/rUxriLxoCKi77ZsOhZL8S2MjaalTFCxhzWzn2v6p0DYDYZ1l1GtddqA/NM
	 EiVCEFya4xo6gilH0DH8KIJeJyoDIYmetmz2pGzAd1ar7oIdkK4c2UCcWGxPuNOPwQ7l9
	 8DbXl+lYAsbu/gdms73Hb6SFERnmycaVuxTdr3PG7VK26nHA2g+49wHHQEaOwBgDfBz8z
	 3FNWyHNbKuvdzzuFjlYStKts0bG4PHi6A5uAsPraPS9IrfodJJPK7XrFE6ezkQLTaIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794674154;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=8lYSAX+MKdS5bF5YiFV+vtem/REbI6jY+0Z5mmmLQpw=;
	b=g7NZG/kMl7/NjFm/ni2hCJAi3ERJ63K3FlIEWeCswsZZLBZTnxJsMky49ILRHmQBaEan
	 XMemwKg3kZDYQg3EbpPhXU2HP2tZKaVA2v0IqA38Gu3bNgBLIgMV2HUZ4DzAnfQjZEZYY
	 06s2yHak0JdKy9x1K1N/ZZ90afXcIjlcY56+nev8i5hJzhc2DQ1PVD2MDBAh/EeJoNsGo
	 R7bHteM6BvqQ6giRGW47UPdJEO43JzjXt1qwmLE7Ce8J3DZcqj0TnoCIpUoqU+rF69vSN
	 H8d2oeesPGGwQ8cNW44RPW5jG3LcgUSGS5m8a2zzCCjhp0VWZy8OcbLvM3xYE1YA/Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=cR9r7WIZ;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38DA606A337
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 16:35:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C38DA606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=cR9r7WIZ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D637F1A164F;
	Sat, 14 Nov 2026 16:35:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 93F0B601F0;
	Sat, 14 Nov 2026 16:35:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B44F711BC0620;
	Sat, 14 Nov 2026 17:35:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794674142; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=8lYSAX+MKdS5bF5YiFV+vtem/REbI6jY+0Z5mmmLQpw=;
	b=cR9r7WIZIZEp3hoThI/hjBlyluqKfIlQa7ITv4TUjqlnSklLXQ6eed5cvDm6hXRf9MxKlv
	FvUw8luwQNYWY1i3R0cwapo7L5wQiDsEgxNYQFoBYJ2h9kVaOZ3qGe7+BZXHLeRPGwP5rG
	l4H/TP93LjBZb1NtDCjM6h86Nf8aIT9q0Xxk9nBOGmiD3lMUPFC52Knaj+35ZALjDBpNYY
	4xQ6dO+mj7w/thb5SiZudskWvreyZVtu19+fHOfNJzB1Dvj9Cwul+z4Q4BbYiTzoqsIrkf
	n6XGkqPkJFCKcSHpqxHYQs1uOr2C4F1zgtMEie2dF54yieMeycA/P9CisWUX1Q==
Message-ID: <60bd468f-e973-44f3-b6b0-c799cc859080@bootlin.com>
Date: Sat, 14 Nov 2026 17:35:37 +0100
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 net-next 3/4] selftests: xsk: move the AF_XDP test
 suite to selftests/net
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>, netdev@vger.kernel.org
Cc: magnus.karlsson@intel.com, stfomichev@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, tushar.vyavahare@intel.com, kerneljasonxing@gmail.com,
 bjorn@kernel.org, Stanislav Fomichev <sdf@fomichev.me>
References: <20261109193048.1006986-1-maciej.fijalkowski@intel.com>
 <20261109193048.1006986-4-maciej.fijalkowski@intel.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261109193048.1006986-4-maciej.fijalkowski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On 11/9/26 20:30, Maciej Fijalkowski wrote:
> Move the xskxceiver engine, the AF_XDP userspace library, the test
> definitions and the XDP program to net/lib/xsk, and test_xsk.sh with
> xsk_prereqs.sh to selftests/net.
> 
> net/lib builds the XDP program and its skeleton with the bpf.mk rules,
> and skips xskxceiver with a warning when bpftool does not work, in
> which case test_xsk.sh skips too. List test_xsk.sh in
> TEST_PROGS_EXTENDED, so that it is installed but NIPA does not run it
> yet: it runs every case, flaky ones included.
> 
> xskxceiver builds against the uapi headers from make headers, whose
> linux/netlink.h does not pull in linux/kernel.h, so include it for
> min_t() directly. Put tools/include ahead of CFLAGS, so that in O=
> builds a stale usr/include in the source tree does not shadow its
> linux/kernel.h and linux/types.h. Move the ethtool ring helpers from
> network_helpers into xsk.c, and cast to void * in the bound check of
> the XDP program, as bpf.mk does not build with
> -Wno-compare-distinct-pointer-types.
> 
> xdp_hw_metadata and the xdp_metadata test keep using xsk.c from
> net/lib/xsk: selftests/bpf builds xsk.o from there in place of the
> find_bit.o rule, which only test_xsk.c needed. Update MAINTAINERS.
> 
> Reviewed-by: Björn Töpel <bjorn@kernel.org>
> Acked-by: Stanislav Fomichev <sdf@fomichev.me>
> Signed-off-by: Maciej Fijalkowski <maciej.fijalkowski@intel.com>

This patch fails to cross-compile when using RiscV as a target, cf
the output in :

https://netdevci.bootlin.com/stmmac/outputs/905943-bootlin-stmmac-motorcomm/build

I'm not quite sure this is an infra problem on my end, any chance you can
look this up ?

looks like it fails to include <asm/fence.h>

Maxime

