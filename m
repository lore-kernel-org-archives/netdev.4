Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.38.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454323;
	b=qXQumCEycdlYhgUWjCw7+ne7Dbgfl8XOBGeyP21+mtdHWbARR7NHXXwLUokiH16NhwSm
	 VwsKBEFF+ctZ5C2W+0Ji8r2yHvM89rUSzj1xVZseJGu8jbs8Ni7mjpSl4Y+z0PBaPDL8b
	 OkPFHp3j/XItuJy9GPOoHQNJw0JBpPK5fMbNQymYEQrioxLrtxNRYWBQJVXXTkMSQeln8
	 SmBntiH1TtGTrPMw6T1ld72ua96ivOUUdiKVCWxuBRB2ad7JEDJAg68u+ReNExod5e8dL
	 fYB21w80PSId+B23bFhj/oxrrd9rnzyM7jwYp3SgOvVahIT0ezYG//SYeC807gHJ6jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454323;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=89BApgqYz11D87S6DGoBfXEeIp+QnnRQ5WgQc0ueIG8=;
	b=evZu44ZYeAhdt8QinAGOJNv5USl6mIvOg15fPGwziyT0jYOzqak+sqTe8yyX3aOsCgGB
	 b7aMM8gH5lanXBtvNRwrVcVcyhTUYVXmf5J0MgnQFu5SOzIkt1D4Ky9gfXnWm6YJqPU0N
	 wbX7Fq98qs60NJuJ8KkQFJMlHnakWxESptJdETBJSIzjtcVo9a13BQNAI6hEnrdHnzYDV
	 W3xuz28kzwYzSO28kc7q6ppaYuYdQfcNG3kQKENC/QYS2rpk0CRLJ4tD3NtdzD9AZynP0
	 drRdSQ1gAK4e0LC2r83EOHBQAXycAOP7cR/lD6jITV9ImDBmmJdMYZo93jGYmSsq7yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=simonwunderlich.de;
	spf=pass smtp.mailfrom=simonwunderlich.de;
	dkim=pass header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=I94oO1lJ;
	arc=none smtp.remote-ip=23.88.38.48
Received: from mail.simonwunderlich.de (mail.simonwunderlich.de [23.88.38.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 0ED61606A698
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 17:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ED61606A698
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=I94oO1lJ
Received: from kero.packetmixer.de (p200300C59714c2E05a704819b6BA2db4.dip0.t-ipconnect.de [IPv6:2003:c5:9714:c2e0:5a70:4819:b6ba:2db4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.simonwunderlich.de (Postfix) with UTF8SMTPSA id B0D82FA384;
	Mon, 23 Nov 2026 18:18:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simonwunderlich.de;
	s=09092022; t=1795454315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=89BApgqYz11D87S6DGoBfXEeIp+QnnRQ5WgQc0ueIG8=;
	b=I94oO1lJGCg5mBC7Zh5cqSF9BEsjLdkYXz9GdFy6WWR6GnpBlezc8a0oERv7+Ur2NN9DF5
	mEqXYaZ+VArgNRPz/xX0E5HVUPiOIqClSc9V6Qscux9b1x2WPyaKtACLvmOsA5ZwTunhLd
	gnS96YKeCdl5aQXDHHnWJoITbMT+T909wH0n6g7M0w4l+bp1WknIuYN8XDb1yYMefOoLEt
	ejrWV4GLryD/vQ9G0eXy9TdoTHpkL1GFpDico+iC3/lHLwl3aml9YLhsP/TVcyMw9al2kK
	Kut1XzgN56CME7PKQHt5oa7WtBWuPYMV2TOE8yZ/9DuWWnxABeS9fVuV4FE9Hw==
From: Simon Wunderlich <sw@simonwunderlich.de>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	b.a.t.m.a.n@lists.open-mesh.org,
	Sven Eckelmann <sven@narfation.org>,
	Sashiko <sashiko-bot@kernel.org>,
	Simon Wunderlich <sw@simonwunderlich.de>
Subject: [PATCH net-next 04/15] batman-adv: bla: register own backbone gw when claiming for local node
Date: Mon, 23 Nov 2026 18:18:16 +0100
Message-ID: <20261123171827.3294525-5-sw@simonwunderlich.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123171827.3294525-1-sw@simonwunderlich.de>
References: <20261123171827.3294525-1-sw@simonwunderlich.de>
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

From: Sven Eckelmann <sven@narfation.org>

batadv_bla_rx() claims an unclaimed client (or a client which migrated to
the local node) by calling batadv_handle_claim() with the address of the
primary interface as backbone address. batadv_handle_claim() then registers
the backbone gateway via batadv_bla_get_backbone_gw() - but always with
own_backbone set to false.

When no backbone gateway entry for the local node exists yet on this VLAN
(for example due to an earlier error), the entry is therefore created like
a foreign backbone gateway. No initial announcement is sent and the entry
doesn't enter the BATADV_BLA_BACKBONE_GW_UNSYNCED state with the startup
grace period (wait_periods and bla.num_requests). The following call of
batadv_bla_update_own_backbone_gw() finds the already existing entry and
returns early without fixing this up.

As a result, the first announcement is delayed by up to one BLA period and
multicast traffic is not held back while the local claim table isn't
synced yet.

Pass the correct own_backbone value to batadv_bla_get_backbone_gw() by
checking whether the backbone address is the address of the primary
interface.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-dba9d95d-5eeb-40fd-abf4-e054aee1f735
Signed-off-by: Sven Eckelmann <sven@narfation.org>
Signed-off-by: Simon Wunderlich <sw@simonwunderlich.de>
---
 net/batman-adv/bridge_loop_avoidance.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/net/batman-adv/bridge_loop_avoidance.c b/net/batman-adv/bridge_loop_avoidance.c
index 68ff2f94cf49..3da070a087da 100644
--- a/net/batman-adv/bridge_loop_avoidance.c
+++ b/net/batman-adv/bridge_loop_avoidance.c
@@ -986,18 +986,22 @@ static bool batadv_handle_claim(struct batadv_priv *bat_priv,
 				unsigned short vid)
 {
 	struct batadv_bla_backbone_gw *backbone_gw;
+	bool own_backbone;
+
+	own_backbone = batadv_compare_eth(backbone_addr,
+					  primary_if->net_dev->dev_addr);
 
 	/* register the gateway if not yet available, and add the claim. */
 
 	backbone_gw = batadv_bla_get_backbone_gw(bat_priv, backbone_addr, vid,
-						 false);
+						 own_backbone);
 
 	if (unlikely(!backbone_gw))
 		return true;
 
 	/* this must be a CLAIM frame */
 	batadv_bla_add_claim(bat_priv, claim_addr, vid, backbone_gw);
-	if (batadv_compare_eth(backbone_addr, primary_if->net_dev->dev_addr))
+	if (own_backbone)
 		batadv_bla_send_claim(bat_priv, claim_addr, vid,
 				      BATADV_CLAIM_TYPE_CLAIM);
 
-- 
2.47.3

