Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509345;
	b=XiaNSgHB9ksbd4fxRQeSAgC+ZgmdM4+zwNd60N4mYf93f1pk84PScF+pm2iqc9xK572D
	 YsQaMkMwKh9Httu6YWOzaFC4x/gHC8QfHzl+pbGcR7to8CzdvtSUp2BhMZG9wrFPfa6vh
	 SIplP9ps7DkeWVZUH3SjiHvhI1HU8mkgjXVhL5qQ8TweWERy/ogbHNrD7fEgFV7n3wO+e
	 xVtCgRCVznZ96QbmejvwWp5s7fFF3XjGyoPb/qljGLComghUE98cWFz/rt6PWyY74cdhC
	 47JRqsbtOtHmHqUrccVg3nFOnaEmxttYYNhNl9vRduPsci3kNaBuFf5P3XDAz7e9Mnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509345;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=CvPBfBZyrWo/IURjWNoOSH2bYaPSh+KUwqyaCMmfae4=;
	b=LfZBXmnm/N/7u0ZfjTPcYTl7LZgA3WXFMT+nz0J8V2VWMuZjIDAoL1QmZEMmEWyY0n0o
	 3s8pPYXOwUeiRZmvD+BgkSXcXGE5xNT+c5BLSUv1e3LoFQswLz8HZ6LqicGupSNTfJX2H
	 OGFUXx6E9e6bH62y24KwUCIkUVyaN2nC3gGZF+sTvy0/oKgDWeZCcIEcJAxNziM2Jx9Ur
	 1MDGXCFWa/ygXOlrSSkHvu7bvbMTNZ9690mxCp4GTs//Uq0ILYkFSNFjPsWs3+9RtIMpl
	 SGHKzv00MO7lFzBVQna8a2sseU9tIXNqqVWUY+/3T0K3wA1UgUgqsXFMmw139M59vbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BiDm7SXd;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB99E606A33C
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 08:35:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB99E606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BiDm7SXd
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33fb4680717so11286718eec.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 00:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795509344; x=1796114144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CvPBfBZyrWo/IURjWNoOSH2bYaPSh+KUwqyaCMmfae4=;
        b=BiDm7SXd0FZcFuAA7mPowtUz3t+gCus/FpUals00iUR4Rxq1X/PCGRPOVzYmxWGTNb
         xlKvf0OVES+TriacQ3hV0ZEpcmwwBCvZN5n4FftfaDUe+hT4ovb7jSxT1LNNHHOak3pS
         D94SVu4y6lKy7GPZoPb3xfKghkpcWBO0EuzHJJh+uNQYhmtpAqLwJTPf2ku2BV8xEkzF
         XFH6DrPQyG7BeJ5VCd8vSnflV1pG0X5XLhLbVX+t+kPpaav0nFulscHdrO3hoTO8ORmf
         sBpbcmVViHjrmYtufIy+YhsFVKodxa7IhJsjzSmUR8RCH031avwKieiIHIRnHgTgDFan
         1itA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795509344; x=1796114144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CvPBfBZyrWo/IURjWNoOSH2bYaPSh+KUwqyaCMmfae4=;
        b=JTGq3Y01WWGlIBYp5NfP8ZFHIJajwKQ2VXEm37vV3ljcNQhWGDtDbcmvoPfPph90FS
         QWaZG+uZ6MpWXDN8RbwnbFdT+FTpHP1jBkGRc8YhWBjOP8jhgZt6eGpItbb+5wOn7jQX
         ft4bY1qZe5BVcXYXZN2DupIKXnYUiczPv6FeUZHEln0QQ3eq0aAhDyGoLuasASlio97Y
         tSTXrRf7x8fCrQMY/s4heEyY/4T+gS4QfCktdl7iQ+7/tCjnxjuAX7fFING1gnmMxDfD
         /ZtBegEn3dI+9DgE5dJlSUav4uvj+ZBsuisDgLTzeAfR15+JmA5ajNQRj7zOdUaBmSyr
         SOug==
X-Gm-Message-State: APuU4Z80E/UhpUjLs7uAPDo5kyuesvfkqiD+WBzUytaVsING4T6nQD0e
	fVrTqCnKRih7p3ZYH3BM3xWzCanYY4VfLAwbFJyBNYqjMVVl6hwXkWBk
X-Gm-Gg: AZFdTZe9PQQ0uYMqZCSPwfwW1QvWZPPHkuLdLsvmhI8X6kGtfaOVrlvQand5exTloz1
	7ijUya6qqEAwA22MEHKYPt84QlbwbotAwEJzdGsbnN2r2GiWfK3sCJGVu1R8X/F1CH6mOkfXBS4
	0WbxANKXgW4lmsMBnJZ74rGiGbyAdb+nxbXZwZDhL4Mo6SdtBmrBRfyog2lAr0nTXo2hCo2550N
	GJrhzK3tc6SKGeN9TAumOYaUTz3TzesaEQEZAWCM8USSmDGCGqlmPthX9072TSG40mdnwNBw/Ft
	m9Gd75Nxgs9odP4xbdFOmYf+25Ky1QqnaJtN1E9lnV84WQecHfmOLVHqwHDA9J4uBF6MvZLz7HY
	XQmiUbYs9N7wt/ys9PCqU3k61VNs5DviU3JBw3BWkIef/iripbDWnOKdVecY4RNa6GWGwm1ro81
	YeaZKDHEhyDMvdlmtLIIXNBZJZ7sfM0OSu8dOxPhe+825tNZeUju3o1QtcYEldB/qNqGH9mcQQx
	eD2EtMp3HI80ydPnbcxi59XnA5OYA7LKb4RIZpQXQKXruVQXgqTTvC+zSBGCjQky4py5t/T6MCw
	DAWEeRgq6cIAF7kmaX/GfP4jGGdB+XJsCm5pricTYm9YwpuTNfHbGvDI01pOejldKJHRs5hutJW
	nlfSsmBsRHbN8qdQTxBSiRtWLO3TuNObuy8fH0bzKs37nAVM+UqknluOMwo30VipauruNjE1hQT
	jP3uQRKdOGFVz/ebrdX9Y=
X-Received: by 2002:a05:7301:c016:b0:386:5adb:ac01 with SMTP id 5a478bee46e88-3865adbb1aemr14055119eec.24.1795509343906;
        Tue, 24 Nov 2026 00:35:43 -0800 (PST)
Received: from localhost.localdomain ([38.114.108.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm50849718eec.10.2026.11.24.00.35.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 00:35:42 -0800 (PST)
From: Jason Xing <kerneljasonxing@gmail.com>
To: magnus.karlsson@intel.com,
	maciej.fijalkowski@intel.com,
	sdf@fomichev.me,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	Jason Xing <kerneljasonxing@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net] xsk: fill in header offsets for TX checksum offload
Date: Tue, 24 Nov 2026 16:35:20 +0800
Message-ID: <20261124083520.45547-1-kerneljasonxing@gmail.com>
X-Mailer: git-send-email 2.50.1
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
ip_summed are set, which will be handled in the csum offload like
ice_tx_csum(). Drivers like ICE do read network_header/transport_header
fields which actually point to the wrong place, leading to wrong action.

The frame layout comes from user space, and request.csum_start is
already the offset of the L4 header from the start of the frame, so the
transport header is known exactly. Only the L2 length has to be found,
by parsing the Ethernet header and, when present, the VLAN tag stack.
skb_header_pointer() is used for that, so it works for frames whose data
is not in the linear part of the skb. Also, initialize skb->protocol
because of some drivers (e.g. mana_start_xmit()) using it.

A frame whose csum_start points into the L2 header disagrees with its
own metadata, so it is rejected and dropped instead of being handed to
the driver with a layout it cannot use.

Only Ethernet framing is parsed while other device types keep existing
behaviour.

Fixes: 48eb03dd2630 ("xsk: Add TX timestamp and TX checksum offload support")
Cc: stable@vger.kernel.org
Suggested-by: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Signed-off-by: Jason Xing <kerneljasonxing@gmail.com>
---
V1
Previous discussions: https://lore.kernel.org/all/arKm5gCaERk6MaGA@boxer/
The patch is based on Maciej suggestion: 1) do not rely on mac header that
probe in AF_PACKET uses, 2) use skb_header_pointer and walk vlan tags to
inspect the accurate location of each field that existing drivers
possibly use.
---
 net/xdp/xsk.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
index 52d538160e0a..7c846f02972e 100644
--- a/net/xdp/xsk.c
+++ b/net/xdp/xsk.c
@@ -11,6 +11,8 @@
 
 #define pr_fmt(fmt) "AF_XDP: %s: " fmt, __func__
 
+#include <linux/if_arp.h>
+#include <linux/if_vlan.h>
 #include <linux/if_xdp.h>
 #include <linux/init.h>
 #include <linux/sched/mm.h>
@@ -1027,10 +1029,37 @@ static int xsk_skb_metadata(struct sk_buff *skb, void *buffer,
 
 static int xsk_skb_sw_csum(struct sk_buff *skb, struct xsk_buff_pool *pool)
 {
-	if (unlikely(pool->tx_sw_csum &&
-		     skb->ip_summed == CHECKSUM_PARTIAL))
+	struct ethhdr eth_buf, *eth;
+	int nhoff = ETH_HLEN;
+	__be16 proto;
+
+	if (unlikely(skb->ip_summed != CHECKSUM_PARTIAL))
+		return 0;
+
+	if (unlikely(pool->tx_sw_csum))
 		return skb_checksum_help(skb);
 
+	if (unlikely(skb->dev->type != ARPHRD_ETHER))
+		return 0;
+
+	eth = skb_header_pointer(skb, 0, sizeof(*eth), &eth_buf);
+	if (unlikely(!eth))
+		return -EINVAL;
+
+	proto = eth->h_proto;
+	if (eth_type_vlan(proto)) {
+		proto = __vlan_get_protocol(skb, proto, &nhoff);
+		if (unlikely(!proto))
+			return -EINVAL;
+	}
+
+	if (unlikely(skb_checksum_start_offset(skb) < nhoff))
+		return -EINVAL;
+
+	skb->protocol = proto;
+	skb_set_network_header(skb, nhoff);
+	skb_set_transport_header(skb, skb_checksum_start_offset(skb));
+
 	return 0;
 }
 
-- 
2.43.7

