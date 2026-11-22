Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795390801;
	b=wjgN+FcN2JC6p3R6p8Or/nfVO0gdNJNlGgR9WebUTJQGlLjx8XFyCGj7z4YM4Ps+I8Mz
	 Vgud1aMpOa6UYgRH8ykVn7GLIA+UiHti17RQ6MX6bSSHcxYFH/v5pVZKXIVDktI3217Dr
	 fv5l1tV1KmtkJoDCpMzNnQGdbrm2pKPlfsHoP93aLUTH/aDqT2LuWidf3/fBpZ9Ux0U6d
	 GqnugrPtgk8DB89LFliLx6xbG/E1UNJZXVjrnSWhTcTD7gre9n71VPTqU8C+C2Q9Q9SJT
	 D2XSuT1xZVlO5KBujhXLqtRw+b9GL6Oj5E0QNMbikvXGDXzngx3m8gmEPLYpGotYKfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795390801;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TQb45l1RsU0Lz4sB7qqB+jyVNMLFZAFcVIiy/3FWzuo=;
	b=1xmMHUiX66+EUTdpbPFNWtWyxfAFNGqpmxVsuZSBWr9qR2PGjfINpBOxGCb/vlduuOfB
	 6ag5mx878gqjVaIsc6UdjTrgUsNHyHpRhuBA5Z6P/Qr60zC1mG9JXEv7IfoOM35vTGXpM
	 hsxDYkh6rVoMYWtyaGCGE7YgS+H5FL/j4XBy56N3+IEh9bcKCQjGJnvDa2uyxju1BpGKI
	 3k6OMP0lQzm5O6L3C9Uzve5hqBdkz2sZVT2qdp7UySnrrMTpB4wku04Rv/mZcJbm0tYTT
	 KIGXHA0a5EjNxLzAKMh/NI+BPEy9bri8XH9MbzxZglocHnx75E/OAIzKbevqFJeT3/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=stellman-greene.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JoFkxyyJ;
	arc=none smtp.remote-ip=209.85.222.181
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A37E606A334
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 23:40:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A37E606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stellman-greene.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JoFkxyyJ
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-94962d80d34so169642385a.2
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 15:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795390800; x=1795995600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TQb45l1RsU0Lz4sB7qqB+jyVNMLFZAFcVIiy/3FWzuo=;
        b=JoFkxyyJLHpNVekneO1pBCAfzUiuj6FsnPF+f9jmITq2rUJSsSdYR0bXQa/JDkA07z
         3Ia4RY7sTeIL3ojqsk4+cE+v1ubAAIFukwpBSf5qBb+B69kKAdyyaUzoZvhIx9Ul+erW
         jeFUD2Zz4k4eR076rfqWAorFnRQYaCePKKB5idvb0ueu0TtsuqcJkoc6OCH1Bv2URybb
         f1FzDhCjPJKNBfl3JGgBdVs5SB2FeNYmPdlOgiyvlhOPAwglC0Gm0LG8ljywhCy98A7U
         HRIo4uTy9rNe7EyJHc8pOfP3L7mhNLnB4X+DAh6EABpj2A1HY3aLgkz8S7xFQp8gFHLB
         +wsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795390800; x=1795995600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TQb45l1RsU0Lz4sB7qqB+jyVNMLFZAFcVIiy/3FWzuo=;
        b=2tnAPVz/BThp9ZuHbYhXrVyLHa6B9XMNKEywI3DKHY56MQtBErgVIbwZqNd40SXRMH
         p+byYaaFOo5hLPP5LbKiExKo13J84nTdJf6DecObTnXmvnJxciriXy2bRN2QV6vtjHE6
         qCRd0j9hs8OJt1v75iRHWHX+KpfkoLJ2A8lyHVGhCJyFj/fd4E+8Adt3Qbpfe2FxRNsi
         7JKmDPLX1LkbWen6ydTIb5GHEurFU8zY6ibHqvv+KSkuNLyb0fUsnqi1jFw7BGsYanm1
         2t83+XHlkJtUJ1r5oQz7oxVGOXgITNrERJCrNRwAn1FWNSMN4YOX+8GS9nAihQ5ThDE8
         qBbg==
X-Forwarded-Encrypted: i=1; AL+hErGJPhDHzvIHCJ+//23bf4BUUXLqnP2SMcwh47pvIFpaGbvOh5anmJXn8KppWQwDTCEXS9Ot3ik=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CVjgq9my8u+Noh6e8HZjeLFvhfVYbsOgrqOUj2rhojCLGM3T6
	3PPqjzocnN1cFeXnyA8XoGVuPzUhAKa/SEkRnG8/2LmzeOreUlgDf9c3
X-Gm-Gg: AZFdTZefBbHJkoBgCPxv1UZz/AhRzRPVs1gbb0JKAqn3qO5E1DydpvoGXBOqmxTw+JJ
	X45nATlJW5aVCel9HeWylkyqIyERnoY6HiuxPzSK14nfA+ZNvvj7ViEWCVcwa9EM3ZUF57F7eBe
	PgmXMTO0RpL1rBfqBAnx20IiuxFk8Th/BKVQwydHcH4xbGB4A51+EdPq9YyZMp37yOBchCwrPbi
	7byeRBy45txbnlPOqAE+y6kY4KzPqZ5+3Df+ruEmPRa7H8fx+g9rtbmMzYltczGby9Z/szzbGP2
	rUD+Xqzwh4s+Qm/fSFJb5eGfEn+XapsqZs+ywW4ZLKfriWo6chixcHgjEcXsySZAYYQzEB4n5QN
	sza4tXi0GMkgJk6LDdU7tHhYz/eYoZPNyn/cOYSvRdWatrFOvEL1DAB9JuYuIjGz822lGpWcCrE
	PY7ql1iK2pX9RDEeN/3hL0m1SUAKVmIEezSgPrIfBfsvKFOCg5gxU0uonDMn/8ci+OGeVA+PRbe
	uVNjexQWNn2DwnAFu8VObf0eX6Hkc0xNRiCLrxHQ8NUHMhWw9K9A3LO0OlsgaSoKdy/ELByO318
	QeM90JjcY5zIL7JHIM0DT7i50CCQdORKM+yzMtyTL3eDEBxvziGFCUnjy9yM+e+CLHvRWZBC88t
	zGPIFpjekymKvKC6i98KarL8AZtf13hPMrMJwoH/qzstRHEEU3xMZTVnF5MEYB30ympeecW+zV8
	Idfc0gcB5fysq5tge407NI+Pg5bw==
X-Received: by 2002:a05:620a:4012:b0:949:3365:7402 with SMTP id af79cd13be357-949ba9b8ee1mr1662958685a.17.1795390800245;
        Sun, 22 Nov 2026 15:40:00 -0800 (PST)
Received: from Mac.mynetworksettings.com ([2600:4041:5c28:200:c8ee:a73:9097:862f])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb41a341sm686330285a.37.2026.11.22.15.39.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 15:39:59 -0800 (PST)
Sender: Andrew Stellman <stellman@gmail.com>
From: Andrew Stellman <astellman@stellman-greene.com>
To: Jon Maloy <jmaloy@redhat.com>,
	Tung Quang Nguyen <tung.quang.nguyen@est.tech>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Tuong Lien <tuong.t.lien@dektech.com.au>,
	Ying Xue <ying.xue@windriver.com>,
	netdev@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Andrew Stellman <astellman@stellman-greene.com>
Subject: [PATCH net] tipc: free the tunnel packets when failover tunnelling stops early
Date: Sun, 22 Nov 2026 18:39:58 -0500
Message-ID: <20261122233958.10462-1-astellman@stellman-greene.com>
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

tipc_link_tnl_prepare() returns from the middle of its tunnelling loop
when a packet does not fit the tunnel link MTU and the peer lacks
TIPC_TUNNEL_ENHANCED, when fragmenting such a packet fails, and when a
tunnel packet cannot be allocated. The tunnel packets already built on
the local tnlq are leaked, and for FAILOVER_MSG the receive side
hand-over at the end of the function (drop_point, failover_reasm_skb,
deferdq) is skipped.

Purge tnlq on these paths and go on with the hand-over.

Reproduced on net (af6737b90668) under QEMU with kmemleak, with two
guests joined by two TIPC eth links: MTU 9000 (active) and MTU 1500
(standby). The receiving guest runs the same kernel with
TIPC_TUNNEL_ENHANCED removed from TIPC_NODE_CAPABILITIES, to stand in
for a peer whose kernel predates that capability; the sending guest's
kernel is unmodified. The sender blocks the MTU 9000 link in both
directions with tc, sends three 100 byte messages and one 4000 byte
message, and waits for the link to fail. Without this patch that logs

  tipc: Link tunneling error, too large msg <0, 2>: 4040!

and kmemleak reports three skbs (six objects) allocated by
tipc_link_tnl_prepare():

  unreferenced object 0xff11000004d34780 (size 472):
    backtrace (crc dd2ea0a1):
      kmem_cache_alloc_node_noprof+0x296/0x3a0
      __alloc_skb+0xde/0x890
      tipc_buf_acquire+0x1d/0xe0
      tipc_link_tnl_prepare+0x94b/0x1960
      __tipc_node_link_down+0x4ae/0x13e0
      tipc_rcv+0x2187/0x2e20
      tipc_l2_rcv_msg+0x1d8/0x2e0

With this patch the same test logs the warning and kmemleak reports
nothing. With a 1000 byte message instead of the 4000 byte one, all
four messages reach the receiver over the tunnel with and without this
patch. Apart from the receiver's capability change, no kernel changes,
fault injection, debug code or delays were used. There are no TIPC
selftests to run.

The issue was found by Claude Opus 5.5 running Quality Playbook, an
LLM-driven code review tool:
https://github.com/andrewstellman/quality-playbook
The fix and this changelog were drafted with Claude Opus 5.5 and
reviewed by me.

Fixes: 2320bcdae628 ("tipc: fix changeover issues due to large packet")
Signed-off-by: Andrew Stellman <astellman@stellman-greene.com>
---
A reproducer is available on request.

 net/tipc/link.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/net/tipc/link.c b/net/tipc/link.c
index 6427c69f892..2fead2f4ed0 100644
--- a/net/tipc/link.c
+++ b/net/tipc/link.c
@@ -2035,7 +2035,7 @@ void tipc_link_tnl_prepare(struct tipc_link *l, struct tipc_link *tnl,
 				if (rc) {
 					pr_warn("%sunable to frag msg: rc %d\n",
 						link_co_err, rc);
-					return;
+					goto out;
 				}
 				pktcnt += skb_queue_len(&frags) - 1;
 				pktcnt_need_update = true;
@@ -2043,19 +2043,19 @@ void tipc_link_tnl_prepare(struct tipc_link *l, struct tipc_link *tnl,
 				continue;
 			}
 			/* Unluckily, peer doesn't have TIPC_TUNNEL_ENHANCED
-			 * => Just warn it and return!
+			 * => Just warn it and stop tunnelling!
 			 */
 			pr_warn_ratelimited("%stoo large msg <%d, %d>: %d!\n",
 					    link_co_err, msg_user(hdr),
 					    msg_type(hdr), msg_size(hdr));
-			return;
+			goto out;
 		}
 
 		msg_set_size(&tnlhdr, pktlen + INT_H_SIZE);
 		tnlskb = tipc_buf_acquire(pktlen + INT_H_SIZE, GFP_ATOMIC);
 		if (!tnlskb) {
 			pr_warn("%sunable to send packet\n", link_co_err);
-			return;
+			goto out;
 		}
 		skb_copy_to_linear_data(tnlskb, &tnlhdr, INT_H_SIZE);
 		skb_copy_to_linear_data_offset(tnlskb, INT_H_SIZE, hdr, pktlen);
@@ -2073,6 +2073,9 @@ void tipc_link_tnl_prepare(struct tipc_link *l, struct tipc_link *tnl,
 		}
 
 	tipc_link_xmit(tnl, &tnlq, xmitq);
+out:
+	/* Empty unless tunnelling stopped early */
+	__skb_queue_purge(&tnlq);
 
 	if (mtyp == FAILOVER_MSG) {
 		struct sk_buff_head *fdefq = &tnl->failover_deferdq;
-- 
2.43.0

