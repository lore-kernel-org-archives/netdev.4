Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776856;
	b=oeOQVt/G81+K2ybbwv9l17gpSFU4J2jeL/NOzlBiMxrO11uFlXWmH9nIhKwsIJcItrWh
	 vAKdBa6G8Hjt15U2ikJOivO4gXtvvZI1dYFmNypG4W8JbmjO4HSRCw+tsTO/bJMCSEGSM
	 VDB14hxMAXnZ7i8dwBJZpgfJwkZzveYRVK4CiltRy1hALkncf9KwHzttGJ/Rr5futCTU5
	 XxHaWk42zhtlmvsWkgAw0VXs/mwozJCUfGeT5E3b0MmOe9v+sPeC9yFT6Sa2DB1xx11rD
	 0oin1mWxm9DyF1LBSOhdDUyvvdGQ2+Le8ZCvfesFCrfFAuqhY6bllpo8fmEW/nesWHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776856;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8A+EQrzJxMOhp05uqIiyAdwIGwBoCs9Lfd8U4FtouNs=;
	b=lxAxexzIUe16O0Uc9DoQhlC8mjSesu2TSsbsH5nRfikR4BeRJs+SgZjd+uDxzW0QOxbj
	 s4cE6OxqhyN/lCWNdQHLwsLnlv+bBwAuXSu8UrIAyDvKN1TYkp2sn5IDiOJWWNZd6Lcji
	 ngYLOK7udwF4EFEJIiJIILt572uQfYvZJE/rLvjC9hYlfLSwuz7UGq5505DmM8MlVFhzB
	 rVGpsgruXHUnaXIg5QzM7Kuzso1/WpsLf+M9IwR32CN+JyLv3QYM28rNuNggWCCRPH0Vu
	 WoXVxkE17Sda7+Y2+Ora2JFOUG5YXclKeopz1Dt5M6apyVsYSmoblrX3Mb112GXVgmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=roQiyCLR;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3073E606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 10:54:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3073E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=roQiyCLR
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-14394530ec6so1886871c88.1
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 02:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795776855; x=1796381655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8A+EQrzJxMOhp05uqIiyAdwIGwBoCs9Lfd8U4FtouNs=;
        b=roQiyCLRC4uvpI5vicgQSn0D6YDyr292LYaiB4arRewxkM5Kko8Be0nR+WndvstWOF
         qUxf8uhP7eGSO9j/ADZoYb6YeHrZk11DlnJTD1p/K+VC4ELbctqXUHFFy5L3iVFlpUyH
         l2mG+tdARplQCQrasDGvJAVDkcvG96MUEEz8EwD8FLTbmTZf36jgpqF55mhWtu8rfPMe
         ovKCgBMixV6+0uL61QLUJRnAkAZn6y5JmldEPDa6FbDPUuutuC5Hb6Q5yde/oAu2PChD
         sAQAi8JdcC1lV3a3xNPR8OdzRW56V79t44RyhhP8SwaSxuxt0iFbOJ8WpLVQuSeIr2Zm
         cm9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795776855; x=1796381655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8A+EQrzJxMOhp05uqIiyAdwIGwBoCs9Lfd8U4FtouNs=;
        b=Xo2IjY/GFBplHE1bYlqs8O5yg15XI582w3MqdLRwf/ilS/tHbG6ZpMtd9mZX9bb2Hy
         QKKlF3chPL6YvRI0vpdCn8a4pe/8ZKk4HZoSb1PDujxtGQDbQaE7lPmzP71I43dTVXEj
         zhXaZYn2zdEHKCpTFEqPoBETwMDWyCT63h5L4n//U5Q9jUxuf3CMYhLrTiYwijyH++Lv
         hmZP+WbDaT6fsZuGKXqzDr3m7Hw3MFXz4ivNMB88v7KAfEu0YUgK4Kuqk1LFdWt9G7+c
         FWDsBIh7jQIehHgbq2JxQT1ZCv96XQIMg2ywl1GQI6zsdVe3cQqo406Af0i1bRcsR8GJ
         kH8A==
X-Gm-Message-State: APuU4Z+pS2OPxKfMRyleP0HA2hvROpLCqSr+Z0uCydZlwoOe/d5SG/n0
	ESy0A3uuFxC5xCaD3qiJgzD4EYVezNsCcbLHDlY23YDliZKvhrAxIMZCA17MBg==
X-Gm-Gg: AZFdTZei/l/RGuXuo1S2XI6ku1Gh2oPxeaeQYDC8J21NVRhldyeqiN0ZXtezQ9wn6+o
	GzpZp7Wf8HzRgFSqFiXYhrFCOn+TInCRlaJ1qYho1NY9clYSJNReScMy7pYZBIUAXxAMh02Au00
	oeds9ypDip8VW2EcZQp06fmCCgpNFtg/WFgM3qdW1N29/vUVKBZKlHJw6KjKMRot0v3j4TvzqFp
	dTFhFZTlDZjGwwtgkjYHMoQh0dhj23/WretN6HWytNlRZcBj7uHZJmqagygd31nMKrGbflFy+L3
	S2LjTk+nSa9Drz9bG46xiX1DzbkckoatQKWG9SZO5vhcAUB5W7o9AwtIChiZPUnqnJLJiWAaZBR
	AlSuZi3t1lqNjFGd+pHe6mebEVHNMTqsN9Ckz3lPY2ZlLZHL1xAgQzMOUhztdtjW9LSKuNhr04g
	ef5vHyIxzTNraxzCQ4edM+6kQc6LJMLz3EdfNmBgvOsQBGd6EwCiA6jVfbGYQ1usSiqzuUvc+ro
	eWyHmVai5+IpDPzxRIKA6QJs6c89ebLD0r833Er2z9llnnfuQjswF5wvDff2ED0j7fwQ2gcoLxw
	K181q76VvaZvWw4eVVTA/wDapO9hFT9PNiWEn/mfJjW5DRvGS/IbRkVAduATNU1b+ICCb2noFJi
	gtdz0+x1ESSjuxVYNoH+L9/KYovcZpPEDM6yZgTOqxgWsrWHm9NqrBvJdGsKLRvhd/o+/RV/+
X-Received: by 2002:a05:7022:3f01:b0:160:90a3:ca8c with SMTP id a92af1059eb24-1b55689f73amr27029644c88.7.1795776855158;
        Fri, 27 Nov 2026 02:54:15 -0800 (PST)
Received: from localhost.localdomain ([38.114.108.154])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm54992326c88.2.2026.11.27.02.54.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 02:54:14 -0800 (PST)
From: Jason Xing <kerneljasonxing@gmail.com>
To: willemb@google.com,
	magnus.karlsson@intel.com,
	maciej.fijalkowski@intel.com,
	sdf@fomichev.me,
	bjorn@kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	Jason Xing <kerneljasonxing@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net v2 2/2] xsk: fill in header offsets for TX checksum offload
Date: Fri, 27 Nov 2026 18:53:47 +0800
Message-ID: <20261127105347.72997-3-kerneljasonxing@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261127105347.72997-1-kerneljasonxing@gmail.com>
References: <20261127105347.72997-1-kerneljasonxing@gmail.com>
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

An XDP_TXMD_FLAGS_CHECKSUM request is turned into an skb carrying
CHECKSUM_PARTIAL by xsk_skb_metadata() where csum_start/csum_offset/
ip_summed are set.

However skb->protocol stays 0, the offload never actually reaches
the hardware and checksum ends up being computed in software every time
(please see skb_checksum_help() in xsk path):
1. harmonize_features() strips the checksum features on devices.
2. ice_features_check() rejects the frame on NETIF_F_HW_CSUM capable ice.

The frame layout comes from user space, and request.csum_start is
already the offset of the L4 header from the start of the frame, so the
transport header is known exactly.

Only the L2 length has to be found, by parsing the Ethernet header and,
when present, the VLAN tag stack. skb_header_pointer() is used for that,
so it works for frames whose data is not in the linear part of the skb.

skb->protocol is set to the outer ethertype, as the rest of the stack does
for in-band VLAN tags, so skb_vlan_tagged() and vlan_features_check()
keep seeing the tags. can_checksum_protocol() and the drivers get the L3
type through vlan_get_protocol(). The mac header is anchored by
__dev_direct_xmit() in the previous patch.

A frame whose L2 header cannot be parsed, whose L3 type is not IPv4 or
IPv6, or whose csum_start does not leave room for an L3 header cannot be
described to the hardware, so it keeps being checksummed in software
exactly as before.

The patch is based on Maciej suggestion: 1) do not rely on mac header that
probe in AF_PACKET uses, 2) use skb_header_pointer and walk vlan tags to
inspect the accurate location of each field that existing drivers
possibly use.

[1]: https://lore.kernel.org/all/arKm5gCaERk6MaGA@boxer/

Fixes: 48eb03dd2630 ("xsk: Add TX timestamp and TX checksum offload support")
Cc: stable@vger.kernel.org
Suggested-by: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Signed-off-by: Jason Xing <kerneljasonxing@gmail.com>
---
 net/xdp/xsk.c | 47 +++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 45 insertions(+), 2 deletions(-)

diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
index 52d538160e0a..8f566996a6dd 100644
--- a/net/xdp/xsk.c
+++ b/net/xdp/xsk.c
@@ -11,8 +11,12 @@
 
 #define pr_fmt(fmt) "AF_XDP: %s: " fmt, __func__
 
+#include <linux/if_arp.h>
+#include <linux/if_vlan.h>
 #include <linux/if_xdp.h>
 #include <linux/init.h>
+#include <linux/ip.h>
+#include <linux/ipv6.h>
 #include <linux/sched/mm.h>
 #include <linux/sched/signal.h>
 #include <linux/sched/task.h>
@@ -1027,9 +1031,48 @@ static int xsk_skb_metadata(struct sk_buff *skb, void *buffer,
 
 static int xsk_skb_sw_csum(struct sk_buff *skb, struct xsk_buff_pool *pool)
 {
-	if (unlikely(pool->tx_sw_csum &&
-		     skb->ip_summed == CHECKSUM_PARTIAL))
+	struct ethhdr eth_buf, *eth;
+	int nhoff = ETH_HLEN;
+	unsigned int l3_min;
+	__be16 proto;
+
+	if (unlikely(skb->ip_summed != CHECKSUM_PARTIAL))
+		return 0;
+
+	if (unlikely(pool->tx_sw_csum))
+		return skb_checksum_help(skb);
+
+	if (unlikely(skb->dev->type != ARPHRD_ETHER))
+		return 0;
+
+	eth = skb_header_pointer(skb, 0, sizeof(*eth), &eth_buf);
+	if (unlikely(!eth))
+		return skb_checksum_help(skb);
+
+	proto = eth->h_proto;
+	if (eth_type_vlan(proto)) {
+		proto = __vlan_get_protocol(skb, proto, &nhoff);
+		if (unlikely(!proto))
+			return skb_checksum_help(skb);
+	}
+
+	switch (proto) {
+	case htons(ETH_P_IP):
+		l3_min = sizeof(struct iphdr);
+		break;
+	case htons(ETH_P_IPV6):
+		l3_min = sizeof(struct ipv6hdr);
+		break;
+	default:
 		return skb_checksum_help(skb);
+	}
+
+	if (unlikely(skb_checksum_start_offset(skb) < nhoff + l3_min))
+		return skb_checksum_help(skb);
+
+	skb->protocol = eth->h_proto;
+	skb_set_network_header(skb, nhoff);
+	skb_set_transport_header(skb, skb_checksum_start_offset(skb));
 
 	return 0;
 }
-- 
2.43.7

