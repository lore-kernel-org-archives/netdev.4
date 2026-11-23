Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467365;
	b=O7Y6k/gOjKMIpCuEyr2/TeEbaftkpYFaHFuNvni99+JgbW3nyE3mb3tWd8GRfpT6DRQ6
	 uP+Nav6NkecYYrMwWqpqHwXcBeG2VCQU0f89rskKPw4E8odHc2moD6jnQQJ3NQr3em5JJ
	 N+j3fXHTgMCcSLX1AhOGy31e0Y+lEaQmsjYy4ljoEh3o2UQpBir5roRKA5PtzVx1VhK9/
	 NSkkDakPgSJQOAts18O6EZgtPxBA0iJcqhK3Jw+Vm06P8ekMRGv9b5WZKujknt+YjwPNu
	 w/hvjb0WBfrsD0Ehfijp+jwsmN5wjcrwmUAfRc8UiEBqh7uFuS0+S0dZCO3johPK3xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467365;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=WPZXnFL2dxCsHKLyRCX5HTJ7jpEYoJWDerjYBwz6GzY=;
	b=kc8JsO8pihgXqPOQtbKX4r0aAWDsNGHqLXpe7lD4fvoP3Wt4hCJ5VlkX6e90ClOid+cf
	 Fxj2HPzw6MZmOS8b2NsRi29eHOchwwkV1d2Js/feBe3N1EO+EZ/ABb3q3K5fCGo2sciEf
	 cVzkHHya65z6/6ej7BLheXaDbUO8zChTRW3EU5k80AmWFLEQmCOCfvXV2o2RUL3TJZWGA
	 sGuAaekpCSapw11EfpS/cyUJYCnf+RWeyvLUkv72F8Dp+qFeh7iyny9j2yqlbY4UawaEu
	 OfR9oqkirce6fN2QJONKsmm0uZ5SqBCfa/HwPqI7bskWGUz2koUJwFSqMchWn/KzD8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wl040Y4S;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED28E606A321
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 20:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wl040Y4S
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79F351F000E1;
	Mon, 23 Nov 2026 20:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795467364;
	bh=WPZXnFL2dxCsHKLyRCX5HTJ7jpEYoJWDerjYBwz6GzY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Wl040Y4SnoATIo+6LbctZXVaSCB3N0b84Ffa1bd0+t3ZVsKrOuFN7lKQ+m2LSB1dn
	 Hplt7Kmaxncg27V5jllxDLHNcImNogb0C2Bf5dXPu75galxViHR7kng/MF24QC0fdj
	 AwezSANldUR0+XPBm2yKpsdXOvyGW7ov+V3Dp2rPOgUIyIOxcdKnvbNBGfhCSNg6ZV
	 nETvX8vuJrGfDuQx0QuO48Q5mQ4CZR+7IJRUpG9yCKiSF7vk7qAcJjq2weA1f/dygk
	 ZkeJ69kjeA61PPECMCyovjJwK+9vdd56m3bnQgvirnOuRDE2A2vpM1/uqln/NXidST
	 T7mzy1PbuOr4A==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	ahmed.zaki@intel.com,
	jacob.e.keller@intel.com,
	intel-wired-lan@lists.osuosl.org,
	anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net 1/2] ice: don't unintentionally switch to symmetric RSS hash
Date: Mon, 23 Nov 2026 12:55:59 -0800
Message-ID: <20261123205600.1794292-2-kuba@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123205600.1794292-1-kuba@kernel.org>
References: <20261123205600.1794292-1-kuba@kernel.org>
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

RXH_XFRM_NO_CHANGE is 0xff, ice looks at this field to check if
RXH_XFRM_SYM_XOR bit is set, without first checking for the
special NO_CHANGE value.

This causes any ethtool -X invocation without explicitly
specifying input_xfrm to enable symmetric-hashing.
NIPA HW tests catch this, and we have been carrying
this fix in NIPA test branches for months.

Fixes: 0dd415d15505 ("net: ethtool: add a NO_CHANGE uAPI for new RXFH's input_xfrm")
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 drivers/net/ethernet/intel/ice/ice_ethtool.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_ethtool.c b/drivers/net/ethernet/intel/ice/ice_ethtool.c
index dffa213734f1..8f13b7607c9f 100644
--- a/drivers/net/ethernet/intel/ice/ice_ethtool.c
+++ b/drivers/net/ethernet/intel/ice/ice_ethtool.c
@@ -3681,10 +3681,10 @@ ice_set_rxfh(struct net_device *netdev, struct ethtool_rxfh_param *rxfh,
 	     struct netlink_ext_ack *extack)
 {
 	struct ice_netdev_priv *np = netdev_priv(netdev);
-	u8 hfunc = ICE_AQ_VSI_Q_OPT_RSS_HASH_TPLZ;
 	struct ice_vsi *vsi = np->vsi;
 	struct ice_pf *pf = vsi->back;
 	struct device *dev;
+	u8 hfunc;
 	int err;
 
 	dev = ice_pf_to_dev(pf);
@@ -3703,9 +3703,12 @@ ice_set_rxfh(struct net_device *netdev, struct ethtool_rxfh_param *rxfh,
 		return -EOPNOTSUPP;
 	}
 
-	/* Update the VSI's hash function */
-	if (rxfh->input_xfrm & RXH_XFRM_SYM_XOR)
+	if (rxfh->input_xfrm == RXH_XFRM_NO_CHANGE)
+		hfunc = vsi->rss_hfunc;
+	else if (rxfh->input_xfrm & RXH_XFRM_SYM_XOR)
 		hfunc = ICE_AQ_VSI_Q_OPT_RSS_HASH_SYM_TPLZ;
+	else /* input_xfrm == 0; core rejects any other value */
+		hfunc = ICE_AQ_VSI_Q_OPT_RSS_HASH_TPLZ;
 
 	err = ice_set_rss_hfunc(vsi, hfunc);
 	if (err)
-- 
2.56.1

