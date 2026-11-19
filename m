Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795054339;
	b=gGWVaKiZezbFur07vG19LuwSEgzoRKdlG6+0u1kR2zNdVtqJjvAYY9ElSMNBZfFAZYMv
	 ZVOJ0vbelW2c/Bab6HpPWI8YnesE4WAkjE/2mPkm2wMANjFkHoOlMRlTDsT/AOLwm9QXu
	 GAjUN6DYQsHysza3vmYp9GW7RZkndQdGQQkBsHN9pYK5Duzbi6DhfcUbn+C4p0TtdVSVE
	 H47Wad6lHc8xmr0BdHlI2e+sWIGH1ucewvTX8g7hnhXLAZ9aQZI5XpHdF8LRt80gxcgRN
	 OW2KDkQj6zD14W4jXzoH0N7UTQxfDApWtCdyvVuaX+oCA2dsdNmHNKkIDB75czlC+FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795054339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=98L6SeBW9Xu1WCjW5oRLiTnE9je2fHVlHISx7sl7zSg=;
	b=leZlItQDlFyZSG+9GC7bM0+nlS4Fyjdc5tICQB2nG5Cqang6FV0Q1ccQ5NSMxYVuh9oZ
	 uSTLYKVXSVHnuQVJMq1cfLGZ2HHQ3dhFk5+U1+RbqHAyMXEJNNZCsWG23y7xKKAFvBxRN
	 S6IOdSSPMdonMuOSVyB4oiPRbPNkrrAGEgJ3C5jRjzZzgJEtgSpANFtnKp/qN8LazJ+47
	 pg4VBf/6Gh5MUC+0p/S5Z6LVuWQvLjnGn2LyGi32FL+epVw6esfKAb3Ism9zHdbcWsWRU
	 ITelfkEddJUlheWfKLx+FH+Dp0Bjin+I7gpoOqTr5JOZW1RfyFLotDdVjkTFGcoxhJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pZFGc5BA;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1494D606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 02:12:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1494D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pZFGc5BA
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so969341a91.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 18:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795054338; x=1795659138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=98L6SeBW9Xu1WCjW5oRLiTnE9je2fHVlHISx7sl7zSg=;
        b=pZFGc5BAH3Jl7l67LPPUl9lySwrpMJ0YBguR3WGls+Q2tGEz+qTDZyBGmFZkSZaYch
         8RGCvN2qUuhilgR5G9bq0LjpawpOw66m3DbIMbZs6kj7fYtjavljlIdllUjJYRNzzKiu
         p/k2z8w5aTBM62z3IDPn4cG0WC+SxVYZOPmiFwkxmX/iqhLweRJsYJTG5tjIihJfk8iP
         cOhD6OrNFD0pqJFcYZ9gKdTkZpy6bWjYAOn62C2rQqMdLkJirI5D4GpbGvOSHP8izrj8
         +kWnzkBOtLVrz3t/njLweF4exDyfswWB9k4V8kgTOvjkqqBEdC67pRPH2I5ri1pQ3x9K
         H68A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795054338; x=1795659138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=98L6SeBW9Xu1WCjW5oRLiTnE9je2fHVlHISx7sl7zSg=;
        b=PlotiD7a1Il+EQdht3zEJY/faa6v27mhQXMaRUXlxJyYxmhxW/ow2IS4eedxjr+cKz
         9AEtBxV6KueRjS5sJK8lDIYmtxf84v9+4XYAckBWhjdj60VBTi5+pB/81cEacURcQR7m
         H900X+7X2unIu/CJf5lH+FDh08CTHLCzj1xqcbqZG2kRRCa+U5yT0RNBBbFBxU/vWttl
         Bu4ImCuzOCX0LWXLMx8H6vjRMJyw1QrkmEVGBuRzXT6rJW5hjy9FLh285LYSQVVSj/5L
         LMqQCgjec7bn+ouMMFvm93Dxorl2nOulqtqYs680OPi5pA4cezuYbbndhlenfF9zJ1/k
         IGEQ==
X-Forwarded-Encrypted: i=1; AL+hErEEwvfahZ8Mtx85iAGfu0OHsdkub3dPuS6t4kjZoLubqPPRzRdl15iH3bsAHIfep7xlUk+GlmA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WCDBkiNUp2KpKjpru7IsdEcOS9s0ze4aI5tKt+vMBVeR5ftK+
	Ule8+K5XOkeG5gstiDV3dy0dzMiEjKnsdYeq7VFNAsSqoe7yJip6EjIC
X-Gm-Gg: AZFdTZfBOt/aXneYGJDwCJdMXg36zyk4K/q/iosHoTsNwHRRmVlMvXePT7+bxK+KRSB
	8eFLu7kre99y5FOhEjNzyFCP1mTqfJ6VE3afCIC3VhOZf0uoz6oQPak1HUjtj4GNntwU9qkyA8d
	+H/WgQDSBpqLgm6yPNEWD1xj8bEqIfsB+kru8Vv5wYFaJmIjYBm5YnWT1qYTEveeE+CQkEqY2tI
	4AumKX3wlrNyEoLlWWAOOAsQ7jkwN3Wqw28XC72kiUWf3RM3q0Y3/czB6IehROPydqInRvtZcwW
	4HGV+e6ZtaP4KrW3WSOFevbhMI66vt4WsYe7eA0wMS1xO8E03wB5jy79CsPnv/ytT673TOE3cvf
	G4gcql5qY/AGWc/rTS/HrZ7IhL1E6rkeIR4wUVQJ3SD7ovHJTnofL+ZN8BCU6G31zKksXMEzCZI
	svfE3lbM0gY8f3vG6PsG5GAF5FAX5eIp5qmON+Ngj+Oe9QmwbmL5+3cgbzApnohhA+KHWxhJEXu
	YYYlcfQnXTsWYUAluGFFG17Okh2+YBYZa5HHuCjnoaiVPOy8k2yjMw2I2qC6dJF0Hq88HQrwjAA
	v8E4xQLsqtGtdPYsJsxGUMOSYR1k
X-Received: by 2002:a17:90b:4b:b0:3ab:be66:ddbf with SMTP id 98e67ed59e1d1-3b3d07e0eaamr3908102a91.54.1795054338315;
        Wed, 18 Nov 2026 18:12:18 -0800 (PST)
Received: from spidy ([2401:4900:7b35:a853:53a1:3682:dac8:6bee])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4059715b3sm17242a91.14.2026.11.18.18.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 18:12:17 -0800 (PST)
From: Gowtham S Bhushan <gowtham398gs@gmail.com>
To: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	syzbot+0cd6f4783442ac67b56d@syzkaller.appspotmail.com
Cc: Simon Horman <horms@kernel.org>,
	linux-afs@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	Gowtham S Bhushan <gowtham398gs@gmail.com>
Subject: [PATCH v2] rxrpc: Fix slab-out-of-bounds write in rxrpc_send_ACK() during PMTUD probing
Date: Thu, 19 Nov 2026 07:42:02 +0530
Message-ID: <20261119021202.525077-1-gowtham398gs@gmail.com>
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

When rxrpc initializes Path MTU Discovery (PMTUD) parameters for a peer,
it computes the usable payload size as peer->if_mtu - peer->hdrsize. If
an interface has an MTU smaller than the transport header size (such as a
virtual interface configured with MTU 0), this unsigned subtraction
underflows to a value near UINT_MAX.

As a result, peer->pmtud_bad and peer->pmtud_trial become excessively
large. When rxrpc_send_ACK() builds a padded RXRPC_ACK_PING packet for
PMTUD probing, it appends PAGE_SIZE zero-page entries to call->local->kvec
inside a loop until len reaches probe_mtu. Because nr_kv is not checked
against the fixed 47-element capacity of call->local->kvec, nr_kv advances
past index 46 and triggers a KASAN slab-out-of-bounds write past the
1584-byte struct rxrpc_local object in the kmalloc-2k cache.

Fix this by guarding the subtraction against unsigned underflow when
peer->if_mtu <= peer->hdrsize, clamping pmtud_good, pmtud_bad, and
pmtud_trial to the usable payload limit, and only enabling pmtud_pending
when the link supports more than the minimum floor.
Additionally, ensure the padding loop in rxrpc_send_ACK() checks
nr_kv < ARRAY_SIZE(call->local->kvec) before writing to the array.

Reported-by: syzbot+0cd6f4783442ac67b56d@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=0cd6f4783442ac67b56d
Fixes: eeaedc5449d9 ("rxrpc: Implement path-MTU probing using padded PING ACKs (RFC8899)")

Signed-off-by: Gowtham S Bhushan <gowtham398gs@gmail.com>

---
Changes in v2:
- Derive peer->pmtud_bad from max_mtu rather than RXRPC_JUMBO(1) so jumbo
  DATA frames remain enabled.
- Cap max_mtu to the local->kvec payload limit so large legitimate MTUs
  cannot overflow local->kvec.
- Keep peer->pmtud_good at 500 and move variable declarations to the top of
  rxrpc_assess_MTU_size().
- Fix probe_mtu spelling in comments and clarify the PMTUD binary-search
  mechanism in the commit message.

v1-Link: https://lore.kernel.org/netdev/20261111144846.838278-1-gowtham398gs@gmail.com/
---
 net/rxrpc/output.c      | 12 +++++++++++-
 net/rxrpc/peer_object.c | 21 ++++++++++++++++++---
 2 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/net/rxrpc/output.c b/net/rxrpc/output.c
index 88cad087f13b..a9d083076a16 100644
--- a/net/rxrpc/output.c
+++ b/net/rxrpc/output.c
@@ -325,9 +325,19 @@ void rxrpc_send_ACK(struct rxrpc_call *call, u8 ack_reason,
 	if (why == rxrpc_propose_ack_ping_for_mtu_probe) {
 		size_t probe_mtu = call->peer->pmtud_trial + sizeof(struct rxrpc_wire_header);
 
+		/*
+		 * skip padding if the base ACK packets already meets/exceeds probe_mtu
+		 */
+
 		if (len > probe_mtu)
 			goto skip;
-		while (len < probe_mtu) {
+		/*
+		 * pad the probe packet with zero pages up to probe_mtu,
+		 * ensuring we never write past the fixed capacity of
+		 * local->kvec.
+		 */
+
+		while (len < probe_mtu && nr_kv < ARRAY_SIZE(call->local->kvec)) {
 			size_t part = umin(probe_mtu - len, PAGE_SIZE);
 
 			kv[nr_kv].iov_base = page_address(ZERO_PAGE(0));
diff --git a/net/rxrpc/peer_object.c b/net/rxrpc/peer_object.c
index fa9a406e1168..32b75a7617f9 100644
--- a/net/rxrpc/peer_object.c
+++ b/net/rxrpc/peer_object.c
@@ -156,6 +156,8 @@ void rxrpc_assess_MTU_size(struct rxrpc_local *local, struct rxrpc_peer *peer)
 	struct rtable *rt;
 	struct flowi fl;
 	struct flowi4 *fl4 = &fl.u.ip4;
+	unsigned int max_mtu, kvec_limit;
+
 #ifdef CONFIG_AF_RXRPC_IPV6
 	struct flowi6 *fl6 = &fl.u.ip6;
 #endif
@@ -207,11 +209,24 @@ void rxrpc_assess_MTU_size(struct rxrpc_local *local, struct rxrpc_peer *peer)
 	peer->tx_seg_max = dst->dev->gso_max_segs;
 	dst_release(dst);
 
-	peer->max_data		= umin(RXRPC_JUMBO(1), peer->if_mtu - peer->hdrsize);
+	/*
+	 * Avoid unsigned underflow if the interface MTU is smaller than the
+	 * transport header size (e.g., on virtual interfaces with MTU 0).
+	 * Also cap the PMTUD upper bound to what local->kvec can hold when
+	 * padding probes with PAGE_SIZE zero pages (3 header/SACK/trailer
+	 * kvecs are reserved before the zero-page padding loop).
+	 */
+
+	max_mtu = peer->if_mtu > peer->hdrsize ? peer->if_mtu - peer->hdrsize : 0;
+	kvec_limit = (ARRAY_SIZE(local->kvec) - 3) * PAGE_SIZE -
+		     sizeof(struct rxrpc_wire_header);
+	max_mtu = umin(max_mtu, kvec_limit);
+
+	peer->max_data		= umin(RXRPC_JUMBO(1), max_mtu);
 	peer->pmtud_good	= 500;
-	peer->pmtud_bad		= peer->if_mtu - peer->hdrsize + 1;
+	peer->pmtud_bad		= max_mtu + 1;
 	peer->pmtud_trial	= umin(peer->max_data, peer->pmtud_bad - 1);
-	peer->pmtud_pending	= true;
+	peer->pmtud_pending	= max_mtu > peer->pmtud_good;
 
 	_leave(" [if_mtu %u]", peer->if_mtu);
 }
-- 
2.56.0

