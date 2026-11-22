Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795375363;
	b=o5I+V9Fpqi8dKcLaEXhRwnue119nkF6H+tBXKLwtKHcgw7VYqBsE9MtbjkH+/8X0hCd/
	 Ejc6A7D2SM9UCd7oJlBlXZ2tzpW+sBUXs2eI+ehLEV9khTVcFO2OGjGVJi2tLDfEV0ABD
	 kCLH5Gh4/G0R4KuL/mAZ5I68Xmvf7capDFa+EeMDNq9kr/qHrggKZh3CITTvc+tsOZP3c
	 o1x3U8JGIvJiYhnwGWs3MvWBchz0Ekplps29Ejk/WCkDv9/C9Bc3QnRmPsmJ7Op3rmoIa
	 H8npJS4h97xFBvNm1cgdejRbPM0mBq2grJpZA16MW0714QMncXKXcqO3GbKJ/sybFLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795375363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=S37Kq7lpvR2YyR5RAVtCqH5zGZdjSyX6X5jAfIRmo9g=;
	b=1mWvvIop4qKuGi99nwz53+yXO08iqglJIiY7uEcIYRJK0aTh7SNw3w7O9Qfajw5hzPWG
	 rxDdvmAHHALjM58NskAivTs8vn0F7NkMT2oqpc3FOkPsK43hDEH+cj9l1Kt4nfzSLByOx
	 BhaIxwKEFXE29qioJz/0H4ubwDF3F8vVIUUJj0iIDJMwT99Yz7sUZohNWGLCLpQy2jOI1
	 Te/0AHvvkeUWC1jRQb78YMkSr6jgh2ayN8nCb3XnUsttFISnEleeTfmWhrz5ZXmX9YukH
	 Mr3RNMOAZhkSWc8APLfA6rT9qtKRCzuNixdTLqTQM1Tl3i2FDpLIk4Ij93VWw0SWUSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=qJt6HBS1;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83DC606A31A
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 19:22:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C83DC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=qJt6HBS1
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so353869866b.1
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 11:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795375361; x=1795980161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S37Kq7lpvR2YyR5RAVtCqH5zGZdjSyX6X5jAfIRmo9g=;
        b=qJt6HBS13acmjm7PvKGvUPqpxRQL265cFb6Eti1Mfs3uadb1yfAfkDSSQIIfgJEhEB
         /8p4RNVsdXzYZN9OEgXQeYru1m4PWxw6fbVBBZXpOYwsoc473++LzlwqqoOlHO/S0Mo7
         tqiYg0mYNkDWYoQDWz5emlOao55jC0dba+zvYlBSMex9j9d0iC5LdIbkKUwgLV0CdFvq
         KSBXhlwSJG4YSoi1omV0xgGH/olADmtmJ+HAYxkAMo2fpUlLwpVvxOmA5OIbYM1dWxLe
         FWre/N1p2kZpZd3T/RmBAFSmldHxY2PBXhTek4/bS8mghIxUFti+YpPu4e88Quw+0w7x
         x3MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795375361; x=1795980161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S37Kq7lpvR2YyR5RAVtCqH5zGZdjSyX6X5jAfIRmo9g=;
        b=o4Fil3jUAU5heIEJ/iX2aklj+lRVsPELztwF8la2CAA3MZKSeEaPj4UMfkebmufSE1
         YEAGAov5g/OF2oY3qklth2gSiyG/xPfxjxILm2uhW3Yj2wgQ4zb2lfgC7P3SgHHs5qu9
         2NniAD6ZP1pPi/I5k1MAI/R3CQJcN/WLF8CduqdfaxY2E6nk/GQ3LPCHUMGuiadAha6C
         loT1ZDacTlQoJz2IB+vtUopnBxoAha7Il2MUhf8RTLEp5ntOKeTTAViXYgd4tZUyzQpM
         5D82Zaj247PYMiFW7KXlxL+hOQ2WIOeUq01dDcLjdzedhO6IXLGzMrAIVMubbjQlYq0O
         qeDg==
X-Gm-Message-State: APuU4Z/XYGYR+C1/g/2n6jmBTvyaTYsXi1fXZoGMB20e9XrVQqaFTRoT
	DYvWubylSl49vxR3oBbinXZEHb0wgGlLdHNE1QaFrxVvuwSjLDb9MjU8TOP8wTCCOg==
X-Gm-Gg: AZFdTZfogVS3Zk73rXXZpWjVjiEY/krkn63SKSVCy49GUvdppIdiCv4MkAqODY5HG4K
	HBNBIZTBqjGe9jK0pCcQMtdfsraL80LxUscx67N3qcR5Doch0gHWkPJJKGlCYkbb1uJ1gZCIn7m
	jJ9cdP7onmB/nbH8wqWxy+l2+iQRubulelu8fvUvMcfAOonyz9D8bLKd97zoY0+LdBiggevtkMj
	rjVwDO+nMh6tkvTUPw+K9FXXvZ2B3xS5oiD8o4Q4ZLZhs9FhMc1vMpVqR+dnSNkFs4t1kyT7bUp
	S3KK9Q2KxGciQ3yJ+rkMAwEKFLOoaZiN8qKLa6jBRYSIBU2jLQ965bc74389k9FRpfVVx3M98aF
	Hd0LpoC3OkOae7xyzzuUbJo/FXOGHuLm+ND3ZOVAoTeORGfBbgUDyglAql+NJc6gnH+WvBRnRB1
	0RAUGYKWJudEH8N5VfFD9vxOILgKd+d/71UDJ4AC5deHb7eaj7rp6SU+CcwREUDqlAGd2ZkwWkq
	zMk+PaFODFHJhzlNPO+AARJwjzxQu8qWoOfBEB12lmCxzqiglcbPJHAs6GjiPdIHrypMxsvGkKZ
	nogWrQEJ7rdLRTD2wFDpoccZYFRFz7k6hZ7Tj/EcHNPmL/y7L72xNEtyp+m+CLLPxSOCSK6g9/r
	MfuHkxZNCHou/BTOJCW224mqzgQmdVQnjPveZJfzdTR35YL8GYMSeUeoRQsReWm/qnt/wM63tae
	W8hNS+z8THrRaJO8MSXJk5MZwmunwQTQj149+YN8rQZf0CgfYoBCvHzpp0FZeJdgFiMMIz3oD96
	K7+MiEF8QGlEUwApzORHySiVvdNaQcGzXc8tsTWLEF+hFJDM78kZLDnbRqqQQqDoZrXXHNkiYZ4
	oEDwtuLO/RNaqSoVN2PaSZ/ykf4oRM5vxVq/iFB4HOoM3BucGrGhLMNjx099klBAuLTag2cBXB2
	5uQ==
X-Received: by 2002:a17:907:3cb:b0:c51:40e:847c with SMTP id a640c23a62f3a-c513a84ab4emr462378966b.23.1795375361209;
        Sun, 22 Nov 2026 11:22:41 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a7000000000000000a27.dip0.t-ipconnect.de. [2003:f2:4713:a700::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc316bsm332597066b.56.2026.11.22.11.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 11:22:40 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: razor@blackwall.org,
	idosch@nvidia.com
Cc: netdev@vger.kernel.org,
	bridge@lists.linux.dev,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	willemb@google.com,
	horms@kernel.org,
	olteanv@gmail.com,
	vladimir.oltean@nxp.com,
	jbrandeb@kernel.org
Subject: Re: [PATCH net] net: bridge: withdraw the switchdev entry of an fdb entry made dynamic
Date: Sun, 22 Nov 2026 20:22:42 +0100
Message-ID: <20261122192242.1205890-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <4937f07a-6238-4136-94ca-a98b2f4b8db5@blackwall.org>
References: <20261121191638.1724620-1-julius@bairaktaris.de> <4937f07a-6238-4136-94ca-a98b2f4b8db5@blackwall.org>
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

On 22/11/2026 12:58, Nikolay Aleksandrov wrote:
> I think this has never worked, so this patch can go to net-next.

Agreed. v2 is for net-next:
https://lore.kernel.org/netdev/20261122192118.1204290-1-julius@bairaktaris.de/

> This helper isn't helpful. Just call br_switchdev_fdb_notify directly.

Agreed, v2 calls it directly.

> This comment is useless.

Agreed, v2 has no comments there.

> I played around with the possible bits that can result from this change and I think
> I got 1 bad case:
> What if a user adds a master static entry (created with BR_FDB_ADDED_BY_USER but without
> ext_learn) which is later programmed and gets BR_FDB_OFFLOADED set, then a replace with
> "master dynamic"?

Agreed. v2 clears BR_FDB_OFFLOADED together with the withdrawal in both
paths. Your sequence on a dsa_loop port leaves the entry without
"offload" in 3 of 3 boots; v1 kept it in 3 of 3.

pw-bot: cr

Julius
