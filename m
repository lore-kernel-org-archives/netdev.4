Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591028;
	b=CRyZkD5fizRMS3gVWBdkla4KmoWIKFKhuaL8sU8n6JXn6Yzj3fr0xO+nNhddz1XGW7L4
	 iMdSCMx9y+ZJVITTQdPs//kWpy4LzglBPTgrsf4vbaolrK+sz3QB7vo7Qov+gzJm9MSsk
	 QjjTfSBLpqeJBD1XCbsr1TpYfiBDzLV50GkMdNYpbruV501vzpWKcTUy2oKBQgllqyiM/
	 EAYIxLHBZcMYr/KhA/R5Vz7utUyVx0EtzMOaFRWrtaPSBKHPP/iVfHuMVuZuhzGqizSuO
	 gOfalbeMwkVyFeS2PU9kLJ/1d8DVeWhWiZDD5mMxZcqGqBwA1Me90OOOr8awKxC24vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591028;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+dHH22/mmXUjEV/FuacR65AgUd54J9CothzajbpQVaM=;
	b=qFdpBtb4NKJ4IgsZZTa/GnNF6XtDbhq32WOn1KBJeA2JStyTX0d4C/ucsHCUdS/bpaap
	 SZYLxoAySt0rhjr0AExBluay7XV2Rxv4+eS9bkwp6vJr+Wm6ITX8PuGF9LfFQLJU2RXLu
	 67X2hhouF80FzwonnQ04B2Ot1INalsOpQEauT+8PyGlK6eqKZwRWfaOxgAiaeEdTIrxOa
	 Kps7mXs9g3IyyYpyLPLcr7ah+OwTd6mSo0ioZ+GU86TZ+TcNCmSyfHuRvyaNMTRlBcb+P
	 iBy2MsOTXq2CrjtosKpvlOGzlPG6jjICfAdpDeizDEFEUTzVD95WUc34/JeUGjcogqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yy1SWnH1;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27C7606A68C
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 07:16:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D27C7606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yy1SWnH1
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f0458cc9easo42810875ad.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 23:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591018; x=1796195818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+dHH22/mmXUjEV/FuacR65AgUd54J9CothzajbpQVaM=;
        b=yy1SWnH1JMhl/jB92k7bZENjX4+Dz17Qm5cgEsXs7nyICV22dfbCY3HPJKiMlKp3mZ
         pcmQQT+cb1hPjvtvHS2Jb8VsunTC7QlUSk8Sqyf3+6vWh/w9H2W4AL6HCo+VAdwdyDVP
         mlsNG5Qt39ISoMepaKRwWAAqndt442eLnT+Qqf64s43WRkYQx0Y8oqeg1HRtTtqjlN1G
         OI/GaANjrcCbffDX7dnVd95A3NxwN1lscyicE3mETl71fJg5Hyyk9GqOlt0LUnzM5M/1
         5g6HV9pDAg6nULbn/LmEz5VeE0d9D5aBb41DAomIUi09+UjLBwdYFi9qQ0dyzSdXK+ON
         OHZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591018; x=1796195818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+dHH22/mmXUjEV/FuacR65AgUd54J9CothzajbpQVaM=;
        b=K+WQ4gJx7eCf21/p9/BzlXLbdZZyb9crvXgwhKmKIQ3IXXzm2SiwECrFqxz6L1i4og
         CRiWSgN8leUJvUe1p1aLI3B5uD1HLgrrNmlLQKm1La51YMxO6hlaBUh3ftbBbeS1hbpq
         es53NcFGa0dkJ4lp96e/RXfE5qFdqVcHOQi6q1UyZ2/tueIO8oW39uvyjke7pa1Sb+nz
         zNm8lQJVsNX2BFjOPpSqgR9PgNwoNUnzflGRBvCcCXQ2R5Bemc9+0uGzKs43u93rDScB
         IZQCpRtT2VkAidpCCp8aOuMo4/dRajoibfcZTiOmYlsemHJ0MYwP8tOq8QSspxpqlw4M
         K9Mw==
X-Forwarded-Encrypted: i=1; AL+hErH58w1hs9XEGN6ylUEQBosRsJskzfwgKSXqINiajg5VCdlhy3LcsBHMvc/FSCoWnQMOOIRdSqU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lAdx8QrRjK3yQwnsQpfqB/73xnT6Kwm2luaJALSEIRwVedVxU
	I+vfTFoc5k77OHBVgAsO10ib5bawk3sx3BzmhpCNEYcDRI05bOMFOtul
X-Gm-Gg: AZFdTZfYF6FAxtqAQDDGejcoFWSaNohx/VU4j+otMhDgcVEnaoCNRC3oZXWgT5j/bXl
	TcLV2sG3N0HchVjHpWIqt28XrtgbBYB4aVs9/P8VkIS2sTFwGaOp0uOs9XrRnm/iiGDjNfU85LW
	XGdTRzvWT0H5/6AiNZTaeZEV53woJPPwyj5k0MZdK1srWBA1YvyGnAhVuAYezbEf4pj3Anp7rQP
	4ijBL45LRrbeF6pDSycz4rChgFPm/3N4WxExUU+rvPh6JVJ8RYVYFNeQaF0ii2PSd/5ndB5fr9b
	J1jwHKXHQ3TTDtKga/IiU/HoYwCU8CHvzTx0mw4XBLT3RoAYLKylLy3LhxgKctIk5FVtfQmkS4r
	0tcTb0g8CcMaylxNb465wyzVnACfskRnY6SDeq/IFiJXtTDyoytWQvY1OCQs75mbDDVgUrq8E1I
	z/LSU1G8PuCmeYyoKDu+RJ2C3gDGJv7vPQDisOtYCY6r8zifglDw/LEeGEXykiZ55ffYNeibp9u
	RXFw2Fa09ep+7gtWG5dCqNi48+M6JSKKALVruPoOdrEOuKgF/WbGajn+FmcBzyafh/j51LOG0Od
	y8xoItl9DiOZ92pc1AiOLoRQI+Fmbrqy84SSPOrn2npGjsXRtTz0FjNR6DJ72pBvH6FSpeg8Vcw
	YjfU/JLvDYuxrsw==
X-Received: by 2002:a17:903:b4f:b0:2e4:b37a:d577 with SMTP id d9443c01a7336-2f03f1c9e52mr170295355ad.43.1795591017970;
        Tue, 24 Nov 2026 23:16:57 -0800 (PST)
Received: from JUNVYYANG-MC1.tencent.com ([43.132.141.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1a8asm80681405ad.24.2026.11.24.23.16.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 23:16:57 -0800 (PST)
From: Jun Yang <juny24602@gmail.com>
To: dhowells@redhat.com,
	marc.dionne@auristor.com
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-afs@lists.infradead.org,
	netdev@vger.kernel.org,
	junvyyang@tencent.com,
	corvus@tencent.com,
	stable@kernel.org
Subject: [PATCH net] rxrpc: Fix kvec overflow when padding a path-MTU probe ACK
Date: Wed, 25 Nov 2026 15:16:38 +0800
Message-ID: <20261125071652.56790-1-juny24602@gmail.com>
X-Mailer: git-send-email 2.54.0
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

From: Jun Yang <junvyyang@tencent.com>

rxrpc_send_ACK() pads a PMTUD PING ACK out to call->peer->pmtud_trial +
sizeof(struct rxrpc_wire_header) by appending one PAGE_SIZE zeropage kvec
per page.  The table it fills is call->local->kvec[], sized
1 + RXRPC_MAX_NR_JUMBO == 47 entries so that it can also hold a
maximum-size jumbo DATA packet.  rxrpc_alloc_ack() has already used three
entries, so only 44 zeropage entries fit, and the loop has no upper
bound: a probe larger than 44 * PAGE_SIZE writes past the end of the
rxrpc_local allocation.

pmtud_trial can be driven that large because rxrpc_assess_MTU_size()
takes the peer MTU straight from dst_mtu().  An IPv4 output XFRM policy
with an unresolvable ESP template makes xfrm_lookup_route() return a
blackhole dst; ipv4_blackhole_route() points it at the loopback device
and dst_blackhole_mtu() returns dst_dev(dst)->mtu without the
IP_MAX_MTU clamp that ip_dst_mtu_maybe_forward() applies to ordinary
IPv4 dsts.  With loopback's MTU raised inside a netns,
peer->pmtud_bad = if_mtu - hdrsize + 1 becomes huge and the probe search
in rxrpc_input_probe_for_pmtud() moves pmtud_trial far beyond 64K.

The XFRM policy only has to match the sport 7001 / dport 7000 that
rxrpc_assess_MTU_size() hardcodes, so it blackholes the route assessment
without affecting the call's own packets.  CAP_NET_ADMIN in a new netns
is enough, which an unprivileged user obtains with
unshare(CLONE_NEWUSER|CLONE_NEWNET).

Clamp the route MTU to the maximum size of an IP datagram in
rxrpc_assess_MTU_size(), which keeps pmtud_bad bounded, and skip the
probe altogether in rxrpc_send_ACK() if its padding would not fit the
kvec table.

BUG: KASAN: slab-out-of-bounds in rxrpc_send_ACK (net/rxrpc/output.c:333)
Write of size 8 at addr ffff8880312f3630 by task krxrpcio/0/10441

Call Trace:
 rxrpc_send_ACK (net/rxrpc/output.c:333)
 rxrpc_input_call_event (net/rxrpc/call_event.c:484)

Fixes: eeaedc5449d9 ("rxrpc: Implement path-MTU probing using padded PING ACKs (RFC8899)")
Cc: stable@kernel.org
Reported-by: TencentOS Corvus AI <corvus@tencent.com>
Signed-off-by: Jun Yang <junvyyang@tencent.com>
---
A KASAN reproducer for this issue is available if requested.

 net/rxrpc/output.c      | 4 ++++
 net/rxrpc/peer_object.c | 6 +++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/net/rxrpc/output.c b/net/rxrpc/output.c
index 88cad087f13b..57fae49e9ce8 100644
--- a/net/rxrpc/output.c
+++ b/net/rxrpc/output.c
@@ -327,6 +327,10 @@ void rxrpc_send_ACK(struct rxrpc_call *call, u8 ack_reason,
 
 		if (len > probe_mtu)
 			goto skip;
+		/* The zeropage padding must fit in the kvec table. */
+		if (probe_mtu - len >
+		    (ARRAY_SIZE(call->local->kvec) - nr_kv) * PAGE_SIZE)
+			goto skip;
 		while (len < probe_mtu) {
 			size_t part = umin(probe_mtu - len, PAGE_SIZE);
 
diff --git a/net/rxrpc/peer_object.c b/net/rxrpc/peer_object.c
index fa9a406e1168..310fe94d9f6c 100644
--- a/net/rxrpc/peer_object.c
+++ b/net/rxrpc/peer_object.c
@@ -156,6 +156,7 @@ void rxrpc_assess_MTU_size(struct rxrpc_local *local, struct rxrpc_peer *peer)
 	struct rtable *rt;
 	struct flowi fl;
 	struct flowi4 *fl4 = &fl.u.ip4;
+	unsigned int max_mtu;
 #ifdef CONFIG_AF_RXRPC_IPV6
 	struct flowi6 *fl6 = &fl.u.ip6;
 #endif
@@ -179,6 +180,7 @@ void rxrpc_assess_MTU_size(struct rxrpc_local *local, struct rxrpc_peer *peer)
 			return;
 		}
 		dst = &rt->dst;
+		max_mtu = IP_MAX_MTU;
 		break;
 
 #ifdef CONFIG_AF_RXRPC_IPV6
@@ -195,6 +197,7 @@ void rxrpc_assess_MTU_size(struct rxrpc_local *local, struct rxrpc_peer *peer)
 			_leave(" [route err %d]", dst->error);
 			return;
 		}
+		max_mtu = IP6_MAX_MTU;
 		break;
 #endif
 
@@ -202,7 +205,8 @@ void rxrpc_assess_MTU_size(struct rxrpc_local *local, struct rxrpc_peer *peer)
 		BUG();
 	}
 
-	peer->if_mtu = dst_mtu(dst);
+	/* A blackhole dst reports the device MTU with no IP_MAX_MTU clamp. */
+	peer->if_mtu = umin(dst_mtu(dst), max_mtu);
 	peer->hdrsize += dst->header_len + dst->trailer_len;
 	peer->tx_seg_max = dst->dev->gso_max_segs;
 	dst_release(dst);

base-commit: c5de2ce2fccdb7d3b48946179634eaa3d7ce2e7e
prerequisite-patch-id: 73dc5424c05c31bf826b8438dff12ad2acee90e4
-- 
2.56.1

