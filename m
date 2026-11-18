Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795027216;
	b=DCl0U0J/fudBLqqx5gTALvUQnxxaAUUg6wnFhLsHdyqqM3ZJXuubkqRXO5vyomQBr7NW
	 OeB7sOt0fTRX45hUsSBXoJoK259D5QlYMrx/bcAx/6VFQCc3n+uMG3mlHv735S/bTB6xr
	 s1qwqdOGG/tj4JVX8wxgKT/drZmJwLTovAsHyXicLync/chMQdhVcF5RyxutmU48h37rt
	 Qaj/QNuE8rrHqwpZjPQpYChJOUnuitBLOsEyd3uHefK1YcgK6YAVvfmcKg+t9C89r9rqY
	 NiGI+6RfNzGk0GqngovIMECNwSbOcjgAiaSbvhHNQIWohI7akeUWMvh8od0pZ34RzGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027216;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=cxcci//GRMEdhKx1M6RiDiJ8JPsYH7BK12DQ2EXCG+s=;
	b=uuZTY+on02xZ4fP2yuhnW8ciP5Cde8X4DdjwwEsEhgxqUdPZxkBvz6QWhvNFwlpQlfY0
	 wsNnzFbF5C561Bo8xVN7o2Lzh6WVhvFUsdaezD9rPlUALTObQTChEBI9Uzb45edFHXWhy
	 RZ7i7VxCLmmKyxXJoh8ZOPdN5Z/+1h76Wfq2j7BeEK02rq7zKHYAY17g4uhvaVRDWmj13
	 YSvir72MwfEm69Ycbmt/O8AonyAIPeE9AsxBdIFIXRnK3s7weyjx0P8ECbEF4yPEp/rPx
	 3dEbE7dyL2vz7DS54TRb1BW2xHC87iLTPDsHVk6A4wWuZiby1H293fSfKi55ETrUsYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Xf0YQygw;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9FF606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 18:40:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB9FF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Xf0YQygw
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cdab938dc83so755332a12.3
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 10:40:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795027215; x=1795632015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cxcci//GRMEdhKx1M6RiDiJ8JPsYH7BK12DQ2EXCG+s=;
        b=JOloMj7PbwudG45cDtwOzLPvyBLBAKJPsCqDN06+0G3CmIfBqQT15aiCmLlUpvvkul
         pV9nBXzRoh92fB/Z7eltgvaofdtaHZLrtWbP8e3Yt7yPQOp5HpHsSj1g2PoRs4EXeHFD
         UfYdT12bBZp2GYujnTcMOERn7ZvmmYMLnpqmJkEjO3uUmJevrZtBy8PaUhXGPurcBHHX
         /sVmyNsyIP7yIwEafM5HDzILsq9wB9Jwc0RIhSqal7H32uqsBK2m8KJBD9mEd6H3K32q
         TlNFiL5RkY5UMRsgynMcjVNzV+MjqhEcZTH5E4uyb+yfI3EE7b/2clU/Hq2cUjIjxTHn
         ossA==
X-Gm-Message-State: APuU4Z8Y4NEvruVtudIDN0lCAAi5qDaPj2jBzQX2xdZ887/EJcPqBonS
	1qz9uaZwE9T3GYBe1jyaWXp7HAo+6MQKnoGqQyOKYOCd5eJjBb4MLwQIzFCUdP4QHuNfcR5ove5
	bq1ZosNlVOBXp58HvvgQeEPuTrQmP/cTiInp/58+E6lJEmEg38LcJUpV0SZsOqJzmWPTcVwEqYV
	vJeh2hRirjE/kKfgFzLyXkXuA2BfOrSoNN9/EtgMcr1bp1N2GwFoGBUMqso0WwlhB++HUmVhhRs
	5qktLutnswTUb9g
X-Gm-Gg: AZFdTZfZN9dLpYQeEToSsrph55bVUPLJpTgQt6ya1hct4UtH0sSMAfbmM/8aXMmpSdk
	Vi9kcHj5Y4ngZ4z6oIlea24zsJglLnDa3YIuFEoDnFmKa/j+5ObERn68sG4djigIzOF0z4w8lmH
	r/W9c28LgjbHUaCV58tlvPAOkAPD2jb0Bg0CZEsHZTIT6ZUNsG+e/u0Do4/8K3lcOQ6Ykl2JgO6
	t/bod6piaH9SQuCPDThARBrKlYk2VEBhCVndAoIStTsAtFDHCeI+ZkJ0OiyVvZffJbG2pKL3Ads
	2m4N7EENiYoV6+E1h8q9JLPVX2A/w9/0SCH4b2G0N2qSWdJUi/HhWAslO5TZdOhdjga0LxNFNvS
	INkCrNg6bAkh90bwrPH/JKjCKLQHfb7LmIq5IkRSLLpCokickKHB+Lo3Z8h/qu0x2TY2cvl8XRu
	N/uK7yvEx1yUHRUYpU27Z4zTmTa+uWAVwMxT4PPBKP3MQ=
X-Received: by 2002:a17:90b:1dcb:b0:3ac:9259:122c with SMTP id 98e67ed59e1d1-3b3d07d3d01mr3290337a91.40.1795027214672;
        Wed, 18 Nov 2026 10:40:14 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3f6be27ecsm205971a91.8.2026.11.18.10.40.14
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 10:40:14 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ae1d132d52so980868a91.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 10:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795027213; x=1795632013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cxcci//GRMEdhKx1M6RiDiJ8JPsYH7BK12DQ2EXCG+s=;
        b=Xf0YQygwF/l1nypK4WSpBObGAEFMQFq1dQOy8siRYe7eTeZKJAv0rD8B62DCU3QAM5
         r4NYTDNvIhq7GbsbjlEPbr0hJKlkfzxmxHNU52+tDAu+V7VTn2VmJoxIRWKj/j7q38k1
         X2e/tgSvhrJQ6dyYt0lB6G9UQDGnGk3bBFekg=
X-Received: by 2002:a17:90b:1809:b0:3b3:cae0:2b68 with SMTP id 98e67ed59e1d1-3b3d07d4653mr3503197a91.48.1795027212902;
        Wed, 18 Nov 2026 10:40:12 -0800 (PST)
X-Received: by 2002:a17:90b:1809:b0:3b3:cae0:2b68 with SMTP id 98e67ed59e1d1-3b3d07d4653mr3503171a91.48.1795027212295;
        Wed, 18 Nov 2026 10:40:12 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d56a3f93sm2428978a91.2.2026.11.18.10.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 10:40:11 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net] net: dsa: tag_brcm: fix link-local detection with a prepended tag
Date: Wed, 18 Nov 2026 10:40:04 -0800
Message-ID: <20261118184004.1916105-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

brcm_tag_rcv_ll() checks eth_hdr(skb)->h_dest to avoid marking link-local
frames as forwarded by the switch. With a prepended tag, eth_type_trans()
sets the MAC header at the start of the tag, so the address checked is the
tag plus the first two bytes of the real destination address. Link-local
frames such as BPDUs, LLDP or EAPOL are then not recognized and get
skb->offload_fwd_mark set, which keeps the bridge from forwarding them in
software to the other ports of the switch when it is configured to do so.

Read the destination address after the tag instead when the tag is
prepended. Tags embedded after the source address are not affected.

Fixes: 762e7e174da9 ("net: dsa: tag_brcm: do not mark link local traffic as offloaded")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
This change was a result of a Sashiko review on this patch series:
https://lore.kernel.org/all/20261116222519.1416501-1-florian.fainelli@broadcom.com/

 net/dsa/tag_brcm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/net/dsa/tag_brcm.c b/net/dsa/tag_brcm.c
index b7c49822ca88..b58669c92147 100644
--- a/net/dsa/tag_brcm.c
+++ b/net/dsa/tag_brcm.c
@@ -149,6 +149,7 @@ static struct sk_buff *brcm_tag_rcv_ll(struct sk_buff *skb,
 				       unsigned int offset)
 {
 	int source_port;
+	const u8 *dest;
 	u8 *brcm_tag;
 
 	if (unlikely(!pskb_may_pull(skb, BRCM_TAG_LEN))) {
@@ -184,7 +185,11 @@ static struct sk_buff *brcm_tag_rcv_ll(struct sk_buff *skb,
 	/* Remove Broadcom tag and update checksum */
 	skb_pull_rcsum(skb, BRCM_TAG_LEN);
 
-	if (likely(!is_link_local_ether_addr(eth_hdr(skb)->h_dest)))
+	/* With a prepended tag, the MAC header set by eth_type_trans() starts
+	 * at the tag, and the destination address follows it.
+	 */
+	dest = offset == ETH_HLEN ? brcm_tag + BRCM_TAG_LEN : eth_hdr(skb)->h_dest;
+	if (likely(!is_link_local_ether_addr(dest)))
 		dsa_default_offload_fwd_mark(skb);
 
 	return skb;
-- 
2.53.0

