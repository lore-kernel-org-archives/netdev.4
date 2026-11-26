Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710756;
	b=06LI/HG9VvRyYwZy3IoB0aZEKWBLSrFIQmykT2EuNk9Kex+cPYCZxVfHLT2TLcuvjC24
	 SMo+Mj6VdvTF4sqIxvA0vCk3d5Xaqj0YXaPQZuS2z7P+jBo33Y9haEOMBVuUZYzXYn627
	 VcUoujNwy4/x1l8jaEd7HoUd86bS2fwqqcKGG7/sPKScwTlmCOTCVNaKBKuDdfp0VOKmF
	 4urPUYjtb0VnvJnSmT6puB6BAhns5j6+iJojRdFmTDIsCE+f6l7CkuEPJ+fp6YDjHmrTQ
	 z9vl4qkmqDz/uXBqZeaxi1rIlO3fTsfo2zMHBdxg4M3PEymCQJEjtJYbZTWdMfqBOWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710756;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=9ro/Ul7fqP8W2uHW3wh4lFnKRkOBN+yQMyu7M6Mtqdo=;
	b=gNB27AuCpmBRN7ElvocbKPOM88yXiCMlCwat6lr0HOeAXNwTJAfyGBosIIq+YbtYT/Pm
	 EF9n4NTx8mg5KQTLNGa1zXpwH+lyGpf0DJCSNlG1jGY1Yg8fLCB2yVKXa0JZlmDGMiBnT
	 VCO3cyqO5MymS3KRcku39ITMAOglu6Y/GB9yPntCnkZd9m57Izl3YYEzMCw8itK4KrRdp
	 tt3Bfbg8lFXfG4Y8LGHV3tFx+SNknm6rGoDIb9oDax9bF/WDXhoQmYNjoRoViCc7dbrEq
	 ShQF7Ixs7WZMLULnpQvON1KvYpL3rlFYtK+O8hbIlaIFFXxbnFLpwJXh2kv+8DnQsBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=bVykUGzx;
	arc=none smtp.remote-ip=195.10.208.47
Received: from mout-b-107.mailbox.org (mout-b-107.mailbox.org [195.10.208.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA08606A323
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 16:32:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEA08606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=bVykUGzx
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-107.mailbox.org (Postfix) with ESMTPS id 4jb2By3jk0z3wq1;
	Thu, 26 Nov 2026 17:32:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1795710746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9ro/Ul7fqP8W2uHW3wh4lFnKRkOBN+yQMyu7M6Mtqdo=;
	b=bVykUGzx4aPcytfnW+ya1Rcczk2LNF+3g1D1eUDNpsfdDYxlMMTVtOjrEdXOWQhJCLvaIB
	QYhvUyXHNnfyrO7W1ag35m4eozo4YEVK/09CM67qHelgdrrpVZXpb5rmiYTphScshDWe5L
	nKJPZBppn+OH+ewitjyuwouWwYROUmN66hy+RVe95d/vOxOSPErGROXTYrNgjc0lOWav/e
	h5XO3zgdaI3d3eEuHR8WPGrGmAvJH1SYQ34lQK2PkTrGj8B7CDI1XytOcd+AUsNdhfqvtF
	s8kectkazwAm7I0tt9ZtWLqBJ41wAK3UwwYpyiqiV+TRvJusF01uHveGewJaFA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of antonio@mandelbit.com designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=antonio@mandelbit.com
From: Antonio Quartulli <antonio@mandelbit.com>
To: netdev@vger.kernel.org
Cc: Subash Abhinov Kasiviswanathan <subash.a.kasiviswanathan@oss.qualcomm.com>,
	Sean Tranchetti <sean.tranchetti@oss.qualcomm.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Daniele Palmas <dnlplm@gmail.com>,
	Taehee Yoo <ap420073@gmail.com>,
	koen.vandeputte@citymesh.com,
	Antonio Quartulli <antonio@mandelbit.com>
Subject: [PATCH net 3/6] net: qualcomm: rmnet: fix TX aggregation timeout overflow on 32-bit
Date: Thu, 26 Nov 2026 17:32:16 +0100
Message-ID: <20261126163219.1744750-4-antonio@mandelbit.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126163219.1744750-1-antonio@mandelbit.com>
References: <20261126163219.1744750-1-antonio@mandelbit.com>
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
X-Rspamd-Queue-Id: 4jb2By3jk0z3wq1

On 32-bit, time * NSEC_PER_USEC is computed in 32 bits before being
stored in the u64 time_nsec, so a tx-aggr-time-usecs above 4294967
wraps: 5000000 is stored as 705032704 ns and read back as 705032.

Reproducer:

  ethtool -C rmnet0 tx-aggr-max-frames 64 tx-aggr-time-usecs 5000000
  ethtool -c rmnet0

Do the multiplication in 64 bits.

Fixes: 64b5d1f8f2d1 ("net: qualcomm: rmnet: add tx packets aggregation")
Signed-off-by: Antonio Quartulli <antonio@mandelbit.com>
---
 drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
index fdfc65c7c5e5..b156e864535f 100644
--- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
+++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
@@ -689,7 +689,7 @@ void rmnet_map_update_ul_agg_config(struct rmnet_port *port, u32 size,
 	spin_lock_bh(&port->agg_lock);
 	port->egress_agg_params.bytes = size;
 	WRITE_ONCE(port->egress_agg_params.count, count);
-	port->egress_agg_params.time_nsec = time * NSEC_PER_USEC;
+	port->egress_agg_params.time_nsec = (u64)time * NSEC_PER_USEC;
 	spin_unlock_bh(&port->agg_lock);
 }
 
-- 
2.56.1

