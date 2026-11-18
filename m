Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=173.37.86.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795044768;
	b=DFdgqR2Cc7GHL/zwCV8Jtkw392lEGTjI0Jw4V/JNa2He7qEMOdlyYnUM97ZROfTQDFng
	 Ds2OlITO93e1tGM66f1N8wo2ZjMfPr0K1Lm9StGbyRPSNImDTvl0VzONEn+bIt+ojhHpM
	 s93qfNB6clh+Axvpj4BSrxC9Zd3RwpYIqqLhYx+Q6Fw70PGUPKe0CXzWaqTFVrTkyY+b8
	 0AmX8/t83a+01OeAv22Ac6kS8LkmB52DR44ffrZ3BZ5l24LI/LoPDWZ8vkspLB3/NFdPh
	 uY7eiQI82H+zYcbyVf7XfQWBA147Y2BBdBDV3MK1olc9GVlgcc/Vb4jDRV4OSqZIfRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795044768;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IPAS-Result:IronPort-Data:IronPort-HdrOrdr:X-Talos-CUID:
	 X-Talos-MUID:X-IronPort-Anti-Spam-Filtered:X-IronPort-AV:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Outbound-Client-TLS:
	 X-Outbound-SMTP-Client:X-Outbound-Node;
	bh=L2HNshc5QObxYt1vYVlML68/eWzQMGhV4v4/EzeN69Q=;
	b=JhuNBNmMq5je4eBVVZCrOYcJiD87zwbJ9Y/tf7PEQriET5lU9l6lAK/hnleMrU+zI70D
	 rP5JWxyX0KNRpaMIKgUPjTZi77JB/1VMBvPb//4VSNYeJMp8uci7wfGvgiTdqIvyItnae
	 7LRha0xBTs084Lw0zSOHM6pURxS/wEUw5aBs+HpGDQs13MINTu2xY2Uq4zk2F9Lm684U1
	 8SArXdHBrmKiKEEIevvH1LjYhUxkPQ4jPSSoF8zQi6MIl0nE/lXbkQJdkNsss+y4FSck4
	 CjR+vPL5u4waMewwfDR8nTH8Ch8Uh4Jtsv16K10zGEiYe+ZP29OU7+/gklweHAQOghQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cisco.com;
	spf=pass smtp.mailfrom=cisco.com;
	dkim=pass header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport01 header.b=Aj3EaUlT;
	arc=none smtp.remote-ip=173.37.86.76
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0B560A3803;
	Wed, 18 Nov 2026 23:32:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A0B560A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cisco.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport01 header.b=Aj3EaUlT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2539; q=dns/txt;
  s=iport01; t=1795044767; x=1796254367;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=L2HNshc5QObxYt1vYVlML68/eWzQMGhV4v4/EzeN69Q=;
  b=Aj3EaUlTMijJLdBEfcX9A1NlceOrAsSE0DvJtID2KfSSFfnVJlGMJNxg
   3ITflEItoSoOGpwGvzv4P1pMCTn/5LtLUWcIrEaf7O63N541dkGmaFHPc
   ag63hbzKhxfCYaHF5liRE8MF+rz71AxYy/onzpixDamC/VK9VBBSHzmlz
   ggcXzTKqwreUb7FwK32ba1uFGo9Dj9CdObuCADEqZsm4vsgxKEr8cMBTh
   zKsphbkIhy9FaAM96jVXI3OXIm/nrfsuZNR3GF7bZcvHaGXxFkFiVt7UO
   KnYM/ikZDKN71tL5zJ8EnNxPYSQJngHafJuEwFYneFuqjndIu5HDr28yM
   Q==;
X-CSE-ConnectionGUID: mbT0sTtrSHOUrfjklhxSVg==
X-CSE-MsgGUID: yx4C6z3UQv2MHkFFm2bBSg==
X-IPAS-Result: =?us-ascii?q?A0BGAgBDNP5q/5L/Ja1aglmCGD+BVUNJhFePU4IhmEmFY?=
 =?us-ascii?q?hSBag8BAQEPUQQBAYUFAo4gAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZckBMCAQMjVhAlAiYCAkYQBgESgwKCdQO5XXqBMoEBhH7ZS?=
 =?us-ascii?q?4FoAQsUAYEKLoV0gm4BgXGECDuEQicbgUlEgRWDaoQqg3WCagSCInoSglaVa?=
 =?us-ascii?q?Qk/gQIcA1ksAVUTDQoLBwVjUjMDIAoLEhIYFQIUHRIPBBYyHXAMJxIpFy9YG?=
 =?us-ascii?q?wYFgRxzFAQTgRKBA12BKyhdASGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIE?=
 =?us-ascii?q?gkBExosCoEaNTwJJj8VDGcIAxoFQAIfCAINDHQ5EDAeJC8FGiY+GwqBDCcfH?=
 =?us-ascii?q?hsOAgoYDUgRLDcGDxkEPQFuB5NLgiZgAhCBDyVagRRVk0KDWo1ea6ERhCuBa?=
 =?us-ascii?q?KAQM4QEk2aTCC6HZpB0I4I2ogKEaoFoPIFZMxoIGxU7gmdTGQ+OLhaBFAEBk?=
 =?us-ascii?q?gcBvQAmMj4BBwIHDwKBc5F+AQE?=
IronPort-Data: A9a23:SD7kVqmrWqNTW+dIgj3ijWPo5gxTJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIWCm3SM6uDMzP2c9Bzboy18k9TuJ7VnIRgHgc9pX08EVtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6x9yQUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtNsvLb83uDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FYgSxr5sPX1Uz
 tw/FSoDbBOHh/KN/r3uH4GAhux7RCXqFJkUtnclyXTSCuwrBMiSBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTZD/7C7pm9AusrmL2bzxDqFGVjaE2+GPUigd21dABNfKIJo3WHZQJxRbwS
 mTu7nSlKU8Ib+Gm12Cg0nGCqOqVlwnAV9dHfFG/3rsw6LGJ/UQfAQMbUHO3qOe0j0q5Vc4ZL
 UEIkgIjobU3/V6mUvH+Uge+rXrCuQQTM/JQFPc/8ymOx7DS7gLfAXILJhZCddYvnMw7Xzon0
 hmOhdyBLTVpvKeYVjGb+6uYoC2aPTUTKykJZUcsVQIP7t/iiJs+ghLGUpBoF6vdptn0Hyzgh
 jOHti4zg50NgsMRkaa251bKh3SrvJehZgg4+gnaQEq74Q5jIo2ofYql7R7c9/koEWqCZkOKs
 H5Bn42V6/oDSMnc0ieMW+4KWrqu4p5pLQHhvLKmJLF5nxzFxpJpVdk4DO1WTKuxDvs5RA==
IronPort-HdrOrdr: A9a23:AAI806+L5AgKCtMNNjxuk+AuI+orL9Y04lQ7vn2ZhyYlFvBw8P
 rOoB1773HJYVkqNU3I9errBEDEewK/yXcX2+Ys1MmZPDUO0VHAROpfBMnZsl7d8kbFmtK1u5
 0QFpRWOZncAUd3iMDi7BL9MdoxqeP3iZyAtKPyw2hgSAdyZ7ol1Qd2DQ6HDlZ7LTM2Y6bRbK
 DsgfZvln6HZWkdaNi9Cz0uWujOoMCOqbfdCCR2fyLOLGK1/EmVAHmQKWni4isj
X-Talos-CUID: 9a23:+tYuS2Gqfl/tamtkqmJi/nJMAfw5aEb960rKLU27DWZ5c4OaHAo=
X-Talos-MUID: 9a23:tf687wVB0zY5Yz3q/C782Bo8JpxV2rr0LWAOv7sD4cOuDiMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,220,1787011200"; 
   d="scan'208";a="549409438"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 18 Nov 2026 23:32:41 +0000
Received: from [127.0.0.1] (unknown [10.25.129.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 9081A18000594;
	Wed, 18 Nov 2026 23:32:40 +0000 (GMT)
From: Satish Kharat <satishkh@cisco.com>
Date: Wed, 18 Nov 2026 15:32:27 -0800
Subject: [PATCH net-next v3 1/6] net: add netif_rx_mode_schedule_update()
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-b4-enic-sriov-v2-vf-receive-control-v3-1-2cb25677aa8c@cisco.com>
References: <20261118-b4-enic-sriov-v2-vf-receive-control-v3-0-2cb25677aa8c@cisco.com>
In-Reply-To: <20261118-b4-enic-sriov-v2-vf-receive-control-v3-0-2cb25677aa8c@cisco.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sesidhar Baddela <sebaddel@cisco.com>, 
 Aravind Dhanasekaran <aradhana@cisco.com>, 
 Reese Faucette <rfaucett@cisco.com>, Satish Kharat <satishkh@cisco.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795044758; l=2545;
 i=satishkh@cisco.com; h=from:subject:message-id;
 bh=N2S11Yr3Cq2cAl8qIoitclt+AaK5sqpYLACgQid+tP4=;
 b=QHCordKhBYfQgsq3LDkAZI9VQPqgHJ0ipG9aNr/j1/XtKqpCXeT8Wu+iRiuD41nbRL855y76B
 Oot8U94kXzgDgqoe8qNyv4/g/ScRL4WlIv/t7fg9SBit58Rff5gRTvr
X-Developer-Key: i=satishkh@cisco.com; a=ed25519;
 pk=4BxbLoCGvHeIMH/PbpiNVx8/2IcTjFvqcr0AD8K6WLY=
X-Outbound-Client-TLS: ANONYMOUS;unknown [10.25.129.52];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.25.129.52, [10.25.129.52]
X-Outbound-Node: rcdn-l-core-09.cisco.com

Add a receive-mode scheduling helper for callers which start a new update
after a state transition. Cancel a pending retry and reset its backoff
before queueing the immediate update so the preceding operation's retry
state cannot shorten the new operation's bounded retry sequence.

The helper preserves address-list synchronization state. Callers which need
to replay configuration lost by the device must unsynchronize the affected
address lists before scheduling the update.

Assisted-by: LLM

Signed-off-by: Satish Kharat <satishkh@cisco.com>
---
 include/linux/netdevice.h |  1 +
 net/core/dev_addr_lists.c | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 0325c6f2a7d1..4ff3523f9474 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -5232,6 +5232,7 @@ static inline void __dev_mc_unsync(struct net_device *dev,
 
 /* Functions used for secondary unicast and multicast support */
 void dev_set_rx_mode(struct net_device *dev);
+void netif_rx_mode_schedule_update(struct net_device *dev);
 void netif_rx_mode_schedule_retry(struct net_device *dev);
 int netif_set_promiscuity(struct net_device *dev, int inc);
 int dev_set_promiscuity(struct net_device *dev, int inc);
diff --git a/net/core/dev_addr_lists.c b/net/core/dev_addr_lists.c
index b6f25e487984..89ae77360a0b 100644
--- a/net/core/dev_addr_lists.c
+++ b/net/core/dev_addr_lists.c
@@ -1568,6 +1568,27 @@ static void netif_rx_mode_queue(struct net_device *dev)
 	__netdev_work_core_sched(dev, NETDEV_WORK_RX_MODE);
 }
 
+/**
+ * netif_rx_mode_schedule_update() - schedule a new receive-mode update
+ * @dev: network device
+ *
+ * Cancel any pending retry and reset its backoff before scheduling an
+ * immediate receive-mode update. This does not reset address-list
+ * synchronization state. Callers which need to replay lost device state must
+ * unsynchronize the affected address lists before scheduling the update.
+ *
+ * Context: sleepable. The caller must hold the device operations lock, or
+ * RTNL for a device which still uses RTNL-compatible operations.
+ */
+void netif_rx_mode_schedule_update(struct net_device *dev)
+{
+	might_sleep();
+	netdev_assert_locked_ops_compat(dev);
+	netif_rx_mode_cancel_retry(dev);
+	netif_rx_mode_queue(dev);
+}
+EXPORT_SYMBOL_GPL(netif_rx_mode_schedule_update);
+
 static void netif_rx_mode_retry(struct timer_list *t)
 {
 	struct net_device *dev =

-- 
2.43.0

