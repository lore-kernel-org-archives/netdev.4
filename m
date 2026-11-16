Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854123;
	b=iRJJItZC7LzXMfV4XuyKh4/wPfhSIHqeROhk32bVETONxf82Arzv23Qq8k/wdPz3LVt6
	 Nvo3O2Xt7Fis7nIHU7irlbyp2eE0a+vMl+m/fVWcr+qXpbTdcXO3i8AUhTcHsuUoeAAle
	 XjN/i6qhkhlXYBnoRZqfyqYyNmDERdd3CKqvnqjzF3hp9zFEmy4LA00L9iuH5PmKTmQTf
	 kG68Wl4eK1RDrZRsZuJt4F3dCx0e4+7gNEDm+iiK+pqzw0SqMIS1Rk6ZoSqVSq1CEjUzS
	 WPP8QsN0bbHKJsEnPg2irafptxwdrWL4GBtNTdIwva6KQS/YXWg/6Hs7AplET/RRnbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854123;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ybBx+yBLrmsB2rueTXpUK9n0LGipir6W5oafTHFMFuo=;
	b=j6awqjf2odjv+0klS5CieH6/LzQSeDCnOzr79ZmQlsW8M79MWB17geXRvnnD9MptH2La
	 VJDsg7tGf2kbzFXeH0iVV0lNDH+bMSIwBV4urbMlY2hs+QfM7+YG26qkhQLHE5LIsEyKP
	 XgHqNVX4fbZAmK7oyPqN2dTe2tFs/OpR+u33oPfgdZ+0iQPEvRoiom2RwA1XJ/LExf8wU
	 LUdHubYWcQHLxYsdnkgMiIUI4WhaNW1tTUu56H6Rz7CruktQU7nwEgrJWHnYGL7ziEtYh
	 rA6j5shuWxbXcj2xAS0cNZsHehl2NxJD9+1u9t52u+tpMlOoCy6XV2/IS7AyGIAjJhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=BZHrf3Vy;
	arc=none smtp.remote-ip=209.85.222.227
Received: from mail-qk1-f227.google.com (mail-qk1-f227.google.com [209.85.222.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096B2606A32A
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 18:35:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 096B2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=BZHrf3Vy
Received: by mail-qk1-f227.google.com with SMTP id af79cd13be357-94965745d92so221143885a.2
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 10:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1794854122; x=1795458922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ybBx+yBLrmsB2rueTXpUK9n0LGipir6W5oafTHFMFuo=;
        b=BZHrf3VyjRKqobnF3MURCjTiC3lNjk5+0vUW+bfm91U5SZy77q6VLoysFylbNjlukj
         bMajemJWImxEKcLg3cwOYiyA83VKJht3baXt9DCfq726TjXqXexA9IeZYIvThQGcF7Mq
         z5dFnhxjzuNZqye88MxVx73qd94P2YUX+t4XQEZkOOjIYEft5DE6vNUnm374Nlb4G7gf
         IOwglMCwcjJ24NkZQwXOIQG/LG/vLJ0aB074YyFuy2XsMRxSJEQ41oP0loRQ2d6taVDG
         zFlm55EiTCC+URH5/itjDFqq5B/Rypia6DfZ4MHWBuhLnbRA8EUeyjzJ/B6ZQWMmTyhi
         SXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794854122; x=1795458922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ybBx+yBLrmsB2rueTXpUK9n0LGipir6W5oafTHFMFuo=;
        b=QGRVBoEqAec9q/Air3JoA1wYlggPPKkKidXlQczQ4Y2C3jbQZ1D/jYAlM80B1k6yul
         vnuAOYbV3dWp61vavLWS4jEzOvH2Nq816X2SLNLbSaKWNaT7tlSt2XOXxZ5TMDUAIxfr
         i26iqSyPHPmDRU119utlGVDMmcaORFKnsc/EAalIF1O85sf5Awe7v7PO08be+Tvj8bl3
         Nx5JIVPPoLNRwQzKP4sytbtBSzk/iohkUXqTUI1D7MSpLzSUNRWumBcS1s97AWC6DBm6
         sX2fDEI2hi8/UzGuS3QmW9zVhd10J++Z0XUoTxlLYuUW5bbEkorl8Zh6QzNO3UkCWAzw
         L7aw==
X-Gm-Message-State: APuU4Z9L8WCWnz15CYtq4cJQkFxYaBeG7iLiazyRm6qxOCPQ/fNAW8gU
	M2ZMOyTMADPo0OyMEAj0cUc7JTsFz8o3iJI1BvkDKRSNq1zQlfQYBtcQn9d2e/M75sewOVdDiW2
	WC5HF6HW/2yMzCuW8EPlym7aDNyJoi7mM6eNU
X-Gm-Gg: AYBFou24zglc0Ry4/7RvKJix2iw0wTdQXZzv5lVpfC10vUCisoB1HxyA8bLQraK0fax
	oFzfh59JWJDb8PVm//dIqCYww6j0f2vwcyifCj3w2yGNIvSJ3RkhZKMCgbrtel3cV2ueRbvmrzY
	f6ELaAP9/QSlEH2q+Gc0j+Fs87Yb2DPNpRpkVCF8uxPEUwVBY7UwrgR2Z3ANcVE1CBa65AmcOik
	dpTPk2EZN+152JPAtMl33GMOUhczJb7BL4Ifd9j/bFaHUv9y85TQ+xGsIglw7Y0Day9POE4T/T8
	yXzj8ApNgR/+FdKKQd4tp+klYtKTvq1lh3RKuU6Rze9AnjjLC+Ywi1DhG1Q23u/LmexpyOFQQfi
	cy5w1LJ7fArCtFA9qLIAbrcQ/xdzqZ1FCsvY=
X-Received: by 2002:a05:620a:4042:b0:93f:571b:c72f with SMTP id af79cd13be357-9494bb97ce7mr1908980885a.20.1794854122063;
        Mon, 16 Nov 2026 10:35:22 -0800 (PST)
Received: from c7-smtp-2026.dev.purestorage.com ([208.88.159.129])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-9494c805f2dsm118548585a.19.2026.11.16.10.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:35:22 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-rjethwani.dev.purestorage.com (dev-rjethwani.dev.purestorage.com [IPv6:2620:125:9025:23::2ea])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 6C70D401CE;
	Mon, 16 Nov 2026 11:35:21 -0700 (MST)
Received: by dev-rjethwani.dev.purestorage.com (Postfix, from userid 1557719937)
	id 656EFDC0D05; Mon, 16 Nov 2026 11:35:21 -0700 (MST)
From: Rishikesh Jethwani <rjethwani@purestorage.com>
To: netdev@vger.kernel.org
Cc: Rishikesh Jethwani <rjethwani@purestorage.com>,
	stable@vger.kernel.org,
	John Fastabend <john.fastabend@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Sabrina Dubroca <sd@queasysnail.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Alice Mikityanska <alice.kernel@fastmail.im>,
	Tariq Toukan <tariqt@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v5 1/2] tls: fix socket use-after-free during device-down
Date: Mon, 16 Nov 2026 11:35:17 -0700
Message-ID: <20261116183519.3314837-1-rjethwani@purestorage.com>
X-Mailer: git-send-email 2.50.1
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

tls_device_down() pins each TLS context, then drops tls_device_lock before
switching ctx->sk's TX validator. The socket destructor can run between
these steps: the context survives, but __sk_destruct() frees the socket.

Switch the validator while selecting contexts from tls_device_list under
tls_device_lock. The destructor uses the same lock for its context put
and list removal, so ctx->sk remains allocated through the switch.

Checking sk_refcnt would miss sockets whose queued SKBs still hold
sk_wmem_alloc and require fallback after sk_refcnt reaches zero.

Requires commit f08d8c1bb97c ("net/tls: Fix race in TLS device down flow"),
which moved the destructor's context put under tls_device_lock. Include
this prerequisite in older backports.

Found by code inspection. An ASan harness running the extracted teardown
functions with userspace shims reproduces the UAF before this fix and
passes afterward. Tested on Mellanox ConnectX-6 Dx (Crypto Enabled).

Fixes: c55dcdd435aa ("net/tls: Fix use-after-free after the TLS device goes down and up")
Cc: stable@vger.kernel.org
Signed-off-by: Rishikesh Jethwani <rjethwani@purestorage.com>
---
 net/tls/tls_device.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/net/tls/tls_device.c b/net/tls/tls_device.c
index 4cdfbb57ecff..866193a506d2 100644
--- a/net/tls/tls_device.c
+++ b/net/tls/tls_device.c
@@ -1345,16 +1345,19 @@ static int tls_device_down(struct net_device *netdev)
 		    !refcount_inc_not_zero(&ctx->refcount))
 			continue;
 
-		list_move(&ctx->list, &list);
-	}
-	spin_unlock_irqrestore(&tls_device_lock, flags);
-
-	list_for_each_entry_safe(ctx, tmp, &list, list)	{
 		/* Stop offloaded TX and switch to the fallback.
 		 * tls_is_skb_tx_device_offloaded will return false.
+		 *
+		 * The context reference pins ctx; tls_device_lock keeps ctx->sk
+		 * allocated until the validator has been switched.
 		 */
 		WRITE_ONCE(ctx->sk->sk_validate_xmit_skb, tls_validate_xmit_skb_sw);
 
+		list_move(&ctx->list, &list);
+	}
+	spin_unlock_irqrestore(&tls_device_lock, flags);
+
+	list_for_each_entry_safe(ctx, tmp, &list, list)	{
 		/* Stop the RX and TX resync.
 		 * tls_dev_resync must not be called after tls_dev_del.
 		 */
-- 
2.50.1

