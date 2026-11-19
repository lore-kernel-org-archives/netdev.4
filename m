Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095674;
	b=L9GLbvoGJ1ZJlvnq4ES73/I4WPzyPvWHvxLgpVHL+oz+kU1VDy05QlEkfKYWP7dOVzaS
	 snfxCYUTU4VCAJwfbvw0nEggzoWIHrHBfHDr5xOdJjFbvkjhSGy/eSNYyZauNf7UzSDdk
	 S8ewXOnutlqs+YX0vNWHw+/CQXfpUkM5VAN0OhNY511ilsnUm/WF1Ffgm/Z3xcpRB7y1Q
	 TIRM4Vw5KKKPtAIJgii9OkoT9uFuYE5ZThJx0S12thWLqfNRrFB+qJEypBs/q38oJFd1S
	 jOYHTQubNJyJ2urSpxPFxldeC4iQWep2GR/NSbSLH/6GZ1SxjoGdHvgoiC4URFkyqnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095674;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Qd4bx4OUZghZ7ls8uoKi/iBPko+kcWdFcEqzSd0yD1U=;
	b=Obp5q4Zpo/ViWldslKJJu9H8iFfvLuynE2Td6N1aD6ymLZ2r9qoqMXXsMwD1jN0qKt0x
	 zzRN43aX/+lrCybiN3ULX/+oFXsAuVPuQigZxmzWXFbxefOpkhwoTMC9V8xDKgxm3l5GV
	 gM5kroNLH9AZtw4pTPjV6R+heVGhM/NrOjroSqOFQrC/IXliiH599qmaZQACu8gwjobhv
	 EDKY9UN4nTA57qoEUyDG/SQdCPup69gjJK59ym5TB27Er98W1X9mqz68SCbBeKftTSaYX
	 OXUB0IoXD33SxUZ+LDrz+ZlXWY/YVn50wQ0NH2x/J/UN9okdU/KPZglp6v1w2+gh3AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yo0muiJE;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C320606A326
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 13:41:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C320606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yo0muiJE
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4cdc606b47so380752066b.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 05:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795095673; x=1795700473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qd4bx4OUZghZ7ls8uoKi/iBPko+kcWdFcEqzSd0yD1U=;
        b=yo0muiJEqXgZ5B5uz2e4Yh7KzHrUl6cIwy9N3xmyntYxBBIYmS3beEjJKewBtQSR4c
         WwLbTdmC/OIIJ7BddGlUzqFwydGR9OSw9afo4deTHw6gXWI5BOYYGa1wBxj/q6IhbkMZ
         CqwAVmv4Kp0h0g+hCc1XSm2FMK8qj/DFbwRkBTDzeBUMQBTmXcbJj5bA0sBMe24LgSPV
         jfeUrtlxAj6OGObVjbGcO8bO88HVFs/rNTl9y5XlvnoBFf4Vo6uzi/4A0tc0lxTm7mh0
         nV7fd5qHdo5v63q+AMvKhe4QkFWZKfb+1/kEUDofL0zB+fMASTu9hZg/LJv7U/5A3V+P
         Es8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795095673; x=1795700473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qd4bx4OUZghZ7ls8uoKi/iBPko+kcWdFcEqzSd0yD1U=;
        b=jl+QiAg5aYtlt68CXsBQIAGLN1vPYuoCKoVAP+SCBfHgV02IH302q+AWfu1AIDU5gh
         Yb1LwpNCM3Ngt3dOq3npEbwCD4kdCMzAAmy4sfMGYHMrEgrrV9i1Hr1lWPCy4dO1vYYl
         9FFXYRc3ItQJqdqRzBwKuOGorNDbFVh+VA6c0SyiId7LveCKkOAGbsDJufEOB2HGV9hc
         Q0fgTKBlyIKxHhcU9ybhxGvzNjuS1MNKm1kjou3oo0O8txAPD2hnhiqzTlL2776l6+1W
         IE5Ygrqt0Q3JGHPF3Cq0LbmSlCcIUPduttwXJ9wlXDxLUphqt1Jh7hxMw6ymGIHU3zU2
         Pjpg==
X-Forwarded-Encrypted: i=1; AL+hErEgr2Jz/YiTmEoolc1EbG/Kn0fIrCPmJkhxf3OuJ/n8QmjGzuuP2hpQ3/S3LzNo7XCSXB9w44E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cGEnzTu23i2D97pMf7qvKvx06LqP2XQnzjZKJL9it+ulryg9U
	8WPlmM5S6TUKax6BozxLQZjFuWwdHvUoWrRVjpSJWHlH8sHoo+BpQbaxfsiJXC5Z
X-Gm-Gg: AYBFou2KNzRNnEzcKNHZrH+lkJ9gySkWx3W3YBU3feMR17+J3r08W3SkbWcmr/g0qO4
	FBjPSIR9Z+Eec2vNrjtNaUMqjwo9QM7ngwM5J1vydxL3YsYSz39jFEi1osusBed9uZeq9Z1h//a
	SohjyyZJP+6uJHU6p2yRIBJu3pCzBbLvJzumIrDNJGDoc4/ZXV9YH2pSzLXeqSq/8FsTeSsLP/f
	25mrXqP1HkTDKNHPSn4Ajld1+XqaEeKECI4SPHUzsf8Xw1eny46SBhAaS1z+GcUbNwVbMbfXAs4
	Hp99VDAu3dxW/J/HSTCy7owHhoRFQu5Xa57T2zQbcQ9TksoCz7Zcc48z+dQ+dvhCoAzVByWfMgh
	ZPV0yjSSth4r5nR3EMNcXF9yIlO75QHwV08zrH6iX2DMN9T7PZzY8Yt0YvPdNSwAVqrBrTHcO6+
	hkymvHqiSENG1fXvbbg9C721RU2lVebvCnlYDSVkE++LhRkZXsrLoOPYJsV8xth93ecXv0xsdXC
	Okk6Wng5JhKxzkWlRrVpR7JrG3CeOY5kPy62BnuAlnOhAiwL0HTfJ/Qx/FquxC4S5SOTG60mk6I
	80gWRCn2GkdbC/ZqGQW7hP0WNVQ/ZRC+HMjRL8uehWS1s088OPVKKbVnyXxnlsACo4JgQzOjBkd
	TuZ7hOSNk62aR+w==
X-Received: by 2002:a17:907:ea8e:b0:c46:7ec3:fde2 with SMTP id a640c23a62f3a-c510e19b619mr560024766b.11.1795095672804;
        Thu, 19 Nov 2026 05:41:12 -0800 (PST)
Received: from VivoBook-ASUS-X712UA-M712UA.lan (user-31-175-182-49.play-internet.pl. [31.175.182.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c512346fc3fsm105582666b.59.2026.11.19.05.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:41:12 -0800 (PST)
From: Stanislaw Pal <kuncy7@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Yongzhao Chen <yongzhao.derek@gmail.com>,
	Alexey Immoreev <luixo-public@luixo.me>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v4 0/4] net: dsa: qca8k: fix the MIB autocast and management frame handlers
Date: Thu, 19 Nov 2026 14:41:06 +0100
Message-ID: <20261119134110.15048-1-kuncy7@gmail.com>
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

The netdev AI review of the MIB statistics series [1] found bugs in
the qca8k handlers of the Ethernet management and MIB autocast frames,
and its review of v1 of this series [2] found two more. None of them
has been seen in production, so as Andrew asked for the related MTU
series [3], this goes to net-next rather than net. All four keep their
Fixes tags.

1. qca8k_bulk_read() falls back to MDIO when the management path is
   not available, but stores register i at val_buf + i with val_buf a
   void pointer, so every multi-register read is garbage: the FDB dump
   and the MDB add/del write the wrong port mask back into the ATU.

2. An ethtool MIB request over Ethernet (autocast) that times out
   leaves the caller's buffer published; late frames write into it
   after ethtool has freed it, and extra frames underflow the frame
   counter. v2 also handles the frames of an earlier autocast arriving
   during the next request.

3. The autocast handler reads up to 164 bytes of counters without
   checking the frame length.

4. The management ack handler trusts the frame for both the length and
   the layout: up to 32 bytes into a 16-byte buffer, read from
   skb->data without checking that the frame has them.

Changes in v4:
- 4/4: take the Ethernet header again after pskb_may_pull(), which can
  move the head; v3 read ->seq and ->mdio_data through the pointer
  taken before the pull [6]. 3/4 already did this for the MIB frame.
- Rebase on current net-next; 1/4-3/4 unchanged.

Changes in v3:
- Rebase on current net-next; the code is unchanged.
- 1/4: the description said that the last three bytes of a
  three-register read are never written; it is the last six (Alexey
  Immoreev) [5].

Changes in v2:
- Drop "let regmap serialize register access" (v1 1/3): Yongzhao Chen
  carries it, unchanged, as 1/2 of his net-next v8 "preserve port state
  across MTU changes" [4]; this series does not depend on it.
- New 1/4: the MDIO fallback of qca8k_bulk_read() (review of v1 1/3).
- 2/4: poll MIB_BUSY before the next autocast, as qca8k_mib_init()
  does after a flush, and track the ports seen as a bitmap instead of
  a countdown (review of v1 2/3). The description now says that a
  frame of the previous autocast still queued on the host can serve the
  next request, with counters one autocast old, instead of claiming
  that every late frame is dropped.
- 3/4 unchanged (v1 3/3).
- New 4/4: bound the data of a management ack frame (review of v1
  3/3).
- Target net-next; describe the LLM assistance here and in the commit
  messages instead of an Assisted-by tag.

Testing: the affected objects build with W=1 on arm64 on this base.
The hardware test is the one of v2, from before the three lines v4
adds to 4/4, which are only built: on a QCA8337 behind an IPQ5018
(GL.iNet GL-B3000), kernel 6.18.60 with these four patches, under
tag_qca with the management conduit on port 0, counted on the conduit:
one ethtool -S costs 3 management frames up and 10 down (the MIB_BUSY
poll, the cast, the 7 autocast frames and acks); with the request
timeout forced to 0 by a test-only module parameter it costs 50 up and
57 down, i.e. the register fallback over management frames plus the 7
late autocast frames, which the handler drops. The counters stayed
monotonic over 2000 such reads and over 5x200 reads under iperf3 in
both directions while toggling the timeout, with no memory growth and
no splat. Under a tagger without management frames (qca-8021q,
OpenWrt) the MDIO fallback of 1/4 was checked by the FDB dump.

LLM assistance: Claude Code (Claude Opus 5.5 for v1, Claude Fable 5.1
for v2, Claude Fable 5.2 for the v3 rebase, Claude Opus 5.5 for the v4
fix) drafted the code and the descriptions from my analysis and the
review findings, and helped work out the race in 2/4. I reviewed every
line, built the series and ran the tests above. The review findings
themselves came from Sashiko, the netdev AI review bot, and for v4
from the OpenWrt AI review of the same patch in OpenWrt.

[1] https://lore.kernel.org/netdev/20261019191137.307514-1-kuncy7@gmail.com/
[2] https://lore.kernel.org/netdev/179304303832.3134.328719975361344250@kernel.org/
[3] https://lore.kernel.org/netdev/47e9713f-815e-4caf-8928-a7ec12d0087b@lunn.ch/
[4] https://lore.kernel.org/netdev/20261104120130.48455-1-yongzhao.derek@gmail.com/
[5] https://lore.kernel.org/netdev/20261107031005.2525-1-luixo-public@luixo.me/
[6] https://lore.kernel.org/netdev/20261119133908.12428-1-kuncy7@gmail.com/

v3: https://lore.kernel.org/netdev/20261118104104.26684-1-kuncy7@gmail.com/
v2: https://lore.kernel.org/netdev/20261104210757.467964-1-kuncy7@gmail.com/
v1: https://lore.kernel.org/netdev/20261022192933.384898-1-kuncy7@gmail.com/

Stanislaw Pal (4):
  net: dsa: qca8k: read each register into its own word over MDIO
  net: dsa: qca8k: drop MIB autocast frames once the request is over
  net: dsa: qca8k: check the length of MIB autocast frames
  net: dsa: qca8k: bound the data of a management ack frame

 drivers/net/dsa/qca/qca8k-8xxx.c   | 84 ++++++++++++++++++++++++++----
 drivers/net/dsa/qca/qca8k-common.c |  2 +-
 drivers/net/dsa/qca/qca8k.h        |  9 ++--
 3 files changed, 80 insertions(+), 15 deletions(-)


base-commit: 9068e05d35f3b02a802f520e664032f802bcd2e9
-- 
2.43.0

