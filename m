Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539958;
	b=4kURG36PLQBlAMzcklt0Q8OjqpqX2dZV/XmdFjeTPT7DnCbtoAnA+64dDefAhwpUrGfo
	 BaUxm6iRSM+pUu/sCbc67dFTAmK7qMU1oNBbJ2+ZkSdeu1cTMwNfdhIjUdmvbIkHHnrva
	 MvrohhMglDsD3iTy5idMwzfFVraVKtW7lmDP08mItjtIB0x70KX7lgkFU8A70zD8onGlN
	 j4WNlgaDlohmseeij4UvHWBnhLc4VFDh0nuWUs81ztZ78a+GV5Ia/I/aBzp/MGdOBTWzC
	 d+fXQvmm/NsBgFUaPMVY5l4gUya/XnMxSl1eEUpJEZFqo8MgDybVSOjai5MJYZq1jTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539958;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=C5GXYiW6k+BWgvwshtn/SHTQSnyqRtCeD3B+3rh5aiM=;
	b=GR7sICzl5fVYTqswmuRtblcaAh2RrNdbEYwIkX9bxJj+FKuyGSnRV3TtKHkJniCK/y40
	 2hhCbLqjwOsgOfBOXRvNt3YZoYzVYJ1E1u9L4Yr0edYjio5uCtLqRX8yQ/5Rsm/ewpKO9
	 hSc/D9C0BE9E484l227Qvbm7C7/ugGk6XwmM4h/I3eHHp83QRZfMTS/g0OYTlmxGVZd5M
	 CchZm6UDjh79a+G0aLnwjtQ1i0I0KOKMJnpOf4aN+o273l/5q3WY8TpHSFy2Ww7upgT3E
	 2t5DiGM9NOQrLaK+f8FW+Bp7n7GPZec7BYKHpY7/1HCw/5qz1QrZVxPc2jRe3po3Cww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i1Hx3jeM;
	arc=none smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A45606A339
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 17:05:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89A45606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i1Hx3jeM
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-9213922de73so82891616d6.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 09:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795539957; x=1796144757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C5GXYiW6k+BWgvwshtn/SHTQSnyqRtCeD3B+3rh5aiM=;
        b=i1Hx3jeMqojfFyoXk1r3KJarFIXDJHCVbhD/XBy5CGrQl6G/MSUAzndYdPVujlKcFQ
         Z6ft+bEN12aEGYOb5677IKlzgVYYD7aPsViiErzVODarRQjBBYK22UZTz2QlAVPCF0aw
         SLJVr78WGMF0ecNWdpb2f8XwWa+7IVItJzq4l6XkG08DQXT5m/psybfuKx7tmxb73kiA
         ilMvzu1COwAsfl/CNI9+jql+JEn3FGfFciqLk/DI8pIH+a7wvDJ0g4kmsx/aKud130xa
         ZpnA/KIkqSdNLNXlpDua2FgH7Af0lJvKbLZcJ4tUmEepyW2GOxj0e6+CDKTrN0PQ6Yb4
         0prA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795539957; x=1796144757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C5GXYiW6k+BWgvwshtn/SHTQSnyqRtCeD3B+3rh5aiM=;
        b=OhiYi2ndnEvckkh27CDOedVTzzAhYkzu/N9GBVy7hOdIl5OTeMbtchbXkK/c2MK9mA
         TtQTsyb++SpQqmulaB+tda63+1cyICSIXLy1Po6iGumkE3Epfdl9pgHn5DVDq6dqBxWP
         7DHlSfsnLBp65HOTT2aIrCJca/MR+IGbMQIMb592LJorcxMCvayocys8o3KD67n2qKiX
         E0XqHe5zWiRigMFkpgFToQOSBlgpWV/MeJ5QxVPVb5DOP9l5+pLSmisAPGhoA0G567Tv
         MEkYwXFRcj7lrT6fPUQD7Ry9l45k+ohNN/Kz2GMlxUqQORrZMOOAC7GrP4NRKx7pSr6D
         sXhg==
X-Gm-Message-State: APuU4Z/3+TgaRlFjqhWKDurQ7FEfwFJpHnrb1sAAp5mvaV+PxVEtYFYz
	mGrGdfwGAcJgMRZSbyWEYkloYody5wyBbE53Z9FBIEZB8ApqRzdqXjBDjhkQlg==
X-Gm-Gg: AZFdTZfAPgpe6AVCM+R5Dd8ooBMVe3UrgzG6mOTaNpUoLKMvWkjmzpUbp07J50KHAiH
	5ErIlYeQDCNW1qatjZNgVMlzioR1ezXmCRaZMhmO6liogbiVqFk6Oo/6SvkdssNmYIFT1nv6C0o
	eEs5dSC5rjwG8Ww6swftXb5KjJ+AidERXwt5pFiQcL6o0NEj+CVsOCK/M+cQ3YlCg34ct7yyPNc
	hlHa4GNcK3Ul/1e3VmGH6F54mHZDr4k0E8tLwqLq/OwndG0X+fLee3ck1c+EyUt/MMoRzhtNNcn
	6z421MDp3mRBYU81c1upac/TnwdzMt9/FRfcdkEFSnlNqTFavKcjX4/qFNFFzsmFdOoovZzcmpL
	RsO/hQO+LriiBL0BKY2ZoffIF+KI+KCiz4EA5qbVjFc5wqcF84m4HRPvFelQx2tka5SmujTGPQY
	7iirqS4ujuejdNTz89Af+RyQWIPFR8WscY74GTjvhHAuenvJGJcHA82JU+krcquNcVj8OdjOyTn
	aHaRV2jmG0ubALzs35NIiovAyfEJFJOygJBtGRtzrspRVVChFztWLLa+lMRpnAByKoQ1LXl4vuo
	1smxK67YtUj1S4XVCAze8ey+gNHg4nPsuoX/pOqWkASw8s0R5hdLiG8lU1GxmmAshGSDhyv43WJ
	UrJ8kO8NbG3cA27/j6+6q97U1duq+cgD9OVVrAn/W0KMO/xYHBcEwh//ia+NGldcZDjj4NmlaPN
	4dh6hmZLS+Cg==
X-Received: by 2002:a05:6214:4e81:b0:91e:dde3:f213 with SMTP id 6a1803df08f44-92134b0e48dmr234538756d6.40.1795539957246;
        Tue, 24 Nov 2026 09:05:57 -0800 (PST)
Received: from willemb.c.googlers.com.com (15.60.86.34.bc.googleusercontent.com. [34.86.60.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349cdfbasm140078216d6.17.2026.11.24.09.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:05:56 -0800 (PST)
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	elder@kernel.org,
	Willem de Bruijn <willemb@google.com>
Subject: [PATCH net-next 1/6] net: ipa: remove ethernet-specific artifacts from modem netdev setup
Date: Tue, 24 Nov 2026 12:05:39 -0500
Message-ID: <20261124170551.1874487-2-willemdebruijn.kernel@gmail.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261124170551.1874487-1-willemdebruijn.kernel@gmail.com>
References: <20261124170551.1874487-1-willemdebruijn.kernel@gmail.com>
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

From: Willem de Bruijn <willemb@google.com>

Commit 75944b040bbc ("net: ipa: open-code ether_setup()") open-coded
ether_setup(), including fields that do not apply to this headerless
ARPHRD_RAWIP device:

- min_header_len = ETH_HLEN, while hard_header_len is 0
- an Ethernet broadcast address, while addr_len is 0
- clearing IFF_BROADCAST | IFF_MULTICAST, which are never set

Remove these and the now unused etherdevice.h include.

With min_header_len left at 0, the device behaves like other headerless
devices (such as tun and rmnet) in af_packet's vlan_get_tci(), where
min_header_len == hard_header_len instead of returning early on the
mismatch. Normal IPA traffic uses ETH_P_MAP rather than a VLAN
ethertype, so it is unaffected.

Cc: Alex Elder <elder@kernel.org>
Signed-off-by: Willem de Bruijn <willemb@google.com>
---
 drivers/net/ipa/ipa_modem.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/net/ipa/ipa_modem.c b/drivers/net/ipa/ipa_modem.c
index d84c1dbd3b1a..e8392d9d3a4f 100644
--- a/drivers/net/ipa/ipa_modem.c
+++ b/drivers/net/ipa/ipa_modem.c
@@ -5,7 +5,6 @@
  */
 
 #include <linux/errno.h>
-#include <linux/etherdevice.h>
 #include <linux/if_arp.h>
 #include <linux/if_rmnet.h>
 #include <linux/netdevice.h>
@@ -223,15 +222,12 @@ static void ipa_modem_netdev_setup(struct net_device *netdev)
 	netdev->header_ops = NULL;
 	netdev->type = ARPHRD_RAWIP;
 	netdev->hard_header_len = 0;
-	netdev->min_header_len = ETH_HLEN;
 	netdev->min_mtu = ETH_MIN_MTU;
 	netdev->max_mtu = IPA_MTU;
 	netdev->mtu = netdev->max_mtu;
 	netdev->addr_len = 0;
 	netdev->tx_queue_len = DEFAULT_TX_QUEUE_LEN;
-	netdev->flags &= ~(IFF_BROADCAST | IFF_MULTICAST);
 	netdev->priv_flags |= IFF_TX_SKB_SHARING;
-	eth_broadcast_addr(netdev->broadcast);
 
 	/* The endpoint is configured for QMAP */
 	netdev->needed_headroom = sizeof(struct rmnet_map_header);
-- 
2.56.1.839.g22a8290db9-goog

