Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794693844;
	b=wG6exkTcylybbmFt6oofangJdOCoBjVJt3tVVazDojs4UtOYTS22WS7sgdDmaEE5XAyW
	 MVt4e4xGMChaBVjwPDNqt8qj2Jb1zpTMjDlTskDJ4eeTqemGYFkvuYB0OVKMl3uMZnYCZ
	 FduyeyMiD4jc/hSTgyBcRD6NzkUq18gAifSkxWPajDlKga7c3Tmxz1ob6pXmm9DcK3ROh
	 LYDlvQRySg1MYC4xmwS3cjqOfYFrpJ+N2gY0pqjjIGjA6+obJWQ2otosLZIiQooxWMlku
	 Uvye6w51mqUV+l0OOuxpL53TRI+LRS/+5QeSzoAe3nqhUOk0U9Xi0NW31QiEQxHhJSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794693844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=vh5zy+jAqMHm/c0Wtk9LMwZdvGBT6DeyQEytCGNCC3Y=;
	b=XCPw0/M19Vf4qp3oOwCFQ9PdrLUDR4Hkq4DdwritlQfv+xB+dFD1I0427rYHtt/9wW/8
	 5Dqle6OJGuPE4+YEn0WLBRzI1z7OcEqiY/isLXN/IIbx5dX70KhAZwIFjc+ADtN3LWpgZ
	 8JUV5t1HaCshnVHF6HtgdUzWG8BXzhsToBBSBfPPI0AkTw2/L9R63PQGzeTu2FkQwbsM1
	 l3rsibiT2tzQiyUUaBG4G4h40/XVQxHdAJBJeJzqE/J1+ZCt9rU6iYNr3druX+XA1icaQ
	 m/LuSSgxHIV5crGZtl061V5YYN0lM36m0iNpe7/xRdVoFsd7D6q4+0AWiu63ItJRFeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=hStfYJU3;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97743606A32D
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 22:04:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97743606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=hStfYJU3
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4cdc606b47so412353066b.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 14:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794693841; x=1795298641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vh5zy+jAqMHm/c0Wtk9LMwZdvGBT6DeyQEytCGNCC3Y=;
        b=hStfYJU3y7r+9Yp9LBu18f5vh08zZEsVnRNn67+kGftdxVojSk7EtgSPs9zUtV4TOo
         dzhs5VIIHB8+sPKLVM20OeuAg/mVLj0yKd0n4eib/kYQaZDb25P05NJJGyNHTZtMThsl
         +XwQ/ps6BLQFWtexS9TZ2FvmxUEEwkvcA6X7L0kpwND+pAxiiMtXGnnyOfuHnhALdY3u
         OH5b/nvatdrlyrCQ5RD6qaFg/wl+5YdMMKTbED28+HMFqarDogbWg6gsl1vjo0QiX9dA
         3S6qvzL/ejK1BEVZJKqhbo4ijx1cLDvnXZUjq6tnhnBJRd/MaD+v6AYzGPgzbsvi7tMf
         179A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794693841; x=1795298641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vh5zy+jAqMHm/c0Wtk9LMwZdvGBT6DeyQEytCGNCC3Y=;
        b=ISsiZi0wUpcfUJihIaHDheW2+cbV0FEn5eQf4Hq6WRBbvMNNLkCMoIpj6Ew9v4Z93O
         29HENvKzpLSk1iQ2YtrAP5f+nGDeQhujORFgWltEWjzLpE2VlVygt8DpJXJuJ9Nb5aAH
         Mwk2bDLfEwdrBuT6xLmRZBHMpp8exqX1x3Va5wdXAG7His7EWisdTaYX05uYNlpaoujg
         /EiJLMXfcfgkPbwNhxRNEtk5Yh3G1NTr6AgBdUX3cUF+CeKYFPRX/q2Upeo5l1/eSeaL
         +cJ5gtoId/8M00uX4tR8DF/5PtHVJwSKKfp7S1QNIcUJH8mfGt2CY45kTv9FrnQYXQYC
         iFuA==
X-Gm-Message-State: APuU4Z9s/SD0RHxKxDUgcfqx9hFgSlj+3/rUjIL7KCAsoqyPlt8uFnKf
	CGY6alCdfc0akXtNe1pC+6vwrEkT4iPVRe2bw/xTAeRKbgA2tFnGr/kHAECxKBe5aIrhT2NZh7+
	KVKKOEoyl
X-Gm-Gg: AYBFou3hOjvTiy3oJ/Q/zKKGf6+1T+gM/Xn4QuqSwm0v7wjNOHfKXAdd78yPUMz3mpD
	IH2iZGaXdbYQDWSMEYjCq1kwsF6kt7aSo1GLmFg3kx1+ivEEctKLdRZ8kwZt2xFKCvrJW5lY69t
	R6iEUsdrcaPHS1HN5RlvBXEh81w62BnlHoqxY8XFhW7qK2FsAMiU8PCyC7s0mthIJHEZjoYuyS8
	G+nuuMwbqj61lOwozF7GoS0QAjQ6CqKHfdNXSTuvzE33Ph/u71soPKmUZ/pJQ5gIYSkhgApgfAp
	sQxhBcllF72nCO2WSnNitKL3zQnkoBty1aiVjKjUHGRrBP/ZDTmCTBqRzdBjzaL6GwC259npKbC
	yB5ToVqRxx0PwiWuwcEKhoO6sW8Dn/aajMjsAKA2v5EC2+KLAgQCY5y4mXlXKyQdDrLYh/Jc7Ga
	NCLOlkSCC/UnblbKbbQGJ7YesLNrctjKNBEnd/Ye9D/Ht12Q9b0rrv/+oHGjuwo6jfcS//3jXjk
	DUNlH9HCotZUlg2e2yp0+W+S1mmCe/C6uVZP7I9wLnz0THuw//dZUMXtICu40G4s43WB17iQxmG
	BqWjHPY1vR4YBl0+nwQyrhd/0WCknYZA/wjDrennRh4gCng0rNACoKIFgZFqnsC9Olm4kB7uxkb
	7zGlZ1rsUoitpI2R4Cy5virpTSSajJMP6xAzQK96jj1KwmWWulHjhk/ZNcp/QbMWfOrQuMPEN6y
	JDu7f70S0DzZprWw1Ng02zuJgVgVf+EZSEj47O5D2ZxQM3lY0s1MTlkoGEPrT1+YFAas4fLX9tA
	jQjBg0WIcwARq3m0frZSrKlERQwe8rdTAS8iJgn78mfEX5N8a8yAaZy+5UkQbIZSaiH0/UA6356
	W2U=
X-Received: by 2002:a17:907:6e87:b0:c41:1750:59a2 with SMTP id a640c23a62f3a-c50963778efmr537828166b.12.1794693841497;
        Sat, 14 Nov 2026 14:04:01 -0800 (PST)
Received: from Desktop.fritz.box ([185.181.130.189])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b236edsm255946566b.23.2026.11.14.14.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:04:00 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netdev@vger.kernel.org,
	linux-hyperv@vger.kernel.org
Cc: haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	ernis@linux.microsoft.com,
	stephen@networkplumber.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] hv_netvsc: fall back to one queue when a sub channel fails to open
Date: Sat, 14 Nov 2026 23:03:58 +0100
Message-ID: <20261114220358.5429-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
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

netvsc_sc_open() counts a sub channel in open_chn even when vmbus_open()
fails, for example when the order-8 ring buffer allocation fails in a
guest with fragmented memory. The channel stays in chan_table with no
ring buffer and a disabled NAPI, and rndis_set_subchannel() goes on as if
it had opened.

The next netvsc_detach() or netvsc_close() then hangs in
netvsc_wait_until_empty(), with RTNL held: napi_synchronize() waits for
NAPI_STATE_SCHED to clear, and a disabled NAPI keeps it set.

  hv_netvsc ... eth0: sub channel open failed: -12
  task:GnsEngine state:D
   msleep+0x38/0x60
   netvsc_wait_until_empty+0x49/0x100
   netvsc_detach+0x135/0x1b0
   netvsc_change_mtu+0xb9/0x120

netvsc_device_remove() would also call napi_disable() on it a second
time, which never returns either.

Check after the wait that every sub channel opened. If one did not,
disable the NAPI of those that did and return an error, so that both
callers fall back to the primary channel. The fallback in
netvsc_attach() did not delete the sub channel NAPIs and left the real
queue counts of the previous device in place; do both, as
netvsc_subchan_work() and netvsc_probe() do.

The device keeps one queue after the fallback, also across later
reconfiguration, until the channel count is raised with ethtool -L.

Fixes: 7b2ee50c0cd5 ("hv_netvsc: common detach logic")
Link: https://github.com/microsoft/WSL/issues/41622
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
Tested in a Hyper-V guest (WSL 2, mirrored networking, 16 vCPUs) on net
aa40afa831ebf, with fail_page_alloc limited to vmbus_alloc_ring() so that
6 of the 15 sub channels of a netvsc device failed to open during an MTU
change. Without this patch, the next MTU change hung in
netvsc_wait_until_empty() with RTNL held. With it, the device fell back
to one queue; a further MTU change, down/up, ping over the device and
ethtool -L back to 16 queues all worked, with no warnings.

I used Claude (Anthropic) to help write these patches.

 drivers/net/hyperv/netvsc_drv.c   |  7 +++++-
 drivers/net/hyperv/rndis_filter.c | 38 +++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/drivers/net/hyperv/netvsc_drv.c b/drivers/net/hyperv/netvsc_drv.c
index 1d43c73fd73f1..ffa5999dc576c 100644
--- a/drivers/net/hyperv/netvsc_drv.c
+++ b/drivers/net/hyperv/netvsc_drv.c
@@ -1023,7 +1023,7 @@ static int netvsc_attach(struct net_device *ndev,
 	struct netvsc_device *nvdev;
 	struct rndis_device *rdev;
 	struct bpf_prog *prog;
-	int ret = 0;
+	int i, ret = 0;
 
 	nvdev = rndis_filter_device_add(hdev, dev_info);
 	if (IS_ERR(nvdev))
@@ -1034,8 +1034,13 @@ static int netvsc_attach(struct net_device *ndev,
 
 		/* if unavailable, just proceed with one queue */
 		if (ret) {
+			for (i = 1; i < nvdev->num_chn; i++)
+				netif_napi_del(&nvdev->chan_table[i].napi);
+
 			nvdev->max_chn = 1;
 			nvdev->num_chn = 1;
+			netif_set_real_num_tx_queues(ndev, 1);
+			netif_set_real_num_rx_queues(ndev, 1);
 		}
 	}
 
diff --git a/drivers/net/hyperv/rndis_filter.c b/drivers/net/hyperv/rndis_filter.c
index 9622513275069..fe5acce0bb06b 100644
--- a/drivers/net/hyperv/rndis_filter.c
+++ b/drivers/net/hyperv/rndis_filter.c
@@ -1278,6 +1278,31 @@ static void netvsc_sc_open(struct vmbus_channel *new_sc)
 		wake_up(&nvscdev->subchan_open);
 }
 
+static bool rndis_subchannel_opened(struct netvsc_device *nvdev, int i)
+{
+	struct vmbus_channel *chn = nvdev->chan_table[i].channel;
+
+	return chn && chn->state == CHANNEL_OPENED_STATE;
+}
+
+/* Disable the NAPI of the sub channels that opened. netvsc_sc_open()
+ * already disabled it on the others.
+ */
+static void rndis_disable_subchannels(struct net_device *ndev,
+				      struct netvsc_device *nvdev)
+{
+	int i;
+
+	for (i = 1; i < nvdev->num_chn; i++) {
+		if (!rndis_subchannel_opened(nvdev, i))
+			continue;
+
+		netif_queue_set_napi(ndev, i, NETDEV_QUEUE_TYPE_TX, NULL);
+		netif_queue_set_napi(ndev, i, NETDEV_QUEUE_TYPE_RX, NULL);
+		napi_disable(&nvdev->chan_table[i].napi);
+	}
+}
+
 /* Open sub-channels after completing the handling of the device probe.
  * This breaks overlap of processing the host message for the
  * new primary channel with the initialization of sub-channels.
@@ -1329,6 +1354,19 @@ int rndis_set_subchannel(struct net_device *ndev,
 	wait_event(nvdev->subchan_open,
 		   atomic_read(&nvdev->open_chn) == nvdev->num_chn);
 
+	/* open_chn also counts the sub channels that failed to open. They
+	 * have no ring buffer and a disabled NAPI, so fall back to the
+	 * primary channel.
+	 */
+	for (i = 1; i < nvdev->num_chn; i++) {
+		if (!rndis_subchannel_opened(nvdev, i)) {
+			netdev_warn(ndev, "sub channel %d is not open, using one queue\n",
+				    i);
+			rndis_disable_subchannels(ndev, nvdev);
+			return -EIO;
+		}
+	}
+
 	for (i = 0; i < VRSS_SEND_TAB_SIZE; i++)
 		ndev_ctx->tx_table[i] = i % nvdev->num_chn;
 

base-commit: aa40afa831ebfe45e40a23721711059f2ac584d4
-- 
2.53.0

