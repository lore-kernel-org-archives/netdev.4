Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.40
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710750;
	b=5L74KsBGmiwJjGtQ8z0bGr1xAlOrZbkHdV9ErYr3Nf75Ue3MyBM9i73M3hxHwtaRAX3B
	 FSvgkaoiobzlYFN6KXHP/d+VSjOH0w9WpDAQZuSs0oS4JYrF4rSfMA9BxPZ5C6u3T6zFW
	 WswrhXQPh3hBdBaqWs70/34Dv2ef00x5FHl4Tgb8pEi0QiGBA9NNpeR+VED6aP3EMxnbu
	 Yqz0ezGelfxjVUtGNpp2EhlO4KuOIYzz08q3lINl7weFKq5kmO2UtpPhJHniUUdtA6D1/
	 qWk0L6W/DZ2OIbKtif8ESC9l87Bze/OLahkhksXL7V5THWz0Zqalb6j5V5dsmN10SMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710750;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=et1ZT7h51+8tWjs/YhcQm47JpYp2mp8eeYsMlD1FRhA=;
	b=bxDsXSBtHgXgu2xv+tmiCnThsESKXubARljMyGl36V1poeURtWmgpZjkLPilFf+iUpXb
	 tCi6B/1tRhmKKQgThN1Sa7IUPTLHkVMg57RoSRRhAtAH2nmG+VuVVofvT7K/U9IHKu6uD
	 LnctdH2L3kXdVJebR6pCIUfKOGyS5mrEY+hmEPTeRwLKq/LnZzj1o3P59U+Y1ncEYPLVE
	 E/Ga7P9lhLcJZeSw3hLK6OzE5YF/NbPxpvL5+nsCmT8zKlcKvEHaQ6LaDhXXGKXXZlCh2
	 ir0MUBS4A0PvttpPsZ8Vbfx5v64q/RrhqqPxGfN5klfK/8pfIO2eZxWWqc1D9b1CcZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=YKargoDC;
	arc=none smtp.remote-ip=195.10.208.40
Received: from mout-b-210.mailbox.org (mout-b-210.mailbox.org [195.10.208.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4E0606A31E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 16:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF4E0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=YKargoDC
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-210.mailbox.org (Postfix) with ESMTPS id 4jb2Bw6vhnzFq8X;
	Thu, 26 Nov 2026 17:32:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1795710745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=et1ZT7h51+8tWjs/YhcQm47JpYp2mp8eeYsMlD1FRhA=;
	b=YKargoDC7XaLAcia5rtTt9qm61qUag6muuU7j4d5tW8leZ7k1NSpuI1l1uSreDUf8Au+p+
	5Aa8XHx66ZoxIMRY9Ts6YBMcKdPqjulCvUY4cfvkVcatOycg3ZmXTQjm79nDXDOyOtGvhS
	Y1o9fMEg6AJ2pA4Tac+3NUuXXXZdg0C+Q90hJX1ZnEAa/AqrOayDcZyvUFu35PTC3+aX1S
	zcE4uj7OyjTfJlLhtqG/vHmGmWc6rhBDtq1iOwv2akIYYzHm3OvC/+lBCoQuQpYqd9h+Wd
	UGWaznnjKKR5KzAlxZKpXZaEz4P7PnCccNA02WG3djzftOxlHet1LU+IvXO5yw==
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
Subject: [PATCH net 1/6] net: qualcomm: rmnet: recheck the aggregate after flushing it
Date: Thu, 26 Nov 2026 17:32:14 +0100
Message-ID: <20261126163219.1744750-2-antonio@mandelbit.com>
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
X-Rspamd-Queue-Id: 4jb2Bw6vhnzFq8X

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

The tx_bytes of rmnet1 and rmnet2 soon exceed those of v0, and kmemleak
reports skbs allocated by skb_copy_expand() in rmnet_map_tx_aggregate().

Move the label before the skbagg_head check.

Fixes: 64b5d1f8f2d1 ("net: qualcomm: rmnet: add tx packets aggregation")
Signed-off-by: Antonio Quartulli <antonio@mandelbit.com>
---
 drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
index 39d6d084e73f..73b04fe386df 100644
--- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
+++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
@@ -600,11 +600,11 @@ unsigned int rmnet_map_tx_aggregate(struct sk_buff *skb, struct rmnet_port *port
 	memcpy(&last, &port->agg_last, sizeof(struct timespec64));
 	ktime_get_real_ts64(&port->agg_last);
 
+new_packet:
 	if (!port->skbagg_head) {
 		/* Check to see if we should agg first. If the traffic is very
 		 * sparse, don't aggregate.
 		 */
-new_packet:
 		diff = timespec64_sub(port->agg_last, last);
 		size = port->egress_agg_params.bytes - skb->len;
 
-- 
2.56.1

