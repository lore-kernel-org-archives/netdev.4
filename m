Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795792121;
	b=d5x60qxIkvqHa/km6kxXICMusOwWZv2FOncKtOVagR/UtYMnirV9sDb8E5W7NUqv61QU
	 ArTp44NRYDtb5UuE8NcpbEWr269+UXxaCfCC5s/Qr/HS3lPfEG1O0zGRN1hLw4OunQUzX
	 lnYNcfz0GOO3mody18rA1VnXf08nwNgQX8l/o7O/mFuRV9nV+RD5/S77eLbl8xn1vozKy
	 +0rtTwkxy2KTv0WiXftVXes3+7DMl3ZmKDlPtQDrcVNRmyxJNeHRHlRZmkrTvBDfmRIMw
	 fryU9zV/W+PsbJy+g9hinbgUKpUkF5RWeXktrqfvepOKMCR/KATghQxwyG/LtR81TQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792121;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=enPySNe5GSl2u0p6rdbWkpR0/mB2HQYhBPK8OEa0+Fc=;
	b=lkUhWfQ+8Z6ESgoKLcnV43O4iK7QuRqDCXW2Pc8bpJUKVJMB3TxE+6uTVfQk/X2GFP6j
	 2BCFQzMXONj4jzIr2gDPMEMDq1nDnHgcu0LQ0f9Rdgs8wvq9u9ipNnuU5+A9V4z9r4s6+
	 2uNIREQ07LLI9YaAUMTZjSzkFl/HFV38rQOdIzCeBsK0EtcQrMs7TPqDFLLzoPG1ID7Dh
	 yuBpUaYOzmQ7qCIgR93hwPks6MryB8wla+ZjpCH6X68NlsuPz40bgVKNgHSnIqDCa5kVU
	 ubEUNyaFTIbBfxKQI0ZGc/D8v0kq1hzp0iYEb3/eZieGALudpBRN2RioQwINZvRDg1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=D30zGbRK;
	arc=none smtp.remote-ip=195.10.208.55
Received: from mout-b-110.mailbox.org (mout-b-110.mailbox.org [195.10.208.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5364606A321
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 15:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5364606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=D30zGbRK
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-110.mailbox.org (Postfix) with ESMTPS id 4jbcHn2XN7zNlbt;
	Fri, 27 Nov 2026 16:08:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1795792117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=enPySNe5GSl2u0p6rdbWkpR0/mB2HQYhBPK8OEa0+Fc=;
	b=D30zGbRKDH7EpnFHpHp340K6HavevmJAtMKErgH9P+Mf6kiMvHqtkXVTYiiiIqQpUxGpza
	YbCOC6SlauZ/JJg5jk5+ehIaDr6mOD895Ukagf+GHsgRBo9ruq71RhGG+vg3Ej4qNNrtH1
	sdISQtVmha8I45Sz1k7oa9p3RdFATGPSqZGk6nwi5jSg/Noc+Re7EmdxpEIfPgZ3bFTBQp
	u753aE0nt0M7uSrpWL/O4uOOWTUe0q/nwBa0vSycxoFWY/x7IX6QzJ00YDxVBB4uzd4GSv
	n/OtbKwiO6Jh8fB0te/GqaVy4EK2c7TjHK2w2o/QkujqffNwM+PImx9ep7eqyg==
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
Subject: [PATCH net-next v2 2/3] net: qualcomm: rmnet: always arm the flush timer for a new aggregate
Date: Fri, 27 Nov 2026 16:08:26 +0100
Message-ID: <20261127150827.785753-3-antonio@mandelbit.com>
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
X-Rspamd-Queue-Id: 4jbcHn2XN7zNlbt

On flush, rmnet_map_tx_aggregate() resets agg_state and drops agg_lock
before cancelling the flush timer. A CPU starting a new aggregate in
that window finds the old timer active, so it neither arms it nor sets
agg_state. Once the old timer is cancelled, the new aggregate waits for
the next packet; if the port is torn down first,
rmnet_map_tx_aggregate_exit() leaks it because agg_state is not
-EINPROGRESS.

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
index 048a6a35ea28..033699aa0385 100644
--- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
+++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
@@ -632,8 +632,8 @@ unsigned int rmnet_map_tx_aggregate(struct sk_buff *skb, struct rmnet_port *port
 	    skb->len > port->egress_agg_params.bytes - port->skbagg_head->len) {
 		agg_skb = port->skbagg_head;
 		reset_aggr_params(port);
+		hrtimer_try_to_cancel(&port->hrtimer);
 		spin_unlock_bh(&port->agg_lock);
-		hrtimer_cancel(&port->hrtimer);
 		rmnet_send_skb(port, agg_skb);
 		spin_lock_bh(&port->agg_lock);
 		goto new_packet;
@@ -655,14 +655,14 @@ unsigned int rmnet_map_tx_aggregate(struct sk_buff *skb, struct rmnet_port *port
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

