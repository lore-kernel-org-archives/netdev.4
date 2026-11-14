Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794663406;
	b=vfy3/9/GOC6C/cfmlulfwb5D33POxp7yM5fRDi2ngizpO9rX+upOaLCWJKJj/uG2iief
	 HFF83KMU3vV0+xDYhWmjdEov4eH8/m4OBmHDV5J4BmNbujtiHDcSrADrTlE1Eilc7r7nX
	 t1nVBoGkV6NnFvTZyeDNnmjRMlZ/PguMxPQsSOfh3sBuNKoyyHMB39C0/T/qE0V/HHfQa
	 Bln3a3mpHcLqpYO7snNd5uPlw9pg5eh917IrSevXH3c0v4oHs2bh9tvzEWF1ZbxEHtaSv
	 HyY6FGs/I+6OB+Ly4o0SU9MEF0z5RcGRmbCzbAfhhy8L177ddIuR7BY6sh9SV4x3s9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794663406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1kasbafd3T9Fhrw7R0Nr/dFHUF4ChKeJYhTGf2AiF+Y=;
	b=Zs71sJUogN19ZHdBFOfs4R0zekoJgHWVAtpCUSIbWm4FivgwHVwntTW7fwXc4G5F5vAF
	 WPMnItz1yhDlPNVVl2yOZdrAGIyp9wKXBAy14elbgiTu3mObQIBZudn+SEfuzbUJVZpwC
	 dxb+CRDXyLdY5IHKyVehcsVgLFCtXsYgrWRBa9a2U96J4Eb8JhU2v9vh68vhL8+TMAzOm
	 uz8LavRP+9XHsP5IIUF3MElxel6tgU0M3uip+ixl+3rBBcR90S7WpBrjMoHEJvOCQlw3f
	 NLElze37/bC3weRe1ArLjqM3oHKYSLmCYMoT1rMfyQEJz+YzhKak5d3rozZnoMfOKIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=grische.xyz;
	spf=pass smtp.mailfrom=grische.xyz;
	dkim=pass header.d=grische.xyz header.i=@grische.xyz header.a=rsa-sha256 header.s=google header.b=RLiTW4j2;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB09606A333
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 13:36:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFB09606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=grische.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grische.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=grische.xyz header.i=@grische.xyz header.a=rsa-sha256 header.s=google header.b=RLiTW4j2
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so1829915e9.3
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 05:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=grische.xyz; s=google; t=1794663404; x=1795268204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1kasbafd3T9Fhrw7R0Nr/dFHUF4ChKeJYhTGf2AiF+Y=;
        b=RLiTW4j2PZ22Di6wXigCid5UZFJoV8dam7pEz8ccG+3BR1ZeTpnU/jNYAdUaF6+GKV
         i4u/7Ahng6orsr62b4sAutMAc49qkZhOwoBVIUV7+sQMzQ/RECJlhxBglurbIjPkJ7c1
         80jVIZDhu7AB1+KcwjFjddolobsJ/sVfAdM2BVtyRYJ8rONTqblrO3dBwr6f6esVg1Ek
         sBFq+16x+IvjNW+wRQYuZxLo9ySeio0fArjTkHjGFAnz2LVbcyXrgkANCZHgChnkDoA9
         5QNoMASS08Vn34NZb9IBUnhw0jMaxOUbNcHwbUBD8oKt7dUPJgFjGvNz3Cs1ZB0H/DXb
         jRRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794663404; x=1795268204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1kasbafd3T9Fhrw7R0Nr/dFHUF4ChKeJYhTGf2AiF+Y=;
        b=05v5IetSCbiZFovP9sPwHVxCEGDQZ8g4lH5VnC/zOfjPpPlagdX98gBnQCOR0Q+Vow
         oa8OxOnjX/90Uml4vOeEGBJuEIThUH+0Dl/2MfGpLpG5UaHIf+/sTYP9mjoHTzRNwqvp
         MYXa8hLzly2ca9Yppdojkaazc8uee8yx4EFMYdeRuNmeCANdde+bCnvYNFUdh2tqtKnC
         k5doeCqa/HFUEWLn6BIoMwHoAEGhQfKXuibIPyMt1l8hkKCzQKeVmRqAtjzDjuEu0nZl
         BYMenfzIv5zSEmIVMBhrZF3lcGg79ER/ZRTDkg6mPOznnaVA7Qsc5nYqlNcdXjGVXAh8
         XAfQ==
X-Gm-Message-State: APuU4Z8zns97F1oBc/9JP8kd/jhap37K4t2soiDlQKZiJvSw5f4xtqIY
	NnfC+yGrGg7UPvrLkd3m9tvRUAaQSJQrMttKukgOYIDKQQylx9P4kN++kKHI8wv3CWlpRWCAuQw
	P2fqpDO/FRA==
X-Gm-Gg: AYBFou0RK8eC89yzOcPNmNS56iDxmDur3+Y83QfaRd0pmpBVuS+VX1Nn5t36ISQCgsn
	pkNiu15vQ9fSCMiFD6eVdC0C3k5Z3A9zft1c7PkNs2Bjv7Pxm2oeuT5vk9zqxTTarlj6o81JmkF
	iTySbVDde5tThsNko9Ar/DhM/WcWY9XSsOmTSrU5ua2JOvbZam+WL3YppIxVX7WI+lEJut0qymj
	PgCMh1auNoESDGaebRjUkRvG4XUDKl/KO/VTtkvdYz3DUTd6bjjwQWVzQQsPD3//diVA8NlxcqF
	dkl5DBAssYbF2iy+hbd7HI90DfZjPPrLE0l+T3sNj8eBOGgNIKOYnIE+B9jLfGqJC3KmDM7UMF5
	UgUYPD300MCuGMaV7W0VwkLhFvDqYnGTLZw5PO+Nz58YOcnpKxK9vA0WlOZVOl9MjDRXEJU/GXG
	TtqYfYNceb5hiali+r4sJdQBesv3zHSWmZTDtpmdaA/2sEghHDybuPCmUyKcI+JDU+uDow5u5XQ
	UzaAYfQwTUy30ABK5gzbnrmV1/+pK2IwdoIG3uI9N2E9YPFUJAGB1Mjcl6VRL6DAmYcX9BVCKJp
	J9YPmyx31xEX+F2YAbptuO6a8G50uDVtj721/vS6/9IIeFY=
X-Received: by 2002:a5d:5f03:0:b0:491:e062:383d with SMTP id ffacd0b85a97d-49c7390fb5emr10908010f8f.57.1794663404019;
        Sat, 14 Nov 2026 05:36:44 -0800 (PST)
Received: from lake ([2a02:810d:d09:1b65:1a41:5e41:61a6:f0b6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49d69c21a17sm6657866f8f.50.2026.11.14.05.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 05:36:43 -0800 (PST)
From: Christian Schmidbauer <opensource@grische.xyz>
To: netdev@vger.kernel.org
Cc: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Christian Schmidbauer <opensource@grische.xyz>,
	stable@vger.kernel.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Ong Boon Leong <boon.leong.ong@intel.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Subject: [PATCH net v3 1/3] net: stmmac: honour Rx checksum errors in the AF_XDP zero-copy path
Date: Sat, 14 Nov 2026 14:36:37 +0100
Message-ID: <20261114133640.3285413-2-opensource@grische.xyz>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261114133640.3285413-1-opensource@grische.xyz>
References: <20261114133640.3285413-1-opensource@grische.xyz>
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

Commit ee0aace5f844 ("net: stmmac: Correctly handle Rx checksum offload
errors") taught stmmac_rx() to honour the csum_none status, but
stmmac_dispatch_skb_zc() still ignores it and sets CHECKSUM_UNNECESSARY
for every IP frame whenever the checksum offload engine (CoE) is
enabled.

Since commit fe4042797651 ("net: stmmac: dwmac4: stop hardware from
dropping checksum-error packets") dwmac4 delivers such frames instead of
dropping them, so this path receives them.

Mark the skb CHECKSUM_NONE when csum_none is set, as stmmac_rx() does.

Fixes: bba2556efad6 ("net: stmmac: Enable RX via AF_XDP zero-copy")
Cc: <stable@vger.kernel.org>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Christian Schmidbauer <opensource@grische.xyz>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 7ffed295eb14..3e5803db19b4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5547,7 +5547,7 @@ static struct sk_buff *stmmac_construct_skb_zc(struct stmmac_channel *ch,
 
 static void stmmac_dispatch_skb_zc(struct stmmac_priv *priv, u32 queue,
 				   struct dma_desc *p, struct dma_desc *np,
-				   struct xdp_buff *xdp)
+				   struct xdp_buff *xdp, int status)
 {
 	struct stmmac_rxq_stats *rxq_stats = &priv->xstats.rxq_stats[queue];
 	struct stmmac_channel *ch = &priv->channel[queue];
@@ -5575,7 +5575,8 @@ static void stmmac_dispatch_skb_zc(struct stmmac_priv *priv, u32 queue,
 
 	skb->protocol = eth_type_trans(skb, priv->dev);
 
-	if (unlikely(!coe) || !stmmac_has_ip_ethertype(skb))
+	if (unlikely(!coe) || !stmmac_has_ip_ethertype(skb) ||
+	    (status & csum_none))
 		skb_checksum_none_assert(skb);
 	else
 		skb->ip_summed = CHECKSUM_UNNECESSARY;
@@ -5789,7 +5790,8 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 
 		switch (res) {
 		case STMMAC_XDP_PASS:
-			stmmac_dispatch_skb_zc(priv, queue, p, np, buf->xdp);
+			stmmac_dispatch_skb_zc(priv, queue, p, np, buf->xdp,
+					       status);
 			xsk_buff_free(buf->xdp);
 			break;
 		case STMMAC_XDP_CONSUMED:
-- 
2.54.0

