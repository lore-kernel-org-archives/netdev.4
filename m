Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795619853;
	b=AhDsrZYhBzcdvIM7szQ+nGcaWfaeeS8knHdatpGGzwfStvlPj34GNG3j54GXx7R/JdQq
	 SAybpvMtDsbaAghVomAYADFd6df9pYNgMnyDJRnVuIOue9KSEVr5MxOOdLLRnzpTGfZra
	 Z3WLujusRSM60rRTysewNVDEMTNAnMGLl5F6G8qzJaJZ6F/owNpB7cEc10+Z6Ht4vKINb
	 1pwb6fIS4cv36gyT57P2rt9B0Qpfd1hl4qnS4pKLfrR7sr/6cKwGtgh2lDEXLXHapMYbE
	 f1UDiY/GIkhgA0pYbR4kibOnCiPagSKIKMWhAa6IJLJ59+/5p16hZF8CtMubJIL/EHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795619853;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=C+rOOkLJgdQ5N9f4sezWXt+SerC+7jevc34AyllYRns=;
	b=XiIEY7ERTWZ1aeyUdRA5+XhcLCRWSldTwkWdadqai2fstceq5dciwqYvmQnjhkqn/M9E
	 F6syO8PlE01E1Tmur9kZbk2X9E6RqsOaoLguudbXzAd1IpEXPCUikpWF+tQ50hatgU7/o
	 sYVsbuGTM3s7DUAchPJ8SpibElcSyQ0ECDaoApP8n+321ug2SQ3b6Ko+xKfCQDmbdzktN
	 t9ptqAwkw/twxMc4nOphw3up16z8HoSl4eyhqO7E/0WEKVJnynqkODf9OJoJB0iQK325X
	 mdzj23/BE1WGrmgO/VmjlVSeINAHkugoMqF10dU8z9xvKXYTaywrFX5+rPKpb3lwQnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xfACnRKA;
	arc=none smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6994606A323
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 15:17:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6994606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xfACnRKA
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5c126f80426so5716993e87.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 07:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795619851; x=1796224651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C+rOOkLJgdQ5N9f4sezWXt+SerC+7jevc34AyllYRns=;
        b=xfACnRKATwe4GT60n/IfE0+y/iZMY1VqjkD4LMy432K5Ck4cf37GGCnWO53Dk86qlV
         wwtbRWD4Yqh4i1yjPvIfXwh+OlefKV6IiqBdZMWiuA/z1hDRXtACk7VT/GOdIPchxJpO
         5BWW/Ae9+blhkT5iIe4GP/WrIoNeGYCR5Iuk3dc411n+/99NTTAzb8lbErxZMCMlCAR1
         wN/pmsSiChltIBLm4VLhmx9NQvjfPE+EK0gE0e93xOsRqwhZ9YDG3fRjCovQgYbxv5FL
         SeGn6JRxsG2VTBtA4WgqJbW7TldQ3Mlh109Ed/bHcBs1IHSZXnYQHqhln3++xnS08as5
         5FYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795619851; x=1796224651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C+rOOkLJgdQ5N9f4sezWXt+SerC+7jevc34AyllYRns=;
        b=oNxkGgJiv0m2S8MBlNCY7fAbodCFrwT/YQgpkuxTDSxXzj4wQqxj/hNQ4trojsDdoB
         p8Cwp3ReveHkvhgx6pbRMQjXLrhfzwCkcPqSMPRAc3dAmCTeILFpKEwXmlr/K0w8WGjR
         SZP0Mm3U7KkBQp4qj7acUTWGVL/Be/kn0ag+NO6IY+/eT2I3MZVSxeqh2+09hP03ojR+
         hU4O13JQip+cM8MEckTmd4KWNgNVH5EZ55Wi8LVj+LZB7cI6KvubAdmmu1jGQCEmzGmh
         Ro2vvWCyS/eh7D5+m6qnqmCO7GdseKk34hr98YiGfS6dkK8aTDRWaNH6yo0h5UTC8cnN
         G+Sw==
X-Gm-Message-State: APuU4Z++GBJIEKjRwwVoT8MuqIae6VYOKoHXoD8sf+cOItzFDJBljaXH
	qmbpJ5Wbh0QoXad2WRYps1LGjFvKxvCQstO3+XaBQ7UyrIt0ndhLV3c5YKfwDA==
X-Gm-Gg: AZFdTZeVoMvI/NtgTL6mZhSWew/EJDQqGKv02Igl1bP+q2nTrqoSZanLTiIKrCXaUtf
	0Lrx26o4BUjpYAOfZCB86BgT1lDxj/dvp7NPYV+KN/0DpvIiEX/tGobX3lsWIZj7fco7+k05PXQ
	EV3o8m2oy6X5Qyi9eI4wPwSVeRuqr5V+YDDkgnbZQnw9umfcbxhH3jYSIb6W2sskSC33JWDNPez
	AWFddOOsd6sYuZ2BASPRA/HQ9+LQNkg6/iqyTnzDy8d8amBE+7WxFlV2FQY0km9fFUk4zD+oFo8
	CBvTTefC2JcTv9OPGkXFQJ01ZzDo6zO6VDT8DWBMdQGMOccdZPL7aZyqEIUWIiQyzhngRH+X0V4
	K7vUPkEf5m0uDSp3IW/2GmXOxDar0ofrz4awcliVMUOPJCSy2gf6/i2LS9c1NDsfLNi7PLNepB2
	vbkOwblgCbYmmtC0Tj01QoV+VvR52pCh7fb1euAQL5uQg8c/mNPXnbkRxG+Ozy3bRa+i/FO/LE6
	le09A4iKWOANIaZQUGmaaEu85BCtF3tbDK188FISRBSCC57oJni2JUIDEbmKB9/7rb5+iJLF7nv
	yJxV4L/C57Y7ng7UPhmVGMON6BkhorSewLSRQwEjcPttMt1AYWoPqpxhbHdyGF1SWDWdP817Vs1
	8b2EKs5XsyeFFXBdH66NZEg1xwcSdCaqgGpcbwBtHpX5rUtngSS2//HUp2MwRveDf8XflKRo=
X-Received: by 2002:a05:6512:110f:b0:5c1:5814:4b94 with SMTP id 2adb3069b0e04-5c32dbc8a6emr66618e87.9.1795619850414;
        Wed, 25 Nov 2026 07:17:30 -0800 (PST)
Received: from wsfd-netdev58.anl.eng.rdu2.dc.redhat.com ([66.187.232.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcf333bcsm4758135e87.2.2026.11.25.07.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:17:29 -0800 (PST)
From: Xin Long <lucien.xin@gmail.com>
To: network dev <netdev@vger.kernel.org>,
	linux-sctp@vger.kernel.org
Cc: davem@davemloft.net,
	kuba@kernel.org,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
Subject: [PATCH net v2] sctp: unshare GSO skb frag_list members instead of linearizing
Date: Wed, 25 Nov 2026 10:17:26 -0500
Message-ID: <739a5caed11c49ce53078747c43ea8cec5076d50.1795619846.git.lucien.xin@gmail.com>
X-Mailer: git-send-email 2.47.1
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

When the iptables TEE target copies an SCTP GSO packet with pskb_copy(),
the frag_list skbs are shared by reference via skb_clone_fraglist().
The SCTP receive path then races on shared sk_buff headers in
sctp_inq_pop(), and can hit a BUG_ON in __pskb_pull_tail().

Commit fd60d8a08619 ("sctp: linearize cloned gso packets in sctp_rcv")
tried to fix this by checking skb_cloned() on the outer skb, but
pskb_copy() gives the outer skb a private head without marking it
cloned, so that check never fires for the TEE case. The frag_list
members stay shared regardless. Even when linearization does trigger
(e.g. for AF_PACKET clones), it destroys per-segment boundaries,
breaking AUTH: the HMAC is computed per segment on transmit, but after
linearization the receive side hashes across all concatenated segments
and the digest never matches.

Fix by avoiding linearization for GSO packets entirely. Add
sctp_gso_unshare() which:

 1. Calls skb_unclone() on the outer skb to privatize the head data
    buffer when it is marked cloned (e.g. from AF_PACKET's
    skb_clone()). For the TEE/pskb_copy() case this is a no-op since
    the head is already private.

 2. Walks all frag_list members and replaces any shared member with a
    private pskb_copy(), giving SCTP exclusive ownership of both the
    sk_buff headers and the linear data buffer. Data ownership is
    needed because AUTH verification (sctp_sf_authenticate) zeroes the
    on-wire digest and writes the computed HMAC back in place; with
    skb_clone() the data buffer stays shared, which could let a
    crafted packet pass AUTH on a second copy or corrupt data visible
    to AF_PACKET readers.

Fixes: 90017accff61 ("sctp: Add GSO support")
Reported-by: syzbot+f15a6eff7a53f6eb7dc3@syzkaller.appspotmail.com
Signed-off-by: Xin Long <lucien.xin@gmail.com>
---
v2:
  - Use a proper Fixes tag and refine the commit message.
  - Use pskb_copy() instead of skb_clone() for shared skbs in frag_list.
---
 net/sctp/input.c | 43 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/net/sctp/input.c b/net/sctp/input.c
index 9494cfa51106..f993191ee1ea 100644
--- a/net/sctp/input.c
+++ b/net/sctp/input.c
@@ -82,6 +82,39 @@ static inline int sctp_rcv_checksum(struct net *net, struct sk_buff *skb)
 	return 0;
 }
 
+/* Ensure exclusive ownership of frag_list members for GSO skbs.
+ * pskb_copy() shares them by reference; unshare with private copies
+ * so AUTH verification can safely modify the digest in place.
+ */
+static int sctp_gso_unshare(struct sk_buff *skb)
+{
+	struct sk_buff **pp, *p;
+
+	if (skb_unclone(skb, GFP_ATOMIC))
+		return -ENOMEM;
+
+	if (!skb_has_frag_list(skb))
+		return 0;
+
+	pp = &skb_shinfo(skb)->frag_list;
+	skb_walk_frags(skb, p) {
+		if (skb_shared(p)) {
+			struct sk_buff *copy;
+
+			copy = pskb_copy(p, GFP_ATOMIC);
+			if (!copy)
+				return -ENOMEM;
+			copy->next = p->next;
+			consume_skb(p);
+			p = copy;
+			*pp = p;
+		}
+		pp = &p->next;
+	}
+
+	return 0;
+}
+
 /*
  * This is the routine which IP calls when receiving an SCTP packet.
  */
@@ -117,8 +150,14 @@ int sctp_rcv(struct sk_buff *skb)
 	 * it's better to just linearize it otherwise crc computing
 	 * takes longer.
 	 */
-	if (((!is_gso || skb_cloned(skb)) && skb_linearize(skb)) ||
-	    !pskb_may_pull(skb, sizeof(struct sctphdr)))
+	if (!is_gso) {
+		if (skb_linearize(skb))
+			goto discard_it;
+	} else if (sctp_gso_unshare(skb)) {
+		goto discard_it;
+	}
+
+	if (!pskb_may_pull(skb, sizeof(struct sctphdr)))
 		goto discard_it;
 
 	/* Pull up the IP header. */
-- 
2.47.1

