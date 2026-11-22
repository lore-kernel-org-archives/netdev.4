Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795339097;
	b=VhOxc8zXj2oldoGYtJ+PcROsIVGS4lHyNAQB2SIKGThkLxM/EXkj0WxaOZXH4dgfmznn
	 DRNiIt9i0ZKez29Wsv5fk5S8+wwVKQt5Y80ybY3P8zlEg8OeUQeJ+N/kvoIOgGoMCJcbw
	 ev1gADG5VrDMstlly+hr8fp3DvrLtOEyzcvZjyyEMUSVzI4BCg+RuQ2Ln+NrS1sSAAI1G
	 1S2fnmZHherRpI/3iFabwI7Clil4S/eTd/nHfWcdNnzYAeeGBurPU9NJkfDMJOCtIZ0m1
	 rJAKOHg9qttMyWrDKoXlK7t8/LtNPqAKWs/61ohVOpJSwxFWYu4vjc+In8urPkHWTOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795339097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=IwI7KfDCoyMhSFpWFFdovIBGOt7mqZWWABnzRAhh+wM=;
	b=a4JVVO1zTknbRffa8Wzui2ZB1SNXMs3kr3eYUA0IK/y5LgGtXNQE97LKpZ7In9Wo/N9h
	 B5Sw3RgW4vyncX3K3GMb/EP0P/5it/MdPsAHuzt2qO00N+jFXqfVyClnMhPaRc4cG08pX
	 uB0vlbGZHIg5gaDJHjHernHQLKdz7JO92kDoD4Vllvv1UzB/b7XK7+r2sAEVxC+2tcx4Q
	 /zp5badoPZEB58Ai7RcP+l8gsE61OxOp4m+tbfr6W6WSKzBLd47RIoftmfkZKupmCfHnO
	 TA5iRxl2HkPj8HAPHUibATSUb3tgPn86JF2wlRKABFw3LOSi/r6kl0vTjwmMKL4fyyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V9cMwuul;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE840606A32A
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 09:18:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE840606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V9cMwuul
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-490d59c3edaso1529399f8f.1
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 01:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795339095; x=1795943895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IwI7KfDCoyMhSFpWFFdovIBGOt7mqZWWABnzRAhh+wM=;
        b=V9cMwuulIstoK3uawwD0uEyU8nq10rn2tL38TroU9iVprlNWVXTIf9L5epKBa5FMMz
         ZA4J0+BObH4XgjQYDumd4fa+iQY8zMrvcHa1qcDiM66YN6fxKB+MOqk5noZwGi1hq6/k
         IxhmoxDzXjlc10rkz4YmVfMeh5hkILg3t3VVF0dDBsAWCd9EhFhsNdiIrDarf0pvAqwc
         eX3Z/hb25Yd0ruvMSoFfs/AsxxcWPLMuMN2+j7IRdWg+cs9uP9DlLlCwyArbks9TywLG
         HOedlurIDentM8BQeqt+XB/mcBtEGwycStlw2qa4XYOf4w7QSLRPxm3ashS2P81eDha9
         TOvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795339095; x=1795943895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IwI7KfDCoyMhSFpWFFdovIBGOt7mqZWWABnzRAhh+wM=;
        b=H3oA4IDgu9+F4Cyhqw2HQbQAZfWa4Q1AC5vklvt1pgpus2KBbgjBmWfiVxBSpZjyU1
         vtZ2vS4TTbAcCDYiScCDCFNJ/HCalsTFDzVE+hSIOc2JoZxjLO1XTEWV9hd1NJMgyaMV
         5rJ16zPDbZKXcuT1yjZtN+/jQspMZt8NdS0c6NkSDflZNezNEDiUDupy2926KAKcwP4r
         ic0s6938xmzKxMGhHCpt7UCD+/9dh4B9d/GtnJIoDCek7k2cmIn/0oAw9OUieDBv2b9W
         dAuBYHPWBq3Ds9n5QhTHfP08o+gVCkWAL/qB8WCM+Uap8+hk0FGddy43pQiF9EDFtQXP
         2geg==
X-Gm-Message-State: APuU4Z9KnqnAFKFAab8TR2B0Gwqn7Pp4817Rv5gszzzzWlIPHhr+nddg
	PohJX/PaDHb9lxnND+E51WABH3kS868CBBpaaO+DHko828ZlUG3xx2PQxau0Wip4
X-Gm-Gg: AZFdTZdRqlGiymEYjI9VocX0erHuGAJKyzkZT8u7WXiLvWCCVGg7angHcABVpTFwJZt
	j7hhk5L34Z2kAXY05lDc/8fRmy04Je9wJvhDA1pfWbC9zM4Sml5DhKZbrxwYuSjxvJBDOUQG7i7
	si59zY2f5xDK1XKFGCc07broWzYQzuqYVbuLxYyqX7i823MjqhGPpvSyDCVOysTXSxby6OxCHyi
	4CyNtTMbp3onY0mR9DRJA7xo2pcvY8qZqf2gdZ3ABbHFfqq7X221hvVZ4wgxWGT+C7kSEwkBpMN
	8NzXBEp4jZW9MrFGyhWJaIsrvNtbpgvxjMLsvveMwyRc9F9AwXPNSlVU33rqPX9JSAJlrcRVww6
	3F3+nho6hYTLoe8nCKCtEfu5jDHTXg3a4n9g4Z/dwbAo2p4hVjry5aB4te/JJYK0xxSog4JhIIJ
	+ZcWsor1S1UAmdZWyV9WZm0PJefSw7udHNwN6qvKeFYGPjZQowfyThiGkb64s3IhpttxOtU3I6n
	51EJgsjJsU0VM//dzZIVysdh2X99iqRk+henbrAytdfqGipveX3+A1knmiOnXYcQoAflkXkEcpq
	TrUxds4pMeCACBiip/xDwTQ8NiWvonIKju+mnwtNHhk7LH4NvXbpLH0fYdrlPBa1+hFM1HhqPIA
	cdhtuFDi/6EvIi9a1X1E424b45bbEVNOXp4y0vu9jS6XKb4z2XGcRP0MxnkblBNf+LbOEZ67t5P
	rcwuxGsw==
X-Received: by 2002:a5d:5d87:0:b0:4a3:2ac:26a4 with SMTP id ffacd0b85a97d-4aa58527c76mr24388328f8f.23.1795339095019;
        Sun, 22 Nov 2026 01:18:15 -0800 (PST)
Received: from qblck ([188.130.155.185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb41f4sm15320792f8f.7.2026.11.22.01.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 01:18:14 -0800 (PST)
From: Artemii Mashanov <ralerrdirsardx@gmail.com>
To: netdev@vger.kernel.org
Cc: Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2] net: bcmgenet: reject undersized RX classification rule buffers
Date: Sun, 22 Nov 2026 11:22:22 +0300
Message-ID: <20261122091748.18292-1-ralerrdirsardx@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The rule list can grow between ETHTOOL_GRXCLSRLCNT and
ETHTOOL_GRXCLSRLALL. If the supplied array is too small,
bcmgenet_get_rxnfc() currently reports success with only the rule
locations that fit.

Return -EMSGSIZE when another location cannot fit so callers can
detect an incomplete dump. On success, continue reporting the number
of locations copied.

Signed-off-by: Artemii Mashanov <ralerrdirsardx@gmail.com>
---
Changes in v2:
  - Retarget to net-next as requested by Nicolai.
  - Clarify the commit message and drop the Fixes and test lines.
  - No code changes.

v1: https://lore.kernel.org/netdev/20261121001550.732679-1-ralerrdirsardx@gmail.com/

 drivers/net/ethernet/broadcom/genet/bcmgenet.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
index 6545caf..a84c8ce 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
+++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
@@ -1664,7 +1664,7 @@ static int bcmgenet_get_rxnfc(struct net_device *dev, struct ethtool_rxnfc *cmd,
 	struct bcmgenet_priv *priv = netdev_priv(dev);
 	struct bcmgenet_rxnfc_rule *rule;
 	int err = 0;
-	int i = 0;
+	u32 i = 0;
 
 	switch (cmd->cmd) {
 	case ETHTOOL_GRXCLSRLCNT:
@@ -1675,9 +1675,11 @@ static int bcmgenet_get_rxnfc(struct net_device *dev, struct ethtool_rxnfc *cmd,
 		err = bcmgenet_get_flow(dev, cmd, cmd->fs.location);
 		break;
 	case ETHTOOL_GRXCLSRLALL:
-		list_for_each_entry(rule, &priv->rxnfc_list, list)
-			if (i < cmd->rule_cnt)
-				rule_locs[i++] = rule->fs.location;
+		list_for_each_entry(rule, &priv->rxnfc_list, list) {
+			if (i == cmd->rule_cnt)
+				return -EMSGSIZE;
+			rule_locs[i++] = rule->fs.location;
+		}
 		cmd->rule_cnt = i;
 		cmd->data = MAX_NUM_OF_FS_RULES;
 		break;
