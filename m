Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706316;
	b=Sjg56wlZGHjMBSzSFmWWAeIhb0jGCN2eQ0w+OWYQXVIssLio/vlBBF7ebuGKFwpD2ts9
	 4G9pcV9t5+rYlBOPN3fXh73oJt/gbOxaRAnUtGk5VYIQoLEwT0imD0OB0boQMbhgJERCl
	 6ZRt9oT2Pgxp7eGp/mAmn7yf2yoegS1MPHPXPvRFnqW6MZJBFl+Wv55I9oLcygrLCGZFF
	 3mZ8ihoo9NJBmzrHHTlJNOf+kDn4WZucvbMf70cVriyBBjNe/3GfH+D3G46LRPKVxoDPl
	 O2wkc0EVqu/Tlmb9RE6Qp6lnPaju8hruTCEJSpdzPKRcNjH6z0AT2cbseyDIRfCfeiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DalhXJZ4Dxp8fWlsgTk3bfkxerv0MWp11t3M4EhVLVM=;
	b=IiVKgLucRsRslYnr2JjWe/MUOXZn/2dU8f2f0vecn6L9Qf/k9beToT8pGzQ5a8I9YAS4
	 tdW2jgZqe7Ur3C+Wat28kmVwbYEbcReMEkLjPa+bXgmYz5H/zhCwN3HPoxTIf+oOSvbqy
	 etgdZ5KvzBnqN3qa07GVPoDhBmGN9Ue9xhMDdjyKWWemgpqRe/20gYrFHtJBIq1nQKbGm
	 pJNySk8la9tXlB3ngZu9JxCVax/bJkLbANb8IRJ+Z1eqrhnH48w6QaCT4H8Ov9iZ0XYif
	 WACA9orU0Ed7RuwECPtukS5GRJ0dMXxmSg6NaNJGDY7BPj9L/5Xc308EqYycYPJRk6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W8dySMyx;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B129A606A31E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 15:18:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B129A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W8dySMyx
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-49465892f7bso5213261f8f.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 07:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795706314; x=1796311114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DalhXJZ4Dxp8fWlsgTk3bfkxerv0MWp11t3M4EhVLVM=;
        b=W8dySMyxfZvkmp5v1bPX9uN/iuazUmw8hAv//3JvcfSqLm6OZfhVeeCzGuD8mk8KB7
         nsRRbuxPXfkFEeg4rpVxygbYFOfCFdTwm00vTyU4m4L3hkYx2chOy1yKaMoK0QyzU2Wg
         JrqEEm8Y7YPATd5HPl/qYehpmyoKktJBCYvmX67gBTTlUAWiSM9tpLDopKIq133Z4zs2
         vc+yWpWy4L0mBRoGWakiHwceMGTdHQlhMMDWfyPlF1iplfHX9tKxpj9+8YJAJLLrPxZv
         3j03KpfGYJscFbeClUsIDWwIDlCWh6Y4m9vtoCkyzy7nUS9w/W9mxgk1JbHm8lO1M/Sz
         44DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706314; x=1796311114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DalhXJZ4Dxp8fWlsgTk3bfkxerv0MWp11t3M4EhVLVM=;
        b=pRfwNsir/lg2gKqbBTwSXUan8MC9qEKY7J4f7i7upShZAZoZPKX3FFVNy1vv5TeV9W
         FHgzqYaNmBj8WadPAv6BHdkuZIwgdi/M3YXuSNgRcBtv5H+5Anj7FkpdJiHKX6OU1hIX
         uNziDjoQ6bSTs5bAS7TV5bBwiFgKoU7axKLDFxFQrTplq/YM00NmAw2l6sXkghXfAsCk
         aJNkSktI3B8vGZ80j+X2i1I5zLWpCkVnRaugNpBLKOCFpskJj1Uvlfbee6mmW5hU0rUM
         Po8c70t/9A1X/wZcQXo7owxX6H804BAvkugvSuZxttEpBEjbJxY4YYmZUhu+u2gd0Hfq
         gK8Q==
X-Forwarded-Encrypted: i=1; AL+hErFYQLTl4yJz+8j/Az19XaJVt3orwRz2iKaG/bkE2nX5Y+XSov8PeupVPssS3LHvxhGLisNW2Rk=@vger.kernel.org
X-Gm-Message-State: APuU4Z80zX0FR7PZ+BOSs+jp/swLzQjtp0D44T42x8wSB5IAYxvinG7g
	nnWkrIZhTo2faB4Vtfx2iQoKnFbnUCrhezGx1f+hxu+/DRnuCy++maVy
X-Gm-Gg: AZFdTZdOB/uiEBEP49e02AxDdPNY0ICuMNG7Z0+NmgCVmp7AR54WV1usYADnR40FcUr
	rmsJEn5SlLxgzKw9iXjNZ5ARTGdHaWMno797Vm0/FU529E4x0t6ucnI4c37jH69AaAPAzC53LIR
	7X3gWwhvL+5tTG6vHJszRNbV9+GOj6K9/wCXQOFbqonDioKg1/zfaC9HBJwE1Gbe164W0lX2T3L
	vNXej78YFKcqy45+EydoH0l9RlSAEmw/dJ+z12sAQknWEOLSJbdm9cVq7WUDyylWY8KnhjaWW5e
	KcWyeS8LMhz1dR2z0PLZ/XHFGkuxy6lgjOddHnQpo3xHh/zgNoTeGrO7yIzZPfz7lMCu4iwiOl8
	z7/DngHab6s7imN+K41SoO6SQ5/zc0JJ/ug/EGiRm6SFhMNR4E4IE87ly4xtgqYoFG/TNrQ40PH
	+lWKbga+QNfvAns0fsCXouc+nhquHN7jkRWvqcL7ErwuQlWlVNbM0ksl8mgDd/jHlXF4uJ3Y9Ff
	ReaEGwlCKNA5erH3+f/1pJ4WEvc7ktICzC6dHbPvAe4WzpRvNn3WvwYG7/wX07RrGKXvbgKn2X5
	hLf/AHfbhzXoNxtVqiarx/le75p2OMGkzBJpyo4VfFbnjpvTxYcireWBJB5/+If5T/9KN3P1s5c
	=
X-Received: by 2002:a05:6000:4013:b0:4a7:d4c9:ea03 with SMTP id ffacd0b85a97d-4abaac57bb5mr39854826f8f.6.1795706313901;
        Thu, 26 Nov 2026 07:18:33 -0800 (PST)
Received: from pierpaolo-N552VW.station ([2.38.140.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b8e564e39asm10391151f8f.57.2026.11.26.07.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:18:33 -0800 (PST)
From: Pierpaolo Iannelli <pierpaoloiannelli18@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	netdev@vger.kernel.org,
	Pierpaolo Iannelli <pierpaoloiannelli18@gmail.com>
Subject: [PATCH net] net: dpaa2-eth: recycle the UMEM frame on XDP_PASS in zero-copy
Date: Thu, 26 Nov 2026 16:18:16 +0100
Message-Id: <20261126151816.173729-1-pierpaoloiannelli18@gmail.com>
X-Mailer: git-send-email 2.34.1
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

dpaa2_xsk_rx() copies the frame into an skb and hands it to the networking
stack, but never returns the UMEM frame to the hardware buffer pool. The
frame is neither redirected nor recycled, and ch->buf_count is left
untouched, so dpaa2_eth_refill_pool() never runs: after
DPAA2_ETH_NUM_BUFS (1280) XDP_PASS packets per channel the pool is empty
and the queue stops receiving.

The non-zero-copy path does the same copy through dpaa2_eth_copybreak()
and calls dpaa2_eth_recycle_buf() after dpaa2_eth_receive_skb(); the
error path of dpaa2_xsk_rx() recycles the buffer as well. Do the same on
the XDP_PASS success path.

Not tested on DPAA2 hardware: the defect was found by reading the code
and reproduced with a userspace harness that extracts the real function
from the tree, compiles it against mocks and simulates the pool
accounting.

Fixes: beb1930f966d ("dpaa2-eth: recycle the RX buffer only after all processing done")
Cc: stable@vger.kernel.org # 6.1+
Signed-off-by: Pierpaolo Iannelli <pierpaoloiannelli18@gmail.com>
---
If a hardware test is required, I do not have a DPAA2 board and would need
help from someone who does.

 drivers/net/ethernet/freescale/dpaa2/dpaa2-xsk.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/freescale/dpaa2/dpaa2-xsk.c b/drivers/net/ethernet/freescale/dpaa2/dpaa2-xsk.c
index 4b0ae7d9a..ce9094cca 100644
--- a/drivers/net/ethernet/freescale/dpaa2/dpaa2-xsk.c
+++ b/drivers/net/ethernet/freescale/dpaa2/dpaa2-xsk.c
@@ -142,6 +142,9 @@ static void dpaa2_xsk_rx(struct dpaa2_eth_priv *priv,
 	/* Send the skb to the Linux networking stack */
 	dpaa2_eth_receive_skb(priv, ch, fd, vaddr, fq, percpu_stats, skb);
 
+	/* The packet was copied into the skb, return the frame to the pool. */
+	dpaa2_eth_recycle_buf(priv, ch, addr);
+
 	return;
 
 err_alloc_skb:
-- 
2.34.1

