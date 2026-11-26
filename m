Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710751;
	b=z5BwBo79XMuLvABQqiPYrefWBc+T9xEJZrLWFMMmgu8AEERZLNrE+FvqUWvCA1x+knhe
	 EoUZxv3Hxc0eje1jUthM/xAA96PtONMl1ptVS9kBT2NT78aCtIRGNd3ST+Igl8xFFvwbB
	 wRc612KOK9yKSW1cYcIlqkgRy3GY++IvGtPihCOEBTgVGuJCEQq1IXiI0zcxF/IYtJaV4
	 NKqw4D9kDfSV+WCWKP+CHCUS4AxJBhwyA9KpubyeAFMYSi5TxMutMy+WHpd7+DAzv8Toc
	 AN3CqtXUmScrno+Bb0i0Wvv7MMX2fXEI1R//kvd2YLce3MjvdbWMJQJ8OKYiIMqXSUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710751;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=3HwggEmN7QDf+7fOdhcEHzmMMaL4VqP+dHX3wTGkWFk=;
	b=04yVNQ468imGWPj/niojJc/uSK9x/oItrCiK5FegX8GAYwRtR+sgzUXEA8rUYas7rLKE
	 NqtyPLfymoD+WXxk0q5A9BkMgiDgBEiCAz9hO6M4y9Ycwk1JdenvJH5EGqu4l2udFASwk
	 Cp6VaED/8fAWRrl07S4qKsKnpBxoz/tcBWx6rcDGFse30tQxe6mC7potISGk24wmHTzY+
	 jtNgRues6mea+SsrYoocUntvr9meZEpNcerAvXMO4Hhz7QbJN9zjzpWdn7n/0ZlcUA2wl
	 MaM+f4M0mL/RBrwm4QRg8vjJ0CHSmwfx9A7fKRY80Ru6j4ZHYbnx5JXPJpxV9Xywtjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=0F7MEsbU;
	arc=none smtp.remote-ip=195.10.208.55
Received: from mout-b-110.mailbox.org (mout-b-110.mailbox.org [195.10.208.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE4A606A32D
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 16:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FE4A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=0F7MEsbU
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-110.mailbox.org (Postfix) with ESMTPS id 4jb2Bz24SRzNkXR;
	Thu, 26 Nov 2026 17:32:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1795710747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3HwggEmN7QDf+7fOdhcEHzmMMaL4VqP+dHX3wTGkWFk=;
	b=0F7MEsbUYkuFczajKen5tPAi4rDceDwuR8BGTDyzsCpXWvUy/xmQfbwL3ndMgh2bmyB0qa
	Kf8v/NTwM6ZVr+ki90ia38hWWnlsAMIouMsHRLypG+0LYBR8NO+dmx6SBWX6lFaLwnjjbc
	Z7V4YctMJrWKa3eTqdJzgT/Wue1FstLF7Qe76U37W7SlZlBSlYCrAIbeCMqR5pOeoXE4cT
	1NJOxlU0JjH/kDLouPNmgAbRfQ9eT9Hhwt/tUu17wUySEtA8nggYAQtZFecxfqNm6g6Gke
	jRZliKjFEOiZC8rHj+55O9QNH9JmtGYiY2t+sjxhuvDuf9A6aIvVDsC1Q6h91w==
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
Subject: [PATCH net 4/6] net: qualcomm: rmnet: stop TX aggregation after detaching the port
Date: Thu, 26 Nov 2026 17:32:17 +0100
Message-ID: <20261126163219.1744750-5-antonio@mandelbit.com>
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
X-Rspamd-Queue-Id: 4jb2Bz24SRzNkXR

rmnet_unregister_real_device() tears down the aggregation state before
unregistering the rx handler. When the last vnd on a port is deleted,
that vnd is still registered and the egress path still finds the port
through rx_handler_data, so a transmit can start an aggregate and arm
the timer. The port is then freed: the timer fires on freed memory and
the aggregate leaks.

Reproducer:

  ip link add link v0 name rmnet1 type rmnet mux_id 1
  ethtool -C rmnet1 tx-aggr-max-frames 64 tx-aggr-max-bytes 4096 \
          tx-aggr-time-usecs 1000000

then delete rmnet1 while flooding UDP through it from all CPUs.
DEBUG_OBJECTS_TIMERS reports "ODEBUG: free active object type: hrtimer",
KASAN a use-after-free once the timer fires.

Unregister the rx handler first: after its RCU grace period no transmit
can find the port.

Fixes: 64b5d1f8f2d1 ("net: qualcomm: rmnet: add tx packets aggregation")
Signed-off-by: Antonio Quartulli <antonio@mandelbit.com>
---
 drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c b/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
index 61b04c6c0390..2ff4b9519139 100644
--- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
+++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
@@ -40,10 +40,10 @@ static int rmnet_unregister_real_device(struct net_device *real_dev)
 	if (port->nr_rmnet_devs)
 		return -EINVAL;
 
-	rmnet_map_tx_aggregate_exit(port);
-
 	netdev_rx_handler_unregister(real_dev);
 
+	rmnet_map_tx_aggregate_exit(port);
+
 	kfree(port);
 
 	netdev_dbg(real_dev, "Removed from rmnet\n");
-- 
2.56.1

