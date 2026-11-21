Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795222097;
	b=TCJRoyYcUdIR+1LndV8KELOKPqIi12LvByPX1r4Q3+VNXLT+FfHekeJgwBWWmKlpAELD
	 q8iCwKsOB78JrPtazBvJLw0GvlW7W7ZYLTvF/g2aJo6CCruBhWibTqc9NrEnMScw+BEme
	 PijnTSnaO/26rxlU6RB9aPtI6uBGtgagYeMuqM/SXkQLV08pgWXALP1c9IUdYlu5d2Us+
	 Xt8ST+YD7Bo72YaltebXppDzKOqrJvvWaNCSilNZIrL0MXUF69Hi4n2UExDRZ9xHmHHmH
	 5j/H/0mDUS/BpJV1u84RbeL0ic6nUrpTxDynw6NSIGbOC+oaVEVvUKU62yPqBszaeJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795222097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Fq7eVjoo8xJhvVi6unc9XNet04qh3ukyVn0blU6xcQE=;
	b=3CfQ4+qOXrFeRbcYbKYlonu2gov0h44ztjgFpFpBPnnx1L60vGXSyCZzC4ghBVIS/bFc
	 Y1evf7fGD/vTUD9aHF87D3Gz2fCBaVP40hspKw6rn8UZdo7gXlzBHV/3ZTrbX8fig90ZM
	 tIpW4XUvfly5eX8nTT7IWPt+H23jl5Cgulacfh1miHeGJoyQYuCLP0h5iWyuJx+itpU1s
	 vhHRUpntvV6PQI7R8+xalAR3EHwfZohOAtbXhCZp1YFlvU0Eqk28tklIlAd0TK5Y6RIY8
	 OQ1Ug3aadf70UtF7CU1viOO8bZNKNotyClPJaWm0cYMPe4nDTj2CzNabBMPNLI2vSrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nA5j9l9T;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9629606A68F
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 00:48:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9629606A68F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nA5j9l9T
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-14394530ec6so2286953c88.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 16:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795222093; x=1795826893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fq7eVjoo8xJhvVi6unc9XNet04qh3ukyVn0blU6xcQE=;
        b=nA5j9l9TnGc2ofeval0osHGmUatRVHuC8h0ZfCjdiPWL3Y9CHH92zy44+m11tG2rNZ
         K477NSGfyzi771sxhkbfg+0x2TNan+31CnZfDU63lgXOBN9U7T3JKS4fjsdkCdFq1+0Z
         Ocq0MU3C4/yBBFmPNJuTkD7vnTJsZdQc9f6ffCmuDF+jNNMtcBOI91weecfXpidcm2NR
         JS2HS2JIUVTyE336cVaJurB7FjkctiFWvKxpul+Uj+vR7WaYu1S1oFWLHZW5tr6P1k+G
         EegYp0ijOlXJdL5D8pNKBFZui/ohUjCA+ttJuBw3KPzmKSvmsmUPNVsy25gGbo9LyZqE
         qnHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795222093; x=1795826893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fq7eVjoo8xJhvVi6unc9XNet04qh3ukyVn0blU6xcQE=;
        b=o+TA7kyhQP4xrjFjPn6rSOZLwy0N8lMY0mz211+Lme3Ow+8r2vTs5TFd5z781oIuhy
         xCCb2JLAvR1TlrBHHY1Sb31uUB2EFpwOTr0jWodJk7JKiiZmRs0niZwlOzOsaKSRA81k
         TVqgHktht8YmUIIQ/Gvkat8WR6M5J1z2WExj3qRj6db0XSuDMRd9LDpdQrpBeqBuYW70
         eXp0WF6Vt0ZvyJ3JAJzpHbsPKXGKLJjrpviBPm2kcurUoWnEvHbU/68bUqA3yRAoA6Ql
         U7sxLRadJ6/TlMSJPBSm3ZokWBTGSCIgzUOLIrxGvqK65eFFEi3VXqL/X3W+lAt+DucV
         7JtQ==
X-Gm-Message-State: APuU4Z+7U9upeZvHXe+iPPFNHv4KopEdXqQJ8M7Bm5VYpjt4UL6zBYtE
	JVErdxu7LfBmxTtahm/LNSkOXqVHSGcFSBpMXcW+hWHyT5Tm2EH9fNyKBRzVdQ==
X-Gm-Gg: AYBFou0+UYl8So+9WVxYabg8t0WB2xoWLMzsKHwoV8qA2PQfEUT6JBGTBROb7O6fzVZ
	5zbD6drN58QieeB/Cvd1TyH6T4Uzj1n67waLp84K8YdGZsoml74MFmJQWn1rEOhsic1x6lcJ+1j
	TBel00LCP6/OKcEr1SAGp/QWufLJyJIEe8TBVs6o0nhYhrdJQBw0UBbohiutGrBqS3XJ72VP8KD
	A06GMkAqwisiOKHj2XsCs9ULqlmU6QtexwFWQmAKyLPLX3kmLZZrVlk0vrpUeWYDPE2ByT5089b
	1AcDFpIgHx7VJivZVmFzYquUUgIWC/zKUeoVgyMloRNlYWP+8Pmj/sy3aft6yMYPmgLWT1Eg4Dl
	5zhJ/n/UzJ2GKkcLxZl/fVfkc2x0Gcz+zPPUDAuBknQnyxbcZ9C/xtOZm971vUn53NVz90J52y8
	Tzgs/U8Pn/BEi+2wWC+5OjT/6XjRan2ZgHfmCovY/s0bJjDM2sFGun5xP1nVydVUo4z9AuCWtHj
	POYJErbJbA4jK+YHHHsHQN46FdeYkN0Vetyr42wmLBpc8JCfidjZIlsc/pSKXCiC7KFVYGZaw5W
	DRDmWj9c
X-Received: by 2002:a05:701b:2804:b0:1b5:434d:b61b with SMTP id a92af1059eb24-1b5568cd633mr3993249c88.22.1795222093072;
        Fri, 20 Nov 2026 16:48:13 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm11462472c88.13.2026.11.20.16.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:48:12 -0800 (PST)
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
Subject: [PATCH net v4 01/10] net: au1000: recycle RX descriptors on allocation failure
Date: Fri, 20 Nov 2026 16:48:00 -0800
Message-ID: <20261121004809.1690280-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121004809.1690280-1-f.fainelli@gmail.com>
References: <20261121004809.1690280-1-f.fainelli@gmail.com>
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

