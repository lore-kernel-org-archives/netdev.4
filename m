Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710757;
	b=cEBe56/9gcM7y+QycRYow8/UzFM7VWojArGF+mPqxVm0n5OpkcTjDrbQiMANnBiK/DCL
	 /RzVAplioR6rkXVEQ8Yh3IR7Zsg+s9rTfq462U9ABQSwlIRlrvQu6OnDFMyr/Jfdyo1lg
	 v3RoNXuP6d331t4mSYaqrMIQbt50TksoCdKD9joVnSXwnQXV9/P1IZ71Pg9UIHKrdD1q5
	 ax2zBysfox6dWmI5jw3RfFHnQbPWE1FHBwVlQVH5/uetEp4Zedrphj2GN+0cQuLiTioud
	 NkeYKtWx0SkuGLjkAI+yOzuBFuAyVc/HikYzaqQ1YV/haHeLWTGi8eWRrDggumpIeSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710757;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=gggQmselow1OIKJXlpQdyAeyuxvsBBp9k1tw7ivcXSk=;
	b=Xw5kFlnM+LuG11NTyse7ARkd0HdD3HRknGMD1shS/NrOMmIXHA4UuHRyAn8v/Zphdn8k
	 22Th7XJqU55zWESI/qq/OLS/JgrpMwm5gKN/C24h/q/6xAtmiui1Oo2I3qlwgx1pxDpi7
	 Ju7mcUWc/Apuf5IBfWh7TSZKEniN3sMg44P3RTPbD1+7n6n0aVnhOf4EjFnYB6/RiGOUV
	 5FShOraVFM3CpK1cKngtSTxWrfxo0OqeeEnne6A1+SwkN8kX4L/eDUazTkBhKWWAlOL0a
	 OJLbB7SQRi8x03OZ9nHBy4KQRS+TdliWeup7TKPySO+bjO5TDqCnmZ6SJ2uKXISIl/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=lAFfrfiZ;
	arc=none smtp.remote-ip=195.10.208.51
Received: from mout-b-206.mailbox.org (mout-b-206.mailbox.org [195.10.208.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68168606A331
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 16:32:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68168606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=lAFfrfiZ
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-206.mailbox.org (Postfix) with ESMTPS id 4jb2C05ptGzcs;
	Thu, 26 Nov 2026 17:32:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1795710748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gggQmselow1OIKJXlpQdyAeyuxvsBBp9k1tw7ivcXSk=;
	b=lAFfrfiZRPyzU7UkkvzNI/TWZ6bKe6JaCTPWf0c1lftJrCN+v+s76Y92utbf3oiFfamM0T
	gIR14uguRsFb74UWzBAevnak0xw3HojOaQ/CHdhzFDDDC85QaDEpxv+QoZsaq6JOKH5QHJ
	xbaulLKXPEs1ssRnCRnymI4czORcyqJGMeqjhhbi9tEe+w/XQMZyteoFtkD2iO4yP3mMEO
	tMRwdkHT3UuY35/aIyvXGvOWZnvc/lEEzeKLnC/0yBLDoTQ3EGmd9WDRL0KTmHqinlk6xb
	oJbJKmQSuY/RlP/G/KgKD987lmJPS4t8B8bcUt+9BP1hQWiMLiXIpm5t+a3SHg==
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
Subject: [PATCH net 6/6] net: qualcomm: rmnet: unlink the bridge from the vnd it is attached to
Date: Thu, 26 Nov 2026 17:32:19 +0100
Message-ID: <20261126163219.1744750-7-antonio@mandelbit.com>
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
X-Rspamd-Queue-Id: 4jb2C05ptGzcs

When the real device of a bridged port is unregistered or moved to
another netns, rmnet_unregister_bridge() unlinks the bridge device from
the real port's rmnet_dev: the vnd created last, never updated when it
is deleted. If the newest vnd was deleted before attaching the bridge to
the remaining one, the unlink reads and writes the freed net_device,
the actual bridge link is left in place and unregistering the vnd hangs
on its references.

Reproducer:

  ip link add v0 type veth peer name v1
  ip link add v2 type veth peer name v3
  ip link set v0 up; ip link set v2 up
  ip link add link v0 name rmnet1 type rmnet mux_id 1
  ip link add link v0 name rmnet2 type rmnet mux_id 2
  ip link del rmnet2
  ip link set v2 master rmnet1
  ip link del v0

Take the vnd from the bridge device's port, which records the one it is
attached to.

Fixes: d939b6d30bea ("net: rmnet: fix bridge mode bugs")
Signed-off-by: Antonio Quartulli <antonio@mandelbit.com>
---
 drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c b/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
index 2ff4b9519139..96129101e477 100644
--- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
+++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
@@ -96,9 +96,9 @@ static void rmnet_unregister_bridge(struct rmnet_port *port)
 	if (port->rmnet_mode != RMNET_EPMODE_BRIDGE)
 		return;
 
-	rmnet_dev = port->rmnet_dev;
 	if (!port->nr_rmnet_devs) {
 		/* bridge device */
+		rmnet_dev = port->rmnet_dev;
 		real_dev = port->bridge_ep;
 		bridge_dev = port->dev;
 
@@ -108,6 +108,7 @@ static void rmnet_unregister_bridge(struct rmnet_port *port)
 	} else {
 		/* real device */
 		bridge_dev = port->bridge_ep;
+		rmnet_dev = rmnet_get_port_rtnl(bridge_dev)->rmnet_dev;
 
 		port->bridge_ep = NULL;
 		port->rmnet_mode = RMNET_EPMODE_VND;
-- 
2.56.1

