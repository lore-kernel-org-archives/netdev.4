Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795161310;
	b=H3vC+pU9aPZAESnW98YwuM4npOClULs6FxHCHqK20joiMcAUvN8ZkjNC5x50A3BNV76+
	 78j2BW4j6BnADcFUZvKLgXbJhDmv0G4R1sjF9qyvzvr000RIvc9GuJOgfV96FUJnYdJkR
	 PSybMTLGoBlo4nkyHv0Gi+kYPbWx2cFJ98FvG6Sgb+CVJ4RBQMyjHavlbn7h0gKDe+FAO
	 pkcWVSIlEnSqGXfnKarR2quGKdvZENrKlSZHggFZw6TCgk/1Ns2gf38b/NJsmyDp8sa1q
	 a3u6+Ihc30/Ew/ffh1wT4RNflYzJsI7unvti5r6PhBSzoyF6wjveJJM4tMTfJXPbBDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795161310;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=++UQ42/+mh10cd5bdbFo3XyNe3E6KwnEO9Zqkc0vqdY=;
	b=QRWEDM+ZW3H3Xm+Hf3aS+LuMfIeqFk6lzZuDD8VH+Eti/YjTIe4M87GO+65i/ZUsxvQc
	 0W6REQlpOi3N57DQAlhQ+DitHqxc7PpK8KhtQEIrELgEBgPWIjUM3j0VYdLef+oOLlYth
	 oQSa2t/CVBlVznBXepxNESJEd02/rewJ4FN8Cl43AueDVfKFEhoy4f0Gcb8kPc7oXZfLM
	 Dmm+r7D+aYj+D5wrj5AbTgcfbUxOPycNrlX9/9wjQQWuXuAdqA3rA9qYRR5pqdGNhc9lp
	 JbCMhYu2at7oz+6OhDW6A5rJ496jAwFQ12tUXDKjIBuz45T6rWeVk3kbG5NgxwjHjng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wUBEbIS8;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17755606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 07:55:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17755606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wUBEbIS8
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f04b676219so1086765ad.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 23:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795161309; x=1795766109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=++UQ42/+mh10cd5bdbFo3XyNe3E6KwnEO9Zqkc0vqdY=;
        b=wUBEbIS84kpxvuTsx6OT5CuUPO5Bnsqu25pXTlbgK64jb5OSL6wcz/Y5omuHE2XZIp
         9HSbRO59tt5I5w0TiXv1IMKb5OVls+234e8AS2rnCqEej2VbKf3VAH+97Xe0xs5S7kHP
         F/vT3DWfRxP0Xv1wrO3aYuPCb851D3aYNRrUoa143jBjQn1ujn+icu0pG2HtkEgGNlyp
         KzgkwzO28kPSn74BOudXBjQUdQazK/YRndN2ItZdE0Njj8uRjSgGGzJS7ENayCy+Mfzg
         SQrexaIpPtsZ38CvRkPEv/9S8I+aaDyaTPT9P0SLse1Oj5Mdval4TuDPSvjR2NsOTMwm
         5avw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795161309; x=1795766109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=++UQ42/+mh10cd5bdbFo3XyNe3E6KwnEO9Zqkc0vqdY=;
        b=qIDf4AoI/XXPAD4442GjQTozm10IfmMOEPhgz50WIHP2Be6xfoYTLwV47MwryvH0YQ
         rPc9clIbl1jUC3idNVQl4ZcscCnRex4r3ECJukmqd7/HmGTedOC1dqHJ/1WuiQabUfX0
         xa0rZxfPQnzbHM51kVOpvGlidJSEU0263mgx/WS2PvwdvlhFXpXpUAM9iwQxL51QaI24
         00ZrXDJPMOGIm1vF3zr8phrqstF6pngETfBS0+kbZYohJlfRjvnHEPB+By8aqQSZj/q9
         68Pu7CgDTtfJfjNUTprx86n7dLQbqpCMdPRRMyKxbhOb4mGDGhIp8HVuL6eD530VPGLV
         l7rQ==
X-Gm-Message-State: APuU4Z+qtnFvc6jyQJWcNrN2Hws13YvW+1kldTp4Ilf8zGwxg+Fj/j+9
	1GZ73jUbYyPeSexIwttermvGmX13HmflBWEHrrP3RS0ATZ5khZpY1Bc9QaCU8RrswTm9dRWd
X-Gm-Gg: AZFdTZfW7hnWoYOxo4R9dAaOFmiaZ3+1Y7J7W/PvW0rncTVn4O5pyWpJU5IWUZCWiiB
	nbRuX6TGZZ8l6MchsgH179oXBCzFfBX3o4Tc230NcB36hQdORYx6zU1g6fQlCxSHmJ4H7KTMEXk
	5cdncLpMai5ls1SplPlxiRC84bZMmAF0GcMCLqXtziAfkE3TP6BlWbF4ZRWRGWyoICybtJtzm2b
	TvFLigXHmelULDcc9JdlgByDEVVb6k248Pk/ZWYfJ75dC57wRLcHPvXbzqA/3FBuWWNXLpdPlua
	9M5JVxm0vNHPMsirYLsrv3S808u2x1f3NfxMzeAdNjzQ6sNczzLEl9lsdYGYdSUAlximkmPIlga
	6nOumUqVRhY+esQU+pv5H1s5BV3TjfBL9yryhQqRHx4Vg0Ypsx5OR3k8sFN8MolPG+eNttwImgK
	NLob0ZQhYpbLOJEdG8af6BA7jGlFV3RzdtGWt6Z/AT7PjqRQWJ8PqPrr2EIseGKxdTkl22QKj2d
	gZYE/4r+ByI8DDlGHlO6j3tGnMgF5Qc9FtQOM+eMKxParnSjp/ls8TSi1IqP3EknmlrTL5+6pvM
	hTLp6Pvaww3+HuDlDU4jNrlmLQlr1IC3SquR96+IaQzWx1I=
X-Received: by 2002:a17:903:2b0f:b0:2ef:d9b8:463 with SMTP id d9443c01a7336-2f03f186250mr24454025ad.35.1795161309252;
        Thu, 19 Nov 2026 23:55:09 -0800 (PST)
Received: from revrse.tailec2828.ts.net ([166.111.83.77])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2f03ee84871sm11010785ad.8.2026.11.19.23.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:55:08 -0800 (PST)
From: Lin Lei <llleigoing@gmail.com>
To: netdev@vger.kernel.org,
	mptcp@lists.linux.dev
Cc: matttbe@kernel.org,
	martineau@kernel.org,
	geliang@kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	willemb@google.com,
	horms@kernel.org
Subject: [PATCH net v2] mptcp: exclude MSG_PEEK from receive buffer autotuning
Date: Fri, 20 Nov 2026 07:54:59 +0000
Message-ID: <20261120075459.2862977-1-llleigoing@gmail.com>
X-Mailer: git-send-email 2.43.0
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

__mptcp_recvmsg_mskq() passes bytes copied by MSG_PEEK to
mptcp_rcv_space_adjust(), although those bytes remain in the receive
queue. Repeated peeks count the same data as new application
consumption and can inflate the receive-memory budget. Subtracting the
unread queue at a measurement boundary cannot undo that repeated count.

The receive path originally skipped this adjustment for MSG_PEEK.
Commit 581302298524 ("mptcp: error out earlier on disconnect") moved
the adjustment calls without preserving that check.

Only adjust receive space for non-peeking reads. Keep the returned
byte count unchanged.

A loopback test leaves a fixed 32 KiB queue unread and peeks 4096 times.
Before this change, sk_rcvbuf grows to the configured 8 MiB limit.
Afterwards, both the budget and the queue remain unchanged, and a
subsequent consuming read returns the original data intact.

Fixes: 581302298524 ("mptcp: error out earlier on disconnect")
Reviewed-by: Eric Dumazet <edumazet@kernel.org>
Reviewed-by: Matthieu Baerts (NGI0) <matttbe@kernel.org>
Signed-off-by: Lin Lei <llleigoing@gmail.com>
---
Changes in v2:
- Send this fix separately from the other patches.
- Update the author and sign-off and add the Reviewed-by tags.

v1: https://lore.kernel.org/all/20261117052200.1507847-4-llleigoing@outlook.com/

 net/mptcp/protocol.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/mptcp/protocol.c b/net/mptcp/protocol.c
index b375da1f17fed..ca0ebcf11e02c 100644
--- a/net/mptcp/protocol.c
+++ b/net/mptcp/protocol.c
@@ -2216,7 +2216,8 @@ static int __mptcp_recvmsg_mskq(struct sock *sk, struct msghdr *msg,
 			break;
 	}
 
-	mptcp_rcv_space_adjust(msk, copied);
+	if (!(flags & MSG_PEEK))
+		mptcp_rcv_space_adjust(msk, copied);
 	return copied;
 }
 

base-commit: 4d67cf2fd2352f130c42494a933ba9158b925c65
-- 
2.43.0

