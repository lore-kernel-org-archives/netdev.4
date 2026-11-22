Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795365724;
	b=KEVPu2XSDf4mPGCiXQrGndzf9EWW1caOMa/e8lS1Ikvw7IG9CDN+FQQCE32Lyvy4Dbd7
	 1y3sJtuify3LW9lAxKCRax6sunC0e0z6NlbilZt3juvEAlUQjpOG7ECyPB85VJIjAEGFi
	 AfH3RU888yvvzGKv6m+HfJ+x3EStK6N9XPPvLJbyChEXzxRUqjAc9RjYfQA6Rlfx5GCng
	 aDhtW8dIIULe0b0cFBQ+vzvFA+7q9EfstNcxSOoeJGALPybeTk5mLjSiVdeMoI5ichb5j
	 MQ9cfSwAlp0GCD7YOK+/nEEOCWUtTVS1aGaV+g7sW/D+xft7GSaHMNnZ+H04k1BNELA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795365724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=r+azstJQBlGkRidMRHAdXxlGjDX4ypISpWhtS/MVgqA=;
	b=0WCa7GquC/aj9t6pIA6AdocVSycEYcJa9w+2gw0W603xIG6wHgwfguWg7tlYgnGo1zL9
	 +7dKj8mUvb4gxoz5zGRespbljYLduL/YxlN5bgpavq/hJ05FlWs88evlv7zpL6Ez4VE/W
	 jQz+H/7OxWGdjaiwwSPETJjZhjbFSKM3babrerRZK0kxg3Bsplq6XoXEirAc+czscISDr
	 08la7LNdXJ7hsdJteK5EGd4q/w8YEqtSFL0mcYM4LcQj4cS12Ls/qtL0Nppb/Hr/eknIA
	 Fe8KG8FW6FZw/uTtOpcRHub2Vdm7FtCoA+9bv1UbZGn45FYxK1QZrGy930ULbpvET+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=rU+Vj6Eq;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718A3606A680
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 16:42:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 718A3606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=rU+Vj6Eq
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4d581da0aaso322691266b.2
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 08:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795365723; x=1795970523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r+azstJQBlGkRidMRHAdXxlGjDX4ypISpWhtS/MVgqA=;
        b=rU+Vj6EqFLZtq17OykikcbR7CZ6nQcRm1ZcCcBNJHmhIDgQPzzfDcfwqSEsJaQvm2M
         bflHZJdk+tdlUjnlKQXpl384X8OAE3gZS7irQnM0xo8AH/s/pAdzgYoTh29JnEb4oSD1
         9KTnTw6Hqdx1P4gJ30al01fFHP//Jhkixb2rjcBN5bYfFoOtj3kRePsZu2bSPauGIZOd
         JYRs+aNNx9/27liDqsDg9MW/M7gaCCr+DrX4+O09M/LZ80rvXmi2QCQYDEjCEFmUdMAT
         YlCmTEq1MBgKcmWELV9fDs22V0cy5L4dDzo4jrZ+kHWZPvwf8hBOliJ3VQP1MIpxgm6y
         pNVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795365723; x=1795970523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r+azstJQBlGkRidMRHAdXxlGjDX4ypISpWhtS/MVgqA=;
        b=sd/VnoHZj6LWvZDTUyatUArDaXSrqKl40+R5C92D2HNbbiLr6qjh8G4d3omSEs63M0
         VcMsnJszJfNZI7+SMgKeo2+XtvG8x+WvVSubm2wxgbUO9X6sUwnh2CphpcBglF9Mb60d
         XvVU9smTcmvSVS42EKrShz3Um892VrG8KJV7BfN+6Tk7sUAbNVkgYtF4L0y3skAenXNj
         nTlKAMn0V5GX9EG98XFE2xLPXzMZ+8NlBv7WnYTzR0AHo5DRGmBXotwDlCjcq9GD/R1S
         SThEnv8hVoPq72MAkdc5nb930YsAYcsO4TDkA9/gc8uQkso6bNiWvV2jj3iC/RyOa5ra
         UipQ==
X-Gm-Message-State: APuU4Z8MIuNdyYLUEbCBVixXRkTnq+U3f9L7UtRk65M3F9HjnhP4Qfyy
	FQ32Y2sUX9BWXABgR91rW8tCvREwYP+Un+MlW46yDs1W/Rk1b9sO7RXwCDBha8cN3w==
X-Gm-Gg: AZFdTZcM9iWbB3HleTMk0d8JppwI0uTjatQ/bUm7iKU7hdV9Ok/oQjkuG1RihB22zi2
	RmSBbjrR9SUdvAoI7hwL92qzAqs42IObELL/+w9eUU+/+xp751aOugIb7RtJFcf/tLsc1DAYn+A
	Xzalmrnt++jHX8IDi9wOOB0tjlK2JW41ArlM/ym1hqkNIPGg2bHKmDn+osu5mUccXHIOwnRHUI3
	mhAMCC5lnAEcTFli44KS0NdUIa3wxw1CAc+xSrPInayauJ/yF7EGxSZV4zl3Oc/MqZ/yYcL5ShC
	uQuxutgj4MJ8Qishs88hdLSyyp1WAm0/YQZBpCHY5EHxbecwA12vkpgfF+E+KFrrpIiMFuKZiXz
	kUpkWVctyrYr9/n5GVkeFYrqyAbEPd/GdgnwcQY0uV9uEOHp5EwvQfF7pp72KX0hfHukTj/lQqG
	HlpD0CPRuNbRENHw3fcAYZbzFZ8N3OTA1tfiqETJJtrUCw44bumjxtJpi3r7cPuQIvqVnIkvPh8
	pokTQSMYhZR+f0MaeY5O9peiIok0XcGkDF1bF11seStzPzx/C3lc8+E46ePoFaqX3Kckvi2Nxl9
	X9uNzTEVRiTB4ktFoen9EhoPHLSHCgP9Q0yOliW4ZSizxqJBUjQPlztnnb3kqNhP95/CEONTU56
	gFO2pqliE4p/g2i8YtxmHrH++wWjFSJs+6eGREg5AM53pgKqmFPVQoHNMr9Uo8sKd3cezyFiPQu
	+VjAVA04P3yJTZr07WBvnlPXzhrkeaari1IKX3Ukq1g75VRJLd9q5JjBW/z10M+NIFPrK9bVPg+
	ZKMtFyv1nvGSxEknOO2DdHXlu+zXCWzhiSNJO42eJBod7IuT4W4VK+al4v0ZGiSb2V1y2xEFJLP
	TMdh/MDRmzu2RCA60/SwkgvTRIiQ4hfpAqhKpLpf+trPhH7r+Rlh5M3TJYZc4jzCqcQV1P/uGcx
	PvqvXlzHKJan8TjBI0bv4
X-Received: by 2002:a17:906:3b04:b0:c29:3c97:c994 with SMTP id a640c23a62f3a-c513ab47f35mr594973966b.35.1795365722856;
        Sun, 22 Nov 2026 08:42:02 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f247136100ed9c1e497de323a4.dip0.t-ipconnect.de. [2003:f2:4713:6100:ed9c:1e49:7de3:23a4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afed51asm319489466b.76.2026.11.22.08.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:42:02 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: willemdebruijn.kernel@gmail.com
Cc: netdev@vger.kernel.org,
	davem@davemloft.net,
	kuba@kernel.org,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	willemb@google.com,
	stable@vger.kernel.org,
	hassansultan@google.com
Subject: Re: [PATCH net v2 2/2] net: gso: fall back to skb_segment when fraglist cannot satisfy checksum
Date: Sun, 22 Nov 2026 17:42:04 +0100
Message-ID: <20261122164204.4058652-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120044733.222627-3-willemdebruijn.kernel@gmail.com>
References: <20261120044733.222627-1-willemdebruijn.kernel@gmail.com> <20261120044733.222627-3-willemdebruijn.kernel@gmail.com>
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

Willem de Bruijn wrote:
> 1. Outer tunnel checksums. __skb_udp_tunnel_segment() and
>    gre_gso_segment() compute these with gso_make_checksum(), which
>    reads stale SKB_GSO_CB() state, and needs an inner payload sum that
>    skb_segment_list() does not compute.

Patch 2/5 of my "ipmr: forward GSO multicast packets" v6 changes the
same three conditions for this case. With this series on net, the case
from 2/5 (TCP from a local udpcsum VXLAN device, CHECKSUM_PARTIAL
aggregates, forwarded with rx-gro-list on) leaves no wrong outer
checksum, 3 of 3 cases in 2 runs, so 2/5 is not needed on top of it.
The other four patches apply unchanged on top of this series.

https://lore.kernel.org/netdev/cover.1795295554.git.julius@bairaktaris.de/

> +	/* Tunnel headers and outer checksums are not rebuilt */
> +	if (skb->encapsulation || skb_tnl_header_len(skb))
> +		return false;

1/5 is still needed: the fraglist branches of
tcp4/tcp6/udp4/udp6_gro_complete() leave inner_transport_header unset
for qdisc_pkt_len_segs_init() and skb_gso_transport_seglen(). VXLAN
forwarded with rx-gro-list on, 20 cases of 1000 packets, 2 runs: 34 to
241 reach the receiver with this series, and with 1/5 and 3/5-5/5 on
top every packet the router received, with valid checksums.

Is v7 without 2/5, based on net once this series is applied, how you
want the two combined?

Julius
