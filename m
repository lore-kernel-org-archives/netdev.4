Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844364;
	b=TIiBTp9ffMyhe8U4Uskzm8G7FuU56O5guW/90sHSMDPrEIzTpGiJ+ErDQF8o5tJtJnOP
	 8AtayAGnfl9jMmSNNn4BqoYg7bY6JH3x1y6ypJyG9Rldy6NPVp+BJ1Ly5/Llm1xi/eqxK
	 F+5oY9CRxlC5+M2B2eaLRejSfBicDoH5GPy1RAgTZoASHgDvqIQSqX2BB06K6kdleVELD
	 lhBj0r3KhLwKz3lBctAPii3/Y2i++7qgwhvxppuC05DZMN91xErEGxtPURCZCsbpkv3KE
	 aYwBvs994aWeunjvCBCH4Wlyojf1/2+7JX75r/HkzW2ExkjqvelkcI+X/uqIW22a6qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844364;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=g+kb+ZzrGTUhbJttxW0qtASDjHC3TIeprrt72BSFN94=;
	b=uw3UwXpyLyOPoL6aAEluaMSRUwjBsTN556932oG3RxHGIEEzrZvS/Uq58Gjw6e/M+/sL
	 6I3ohW3z2wtMntSPBgj57V5KBgculBdrWu7Keto/wK8Dyr/p02xucuR70Q3Tp3Ohy5jbK
	 bsSO6N3VxbJ1Jh3erRBoO95MSnPfr/u4rEIvYn3+Rg3o3o49AuY1c8rk0axZ1bvP8TeBy
	 poN6W/lrl73B1mQ95DRfJxlbi5dzMfMBfFK0+1jbWwAGzUVtp7Wme/ioPG3ZHczPhZ0ct
	 GikcoWMAd45I3a9f39oItlWc/Ab0km5aKQ72ZDz1QBXTSrRI2pOqiKAqe3UuRvxhGUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nebusec.ai;
	spf=pass smtp.mailfrom=nebusec.ai;
	dkim=pass header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=qkCSfGmo;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21C6606A332
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 15:52:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E21C6606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=qkCSfGmo
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ede7cb02daso32766925ad.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 07:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1794844363; x=1795449163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g+kb+ZzrGTUhbJttxW0qtASDjHC3TIeprrt72BSFN94=;
        b=qkCSfGmopHpHUcNocZwRbaALDar9yZzNW2wbOhHFMj/hFXNwMe2jBxbSZ5/dDFppYb
         lXu7eMEYGP7bJdfC8dbILiusCGbXv/QkBIaZs7/9iH20cg0WD+u5rV5Lltt+T1zN++O6
         3p8KOBeAFhW19Z1AIolILCYh1kz8DNwU3En7dW072KN4KjYE90OiWNdWOpqhPvMif8YY
         Z2Tn7hs9b/2af81NNUV5dbGwFOAm8lm79WotkCmKnCWowwdVWBXKxvc4ScuiAuQ25tSy
         2wePdAeicHVA1AD4CJ0/N8AGJe0M7SmT30M2a2B/cMqG3aux5GTrJfcwIhrx8gPjtzKp
         s8Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794844363; x=1795449163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g+kb+ZzrGTUhbJttxW0qtASDjHC3TIeprrt72BSFN94=;
        b=XhiGvfwOdo3IDtDNca62I2Mc5E7jMPxcjgPmSwgdAl4y8MnKXWv0SEwuJtuvFBZIte
         Z5Z4MD+sB/BnIQaqeZlvnZygTV2zKT+fwaU5czpSoQ1yNKc88VcQ2NkxrPU1FNQpgjke
         RsS39ftLnEgaANjgFREdfnY310LeSxrisIg/cFAPG76ete688uemlATw2kpzsdf9rD79
         6oXc90JFsHIOdUfwDAsoINBy5zKjUNntmK2ovGmCOgiyvfTV92FdfrYLVcSwi6LMXnk7
         3xlFrMy+0lXKvULev3pW/UeBitWdd97BgNslLJZzjQRhqiBEqMWdYwUWzfaM2miw3FpD
         +HPw==
X-Gm-Message-State: APuU4Z/TEZwq0OTZYxpHXXGfjiYu/ixjbyr1uv7ZLiP3Vpl2uAUwYCuF
	emmRzZ2Q+OphBUrdBRoRe8yVVO5CiFpB5QNMWrEA+PxhOjsp2b+14xn0b+XY2SXRvBQqwQRbnRJ
	0gRGvqX8g
X-Gm-Gg: AZFdTZeMrUxergDQ7bQVFAdNytlBaONjXwjCBtfbq/2PpYZb6+HrB1rhRT/Qo6uRW05
	1CveGJqrDeq8ojylUtJAzkioVWKDzAwPYPWHIE7COANrEelszwEfu/prk6tuLSfX1xYe6cCd7Hq
	XMi+WMK1Sv+z5CfDMQob7hsdGlbQHw0XqOgfuTFeeSR7qcEBCWFiVG+E0gHwzbpWGipAEMTDBXS
	JQhh3KFgjFLXrAo6FWEuS+3typtiFUUFbiIRn6+H7WbAlHCZoyxqPJFMoRp2CoAdLFHReDwa3LE
	o/1sLkM7NN8pRMb8P52H32Hep7l+F4B7FNFe0Kq+/4mGrbMc/YuqxGexhKKQ8XlFAnkSdLA6ZZg
	kdxkcJB5hdf/QasHQB1tEsrTkoUoXpxfQVado2BhyBo+zVkPrf4MmN/pwLJsXb1k+KrcFc9tVSh
	EApLcEAqOEqmvLiX6JktY6sDVE4YZLs/hRYxSORRZ4m4I4cWn3Zafbn0pO/Bz4OBjnxpLnmYTQK
	oAPQZsZbrARKuzk1ORZIQe8o3Z36w61mav8xvYAu6N0U3rlQhA436LcZXswqQmX9JcNazQ+4Z5E
	HH4c2F+wH+zUFqoTuR5TPIPWh1YJCbBFMHDmhMcGP4jTn5QE6hPUeeuFY8Jad451QfMpW7wSZbe
	rzO3UzevDLoQySGHYjrYH
X-Received: by 2002:a17:903:3b87:b0:2e6:1c24:d5f2 with SMTP id d9443c01a7336-2edf21c1da4mr95518365ad.36.1794844363031;
        Mon, 16 Nov 2026 07:52:43 -0800 (PST)
Received: from 24c857d0c3be.. ([122.51.212.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a36504sm1330985ad.30.2026.11.16.07.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:52:42 -0800 (PST)
From: Zihan Xi <zihanx@nebusec.ai>
To: netdev@vger.kernel.org,
	ipsec@lists.linux.dev
Cc: steffen.klassert@secunet.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	sd@queasysnail.net,
	vega@nebusec.ai,
	zihanx@nebusec.ai
Subject: [PATCH net 1/1] xfrm: espintcp: select receive path by skb protocol
Date: Mon, 16 Nov 2026 15:52:29 +0000
Message-ID: <20261116155229.318582-2-zihanx@nebusec.ai>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261116155229.318582-1-zihanx@nebusec.ai>
References: <20261116155229.318582-1-zihanx@nebusec.ai>
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

An IPv6 socket can accept an IPv4 connection through a v4-mapped
address. Such a socket still receives IPv4 skbs, but espintcp selected
the XFRM receive path from the socket family.

Use the skb protocol when selecting the receive path so IPv4 packets are
not passed to the IPv6 XFRM parser.

Fixes: 26333c37fc28 ("xfrm: add IPv6 support for espintcp")
Cc: stable@vger.kernel.org
Reported-by: Vega <vega@nebusec.ai>
Signed-off-by: Zihan Xi <zihanx@nebusec.ai>
---
 net/xfrm/espintcp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/xfrm/espintcp.c b/net/xfrm/espintcp.c
index 4052ae5bbb2e..ec37a32ecb00 100644
--- a/net/xfrm/espintcp.c
+++ b/net/xfrm/espintcp.c
@@ -48,7 +48,7 @@ static void handle_esp(struct sk_buff *skb, struct sock *sk)
 	}
 	local_bh_disable();
 #if IS_ENABLED(CONFIG_IPV6)
-	if (sk->sk_family == AF_INET6)
+	if (skb->protocol == htons(ETH_P_IPV6))
 		xfrm6_rcv_encap(skb, IPPROTO_ESP, 0, TCP_ENCAP_ESPINTCP);
 	else
 #endif
-- 
2.43.0

