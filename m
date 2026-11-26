Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.61
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710757;
	b=Ic7MWhz4subR5TYAY2h+8835P+4c0+a6l4AW//fbHkhXgFe+hWvkuC69JRXiHGp1qG0T
	 0NaVwCCL6fLVyDgsahjfhtKJffpc4NQoQtLoUPOWvE5Ni1ffIPqLxheW9VHW2m6PLq3Bo
	 YuG3cGT9Xx/8Nud+INq2uohCtwXqQvPjDZN4Mv27nqBgtQ+tOsfnKxe8cdzIgc2MA5ZD+
	 Onb8n+bW4osfUcB83Htg8Fey3oRu/4cY2WMcI0sHvyUo5xwfD0mLNtlIil/3j/JFUtsZp
	 9BwZwe9Xj/lAMdomG63Z1RHq+OCaYAfxI21IIGFmfTB6IcTvlZfBrC6jlH4GVre6s0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710757;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=lf3c8lGbqr/K5l9flE2IxkmfeNdaCQKFVrpnpEtHLeI=;
	b=rZruMqgbPcvuhnYFlscyZyCZzQMXa36yptLdY9W92vtKnd6fnyi8RDdp+JToyuiH2Tpe
	 uVuX9nxGL6v47qYht27yfz6wokb5f7E26rRAFynr0eV/M7a/B7x6vXd2FXVbo5RbKIpNw
	 2tIbIooCwy2UPnmlOw5mobBVHekpQTW7qP5+4uuY8ZVuzOC1TDbsJUqf84FflkC1BU9dc
	 XnIy7Ar8ASATvCjsosvAwfvDyDbfwrNklwZ89Ta1ximzz9r9DHY+RgQF877EFt98k8ozb
	 NtRpIYaPgwnviUjpbJd2AstfUkbriJ3lFmKHstE2EMgyB/DNmUvosghQq4y17OztzGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=XVAKWa1C;
	arc=none smtp.remote-ip=195.10.208.61
Received: from mout-b-201.mailbox.org (mout-b-201.mailbox.org [195.10.208.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73273606A327
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 16:32:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73273606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=XVAKWa1C
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-201.mailbox.org (Postfix) with ESMTPS id 4jb2C00QZKzLmJ3;
	Thu, 26 Nov 2026 17:32:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1795710748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lf3c8lGbqr/K5l9flE2IxkmfeNdaCQKFVrpnpEtHLeI=;
	b=XVAKWa1C3G5DJrhDDixAnTPqGwnp9P0YTv4LTOomBMAS5G0inkiu/AOk2JhIz8ASnjUpKE
	Q5oqy0x758/z4ohzaX9kYjc5HF+fpL00PyaQQkicnfCjtIqqefCRuJynAKguwZNuoP2jeW
	QIKkhwLoX5FWVqoaqiRRDI/0DWwjXaxj1adtl1Zc6iNsPOWloLB1mlE/BGwIgvbHBXjAU9
	ubrKg1XKJICw18tgu2mkpSBFQj1mcEWvWxm9gO1reN4nBWVl9yzVbZpMwU9PX5ov9aHB0P
	H5kVoTFm+tzwiGNVdJjfl4yr/dJHnqo2MCoT3YZPV7nDn9dLZyUBgdgcoNinMQ==
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
Subject: [PATCH net 5/6] net: qualcomm: rmnet: account linearization failures on the real device
Date: Thu, 26 Nov 2026 17:32:18 +0100
Message-ID: <20261126163219.1744750-6-antonio@mandelbit.com>
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
X-Rspamd-Queue-Id: 4jb2C00QZKzLmJ3

When the real device lacks NETIF_F_FRAGLIST and linearizing an
aggregate fails, rmnet_send_skb() counts the drop on port->rmnet_dev.
That is the vnd created last on the port, never updated when it is
deleted, so it may point to a freed net_device.

The aggregate head is sized for tx-aggr-max-bytes, so linearizing only
allocates when that limit grows while an aggregate is pending.
Reproducer:

  ip link add v0 mtu 16000 type veth peer name v1 mtu 16000
  ethtool -K v0 tx-scatter-gather-fraglist off
  ip link add link v0 name rmnet1 type rmnet mux_id 1
  ip link add link v0 name rmnet2 type rmnet mux_id 2
  ethtool -C rmnet1 tx-aggr-max-frames 64 tx-aggr-time-usecs 2000
  ip link del rmnet2

then flood UDP through rmnet1 with failslab on the senders (task-filter,
probability 10) while switching tx-aggr-max-bytes between 512 and
12288. KASAN reports a use-after-free in rmnet_send_skb().

Count the drop on the real device, where it happens: the aggregate may
hold packets from any vnd.

Fixes: 64b5d1f8f2d1 ("net: qualcomm: rmnet: add tx packets aggregation")
Signed-off-by: Antonio Quartulli <antonio@mandelbit.com>
---
 drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
index b156e864535f..3de093198474 100644
--- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
+++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
@@ -543,10 +543,7 @@ static void rmnet_send_skb(struct rmnet_port *port, struct sk_buff *skb)
 {
 	if (skb_needs_linearize(skb, port->dev->features)) {
 		if (unlikely(__skb_linearize(skb))) {
-			struct rmnet_priv *priv;
-
-			priv = netdev_priv(port->rmnet_dev);
-			this_cpu_inc(priv->pcpu_stats->stats.tx_drops);
+			dev_core_stats_tx_dropped_inc(port->dev);
 			dev_kfree_skb_any(skb);
 			return;
 		}
-- 
2.56.1

