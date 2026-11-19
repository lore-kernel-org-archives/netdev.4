Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=130.149.7.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081473;
	b=d7Yxkf9AJhs6VJYEqO364DCRTO+jNNAdrMKEOATBBFNgSjVG5rPsy6bjpPhoTUc4sYyV
	 paOekUZRWDQLhHdsxKXHcEoD0Tw0rchSJBu9zz579TTKhp44Bium0Uos3ASWS9KEV+d9o
	 6UqdROSqin1xyizVEFgyAunGjqRSda7u0EBT/tXuayGS5uJXLDGFukjlnYs772tb/VSaY
	 /vxlGFLdF3UdipyiX/QGulca+85FaBOg+ANBicf6JAGJkZrYfGezd4wi+2X8I72zG0HkO
	 VdtzpzPAXqSP2Mv7CeYv8Z2rK4ashMSDbXxBeJQuW7execT0Pa5g7CPpKP09jPA7AcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081473;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:X-B4-Tracking:X-Change-ID:To:CC:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=V+3UsMjZBvcdao0W9uMQLAzOcFQLxo5afAU/TJpG878=;
	b=jGZOO+bB1PFgimMFrgxutg6AWavJncewENlnDoiyQwPBBhTZRr5vHdTLSI65bIIAmWkq
	 9hQPj7mMl59/4gQ/50s4j0B6dq76abSpJld8hDuYL3p5/AUR9e+ACo9ZLKcjL7tM19tBi
	 A6iDiO332amPERwiizjEU92wwOjRrasZVY5urX7EMoYvVPdmE0S3ceABbV5u93Al2k2/V
	 ebeGgclygkgr5Rn2Yq7qI69GENMK4YoY2gwCMkRgB3G9AOWGzGh5lY+LQIkfSgzrqUbAD
	 RG4qasNJ9NATlijOOFVgLJVxrSrdbYM4SdyfsdNUURzzQZyZJjSfYvhvt6rEYtkaKeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tu-berlin.de;
	spf=pass smtp.mailfrom=tu-berlin.de;
	dkim=pass header.d=tu-berlin.de header.i=@tu-berlin.de header.a=rsa-sha256 header.s=dkim-tub26 header.b=UKqhatpb;
	arc=none smtp.remote-ip=130.149.7.70
Received: from mailrelay.tu-berlin.de (mailrelay.tu-berlin.de [130.149.7.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F95606A320;
	Thu, 19 Nov 2026 09:44:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07F95606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tu-berlin.de header.i=@tu-berlin.de header.a=rsa-sha256 header.s=dkim-tub26 header.b=UKqhatpb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/relaxed;
  d=tu-berlin.de; s=dkim-tub26; t=1795081472;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=V+3UsMjZBvcdao0W9uMQLAzOcFQLxo5afAU/TJpG878=;
  b=UKqhatpbs8aWjzWlrzZgRi7RuXZfNlXXisrPUCElz39MOS69o0anagWD
   aiMnbTjcbHpim64N40NMIDvF0RwNLic7NW7Xjc6UeotACG3uP4W6UR80B
   KJ1txZ6b41bZ7L7azfEu3gjnLe3q5j9pcPSc+E/PRLJcgVMYiAF6qpNut
   tpelbgG+Ln6XDztu+zrxEvARWdPX4UsTqqmy6/0vcFlU+1b24k5ugwYup
   hNgb4bm5NWPKviuUAOzbwmzaFXuSEQxZ1GGw+iuLHiWb/f3tVrb9UFhKL
   OB+Q2e3Pu90RvOcm3iYDXdrJQoXEcmfgRVDskb/WRwJqgL4Ark/O+FOpC
   Q==;
X-CSE-ConnectionGUID: Fq4jeTPTSjGxSZQYuQNw1A==
X-CSE-MsgGUID: 6J1wcFywQl+Syul5X1f+2A==
X-IronPort-AV: E=Sophos;i="6.27,220,1787004000"; 
   d="scan'208";a="54889326"
Received: from bulkmail.tu-berlin.de (HELO mail.tu-berlin.de) ([141.23.12.143])
  by mailrelay.tu-berlin.de with ESMTP; 19 Nov 2026 10:44:23 +0100
From: =?utf-8?q?Jonas_K=C3=B6ppeler?= <j.koeppeler@tu-berlin.de>
Date: Thu, 19 Nov 2026 10:43:57 +0100
Subject: [PATCH net] net/sched: sch_cake: fix unintended tin override with
 cake_mq
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20261119-cake_mq_fix_incorrect_tin_override-v1-1-3238122d09ca@tu-berlin.de>
X-B4-Tracking: v=1; b=H4sIANzE/moC/x2NUQrCMBAFr1L224BbqFSvIrLE5KmLuNFNKELp3
 Q1+DgwzK1W4otJpWMmxaNViHXg3UHpEuyNo7kzjfjww8zGk+IS8PnLTr6il4o7UpKlJWeCuGSH
 neQLPPF1jpB56O7r9n5zJ0OiybT/vFcQfeQAAAA==
X-Change-ID: 20261119-cake_mq_fix_incorrect_tin_override-dd85e1815baa
To: =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>, Jamal Hadi
 Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
	<horms@kernel.org>, Willem de Bruijn <willemb@google.com>
CC: =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
	<cake@lists.bufferbloat.net>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, =?utf-8?q?Jonas_K=C3=B6ppeler?=
	<j.koeppeler@tu-berlin.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795081463; l=3525;
 i=j.koeppeler@tu-berlin.de; s=20260219; h=from:subject:message-id;
 bh=qOg+PjfmvlIpJEXH52wn9tweaLIrOgRqgsCHOQ7C1ns=;
 b=uqVbuwB9GkQbApH4Rs6/JKgCHuVV09HojmGQvO3UOIiCEQ5rGctweFLn/aoR2elW0jzm7V8Sz
 E2Fjn4DEJpbDbhgni1E8RzvARUa1qME2UbXBWDFddQg/e9SkB/gHsig
X-Developer-Key: i=j.koeppeler@tu-berlin.de; a=ed25519;
 pk=+pMLYEiy24PHhKr0HCDJhKWgh9WowPOEUOtiuMX7LLc=

CAKE allows overriding the tin selection through skb->priority: if the
major number of skb->priority matches the qdisc handle, the minor number
selects the tin. With cake_mq, the per-queue CAKE instances are created
through qdisc_create_dflt() and never get a handle assigned, so
sch->handle is 0 for all of them.

For forwarded IPv4 traffic, ip_forward() sets skb->priority from the TOS
byte via rt_tos2priority() when net.ipv4.ip_forward_update_priority is
enabled, which is the default. rt_tos2priority() returns 0, 2, 4 or 6,
all with a major number of 0, which matches the handle of the cake_mq
children. The minor number is then taken as a tin override and the DSCP
mapping is skipped.

With diffserv4 and diffserv8 this puts packets into the wrong tins. For
example, AF13 (TOS byte 0x38) under diffserv4:

  ip_forward():
    skb->priority = ip_tos2prio[(0x38 & 0x1E) >> 1]
                  = ip_tos2prio[12] = TC_PRIO_INTERACTIVE_BULK = 4
  cake_select_tin():
    TC_H_MAJ(4) == 0 == sch->handle
    tin = bulk_order[4 - 1] = 3                     -> Voice

whereas the DSCP table gives diffserv4[0x38 >> 2] = diffserv4[14] = 0,
i.e. Best Effort. Likewise, AF21, AF31 and AF41 are demoted from Video
to Best Effort. diffserv3 happens to be unaffected, because the only
reachable override (priority 2) agrees with its DSCP table.

Fix this by matching skb->priority against the major number of the
parent cake_mq qdisc when the instance is part of cake_mq.

Fixes: ebc65a873eff ("net/sched: sch_cake: Add cake_mq qdisc for using cake on mq devices")
Signed-off-by: Jonas Köppeler <j.koeppeler@tu-berlin.de>
---
Reproducer: client -> router -> server over veth, router forwarding with
the default ip_forward_update_priority=1, cake_mq diffserv4 on the
router's egress (2 txqs). Ping with -Q 0x38 (AF13), compare per-tin
counters against plain cake:

                  Bulk  Best Effort  Video  Voice
cake:                0           50      0      0
cake_mq before:      0            0      0     50
cake_mq after:       0           50      0      0

Setting ip_forward_update_priority=0 also hides the bug.
---
 net/sched/sch_cake.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/net/sched/sch_cake.c b/net/sched/sch_cake.c
index aa4043d662c1..5a37b7a5d569 100644
--- a/net/sched/sch_cake.c
+++ b/net/sched/sch_cake.c
@@ -1679,7 +1679,7 @@ static struct cake_tin_data *cake_select_tin(struct Qdisc *sch,
 {
 	struct cake_sched_data *qd = qdisc_priv(sch);
 	struct cake_sched_config *q = qd->config;
-	u32 tin, mark;
+	u32 tin, mark, handle;
 	bool wash;
 	u8 dscp;
 
@@ -1689,6 +1689,8 @@ static struct cake_tin_data *cake_select_tin(struct Qdisc *sch,
 	 */
 	mark = (skb->mark & q->fwmark_mask) >> q->fwmark_shft;
 	wash = !!(q->rate_flags & CAKE_FLAG_WASH);
+	handle = q->is_shared ? TC_H_MAJ(sch->parent) : sch->handle;
+
 	if (wash)
 		dscp = cake_handle_diffserv(skb, wash);
 
@@ -1698,7 +1700,7 @@ static struct cake_tin_data *cake_select_tin(struct Qdisc *sch,
 	else if (mark && mark <= qd->tin_cnt)
 		tin = qd->tin_order[mark - 1];
 
-	else if (TC_H_MAJ(skb->priority) == sch->handle &&
+	else if (TC_H_MAJ(skb->priority) == handle &&
 		 TC_H_MIN(skb->priority) > 0 &&
 		 TC_H_MIN(skb->priority) <= qd->tin_cnt)
 		tin = qd->tin_order[TC_H_MIN(skb->priority) - 1];

---
base-commit: e203d8a4751d48aa00eda31e3b320ba8e0d47dbf
change-id: 20261119-cake_mq_fix_incorrect_tin_override-dd85e1815baa

