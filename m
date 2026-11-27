Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795744075;
	b=a2SJXW22wP0dLaF7YC++1MUL2brKNEaYpINCqrNfQZkKVzoVIQe8aJV9b8l0Iwx7ktLM
	 nM8BS6NBJEdEfWIgvyvbawJor6ZEoL8WvrIo5ZT7K5dod58juQwYYWJD8cNncMDZ+YWvW
	 oy1IJhSjt3MP//U42tB9uZspclx9/y6tY6BDOS7pfMKFyxr8S10ib+Y88cmicwTvXH+wA
	 dDy+9WFCjPzWfLtSUMJql+GGeoGxeKxsth3BXGEmyWdUfrIm6nJJqefsOSLl4nS8NEyjT
	 pqEcTv8gt2+X441VZDzJJxCrFhiZFp83hV0C8Sv5Atijjyyht1MAHLJEDteUAa+ObOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795744075;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=9rpdsm/VQNjI+QZyvQZysG3z/mkS8qpvjAF0HDQXOiw=;
	b=1xgSMKFGMqDdswQMnzUwiyMjzyCJbsLv9WB/zBfSG8RnZ0EnGKsFUa24m29QVKCeKgpb
	 72I3VGKW8lDU+2a4S4kTh+65GcJGLu5DXF0GVZabSxGIgzgb4mzcDysVSx/ZozoNkldCR
	 ljxjW+1UfbE4Ppt9cl9QGye5DQ1vJOiinn77TjcYp/owCJzG2bM68QUM3XWR9funm3WuY
	 vUUYHP+wvOqCQ2K9CJIUyDVBcXQCbUJbrdUJjiMqYglC3Ymu8+ueRQZjMOo3txYN9G5b2
	 Ul6D6+A6rSd1JwVBE0Y0kaubVAXY0RAz1enr0+6svtFCqJn2XA8tt6zg8Aj+WiW6DWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andrii.net;
	spf=pass smtp.mailfrom=andrii.net;
	dkim=pass header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=W9umYR6B;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2217B606A323
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 01:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2217B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andrii.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andrii.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=W9umYR6B
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3b3a914e4c8so4298571a91.0
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 17:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=andrii.net; s=gmail-2025; t=1795744074; x=1796348874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9rpdsm/VQNjI+QZyvQZysG3z/mkS8qpvjAF0HDQXOiw=;
        b=W9umYR6Bu05MAqt8vQxTPaZuHIj8L7nkoqY7roaXz/KTOuU0vid4imCewE5ztw/rXx
         h4KetozT0hoS7sXnuW/fq85mVt9zpfR6JRkVpxBfKZkcRQlrHikdfsoDem8IJnaM2Cj4
         9cwe8pDu65JPoWmf0uzO1mhZztzErO6vjL9Wzp+Aj76Z945LQaXM0fNNY02GCDcU07YP
         OuVlLLTbQtV2Z4OO5pwSCXDAwml/8Gr44oxlyeR3eoes0VA6EFJ8wE/XMGz6oap/ipfF
         1uDzFiDy+c8Txk+tjbKX9kIFMgYRczn2nrzTPthOc0yICs2VWsF8YdjxqI1A235TPWks
         KeoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795744074; x=1796348874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9rpdsm/VQNjI+QZyvQZysG3z/mkS8qpvjAF0HDQXOiw=;
        b=ZjWvm3tYBuH6/G3NZYWEJi6IgDZC8xriO/1USeKKdBbs2RMP0oMzGXCIFGfdxemGbz
         w8GU0andN8W+O8iVPn7HVvf2GOAB3C+iq5355TVrLVHgV3uVQUwXVcL5GstveOhzwt2/
         CFtjZL/I70MJ9Oy3K3dBqxoODFYYg/XV0064ze4txRjcEaYsKT5alBZGi1JvNW8EojoJ
         0043r0QNxRa84VAcqIjIAQatRmvyjT5fVaAouSIXLhgYbdP4wltXisDloTamnLKQ1p+X
         /sCGPvSdSNQ4lz/Y9q0P46HgPcSzREdwEbNXOpWaUQ1lEFtwmy96HO3BBTga8a80J5z5
         IUYw==
X-Forwarded-Encrypted: i=1; AL+hErF7+HqDj9+mAxLKgxrdcvdwU27zbwsewrkmLAuAfXpIyl9DaMis7m1qegMVlsv0J/PIfBcWSQI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+T24rQ4g3t7/CsGABG/81WCtcOYyy9nSQhkxVz3NQrEiWsW55B
	kk4yEzfzTejZfejzW3aggzVwAN5P6Uk9yz+YavtzBG7+r3tqHV6XDJVPdJrxLB+GpLi8XTk/mqv
	ljRNmWux+w6AP3xTQ20t3nUIBxPUsvP2C0ashGVfx2CI2zxlB2Q+q
X-Gm-Gg: AZFdTZfu4TaW9tlVd2pwVtJo1wlVx4KJF+1o8NXcEELIlXT5AkwczZif/DL7Z6AXzM+
	P+fGSeQLOKPNc7KyCcmFm20CbtO7VdpwlNRPq9pL4PQNz+wJ1vbxMu8ZKlrT5dSn0wf01JQvgXZ
	IdYcvKArBc97Usem7ghn8S09u40HFGmWDR2m6XgV+5Ed9J6zsLvsNHMPo6dw5dKVvP+TXBX4Flk
	rpajrID5d2KUErksM7snpqx34/mfaGqBwLkBm+fT+bS7Swoco/zmvgh+3IYOsR0pb+AiqIW/OZ8
	yaS4KijUFJLScei0UR/4WwmFwnlLQvR2ny8rJtM/HRIrAjxGGwDumoOSI2/13LSUIj0dpYzzXyt
	gl0NeXXe66ryBaSrUQB3bK157W0Q=
X-Received: by 2002:a17:90b:288e:b0:3b3:ab75:c94f with SMTP id 98e67ed59e1d1-3b41c92a098mr21400073a91.31.1795744074328;
        Thu, 26 Nov 2026 17:47:54 -0800 (PST)
Received: from andrii.ai (mac.hestia.andrii.net. [2602:f337:ed:4865:7374:6961:204d:6163])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b4062a77f5sm16585106a91.6.2026.11.26.17.47.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 17:47:54 -0800 (PST)
X-Relaying-Domain: andrii.net
From: Andrii Tereshchenko <opensource@andrii.net>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Christian Hopps <chopps@labn.net>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	security@kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH ipsec 1/2] xfrm: iptfs: don't modify the shared info of cloned skbs on output
Date: Thu, 26 Nov 2026 17:47:51 -0800
Message-ID: <5ea528c8-ec02-4f2d-bc59-50700be8216a@mid.andrii.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <179531150722.3135.5639628464200463791@kernel.org>
References: <c1e999b5-15ee-468d-81c5-530a560e84df@mid.andrii.net> <179531150722.3135.5639628464200463791@kernel.org>
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

On Sun, 22 Nov 2026, Sashiko AI review wrote:
> [Severity: High]
> Does this guard hold the "they are never appended" rule from the comment
> above? It only tests skb_cloned(skb). It also runs after
> iptfs_first_skb(), which may already have uncloned the head.

Yes, this is a real gap. A head that is not cloned can still share its
frag_list members: after skb_checksum_help() as you describe, after
pskb_copy(), and after skb_cow() of a clone. v2 tests skb_has_frag_list()
instead of skb_cloned(): a first skb with a frag_list is sent on its own,
aggregation stops at a following skb that has one, and
iptfs_rehome_fraglist() is removed. That also covers a deferred skb2 that
becomes the next first skb.

I drove your route directly in a test VM: a cloned CHECKSUM_PARTIAL skb
with a frag_list sent into an IP-TFS SA, then a small packet behind it.
With v1 the original's frag_list was written into every time; with v2
never.

> [Severity: Low]
> The commit message says: "ESP copies a cloned head anyway, so this
> moves that copy earlier and does not add one." That is not true...

Agreed, with aggregation ESP can reallocate the head again. v2's
changelog no longer says it.

v2 follows as a new thread.

Andrii Tereshchenko

pw-bot: cr
