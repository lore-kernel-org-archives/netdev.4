Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795792121;
	b=Yxp7Tx9TijtphIC7AUVMmat545fuNN0LbGbhoXJNFYrZICP9dJLk7VCwkrZE0ipNs/ZD
	 V2/x4NKr1bOBs6oD1xNlWI2fgh+P4YY7yd0/paKGXtJqrG6sgz4Ujs6WyYA7baH9GO/ul
	 CCuTAKzwGvsTMwWIEj1WoGL0PKtNbXa/m5/FIdZrkWgPWJEjKKk53PqZcZGC9WBo0z4Ga
	 gCImFoS6Az/PclbdvTtqoYEatiwg476KKM6aSr7Z5+8SrS69aEClb4TGoYl6JtTY0pcI8
	 7O6VoGIUxWdolLKUq13mktd8ncTMo7Xv1mRaNDmo46CUOaH9f946hTgzpAOWpse+nxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792121;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=wnREu1DivVRBdVLiud6/AG7sCceCRA6xn2hZdTRplvM=;
	b=RGVzEmIxAfhg+zmszoGDrHqupzvE+yxaTzUXjr+BTdqijwbHJM1PRR5uJkdr82NQO68q
	 RMUvd5I+liaxBgB23IHuCzW+9kHCYM57se6Nwwe9Q5A9zfFX2aseAoUCwVwnTiZ2VPtHE
	 +97tvuolkYAhTnX5kXtYmOAnUk8tVUliNYMfeCKrImk+S3hKbnthUfIqZWVHdZlltoGhF
	 cJ1t01usE5S/AWutkpFYZ7qTrqIqhSGaV+ASz6RW5CmqfAi5WKVQZDjsJjKXwUIr118T2
	 jdJac2mHHQYvJm6M7LZJarb9qKVfRxdUEH/ApPL5513+eVdU8F77AOMMHUHvuAQpG/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=OJtiozAo;
	arc=none smtp.remote-ip=195.10.208.50
Received: from mout-b-105.mailbox.org (mout-b-105.mailbox.org [195.10.208.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B34606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 15:08:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31B34606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=OJtiozAo
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-105.mailbox.org (Postfix) with ESMTPS id 4jbcHl1SzVz9sHc;
	Fri, 27 Nov 2026 16:08:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1795792115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wnREu1DivVRBdVLiud6/AG7sCceCRA6xn2hZdTRplvM=;
	b=OJtiozAows720+CpZ+7XAxyfPzQsfE+rMuN5VGSs7BTp1s80AEOqXpS3/WVG74NQG74KyW
	5BxHIXN3Om7X9T8ZrqjDKTODeqTQAcUHP1ktHhDFbUdKI8fk6iT2wCOp4u/JAxpTLnxHDg
	aVnAhAvWisAV6ZfnVc5oBzRLxBshkAP5I2K/nRGa8AnTjLcdV3ck6Gdd0QJH4tRDt3IyfJ
	2Crq60n9BWLkkZB+J9EXB+fuzFqBoQkfHKgC4Q/04BV9jWwA3CzqtefPh58NE1e/lKbW7Q
	MaJG8wsr/kfDVm/hqE9pxustvThYaToLQHYaDlaIKTivlMq1KaVaumsA+MH5xg==
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
	Koen Vandeputte <koen.vandeputte@citymesh.com>,
	=?UTF-8?q?J=C3=A9r=C3=A9my=20Jean?= <Jeremy.Jean@oss.cyber.gouv.fr>,
	Antonio Quartulli <antonio@mandelbit.com>
Subject: [PATCH net-next v2 1/3] net: qualcomm: rmnet: recheck the aggregate after flushing it
Date: Fri, 27 Nov 2026 16:08:25 +0100
Message-ID: <20261127150827.785753-2-antonio@mandelbit.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127150827.785753-1-antonio@mandelbit.com>
References: <20261127150827.785753-1-antonio@mandelbit.com>
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
X-Rspamd-Queue-Id: 4jbcHl1SzVz9sHc

When an skb does not fit in the pending aggregate,
rmnet_map_tx_aggregate() flushes it with agg_lock dropped, then jumps
back past the skbagg_head check. rmnet vnds are lltx and can share a
port, so another CPU may start an aggregate meanwhile: it is then
overwritten and leaked along with the packets chained to it, or
overtaken by a skb sent without aggregation.

Reproducer, with UDP sent through both vnds from several CPUs:

  ip link add v0 mtu 9000 type veth peer name v1 mtu 9000
  ip link set v0 up; ip link set v1 up
  ip link add link v0 name rmnet1 type rmnet mux_id 1
  ip link add link v0 name rmnet2 type rmnet mux_id 2
  ethtool -C rmnet1 tx-aggr-max-frames 64 tx-aggr-max-bytes 4096 \
          tx-aggr-time-usecs 2000

The tx_bytes of rmnet1 and rmnet2 stay above those of v0 after the flush
timeout, and kmemleak reports skbs allocated by skb_copy_expand() in
rmnet_map_tx_aggregate().

Move the label before the skbagg_head check.

Fixes: 64b5d1f8f2d1 ("net: qualcomm: rmnet: add tx packets aggregation")
Signed-off-by: Antonio Quartulli <antonio@mandelbit.com>
---
 drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
index 7ee2bc33433f..048a6a35ea28 100644
--- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
+++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
@@ -597,11 +597,11 @@ unsigned int rmnet_map_tx_aggregate(struct sk_buff *skb, struct rmnet_port *port
 	memcpy(&last, &port->agg_last, sizeof(struct timespec64));
 	ktime_get_real_ts64(&port->agg_last);
 
+new_packet:
 	if (!port->skbagg_head) {
 		/* Check to see if we should agg first. If the traffic is very
 		 * sparse, don't aggregate.
 		 */
-new_packet:
 		diff = timespec64_sub(port->agg_last, last);
 		size = port->egress_agg_params.bytes;
 
-- 
2.56.1

