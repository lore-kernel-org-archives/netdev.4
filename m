Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795388577;
	b=3oXkYX63X//ehHcOHYILz4eXT434NGkr5SCcSPI8Q24mt3LEjGweg8eto3eGDFgzW5KE
	 MsNHwAv5EegGJzqdAFs39UJH9iNpwIOzaJZKy6GfD+Yg4qU71p/cSdTRA71gQcZIE/YKk
	 krPzq82OdqdKgpvxIAqncOTsR8f2bb4GUK/w2vc9pVGHy3gmzFSGWYKuxkbyHJ6iwOFQm
	 5S3S8O3sCfIhkr7q3Uov2x9CFVlNOajWEh/SYiHuWF28Cjk9oQKUYG6noJ75HHp/6iZBS
	 1V6HffFIVXR7VsdW44QLyBH2p7OuGj2o3of0UkqIDP8b1Ni7hzQA9fDIHNWdVZMfAwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795388577;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=2vtq+bJAgkK5J7ORrOJ12oBNTPI8ZkKXFNJnCJW1Feo=;
	b=dykqCjm6akybMOVsSYiok3Mby14VEUKuCfSRPmr+imL7Cat9vofuGcrHLFEXX5rqJgSf
	 WFgwUw3RIP4vkgjwN8DdwQhMET07yGuw6EJuu/ifLXKgJytWFPuWgpj9cFp8rxEC0/iWo
	 fFrUn17IS9L2mDv5/y571SGMxFgkz5OpAEzYBavp3yK9LnXzaf1rpVzJm/f2AnQ5P8suh
	 /J0iVytv4RzZ3oho/Y70xO+9Xrwq6pTc0DlUDNfrJ8/5ydo4TO1aoI1z19SPB/uD1Ttaj
	 gXEfA7TSTz1wj4TeZI41yf1433CPSmOmh7O+eBrxZeEsjXO9o0wW6UJLiW3BsZrMDMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QwtFPDgv;
	arc=none smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D633606A31D
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 23:02:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D633606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QwtFPDgv
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-53634b8328eso27594361cf.0
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 15:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795388576; x=1795993376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2vtq+bJAgkK5J7ORrOJ12oBNTPI8ZkKXFNJnCJW1Feo=;
        b=QwtFPDgv33BmxV4+Xike/FEy+L6uSWkDBttFSL8qbI08MhA6opEgTJBj1O/gs/LSvY
         pkvsTKWtjLTPRarMAcO9KVr7YrVofDVztR8jrlByPdX0lOz9KGCXWo0UbBkECNy7mG2H
         AUhs2d82k1eG5fGubgc+UPZluBpk7e60+YQERHTtZlrA1KxwLWwG8Ne28iWG+wSDAcHk
         mzalP5xMme+ZP+HtFr79YL1sf8+jkcTyy2xEXn3xboo6rtuVEwXlSvbOI24KaSG+7q2D
         OPc9sarA94JGm/ha2Qea/IV/C1+e42KX6JVqoI01j+67mfS6ldYTLtT2N7JRZVM66zfS
         kbXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795388576; x=1795993376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2vtq+bJAgkK5J7ORrOJ12oBNTPI8ZkKXFNJnCJW1Feo=;
        b=utQ8A51oAQVOUivwEU3h3LzIGtFbeT0IM2BJbCpNQiWtHmyUKGqnmBxG1p0/Kc/pZ0
         tdUmYrnJ/rG7SrcLhcyEjj6AO2sTOS+AjcyjEonZyRE8JcKlBucfaD51uSm14i5gBOZ0
         2hUbDZGxD9gO77Vr/S9OqaGVpg0noBnmMtTcGIbpTJdDLf0slZK2GHcgyxOdPoTlj2i2
         H0xLGnhrISHBFu1fd+/1mCZ3YbFwsslu3nUQCgpoFSKBtzyQA9I/yl1diPDwmu0EZN3N
         uJil8rXc+og/CSDOavnI/jpJPSfsXNHkuo8+E6Cew+ji7q82MhXdqDIpDF6snbvmV0HB
         16Bg==
X-Gm-Message-State: APuU4Z8t3nz3tclj7Z08owOVbMFlmo5Y8IWRnypPOG434DQjcNWHEA3F
	BWJtTCeycrK5yy3Wn2PzU4wbRT9lrsIZp5o26VUiduAt58aU8gwOAtvywJLZJ7Hu
X-Gm-Gg: AZFdTZcmZkZpoxCKDfs68DuEhrdezuM5NefwpOm0hvq4p0E2WSpy3HGVA3LVq0p2NhE
	lzGJnaYM9LfXmo0lz27KJ/yQDvesF7zrMvk7gY8GUc8WdYY0riPEafftHc4GYqcf32u7Yaictgl
	yXIHwRQCamU8iGd9vIiq+x037AD+deAVHyB79u0zP71mU0P28iS+vlmVyETmPx2DvT3SomSsLRt
	C3sJ4C/3JXw2WlCpUv7i/l6A0VYVHj+HmmZXnIrTtLVrPNbwJBQ2BxKLVu7e6VMltxEK5mubXHS
	pWU5N0aqVS9I7CnchcXbqSIZuqO9gnlYU5qty1qUhrtDSJnRnbhIDa43K1j+UtKCvxElqsSzE0C
	FwfL+5AoIdEmbpwhyAo0+2djP4B+0bYAc1KwpAFSbTzolc4YpiNj/mYZo2lBh8EChS8tvmAMP9g
	UDgbiWh9ZJnQsy+bUHqwZfVazM0RzqJ8Pn74obCL6dLKNMRB+2PK6OlDINeTjnX5GAIDG7PLrxt
	iokrywGd9AUjyrh92q/ZINz5rDVo5WR1Vh2KGWw5LZptcTh6dBDsBu+2eO0LGG41zNgy1p7vZCK
	b8OWNkuMl+h8BoQnK6zG1/auIFhNE4QLxDZhb72RooOhSnMDbm2t/r+LxCiNqwrxjDk9jR01PfG
	grrW0suyB/NLawC7WXvTE7Cqt6AR+K+yyva00ow0J7V+h+Er06uiQ9dNxBBk0CjYf93GDIYqf2V
	x55E70xLfxrSwp1jx0
X-Received: by 2002:ac8:5a08:0:b0:55d:25a1:72ac with SMTP id d75a77b69052e-55d76a26882mr177747901cf.27.1795388576409;
        Sun, 22 Nov 2026 15:02:56 -0800 (PST)
Received: from wsfd-netdev58.anl.eng.rdu2.dc.redhat.com ([66.187.232.140])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788506b0sm82756661cf.17.2026.11.22.15.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 15:02:55 -0800 (PST)
From: Xin Long <lucien.xin@gmail.com>
To: network dev <netdev@vger.kernel.org>,
	linux-sctp@vger.kernel.org
Cc: davem@davemloft.net,
	kuba@kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
Subject: [PATCH net] sctp: unshare GSO skb frag_list members instead of linearizing
Date: Sun, 22 Nov 2026 18:02:54 -0500
Message-ID: <20e1d469385153bcfa766080453e8d9c1d64c339.1795388574.git.lucien.xin@gmail.com>
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
the frag_list skbs are shared by reference. The SCTP receive path then
races on shared sk_buff headers in sctp_inq_pop(), and can hit a BUG_ON in
__pskb_pull_tail().

The previous fix in commit fd60d8a08619 ("sctp: linearize cloned gso
packets in sctp_rcv") checked skb_cloned() on the outer skb and
linearized the entire GSO packet. This is insufficient for two reasons:

 - A partial pull into the frag_list can privatize the head while later
   members stay shared.

 - Linearizing destroys per-segment boundaries, breaking AUTH: the HMAC
   is computed per segment on transmit, but after linearization the
   receive side hashes across all concatenated segments and the digest
   never matches.

Fix by avoiding linearization for GSO packets entirely. Add
sctp_gso_unshare() which:

 1. Calls skb_unclone() to unshare the outer skb header without
    flattening the frag_list.

 2. Walks all frag_list members and replaces any shared member with a
    private skb_clone(), giving SCTP exclusive headers (data, len,
    cb[]) while still sharing the underlying data buffers.

Fixes: fd60d8a08619 ("sctp: linearize cloned gso packets in sctp_rcv")
Reported-by: syzbot+f15a6eff7a53f6eb7dc3@syzkaller.appspotmail.com
Signed-off-by: Xin Long <lucien.xin@gmail.com>
---
 net/sctp/input.c | 42 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/net/sctp/input.c b/net/sctp/input.c
index 9494cfa51106..cd84ee44b9f2 100644
--- a/net/sctp/input.c
+++ b/net/sctp/input.c
@@ -82,6 +82,38 @@ static inline int sctp_rcv_checksum(struct net *net, struct sk_buff *skb)
 	return 0;
 }
 
+/* Ensure exclusive ownership of frag_list members for GSO skbs.
+ * pskb_copy() shares them by reference; unshare by cloning in place.
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
+			struct sk_buff *clone;
+
+			clone = skb_clone(p, GFP_ATOMIC);
+			if (!clone)
+				return -ENOMEM;
+			clone->next = p->next;
+			consume_skb(p);
+			p = clone;
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
@@ -117,8 +149,14 @@ int sctp_rcv(struct sk_buff *skb)
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

