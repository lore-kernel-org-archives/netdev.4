Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795295673;
	b=wi+6LH1gl9tVhiY/pKjRXfgMYOG6hBfd/cs7oLwJbH5w2X19dJFpSJRlX0G7mLDVyJCe
	 0uhbIbxsulSXAXGgAOqe0zyMoQckvgz2mpX2qjnFqIslR/4Wz6a/72SJogofoCeiF9NDp
	 rpWiAv5fOA1iyVbr7e7nUO9idYOU6OZzu5jvQrm2eqOk5Mr3S2ROwVV5Z6fKs0F0JrkAf
	 6/3jtbwqelelD7PKgUyJTSZWnajUGn4AmPBuo0+bFjlL6SUMmQ+agPl7xDkP9W1h5p8Bx
	 LZnp1YKHbs9NrdlWKUSDP9Fb9sQGP5Oz7xFbTB9DNPRAdvzzwws1Eow9StzGBIcOzqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795295673;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=W3XGm4D/gebvd6MJ/B5UrKrT0jEK8n/MSmEL6MYn/QU=;
	b=iYrQqGwGtPGwFhl0/FXdDxgQgTJP/TwPIUVD3GJCfOw3sjLRxCll2nm5DRjV11/lmA6x
	 vDDcgy44Y39CWtw12SaRFC1/PqKYVILoTEsYbqoizTAw16LYdTkl1kXgmN5C9pLtnstKs
	 JVUbGwHZUDLXDLJRLqSVL+GGaWZOELXSuMRL+qxQGCivriFZv/48m/B0N7BB2S9gyW5fh
	 F2d8Z+oH04cu3JMm4vg1qMsL5MDU27u87KGFX47+xFESmzf4C1YWQfoK2A2mrEsNaCqQJ
	 bCLDWhrIPsMl0u7jMVjZZJN32a0M+zmGJr5DA81Z4107aWmRJyB0L3PSlvGbIkh+pYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=jHldEWwy;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45555606A689
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 21:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45555606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=jHldEWwy
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4cdc606b47so359515866b.0
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 13:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795295672; x=1795900472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W3XGm4D/gebvd6MJ/B5UrKrT0jEK8n/MSmEL6MYn/QU=;
        b=jHldEWwyR5y+1WZeY60FjDE9ddWAhaTOoyRYkIMrliZW2fkzz1mG47GXOgNrQD35ND
         dzAWDio5nG3+bIYS8znNnDvi7UdKov3FUNt21uvncNCdANZBv6RwF0zcstjIPauBnUZs
         XVfVXsWp6UlpKx/f8W2nN72pIoxLNggeyptHF0khV6aOgpS3A811cNjFAQncpaNU1CXL
         nQQxSj8ITaS90L0xanncrts4lk+pwta7DG75GhHV8UUrFbnYvIcAOV4HWcbH3rLGIQd4
         HoLYVXMk8GIArwz+lhz2jI2h/RKJLB8LOpKozxqUOMV/cWaqRa0Tzkgb+jbbpeXL0WT3
         KALQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795295672; x=1795900472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W3XGm4D/gebvd6MJ/B5UrKrT0jEK8n/MSmEL6MYn/QU=;
        b=YMzE+Mqcu8M825vrdm0P/Q/vaLyTk8yFDwothF9nNMkvkkEUacUvuKvFvOHwEly4OF
         iQWRl2E+p2gwGUOXmzAybamOvnkBTuoimqPRKrigTQrIzpwGqf+r7zSuOwTMy5zsdAsH
         rfN++ny2EsYczrmKpkhvARuxH0WdT4eHNxVHVk4MTlaF9euSDSeyQedxuKdfQCr7fQRk
         XFwLQ4KkZ4I8xW3bxwz8UHK269jtw/ie9jB5yfk/YMIGSJndOr1+VrSRQX/jupXstOj4
         oL9hfWKOb893s0914fa0YpXSAevKQn5O0JXTiKVqRmse1EuMUS2cr2KZN//9pEtS3MWL
         Be4A==
X-Gm-Message-State: APuU4Z8W5XjdXPYdcdvoiKr9Mtg6dVrA/QnlAxKuO/RaKgOKeJ2Sf36e
	iInWZ9JpO4dPHcuTpOGgYFNNY9sgKrWErWaV/IQKYiFOmF3Zk9WZAUSd9M6oaGxxi/5UR/vli/W
	AYTsga3Co
X-Gm-Gg: AZFdTZcNb/CVyx6ClnptW02Rn/aFBh9MZJB0X339ZJUO9hyX72RsAHT4FUO7gScd/MM
	4x2FpuQvF2PtqxMPc8HGd/zeBt1tcrUXOugnmEyMTeyiGSkfzLnOSQ74oPxb5pI1v44C/kBABwy
	8Bg7u2ZP+DdRllkiEgwEhe3BcVH2jfKZPTpGYgM42E9xlv8j4a9desVFimlRPG+4W0/57C8dpFY
	alxRo5h+1KOTMVE2B7c7Q+HddI7ynYUX0L5TjEadF8RsopGQbz7d9fXEIG/AohXud/ZEZ4ixkSo
	hVhXRtj5/D2v9riyk9XXdPOJGb2+Bd4+Nak9qIhlaeevVAokSAbwKy9aq3/qrnBlNLaKopuwupK
	yjdFOMiWMuCswLGb3ylF6vxGmTip6rBZoNS7valwWcIqMLigKUgAGVimlE5VZ5ub9iyTHWfQHcD
	vfyC+APdWfsWgGpb79JsT1ATezRpcjYVI6d/cTIPhqu1/4coeExc44XRBQVclOiBChxjBsFYDMh
	nGeOwIKJ7g1V+YsG2+vNQH4MdzFKkPPTw5yFJ+L/hMkSA4K3bGp98B6JlJD3bHJLYt6C2kT0xIa
	amCLX0MZhqQgQ9Pc1VirjemPEytKi78sr2xcsHLNrdZdwh+qTC9T20ZnVJMBVJU3Wes/ZVUp4yZ
	YZxY1iexqS3jeq65w3TE0uj2xvyXcfkGJkWiPC43a0q+3oOxG9cwCADqhFynWp8LmPwa65wldx2
	ucTqS9Pxbc1rxFY+/GoqrJMCX3ydnu3I09UQEw5kZ1fwMttAJHxRlQEBj8k1MUONsNeYGa2/oGC
	8hSfX/PpWH9acEeer25mRUgVEhRWr1mES1nn5Y4JBAZ+Eis1Zp05BRNg15VxS8lN8jzmdjl2FL3
	LgkgmzUw8Lk=
X-Received: by 2002:a17:907:a890:b0:c50:9432:b7e3 with SMTP id a640c23a62f3a-c513aace654mr698283566b.42.1795295671681;
        Sat, 21 Nov 2026 13:14:31 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([113.30.183.63])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b03723bsm233079566b.87.2026.11.21.13.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:14:30 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	dsahern@kernel.org,
	idosch@nvidia.com,
	willemb@google.com,
	ncardwell@google.com,
	kuniyu@google.com,
	steffen.klassert@secunet.com,
	nbd@nbd.name,
	jiayuan.chen@linux.dev,
	mfleming@cloudflare.com,
	almasrymina@google.com,
	bigeasy@linutronix.de,
	richardbgobert@gmail.com,
	ecree.xilinx@gmail.com,
	bsdhenrymartin@gmail.com
Subject: [PATCH net v6 5/5] ipmr: do not drop GSO packets that fit the MTU after segmentation
Date: Sat, 21 Nov 2026 22:14:22 +0100
Message-ID: <feedaf85d17bfb8b0e4587729d8cfa5898f94183.1795295554.git.julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795295554.git.julius@bairaktaris.de>
References: <cover.1795295554.git.julius@bairaktaris.de>
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

ipmr_prepare_xmit() drops a packet with DF set when skb->len exceeds the
route MTU, without checking whether it is a GSO packet. A UDP multicast
stream received with fraglist GRO or UDP GRO forwarding enabled is
aggregated into GSO packets, and every aggregate is dropped with
FragFails, while ip_forward() lets the same packets pass by checking
skb_gso_validate_network_len(). Do the same for multicast routing,
leaving room for the outer header on tunnel vifs. ip6mr has no such
check and leaves GSO packets to ip6_output().

On an IPQ8074 router with fraglist GRO on, a 10 Mbit/s stream of
1316-byte DF datagrams routed by igmpproxy loses 14.5 to 15.5% (n=3)
and 0% with this change.

Fixes: 9fd1ff5d2ac7 ("udp: Support UDP fraglist GRO/GSO.")
Reviewed-by: Simon Horman <horms@kernel.org>
Reviewed-by: Eric Dumazet <edumazet@kernel.org>
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 net/ipv4/ipmr.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/ipmr.c b/net/ipv4/ipmr.c
index eae382a2fadb..3e518877ff5f 100644
--- a/net/ipv4/ipmr.c
+++ b/net/ipv4/ipmr.c
@@ -1940,6 +1940,7 @@ static int ipmr_prepare_xmit(struct net *net, struct mr_table *mrt,
 	struct rtable *rt;
 	struct flowi4 fl4;
 	int    encap = 0;
+	unsigned int mtu;
 
 	vif_dev = vif_dev_read(vif);
 	if (!vif_dev)
@@ -1981,7 +1982,10 @@ static int ipmr_prepare_xmit(struct net *net, struct mr_table *mrt,
 			return -1;
 	}
 
-	if (skb->len+encap > dst4_mtu(&rt->dst) && (ntohs(iph->frag_off) & IP_DF)) {
+	mtu = dst4_mtu(&rt->dst);
+	if (skb->len + encap > mtu && (ntohs(iph->frag_off) & IP_DF) &&
+	    !(skb_is_gso(skb) && mtu > encap &&
+	      skb_gso_validate_network_len(skb, mtu - encap))) {
 		/* Do not fragment multicasts. Alas, IPv4 does not
 		 * allow to send ICMP, so that packets will disappear
 		 * to blackhole.
-- 
2.53.0

