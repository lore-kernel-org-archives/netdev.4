Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795451523;
	b=CuE4Qvt0Dx+7fYRKlNnvI8lEGVhUm5XXwXvDeAIYqwf/s7pJXe8w1kRe5x0RJg4rcVnT
	 YixSLz793dE+pNhVIl5SXeWl+fJKcT8IGi1/PKR9atCQnfXEc5QaDziBgMf6hXUrDhilL
	 EB3kvtKIYKTd32y491WeB4fIYnzCkiOpbX0f8FvUD0sevaDg/XNkgRX7gCFA7RygE5pAz
	 j3W8qYnCi99Bbm2k7trzUTBlaF75usr45TLyXDvu/ko780SpS4PkQnGj+7PAeQ+TeE/6w
	 Y72kUnf6I/JP17RFz9odXPRxr2zZmHXYAdwI5dl6X8cvDCWp9KH/dIaih4Dn67wBZjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795451523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rrmNHSU3ypTCqoRrLbiif4hQznku7QNW/QdUBxa7ntk=;
	b=5Z2L82GGoY71D+SKFpVD45yjS5DdSF/i6I+GoJiwxqTsDUghDBtua7GeajZEi4NS5cDg
	 xyfpc97FNT37/6f27HszF+n7+2STTmfkF5BjwoqD1HQJcTpZPIP96I85bkDkMBSDXrce5
	 OwRp3eoD9ll0By3oUlMvPmC7JXqGtTgm8de6yM8zh0Bf3P/46g2FGZC8am7i7jaSsuWDT
	 sXEgZ+LDY0hPWBg+60Pi/m7nElVkszcKMkjQ4LlqiD4bRuZY+CCIEP9ZV/y8ezZvWn91g
	 P/Qc+I5AcoOoLoj3AVNqW7rLJS1ERt/1Kr4cAScKC4djZ+nqet9r/5tyaSe3adD+ZtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CpQgYNvD;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9BB606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 16:32:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E9BB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CpQgYNvD
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33fb4680717so9553953eec.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 08:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795451523; x=1796056323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rrmNHSU3ypTCqoRrLbiif4hQznku7QNW/QdUBxa7ntk=;
        b=CpQgYNvDlFm0WiYd39sOK1W0UR0I7V31U8ortklh7qSSwm6F8QJBjE2TEoURaVPaio
         Srr2IE+9Tm0WbczfgbG+NWbjvV2h91gsiKYgbaklbxHOHby5HGHBvez4C8KMrJuSEbXI
         M0VW36eGCJH5M5vt9n0DaQVPCyYGNgKTxr2hdPO+XPO7GPuSmj8XnJ2eBEwIpI2wFnfQ
         T10LTXL0XnaQar7JkJJHwVnpHD61Hd7Joe/guVvRpbjBuxIE7Ebags33MrTLM8qahW0r
         XDFyWIgI+mCm592NsA5FxqrxKidmPHa5kZOFVc6CZu9mex+kyt0n2fk0EUWL7hBNYIhk
         BJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795451523; x=1796056323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rrmNHSU3ypTCqoRrLbiif4hQznku7QNW/QdUBxa7ntk=;
        b=Z8Uq/J/l7wh7rhsmqXslDX+O5LXtB1qVcvm3erMVyXGljNHOPA45XaQ+ORtxv5xvCc
         f9RHzjZUQforMVCe5pSSLSjB61NmOP2VLv8ZLdygW4f9i2aAtcNF+a76rXRTTtCZ2B9j
         NG9mQxoOeqjjMaDY/0mVcAugWk3OwJ7C6X5llK0BD8/nwfczQbhgSTo9wZTlH1D34d0/
         AV2vVtnfZI1mJrXSXCFlKkTU5D9qXi9GzibBU1In0kq+jktr9euKknNOrUva/CIrDIJJ
         oKK9nYSiyM9xAlF1wtGaypxhU7O5oEEbzxDN62wx8CMB1hxjlQZTHDOzpKHkKipSGJXf
         fzeg==
X-Forwarded-Encrypted: i=1; AL+hErE+0mItuRFua3NoPLaH6S8TB2YZH3hWr9q/2H7LLARgNhyuSF/e0I+XupYE7XpbkGPP2/eqptU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/X9GwpSx/MsCHb3xNzp2UeGxCtOiXJsYft0X8v0h/3zWvbJx/W
	CsRGolyMN6pqX8N6NnY+tRUjszmQFhqpN8UiVQAJQV8K4kW3GUxGHMw=
X-Gm-Gg: AZFdTZcPVF8PD0lBtStDfkhZyaxzn49fqUQPKH3QIsbvzrcf2HaU0mywbpyRptDRizO
	OnkqkACg0QBx0MWVg+z7gmfTbCDMPiHpXfibb4Un8lcHbIO/QGJQdIq1a1hkIjmhL0CUtgIIzEF
	+82vUSvP6sAEHAz4Alzo18bBPmKTphYGCOy7ABjGeSRWcL4gdgB7b+yFY19wnczHS2r4OqttHh9
	GUQJXCJNVAlhYSt6hghsFtowTH/BD5V5oMXo27fnJJgkENCoWEi+HvQ46luCcw1Z9kXGxKVx1bY
	8I3f6jAur5ownwVm2ouMI64Mtuu6VvQZl28DeAW+gCxb0NT800UzUvLJb3bSUat9GpUS6yVy22n
	Cc+3HVDqtvsRz5N2JAQFlR1CIopEP9nUx+K+/dCg1lUce7UzWgFLEP34LsIeGSohaKEF7JfItDc
	KTabWll1HvxX4PfmSKP9bfoytcasbSGT7OJxla5BDZab/xfZMAO8C+2HEL7SH3GJQehnGTHBMp8
	Z2k+fSZ91VTT51/yK62HJ7yoUig9CMEgTrhtzNO5Tfze0DrCISzJn/EjykGXSjMioJP+vknN8B6
	X6p23TEVc0gVs3PdFfdQOKSH7Kdv3DMjNSpKRfYRZD1c4yxhPPVvQ7FOcw==
X-Received: by 2002:a05:693c:88c7:10b0:386:b3aa:77f0 with SMTP id 5a478bee46e88-386b3aa7d6emr2891515eec.18.1795451522495;
        Mon, 23 Nov 2026 08:32:02 -0800 (PST)
Received: from localhost.localdomain ([218.212.26.103])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b1965c02sm9727659eec.27.2026.11.23.08.31.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 08:32:02 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: MD Danish Anwar <danishanwar@ti.com>,
	Parvathi Pudi <parvathi@couthit.com>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Roger Quadros <rogerq@kernel.org>,
	Mohan Reddy Putluru <pmohan@couthit.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net: ti: icssm-prueth: Retain port node references until remove
Date: Tue, 24 Nov 2026 00:31:30 +0800
Message-ID: <confirmed-20261105-26-ee6bb3813c44@gmail.com>
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

icssm_prueth_probe() takes a reference to each available port node and
stores the nodes in prueth->eth_node[]. Those references are released
both at the end of a successful probe and in icssm_prueth_remove(), leaving
one excess put per port after unbinding the driver.

Keep the references after a successful probe, since the stored nodes are
used during teardown. The existing remove path and probe error path then
each release the references only when they own them.

Fixes: 511f6c1ae093 ("net: ti: icssm-prueth: Adds ICSSM Ethernet driver")
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
AI assistance was used for analysis and patch preparation.

Based on next-20261104 (8b7179210b22).
Compile-tested: arm64, GCC 14.2.0, W=1, drivers/net/ethernet/ti/icssm/icssm_prueth.o;
baseline and patched objects built with no warnings.
Static source review; no hardware, boot, or KASAN test was performed.

 drivers/net/ethernet/ti/icssm/icssm_prueth.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.c b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
index b42c98e861e081d6c616881786b94e8bcde6b944..4f9529e0e404fd9cfee9e7340f2f048442ab938a 100644
--- a/drivers/net/ethernet/ti/icssm/icssm_prueth.c
+++ b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
@@ -2018,10 +2018,6 @@ static int icssm_prueth_probe(struct platform_device *pdev)
 	dev_info(dev, "TI PRU ethernet driver initialized: %s EMAC mode\n",
 		 (!eth0_node || !eth1_node) ? "single" : "dual");
 
-	if (eth1_node)
-		of_node_put(eth1_node);
-	if (eth0_node)
-		of_node_put(eth0_node);
 	return 0;
 
 netdev_unregister:

base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
