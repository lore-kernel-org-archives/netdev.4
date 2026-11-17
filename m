Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943949;
	b=pbSj72XhJk5lyY+8cWaOp3C+eOuD/GKS9hGgUSEkMHebXuONnGbwjipzYYi9mZJumcGO
	 M7X2+P+K4etPk72J3LZsRMTGry5gjncp/m9BAwA8rSY2N1xNTjP3mkwibj/1Kft0dSciY
	 0Rw7/0d8G9e+2FIQdVEN7jYuPIx2WWakJgF3EmYZLZJeGesKHR/okcTQMwyMeIOdEIAGS
	 EVM93rdGsI+P8LoCMIBaG6YEILYZ6AvlYKtXfDBrVE9yqQYk5SxWiCSjqebB1ihuttBP6
	 hQyQ/MWgLmG2JnFG3aiCQm7BIdVwOHFia1lG1uXR4LKKpPa6UlxITfF1KpFokvOR94w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Fq7eVjoo8xJhvVi6unc9XNet04qh3ukyVn0blU6xcQE=;
	b=sgsGKWyGyVzQlXCp+GJ0DToVcgp0rsW+U5B/uEgRdUF4BPZ4EPGeiNev9DerBOJc6qiQ
	 ZckNIRR0pbrJBeHeXCutgUVGf7KyYMoCK2PViJwOg63r2cY7Ax5EzXxghZQCNEE1eZcDJ
	 QSDrmf6JmOXxLUyy110XJjiOlp4tKm7TdKhFeJhudia8oHGTt97auEUFw/SfhoI5Wo/qC
	 KzEjP0KLth2sB53j0cHYJV3VGc9kPShKxlXbrF+lh/L0kqUd1U59DWdjuJI6e8mHhnO2v
	 u0R/IT4JL7aa3w97pTIGA3yXamqpcQAuZOzvzPsqaaOEkTcGAzR9nRBlayvk3BoZmHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l7rU9mx9;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658DE606A33A
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 19:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 658DE606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l7rU9mx9
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-37071c0f42aso451366eec.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 11:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794943949; x=1795548749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fq7eVjoo8xJhvVi6unc9XNet04qh3ukyVn0blU6xcQE=;
        b=l7rU9mx9esX/eI1IaDJbA5n/H7+jLp3L/sXmkp3A/y4wj3ouiDun6uGM83b/7CMfi0
         wrlTCn4p/0BK33O7WVg7wug8WXBOd95fWGOMupWRnJGiFnh8JuJjbdO2gRo281Pzwb2K
         a7iKbFxRWnA1D5CxP0lEZnt/aZrNnxQ4WWlWRHe20qlKAjfX2kPQwoVxAhS+Xr4lxygr
         y836kjL+4ZLL+sxTtvYdJMIVQdj3EdSNd+ungXdbas8FNzmJn4ZDsJji+CouuMvVmlRa
         D9030Uy+YNJcKTP0/JZ3XrDVCKOvJAqUoH8tq5mpbJcdK5OuNSyTgv/TVCIdA7VRTSt7
         Em6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794943949; x=1795548749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fq7eVjoo8xJhvVi6unc9XNet04qh3ukyVn0blU6xcQE=;
        b=Yn61pKEG93f4oU/EahTkX10JwZ0Fx5RJmM6lMSXHRdGs1AuJBBU/Um+HBLdoCDj+3z
         x3KzcQeZzVbiVCggcQF07nxMLib4GqmnIwzhTWHEyzSaq60NMmwg2l92quZK4pWLWLOq
         hu3vCGMS7fQxIfTRejI2P1vJTykzqXR2lzloZxFNQStlCWxGgjJNKLcufBv11XCJ9JVa
         P8DTHDxWBbO2ZFyJsgEq8Yhg/bSWS69RiVDDwxECYEnAFPfo2AtdQXtGkCf8qwx/mQbR
         HPTmO8KkhbvFfKEuvBvX/R3vV/ZGIpKkhe9QriuYGHlJjB53H/Ms71js3hT1EynxAGb+
         Tf5g==
X-Gm-Message-State: APuU4Z9a06ArF/NGkggORGcJZyDl/uCqnt9sW/UsYkmKdGIjfNSM1JzR
	Fy5x13YNZqJyeuVLAlJKG/RFfeRv8nownkofw4pBjBka0KpAarBCXpm921NCXA==
X-Gm-Gg: AZFdTZdRYjgAXpg4DbQ//gkQSCabLDBWe4G7QmI46WagW4M1laM9yaxn9cUjwYIOCXJ
	BKVgfR+3iwmzQkU4r/b+Rbj6D5HbU6atG45o6EAw/vIdphaC5m6A5x9HA1/xqmO5BFIX4BtdrAs
	4XGWV8NIYIH2tYXlH58PF8q3wZ91ujh+t7RtzFrNCZ2eoCSKH5oHcJnNle7ITAelF+W4aWbF/sO
	OQ7RAqGoArTfy9vLM/hAdjnKLQeuB5iMbQMpxsLUZ0qPRejIn78pa9b+0T2hMhLNWw5sJ+bcNAi
	OYhwtkSF/mRX6TGv6CKUshleDUxCSPUCTamT0jDTow5gpf2/Bj9aF8zN/KqDjY+sfsmYzrNNfEW
	f0iQN1hT23PkqLZzr3YqpNqJk5hO0v9h/+RbLuouUunT+Y6jYOl91XWduVBPYd1ThCAsHuhAUPZ
	7CT7oMcBsud5srBMBnIbvgk72Tdi3f2+AUOTOT9Bjlp8ENSXe/xymu2e5yJxkwAsJcalq+GVKUr
	QkU2uKNu0MInTMFJOlS/LyT/ck9KitIPdFB0HPYKTcEUY/FhDe20+8rZ/2dWo7JGETjXG7o4Tqb
	W0s4YTpEuInCloeKoeeaz3Bjb/MYWg==
X-Received: by 2002:a05:7300:f408:b0:369:f035:661 with SMTP id 5a478bee46e88-38280a3c1f8mr420676eec.15.1794943948629;
        Tue, 17 Nov 2026 11:32:28 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63059e3sm173376eec.5.2026.11.17.11.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:32:28 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Jijie Shao <shaojijie@huawei.com>,
	Simon Horman <horms@kernel.org>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	David Yang <mmyangfl@gmail.com>,
	Herbert Valerio Riedel <hvr@gnu.org>,
	Danny Kukawka <danny.kukawka@bisect.de>,
	Mugunthan V N <mugunthanvnm@ti.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	Manuel Lauss <manuel.lauss@gmail.com>
Subject: [PATCH net v3 01/10] net: au1000: recycle RX descriptors on allocation failure
Date: Tue, 17 Nov 2026 11:32:14 -0800
Message-ID: <20261117193223.2795612-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117193223.2795612-1-f.fainelli@gmail.com>
References: <20261117193223.2795612-1-f.fainelli@gmail.com>
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

An skb allocation failure retries the same completed descriptor forever
in hard IRQ context. Return the buffer to DMA and advance the ring even
when the packet must be dropped.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/amd/au1000_eth.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
index 8682323d693f..cd25248f4e3a 100644
--- a/drivers/net/ethernet/amd/au1000_eth.c
+++ b/drivers/net/ethernet/amd/au1000_eth.c
@@ -788,7 +788,7 @@ static int au1000_rx(struct net_device *dev)
 			skb = netdev_alloc_skb(dev, frmlen + 2);
 			if (!skb) {
 				dev->stats.rx_dropped++;
-				continue;
+				goto next;
 			}
 			skb_reserve(skb, 2);	/* 16 byte IP header align */
 			skb_copy_to_linear_data(skb,
@@ -820,6 +820,7 @@ static int au1000_rx(struct net_device *dev)
 				pr_cont("\n");
 			}
 		}
+next:
 		prxd->buff_stat = lower_32_bits(pDB->dma_addr) | RX_DMA_ENABLE;
 		aup->rx_head = (aup->rx_head + 1) & (NUM_RX_DMA - 1);
 		wmb(); /* drain writebuffer */
-- 
2.53.0

