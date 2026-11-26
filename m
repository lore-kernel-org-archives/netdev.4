Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710755;
	b=KjgG8cAIlw9cgvbuFc7r/l8Fa7PytLPnl4LGbfXpLXo4rZIIlkuSSCRsAysF4MFSZiG2
	 o1dhRdVOD4v8PsNFvRKcYBY/JNoskt2Zuo3vLqRYUiR1+UcsIE5mDh6fRb6MY3GfOF3h2
	 yu2AMlBjWQyF1Gj3oyMErN0z38JhlE7jwu5fz8ocikxnCMqHdlsDX9SyRzwcOCkTib1BQ
	 zsnlB/sHzJwp75b/rM15ZhyByVL9gXVXEr5JCto3BGqeoDQ5laI5+bKrzzIzQrdCmf9AQ
	 NiDqQO6BLSnh/4ahis7c8+e5VtuhPbYzBELNJ4cSEXTxvtjsjNzF1MlQANjHem5/DqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710755;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=NAFuRlfHzyLod0BAEG+HKMSQVYdL8WhP8DUW/14PJNU=;
	b=SV91CFhlLAvelGSxg3n7EFjmUJ0AvnjwGjUAkgDZnmZFkZxh3cnDqMLLzZSl3oe1LRm7
	 7o+lC3HwBSG70E7TgwulYRvjctYSJHX3J/xB8z2mHk2Gs5TIKYN0A4sFvtmIEDESClTpI
	 AHeYX/C9gZSy7bo7azkBtIyWxoMfngVw5OHEBXBf1oi2ruacOlB85nmJlrY3svvkj1deG
	 y6Wwx7h7KwgcryCmyD+WWBtjOIQuPut4p/mi+OpBvoAwuA1VfyBVy5BiHF4W1LuEpKKrV
	 upSbhVdJmibIMH9oukLUPQfXL9BZuf96gTCWK9K5F9BzRTXsVfTOiZYLV3SJkjY11ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b="eq/SZq0q";
	arc=none smtp.remote-ip=195.10.208.50
Received: from mout-b-105.mailbox.org (mout-b-105.mailbox.org [195.10.208.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0411606A31E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 16:32:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0411606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=eq/SZq0q
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-105.mailbox.org (Postfix) with ESMTPS id 4jb2Bx5NwVz9tNL;
	Thu, 26 Nov 2026 17:32:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1795710745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NAFuRlfHzyLod0BAEG+HKMSQVYdL8WhP8DUW/14PJNU=;
	b=eq/SZq0qm8qDN6cymvL5x0aTkWvELQUrTvbWbEhAD5+XqI2rGOWc70PQEEk08BBVWTOEJu
	bsAWbbP6CoCcGpjUFx0auD5UtR+68gleOOKQiQDeEAfzgZXDdC9+rkNMSpyWaylUayx5ap
	xMZEWFMEYq2vj4NiDMEI2+g3u8K5JRgFxrA+U64gHP4in9Gx6xcV8OipUaRuCfJQkODn5W
	fXBV2X2IwLyzbhVX+ndMrcpMP9n0+VXrdXYceFLkBJwJLTGpbhnyEgmQedMUHe+aRbt38l
	QuQz+JCQHjn0QANCKvxuI0cJsebeTkM0Ip+EtE3k3EDXy5YiDwjjeZmhhXEnXQ==
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
Subject: [PATCH net 2/6] net: qualcomm: rmnet: always arm the flush timer for a new aggregate
Date: Thu, 26 Nov 2026 17:32:15 +0100
Message-ID: <20261126163219.1744750-3-antonio@mandelbit.com>
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
X-Rspamd-Queue-Id: 4jb2Bx5NwVz9tNL

On flush, rmnet_map_tx_aggregate() resets agg_state and drops agg_lock
before cancelling the flush timer. A CPU starting a new aggregate in
that window finds the old timer active, so it neither arms it nor sets
agg_state. Once the old timer is cancelled, the new aggregate waits for
the next packet, and rmnet_map_tx_aggregate_exit() leaks it because
agg_state is not -EINPROGRESS.

To make reproducing this bug easier, a udelay(2000) was added
after agg_lock is dropped in the flush paths. Then, with two vnds on one
port, tx-aggr-max-frames 2 and tx-aggr-time-usecs 100000, one CPU sends
3 packets on the first vnd (bypass, new aggregate, flush) and another
sends 1 packet on the second vnd 0.5 ms later: that packet stays queued
past the timeout.

Cancel the timer under agg_lock, so a timer armed for a newer aggregate
cannot be cancelled, and arm it whenever agg_state is not -EINPROGRESS;
hrtimer_start() copes with a timer that is still enqueued or running.
If the cancel races with a running callback, the flush work it queued
finds either no aggregate or the new one, which it flushes early.

Fixes: 64b5d1f8f2d1 ("net: qualcomm: rmnet: add tx packets aggregation")
Signed-off-by: Antonio Quartulli <antonio@mandelbit.com>
---
 drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
index 73b04fe386df..fdfc65c7c5e5 100644
--- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
+++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
@@ -635,8 +635,8 @@ unsigned int rmnet_map_tx_aggregate(struct sk_buff *skb, struct rmnet_port *port
 	if (skb->len > size) {
 		agg_skb = port->skbagg_head;
 		reset_aggr_params(port);
+		hrtimer_try_to_cancel(&port->hrtimer);
 		spin_unlock_bh(&port->agg_lock);
-		hrtimer_cancel(&port->hrtimer);
 		rmnet_send_skb(port, agg_skb);
 		spin_lock_bh(&port->agg_lock);
 		goto new_packet;
@@ -658,14 +658,14 @@ unsigned int rmnet_map_tx_aggregate(struct sk_buff *skb, struct rmnet_port *port
 	    port->skbagg_head->len == port->egress_agg_params.bytes) {
 		agg_skb = port->skbagg_head;
 		reset_aggr_params(port);
+		hrtimer_try_to_cancel(&port->hrtimer);
 		spin_unlock_bh(&port->agg_lock);
-		hrtimer_cancel(&port->hrtimer);
 		rmnet_send_skb(port, agg_skb);
 		return len;
 	}
 
 schedule:
-	if (!hrtimer_active(&port->hrtimer) && port->agg_state != -EINPROGRESS) {
+	if (port->agg_state != -EINPROGRESS) {
 		port->agg_state = -EINPROGRESS;
 		hrtimer_start(&port->hrtimer,
 			      ns_to_ktime(port->egress_agg_params.time_nsec),
-- 
2.56.1

