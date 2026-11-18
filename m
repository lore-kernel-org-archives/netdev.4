Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=173.37.86.80
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795044789;
	b=lBbzBX5JgROrrd8IF2OAH5AxDS8Y5oJJTo55gae7D829JN4/zIUc0S3NnTr6nSqhXdf1
	 N5tH9A0DFhGr9PGWZPlPNfMXigjujUzFnU1gZLx8krZZqsAD/I6Y1eCi5iRoxT3Eaz1pP
	 U+9orN1EM29oPLEIYjiyHqkNPHfYx8MBbTyxsRLd8vKClJMklqbJUZF9sdgm8EehyV1BG
	 DTi1gtruu9ebu59mLjabaQHwWM36b/B0PQgHvD2wqHT6qSokfxdAVmydXENmGVJNYbYS3
	 /xOBMCEoYWCukgzzFEhnpfr3jSi4xZiq6CfaAgq4cV1HOSCtYojcwUzX1aQfxUGdJww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795044789;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IPAS-Result:IronPort-Data:IronPort-HdrOrdr:X-Talos-CUID:
	 X-Talos-MUID:X-IronPort-Anti-Spam-Filtered:X-IronPort-AV:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Outbound-Client-TLS:
	 X-Outbound-SMTP-Client:X-Outbound-Node;
	bh=+qv1V4Xq/TQu4/KWBtAYW3dI4eTjFvuuUzWiBgqdJ/4=;
	b=u8M3CLqekLe3iMURSs2SHmNbm3XAosy6+7r1JAAUiXwzzo/D4/kpNUXN9r2Pyj4Pmiw9
	 GJbJCrqbohYDl9rMKp4rHCC+bP6GgSyPGZ6jedmahDz0feBC16dxbVRSDlx7trOazgvd8
	 3UTRis/d9kuKvPb5z1dJFIBZJlYq610X61kVZXVb6lhcogx5jbSgGtVkwThqF3Lqvlpab
	 k4PZr6xe2hqyTAUpBZoWnp9Ek4wQJ72UPGAKn2vl0C5z9T5OKobH1WJWJG07mQI5V+xCw
	 /1C6K1PgstQvfE3kkapYZOxRh7zzRbs2Pj8ZZpjttMkOavq05DQhIdJB47j9yRqqTkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cisco.com;
	spf=pass smtp.mailfrom=cisco.com;
	dkim=pass header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport01 header.b="LLFDzn/D";
	arc=none smtp.remote-ip=173.37.86.80
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB30606D673;
	Wed, 18 Nov 2026 23:33:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BB30606D673
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cisco.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport01 header.b=LLFDzn/D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=21386; q=dns/txt;
  s=iport01; t=1795044789; x=1796254389;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=+qv1V4Xq/TQu4/KWBtAYW3dI4eTjFvuuUzWiBgqdJ/4=;
  b=LLFDzn/DscSBIKKHssReactQeBZHMmkCDOEqwwdUlO0fCaG9HIi1t5r+
   7eVCBnIz3npBb22cs6xzfpFjOC18MjYvayQ0MclExOGlMcRcXIdlxdN6k
   lpWebVFp2YOhvjoLhocK3b4kBo8aEl8ctqUa1TJumeVB5rSw/8OG2q8R6
   3TPL3Vw1WXRfuU89ZQYhyppJkF+HwtE3oHGpxGlvuajB4rftp2MtCOv07
   sST0+KAJCXXllIzDWbkaEKDPO8cXfqgENcq8y84gjIJXoCcsvhDOQekXe
   p9afRgcVERLdfychuFMFyqHGBwm2890sGB+WD0uPfoXeOyzi8bN2VUgff
   w==;
X-CSE-ConnectionGUID: BWQVrvQxTpWjqEtDPw+mHg==
X-CSE-MsgGUID: 5bVio6sIR1GmRcE8GaHIzw==
X-IPAS-Result: =?us-ascii?q?A0AIAABINf5q/5L/Ja1aGwEBAQEBAQEBBQEBARIBAQEDA?=
 =?us-ascii?q?wEBAYF8BgEBAQsBglaBVUNJhFeIG4c4giGRUoxZFIFqDwEBAQ9RBAEBhQUCj?=
 =?us-ascii?q?iACJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFgQ4ThlyQEwIBA?=
 =?us-ascii?q?xoJBEASECUCJgICRhAGARKDAoJ1A7lden8zgQGEftlLgWgBCxQBgQouAYVzg?=
 =?us-ascii?q?m4BgXGECDuEQicbgUlEgRWDaoQbBAuDdYJqBIIiehKCVoU6kC8JP4ECHANZL?=
 =?us-ascii?q?AFVEw0KCwcFY1IzAyAKCxISGBUCFB0SDwQWMh1wDCcSKRcvWBsGBYEccxQEE?=
 =?us-ascii?q?4ESgQNdgSsoXQEhgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBG?=
 =?us-ascii?q?jU8CSY/FQxnCAMaBUACHwgCDQx0ORAwHiQvBRomPhsKgQwnHx4bDgIKGA1IE?=
 =?us-ascii?q?Sw3Bg8ZBD0BbgeTS4ImAVEfAQENCBcQGwIbBgkLe0EdFQoEFxoBAS4eJ5JXD?=
 =?us-ascii?q?B0mgzyNXmuBNZ9chCuBaKAQM4QEk2aTCJkII4I2oRQGDwkBAk2EaoFoPIFZM?=
 =?us-ascii?q?xoIGxU7gmdTGQ+OLhaTHQG9ACYyPQEBBwIHDgMLgWiQAAEBAwwXB4FPAQE?=
IronPort-Data: A9a23:S7n8v6KRQSzPIARUFE+RA5QlxSXFcZb7ZxGr2PjKsXjdYENS12QDm
 mcfX2jSMvjcYGTyfYp+YIixpksPsMSEmNVnHgMd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea9k3wWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8gmckajl8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1EM3gIJ5Mh6tpvPmNX2
 OA0EC9OazCM0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBXLAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEqojx5nYj/7DLollfupnXn8cxVTqUmeouw85G27IAlZjeS9aoSNKoXULSlTthuSm
 GPBoX/YOEg1MeaU5Gqq+1KNlPCayEsXX6pXTtVU7MVCjFSNy2k7BBQIWF6/pvelzEizR7p3J
 kAJ/yM8oLQa90GxSNT5GRqirxasvhkGXsF4EOAg7gyJjK3O7G6xBXUORxZCZcYguctwQiYlv
 neAmd/zCCMstrCJRX+D3rOJqzX0Mih9BXcLbyICTCMf7tXjqZ11hRXKJv5nEaionpj2FCv2z
 jSisicznfMQgNQN2qH9+krI6xqqq4TFQxAd+AraRCSm4xl/aYrjYJangWU39t5aJ4qfC13Et
 38elo3GvaYFDIqGk2qGR+Bl8KyV2stp+Qb02TZHd6TNPRz0k5J/Vei8OA1DGXo=
IronPort-HdrOrdr: A9a23:feYJpqlQeeQ4gqAbf6WMs+azXbrpDfLa3DAbv31ZSRFFG/FwWf
 re+MjzsiWUtN9xYh8dcL+7VZVoLUm3yXcx2/hyAV7AZmbbURWTTL2KhLGKq1bd8m/Fh41gPM
 xbH5SWZueAaGRSvILW7Ba1FtA4zMLC0qy57N2utktFfEVGZ75t6gFhBh3eKE15QwFaGYE0fa
 DsgPav3wDQHkg/X4CcGmQPWfTFqpngkZLrZgNDOjscgTP+9Q9BLNXBYmKlNtB0aUI1/Ysf
X-Talos-CUID: 9a23:WdUhu2Ggvv44LCdbqmJNy3cqAN4cYkHF83XJDlOUMXkqTZ2aHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3Ao5rrog+HgxWtqqfVdH/dZFSQf5pi3aWpVlssq8w?=
 =?us-ascii?q?pvvOPGHxfMhe8niviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,220,1787011200"; 
   d="scan'208";a="548260816"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 18 Nov 2026 23:32:47 +0000
Received: from [127.0.0.1] (unknown [10.25.129.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 0273F1800058D;
	Wed, 18 Nov 2026 23:32:45 +0000 (GMT)
From: Satish Kharat <satishkh@cisco.com>
Date: Wed, 18 Nov 2026 15:32:32 -0800
Subject: [PATCH net-next v3 6/6] enic: configure V2 VF receive mode over
 mailbox
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
Message-Id: <20261118-b4-enic-sriov-v2-vf-receive-control-v3-6-2cb25677aa8c@cisco.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795044758; l=22225;
 i=satishkh@cisco.com; h=from:subject:message-id;
 bh=7zWmmMx0O07Hrq42vpRMKxaljomauVHY3EZqs974EH4=;
 b=5J8rjvPqozZ5uZ/J1XFk9SHQrpP882JCOD84WOJiVcVZzw0WeAHYtrkOVozKxy41onLMuD4qM
 GABqCjwVLavDm5SZLPDz6GxzcO7vXhwiefsRVCMWY9MMWx9ynjMWPSo
X-Developer-Key: i=satishkh@cisco.com; a=ed25519;
 pk=4BxbLoCGvHeIMH/PbpiNVx8/2IcTjFvqcr0AD8K6WLY=
X-Outbound-Client-TLS: ANONYMOUS;unknown [10.25.129.52];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.25.129.52, [10.25.129.52]
X-Outbound-Node: rcdn-l-core-09.cisco.com

V2 VFs cannot program receive filters directly. Add an asynchronous
receive-mode callback that sends unicast and multicast address changes and
packet-filter settings through the VF's one-request-at-a-time mailbox path.

Complete all phases required for one address-list snapshot before reporting
success from the callback. Retryable errors request the bounded netdev-core
retry path rather than claiming convergence. Process every stale delete
before new adds and reserve
capacity for 31 secondary unicast and 32 multicast entries, because
deployed async PFs count the station address in the same 32-entry unicast
table. Install that finite exact-filter subset even when broad coverage is
required or denied, leaving overflow entries unsynchronized for later
convergence.

Use only validated applied packet-filter state when ordering broad-mode
transitions. Enable newly required broad coverage before exact-filter work
and withdraw stale broad coverage before installing its finite replacement.
If a combined transition cannot establish the new broad mode while an old
one must be withdrawn, reconnect so stale acceptance cannot survive. Treat
PF denial as degraded coverage consistently during open and runtime
updates.

Track detailed per-address results so idempotent outcomes converge and
stable policy denials do not consume the retry budget. Require fresh
registration when an ambiguous whole-request error can leave a DELETE
partially applied, while keeping local pre-submit and add-only failures on
the normal retry path. Keep the station address out of both secondary
address lists.

Select the asynchronous netdev operations only for V2 VFs. Replay receive
mode after successful reset, hang-reset, and direct MTU reopen paths so the
current snapshot converges after every internal datapath rebuild.

Assisted-by: LLM

Signed-off-by: Satish Kharat <satishkh@cisco.com>
---
 drivers/net/ethernet/cisco/enic/enic.h      |   3 +
 drivers/net/ethernet/cisco/enic/enic_main.c | 476 +++++++++++++++++++++++++++-
 2 files changed, 468 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/cisco/enic/enic.h b/drivers/net/ethernet/cisco/enic/enic.h
index 5a830a7f8d92..294e09d44da8 100644
--- a/drivers/net/ethernet/cisco/enic/enic.h
+++ b/drivers/net/ethernet/cisco/enic/enic.h
@@ -395,6 +395,9 @@ struct enic {
 	 */
 	struct enic_mac_addr *mbox_reply_mac_addrs;
 	u16 mbox_reply_mac_count;
+	u16 vf_pkt_filter_requested;
+	u16 vf_pkt_filter_applied;
+	bool vf_pkt_filter_valid;
 	bool mbox_initialized;
 
 	/* PF: per-VF MBOX state, allocated when SRIOV V2 is enabled */
diff --git a/drivers/net/ethernet/cisco/enic/enic_main.c b/drivers/net/ethernet/cisco/enic/enic_main.c
index 46a5f46b192e..47b84bc282f7 100644
--- a/drivers/net/ethernet/cisco/enic/enic_main.c
+++ b/drivers/net/ethernet/cisco/enic/enic_main.c
@@ -1048,6 +1048,8 @@ void enic_reset_addr_lists(struct enic *enic)
 	enic->uc_count = 0;
 	enic->flags = 0;
 	netif_addr_unlock_bh(netdev);
+
+	enic->vf_pkt_filter_valid = false;
 }
 
 static int enic_set_mac_addr(struct net_device *netdev, char *addr)
@@ -1621,17 +1623,404 @@ static int enic_set_mac_address(struct net_device *netdev, void *p)
 	return enic_dev_add_station_addr(enic);
 }
 
+static u16 enic_rx_mode_to_pkt_filter(struct net_device *netdev,
+				      unsigned int uc_count,
+				      unsigned int mc_count)
+{
+	u16 flags = CMD_PFILTER_DIRECTED;
+
+	if (netdev->flags & IFF_MULTICAST)
+		flags |= CMD_PFILTER_MULTICAST;
+	if (netdev->flags & IFF_BROADCAST)
+		flags |= CMD_PFILTER_BROADCAST;
+	if ((netdev->flags & IFF_PROMISC) ||
+	    uc_count > ENIC_UNICAST_PERFECT_FILTERS)
+		flags |= CMD_PFILTER_PROMISCUOUS;
+	if ((netdev->flags & IFF_ALLMULTI) ||
+	    mc_count > ENIC_MULTICAST_PERFECT_FILTERS)
+		flags |= CMD_PFILTER_ALL_MULTICAST;
+
+	return flags;
+}
+
+/* Deployed async PFs count the station MAC in the 32-entry UC table. */
+static bool enic_vf_uc_needs_promisc(unsigned int uc_count)
+{
+	return uc_count > ENIC_UNICAST_PERFECT_FILTERS - 1;
+}
+
+static int enic_vf_set_pkt_filter(struct enic *enic, u16 flags,
+				  u16 *applied_flags)
+{
+	u16 applied;
+	int err;
+
+	/* The PF can change trust policy independently and thereby withdraw
+	 * broad modes. Always refresh those requests so the returned applied
+	 * flags remain authoritative. The other modes are not trust-gated and
+	 * can be reused for ordinary address-list churn.
+	 */
+	if (!(flags & (CMD_PFILTER_PROMISCUOUS |
+		       CMD_PFILTER_ALL_MULTICAST)) &&
+	    enic->vf_pkt_filter_valid &&
+	    enic->vf_pkt_filter_requested == flags) {
+		if (applied_flags)
+			*applied_flags = enic->vf_pkt_filter_applied;
+		return 0;
+	}
+
+	err = enic_mbox_vf_set_pkt_filter(enic,
+					  !!(flags & CMD_PFILTER_DIRECTED),
+					  !!(flags & CMD_PFILTER_MULTICAST),
+					  !!(flags & CMD_PFILTER_BROADCAST),
+					  !!(flags & CMD_PFILTER_PROMISCUOUS),
+					  !!(flags & CMD_PFILTER_ALL_MULTICAST),
+					  &applied);
+	if (err)
+		return err;
+
+	enic->vf_pkt_filter_requested = flags;
+	enic->vf_pkt_filter_applied = applied;
+	enic->vf_pkt_filter_valid = true;
+	if (applied_flags)
+		*applied_flags = applied;
+
+	return 0;
+}
+
+static void enic_vf_report_pkt_filter_denial(struct net_device *netdev,
+					     u16 requested, u16 applied)
+{
+	if ((requested & CMD_PFILTER_PROMISCUOUS) &&
+	    !(applied & CMD_PFILTER_PROMISCUOUS))
+		netdev_dbg(netdev, "PF policy denied promiscuous receive mode\n");
+	if ((requested & CMD_PFILTER_ALL_MULTICAST) &&
+	    !(applied & CMD_PFILTER_ALL_MULTICAST))
+		netdev_dbg(netdev,
+			   "PF policy denied all-multicast receive mode\n");
+}
+
+struct enic_vf_mac_op {
+	struct netdev_hw_addr *ha;
+	unsigned int *filter_count;
+};
+
+static unsigned int
+enic_vf_addr_list_count(const struct enic *enic,
+			const struct netdev_hw_addr_list *list)
+{
+	const struct netdev_hw_addr *ha;
+	unsigned int count = 0;
+
+	netdev_hw_addr_list_for_each(ha, list)
+		if (ha->refcount > ha->sync_cnt &&
+		    !(enic->vf_station_addr_valid &&
+		      ether_addr_equal(ha->addr, enic->vf_station_addr)))
+			count++;
+
+	return count;
+}
+
+static int enic_vf_collect_mac_ops(struct enic *enic,
+				   struct netdev_hw_addr_list *list,
+				   bool add,
+				   unsigned int *filter_count,
+				   unsigned int *projected_count,
+				   unsigned int max_filters,
+				   struct enic_mac_addr *macs,
+				   struct enic_vf_mac_op *ops,
+				   u16 *num_ops)
+{
+	struct netdev_hw_addr *ha;
+	u16 pos = *num_ops;
+
+	netdev_hw_addr_list_for_each(ha, list) {
+		if (enic->vf_station_addr_valid &&
+		    ether_addr_equal(ha->addr, enic->vf_station_addr))
+			continue;
+		if (add) {
+			if (ha->sync_cnt || *projected_count >= max_filters)
+				continue;
+		} else {
+			if (!ha->sync_cnt || ha->refcount != ha->sync_cnt)
+				continue;
+			WARN_ON_ONCE(!*projected_count);
+		}
+		if (pos == ENIC_MBOX_MAX_MAC_OPS)
+			return -E2BIG;
+
+		ether_addr_copy(macs[pos].addr, ha->addr);
+		macs[pos].flags = add ?
+			cpu_to_le16(ENIC_MAC_ADDR_FLAG_ADD) : 0;
+		ops[pos].ha = ha;
+		ops[pos].filter_count = filter_count;
+		pos++;
+		if (add)
+			(*projected_count)++;
+		else if (*projected_count)
+			(*projected_count)--;
+	}
+
+	*num_ops = pos;
+	return 0;
+}
+
+static int enic_vf_sync_mac_filters(struct enic *enic,
+				    struct netdev_hw_addr_list *uc,
+				    struct netdev_hw_addr_list *mc)
+{
+	struct enic_vf_mac_op *ops;
+	struct enic_mac_addr *macs;
+	unsigned int projected_mc = enic->mc_count;
+	unsigned int projected_uc = enic->uc_count;
+	bool has_delete = false;
+	bool permanent_add = false;
+	bool reconnect = false;
+	bool retryable_add = false;
+	u16 num_ops = 0;
+	unsigned int i;
+	int err = 0;
+
+	/* A class can contribute at most its installed perfect filters as
+	 * deletes and its finite perfect-filter limit as adds. Keep the wire
+	 * batch large enough for both classes so an update always fits in one
+	 * transaction and -E2BIG remains only a defensive state-corruption
+	 * check.
+	 */
+	BUILD_BUG_ON(ENIC_MBOX_MAX_MAC_OPS <
+		     2 * (ENIC_UNICAST_PERFECT_FILTERS - 1 +
+			  ENIC_MULTICAST_PERFECT_FILTERS));
+
+	macs = kcalloc(ENIC_MBOX_MAX_MAC_OPS, sizeof(*macs), GFP_KERNEL);
+	if (!macs)
+		return -ENOMEM;
+	ops = kcalloc(ENIC_MBOX_MAX_MAC_OPS, sizeof(*ops), GFP_KERNEL);
+	if (!ops) {
+		err = -ENOMEM;
+		goto free_macs;
+	}
+
+	/* Collect all stale deletes before any add. Projected occupancy reserves
+	 * only replies which could fit after those deletes; actual counts change
+	 * below only for successful per-operation results.
+	 */
+	err = enic_vf_collect_mac_ops(enic, uc, false, &enic->uc_count,
+				      &projected_uc, 0,
+				      macs, ops, &num_ops);
+	if (err)
+		goto free_ops;
+	err = enic_vf_collect_mac_ops(enic, mc, false, &enic->mc_count,
+				      &projected_mc, 0,
+				      macs, ops, &num_ops);
+	if (err)
+		goto free_ops;
+	has_delete = num_ops != 0;
+
+	err = enic_vf_collect_mac_ops(enic, uc, true, &enic->uc_count,
+				      &projected_uc,
+				      ENIC_UNICAST_PERFECT_FILTERS - 1,
+				      macs, ops, &num_ops);
+	if (err)
+		goto free_ops;
+	err = enic_vf_collect_mac_ops(enic, mc, true, &enic->mc_count,
+				      &projected_mc,
+				      ENIC_MULTICAST_PERFECT_FILTERS,
+				      macs, ops, &num_ops);
+	if (err || !num_ops)
+		goto free_ops;
+
+	/* The protocol carries all changed unicast and multicast addresses in
+	 * one request.  Besides matching the native ABI, this bounds time spent
+	 * in the RTNL-held asynchronous receive-mode callback to one MAC reply.
+	 */
+	err = enic_mbox_vf_add_del_macs(enic, macs, num_ops);
+	if (err) {
+		/* The PF may have applied any prefix before a request-wide failure.
+		 * A batch containing DELETE can therefore leave stale acceptance.
+		 * Fresh registration is the cleanup boundary unless transport DMA is
+		 * already poisoned and awaiting its reset fence.
+		 */
+		if (err == -EIO && has_delete &&
+		    !READ_ONCE(enic->mbox_tx_poisoned) &&
+		    !READ_ONCE(enic->vf_mbox_reconnect_required))
+			enic_mbox_vf_require_reconnect(enic);
+		goto free_ops;
+	}
+
+	for (i = 0; i < num_ops; i++) {
+		u16 flags = le16_to_cpu(macs[i].flags);
+		bool add = flags & ENIC_MAC_ADDR_FLAG_ADD;
+
+		if (flags & ENIC_MAC_ADDR_FLAG_SKIPPED) {
+			if (add)
+				retryable_add = true;
+			else
+				reconnect = true;
+			continue;
+		}
+		if (flags & ENIC_MAC_ADDR_FLAG_PERMANENT_MASK) {
+			if (add)
+				permanent_add = true;
+			else
+				reconnect = true;
+			continue;
+		}
+
+		if (add) {
+			ops[i].ha->sync_cnt++;
+			ops[i].ha->refcount++;
+			(*ops[i].filter_count)++;
+		} else {
+			ops[i].ha->sync_cnt--;
+			ops[i].ha->refcount--;
+			if (WARN_ON_ONCE(!*ops[i].filter_count))
+				err = -EIO;
+			else
+				(*ops[i].filter_count)--;
+		}
+	}
+
+	/* A failed DELETE can leave hardware accepting an address no longer in
+	 * the requested list.  Registration is the fail-closed cleanup boundary.
+	 * A skipped ADD changes no acceptance state and can use the bounded core
+	 * retry path.  Permanent ADD denials remain stable policy results.
+	 */
+	if (reconnect) {
+		enic_mbox_vf_require_reconnect(enic);
+		err = -EIO;
+	} else if (retryable_add) {
+		err = -EAGAIN;
+	} else if (permanent_add) {
+		err = -EACCES;
+	}
+
+free_ops:
+	kfree(ops);
+free_macs:
+	kfree(macs);
+	return err;
+}
+
+static int enic_set_vf_rx_mode(struct net_device *netdev,
+			       struct netdev_hw_addr_list *uc,
+			       struct netdev_hw_addr_list *mc)
+{
+	struct enic *enic = netdev_priv(netdev);
+	unsigned int uc_count = enic_vf_addr_list_count(enic, uc);
+	unsigned int mc_count = enic_vf_addr_list_count(enic, mc);
+	u16 flags = enic_rx_mode_to_pkt_filter(netdev, uc_count, mc_count);
+	bool uc_overflow = enic_vf_uc_needs_promisc(uc_count);
+	u16 broad_modes = CMD_PFILTER_PROMISCUOUS |
+			  CMD_PFILTER_ALL_MULTICAST;
+	bool broad_enable_needed;
+	bool broad_withdrawal;
+	bool filter_needed;
+	bool target_filter_updated = false;
+	u16 applied_broad;
+	u16 prefilter_flags;
+	u16 applied_flags;
+	int err;
+
+	if (uc_overflow)
+		flags |= CMD_PFILTER_PROMISCUOUS;
+
+	if (!READ_ONCE(enic->vf_registered))
+		return -ENODEV;
+
+	filter_needed = !enic->vf_pkt_filter_valid ||
+			 enic->vf_pkt_filter_requested != flags ||
+			 (flags & broad_modes);
+	applied_broad = enic->vf_pkt_filter_valid ?
+		enic->vf_pkt_filter_applied & broad_modes : 0;
+	broad_enable_needed = flags & broad_modes & ~applied_broad;
+	broad_withdrawal = applied_broad & ~flags;
+	if (broad_enable_needed) {
+		/* Establish newly required broad coverage before an independent
+		 * exact-address rejection can block it. Retain currently applied
+		 * broad modes while establishing the newly required modes.
+		 */
+		prefilter_flags = flags;
+		prefilter_flags |= applied_broad;
+		err = enic_vf_set_pkt_filter(enic, prefilter_flags,
+					     &applied_flags);
+		if (err) {
+			/* A combined transition retains the old applied broad mode
+			 * until the new one is established. If that request fails, the
+			 * stale mode may remain active outside the requested policy.
+			 */
+			if (broad_withdrawal &&
+			    !READ_ONCE(enic->mbox_tx_poisoned) &&
+			    !READ_ONCE(enic->vf_mbox_reconnect_required))
+				enic_mbox_vf_require_reconnect(enic);
+			return err;
+		}
+		target_filter_updated = prefilter_flags == flags;
+		enic_vf_report_pkt_filter_denial(netdev, flags, applied_flags);
+	}
+
+	if (broad_withdrawal) {
+		/* Withdraw stale broad acceptance before installing its finite
+		 * replacement. Complete both phases in this callback so a synchronous
+		 * receive-mode operation cannot return between them.
+		 */
+		err = enic_vf_set_pkt_filter(enic, flags, &applied_flags);
+		if (err) {
+			/* The previously applied broad mode may still be active.  Do
+			 * not rely on the core's bounded retry budget to narrow it.
+			 * Fresh registration is the fail-closed policy boundary.  A
+			 * local send timeout is already terminal and cannot use ordinary
+			 * reconnect recovery.
+			 */
+			if (!READ_ONCE(enic->mbox_tx_poisoned) &&
+			    !READ_ONCE(enic->vf_mbox_reconnect_required))
+				enic_mbox_vf_require_reconnect(enic);
+			return err;
+		}
+		target_filter_updated = true;
+		enic_vf_report_pkt_filter_denial(netdev, flags, applied_flags);
+	}
+
+	/* Install and retain the finite exact-filter subset even for an
+	 * overflowing class. Broad mode covers the remaining addresses when PF
+	 * policy permits it. Deletes are applied first so later updates can fill
+	 * newly available exact-filter slots.
+	 */
+	err = enic_vf_sync_mac_filters(enic, uc, mc);
+	if (err == -EACCES) {
+		/* Do not spend the core retry budget repeating an exact operation
+		 * that the PF rejected permanently. Finish any independent packet
+		 * policy change below before returning success.
+		 */
+		err = 0;
+	}
+	if (err)
+		return err;
+
+	if (!target_filter_updated && filter_needed) {
+		err = enic_vf_set_pkt_filter(enic, flags, &applied_flags);
+		if (err)
+			return err;
+	} else if (!target_filter_updated) {
+		applied_flags = enic->vf_pkt_filter_applied;
+	}
+
+	enic_vf_report_pkt_filter_denial(netdev, flags, applied_flags);
+
+	return 0;
+}
+
 /* netif_tx_lock held, BHs disabled */
 static void enic_set_rx_mode(struct net_device *netdev)
 {
 	struct enic *enic = netdev_priv(netdev);
-	int directed = 1;
-	int multicast = (netdev->flags & IFF_MULTICAST) ? 1 : 0;
-	int broadcast = (netdev->flags & IFF_BROADCAST) ? 1 : 0;
-	int promisc = (netdev->flags & IFF_PROMISC) ||
-		netdev_uc_count(netdev) > ENIC_UNICAST_PERFECT_FILTERS;
-	int allmulti = (netdev->flags & IFF_ALLMULTI) ||
-		netdev_mc_count(netdev) > ENIC_MULTICAST_PERFECT_FILTERS;
+	u16 filter_flags = enic_rx_mode_to_pkt_filter(netdev,
+					       netdev_uc_count(netdev),
+					       netdev_mc_count(netdev));
+	int directed = !!(filter_flags & CMD_PFILTER_DIRECTED);
+	int multicast = !!(filter_flags & CMD_PFILTER_MULTICAST);
+	int broadcast = !!(filter_flags & CMD_PFILTER_BROADCAST);
+	int promisc = !!(filter_flags & CMD_PFILTER_PROMISCUOUS);
+	int allmulti = !!(filter_flags & CMD_PFILTER_ALL_MULTICAST);
 	unsigned int flags = netdev->flags |
 		(allmulti ? IFF_ALLMULTI : 0) |
 		(promisc ? IFF_PROMISC : 0);
@@ -2252,6 +2641,10 @@ static int __enic_open(struct net_device *netdev,
 	struct enic *enic = netdev_priv(netdev);
 	bool vf_mac_added = false;
 	bool clear_cqs = false;
+	u16 vf_filter_applied;
+	u16 vf_filter_flags;
+	unsigned int vf_mc_count;
+	unsigned int vf_uc_count;
 	unsigned int i;
 	int stop_err = 0;
 	int err, ret;
@@ -2347,7 +2740,6 @@ static int __enic_open(struct net_device *netdev,
 
 	if (!enic_is_dynamic(enic) && !enic_is_sriov_vf(enic))
 		enic_dev_add_station_addr(enic);
-
 	if (enic_is_sriov_vf_v2(enic)) {
 		if (!READ_ONCE(enic->vf_registered)) {
 			netdev_err(netdev, "VF is not registered with its PF\n");
@@ -2365,9 +2757,31 @@ static int __enic_open(struct net_device *netdev,
 		enic_vf_station_addr_set(enic, netdev->dev_addr);
 		enic_vf_station_sync_reset(enic);
 		vf_mac_added = true;
+
+		netif_addr_lock_bh(netdev);
+		vf_uc_count = enic_vf_addr_list_count(enic, &netdev->uc);
+		vf_mc_count = enic_vf_addr_list_count(enic, &netdev->mc);
+		netif_addr_unlock_bh(netdev);
+
+		vf_filter_flags = enic_rx_mode_to_pkt_filter(netdev,
+							     vf_uc_count,
+							     vf_mc_count);
+		if (enic_vf_uc_needs_promisc(vf_uc_count))
+			vf_filter_flags |= CMD_PFILTER_PROMISCUOUS;
+		err = enic_vf_set_pkt_filter(enic, vf_filter_flags,
+					     &vf_filter_applied);
+		if (err) {
+			netdev_err(netdev,
+				   "Failed to configure VF packet filter: %d\n",
+				   err);
+			goto err_out_disable_wq;
+		}
+		enic_vf_report_pkt_filter_denial(netdev, vf_filter_flags,
+						 vf_filter_applied);
 	}
 
-	enic_set_rx_mode(netdev);
+	if (!enic_is_sriov_vf_v2(enic))
+		enic_set_rx_mode(netdev);
 
 	netif_tx_wake_all_queues(netdev);
 
@@ -2575,6 +2989,7 @@ static int enic_stop(struct net_device *netdev)
 
 static int _enic_change_mtu(struct net_device *netdev, int new_mtu)
 {
+	struct enic *enic = netdev_priv(netdev);
 	bool running = netif_running(netdev);
 	int err = 0;
 
@@ -2591,6 +3006,8 @@ static int _enic_change_mtu(struct net_device *netdev, int new_mtu)
 		err = enic_open(netdev);
 		if (err)
 			return err;
+		if (enic_is_sriov_vf_v2(enic))
+			netif_rx_mode_schedule_update(netdev);
 	}
 
 	return 0;
@@ -3198,6 +3615,12 @@ static void enic_reset(struct work_struct *work)
 		netdev_err(enic->netdev,
 			   "Failed to reopen datapath after reset: %d\n", err);
 		goto reset_out;
+	} else if (reopen && enic_is_sriov_vf_v2(enic)) {
+		/* Internal reset bypasses __dev_open(), which normally schedules the
+		 * asynchronous receive-mode upload after ndo_open. Schedule an update
+		 * after enic_reset_addr_lists() marked the lists unsynchronized.
+		 */
+		netif_rx_mode_schedule_update(enic->netdev);
 	}
 
 	/* A PF reopens its admin channel after the datapath and re-pushes link
@@ -3343,6 +3766,8 @@ static void enic_tx_hang_reset(struct work_struct *work)
 		netdev_err(enic->netdev,
 			   "Failed to reopen datapath after hang reset: %d\n", err);
 		goto hang_reset_out;
+	} else if (reopen && enic_is_sriov_vf_v2(enic)) {
+		netif_rx_mode_schedule_update(enic->netdev);
 	}
 
 	/* A PF reopens its admin channel after the datapath and re-pushes link
@@ -3612,6 +4037,30 @@ static const struct net_device_ops enic_netdev_dynamic_ops = {
 	.ndo_features_check	= enic_features_check,
 };
 
+static const struct net_device_ops enic_netdev_vf_v2_ops = {
+	.ndo_open		= enic_open,
+	.ndo_stop		= enic_stop,
+	.ndo_start_xmit		= enic_hard_start_xmit,
+	.ndo_get_stats64	= enic_get_stats,
+	.ndo_validate_addr	= eth_validate_addr,
+	.ndo_set_rx_mode_async	= enic_set_vf_rx_mode,
+	.ndo_set_mac_address	= enic_set_mac_address_dynamic,
+	.ndo_change_mtu		= enic_change_mtu,
+	.ndo_vlan_rx_add_vid	= enic_vlan_rx_add_vid,
+	.ndo_vlan_rx_kill_vid	= enic_vlan_rx_kill_vid,
+	.ndo_tx_timeout		= enic_tx_timeout,
+	.ndo_set_vf_port	= enic_set_vf_port,
+	.ndo_get_vf_port	= enic_get_vf_port,
+	.ndo_set_vf_mac		= enic_set_vf_mac,
+#ifdef CONFIG_NET_POLL_CONTROLLER
+	.ndo_poll_controller	= enic_poll_controller,
+#endif
+#ifdef CONFIG_RFS_ACCEL
+	.ndo_rx_flow_steer	= enic_rx_flow_steer,
+#endif
+	.ndo_features_check	= enic_features_check,
+};
+
 static const struct net_device_ops enic_netdev_ops = {
 	.ndo_open		= enic_open,
 	.ndo_stop		= enic_stop,
@@ -4295,7 +4744,9 @@ static int enic_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	 */
 	enic->rx_coalesce_usecs = enic->tx_coalesce_usecs;
 
-	if (enic_is_dynamic(enic) || enic_is_sriov_vf(enic))
+	if (enic_is_sriov_vf_v2(enic))
+		netdev->netdev_ops = &enic_netdev_vf_v2_ops;
+	else if (enic_is_dynamic(enic) || enic_is_sriov_vf(enic))
 		netdev->netdev_ops = &enic_netdev_dynamic_ops;
 	else
 		netdev->netdev_ops = &enic_netdev_ops;
@@ -4458,9 +4909,12 @@ static void enic_remove(struct pci_dev *pdev)
 
 		/* Close the admin channel and unregister from the PF before
 		 * unregister_netdev() to prevent a late PF notification from
-		 * touching a netdev that is being torn down. VF_UNREGISTER is the
+		 * touching a netdev that is being torn down.  VF_UNREGISTER is the
 		 * protocol teardown operation: the PF removes all VF-requested
 		 * configuration, including the station address, before replying.
+		 * Detach first while holding RTNL so any running asynchronous
+		 * receive-mode update has completed and queued updates cannot enter
+		 * the mailbox callback.
 		 */
 		if (enic_is_sriov_vf_v2(enic)) {
 			enic_vf_admin_mac_quiesce(enic);

-- 
2.43.0

