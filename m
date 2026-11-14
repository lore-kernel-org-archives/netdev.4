Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794658475;
	b=fAWYDNas5Gfp1BFCgJNkrFuP/FkBtbdhNeJlPmkGP5FmyOmbezUzxXoZngB1VgCCPABR
	 dnLd2WMCd3FY3CP3zN7ZQ16Dr4v3iDxbQVioBIfE5Y4wCePWI5EneD9vILsMemVLnV6Wo
	 g4mBVbuzTSypDdt1yYm5F7dfGvMsyJFfMSsWrccdcxjZQk39JQLCl30CIuaNEbfMM4LVv
	 YPDegp7AKW3Vymk4ao79epdznRNNBLmzJGFpI8aImWwin6WEjYe46mw5K55z6+/JBZ0yU
	 OtWteeSYnF5CkkrN/LovbwC1rR2o+Djy9KXmb8s0APJ4ZhaNuqB52x4fCMYnRpdzNDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794658475;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=tTIiLpDOOjOiY6YNXTXY68AsLZjNpjTi2i4PTJ3SyLA=;
	b=sILKkOPLU4yolviX6as1zTgqDGQlwcqBq3Kd7BdZoOuVt5KeKewPIFmvognmgPH2J2N+
	 SnCJ9W94PSx/9KwfSabH1FRytfmHBP5r8Ccfc/ZE3DyjGDKuNH3hNEqIi0ag6QTUtJV+Q
	 AVxBHz1VGpDDogUxP4/2Kfd6Fo2x6isCAPTRFYK/VRb04ItVS7bvYF89oVH0O35SL554n
	 i3nBDGl31MKP8MqKSx4mNVVIVR0bRvAdVAYWUUd243EXBw3ciOXs+JMpk/DlhRZOcL0kv
	 EeJ/ZOmmpDOOuOF2ZZjN+y6u6dr2CN11yAL8MTvOVazds3LqpuXMggeiLKBOnsJOGwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=SI+z7qFY;
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F0E606A335
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 12:14:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4F0E606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=SI+z7qFY
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91c847584b8so30735856d6.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 04:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1794658473; x=1795263273; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tTIiLpDOOjOiY6YNXTXY68AsLZjNpjTi2i4PTJ3SyLA=;
        b=SI+z7qFYhjEe4bd+OQQkF39jr88sHLNrOKj+yoXWdbKsMZYp9/2EWxHZJdnCW1DfDx
         Xw0i8WyC5v4wnuStd0VKhZJLElLxVNk7tikxNzf+kRRp1CLsyl4fU2q9/Lou1XE7VxHZ
         nCg10hb92l468WAgWMG1RauaF+W/QviWji0BQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794658473; x=1795263273;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tTIiLpDOOjOiY6YNXTXY68AsLZjNpjTi2i4PTJ3SyLA=;
        b=VIdsjkeRzOKWkOx/Ct4KIYhxGabn5gsrjNt0VTTIEpB71ZMWN/jvTFzEI5Ig/ZfmOo
         CTHWKhIdrVnVkqwR/KS7OmSC50Gf2Z6ikxGTphHY30B0Y38X7AASdMnkiyvAiRX+0UoX
         zPR/RHj2oBGE5gaunKUh7sqDuzyl2UJVOxs/Dbw/Jg47fVd+AJfKieUeti9gaJPlcQUT
         bQj3dA81wwOFWpNH/8bvn3mhXr+lUzxrI8WaFuw96bnKGZM42ifZ+WklZ5r7mHw8UGQg
         3+0oW1o+B2NpoHCHhZB6IeCeclfielXpyG/6JGMm2gIATiToHnSoi2W4s2i9InMb7HFt
         uIog==
X-Gm-Message-State: APuU4Z+qiTWIeeTso+Sh41zC9x7jaOKbeGsS8w5SNI9q00KaD92XC92y
	FBfVYltLhgkyCdnrIxT3TRSxQa5G3Y7Nplf2+lZZHcMYciVWglP5LOpk2mg0YY34uF+v1/eSY48
	ExwU=
X-Gm-Gg: AYBFou3sG4vyJC1erQgGc+NZ+ASjpHFB9bo+6OGTWhBiwuNON1SQmdEdCd2ypsDZn1N
	VoPSRoeY5BBpkrI+XpLVr+cdAojx9t2UXxV1CEPdYwn9SNGQJbFcOE3VHXD9gaEkWGvmZcz2cg1
	FRPajNsW4o+3tmnQf3M7sncGb4gHaaECbDZbI8q6XOjOBSzbY9cRxz+Re/8uo2HbYvPfjLf9+TC
	Vq4rwWe3UYLXWE4PbYzPOopJIGabKVHI+Z90Z+E4Uk9chuhfiqXhfkZW78U1COGIziwSBvl3TtZ
	UdHHFmFjFxTvcZQR2m+59RQ3GWdsYxoK/JeehZJ5UaCencKrKQ9j5gJ2PJ/9vfqUTj2XBA+a8vZ
	x8/6dDVWVs6X1ILmDgdvTanQjGXBMcpyM7TVGQtDZN8fND1UgEmjH+UIFBV9UxrORX50hTEVSS0
	9E+1EX/C+l+Y79t/xBb7K5t2K8ybLJFIyU6OEntVqcFPY15UvyYk1s2b/0y8BciD7Glgaek9ayJ
	UpQoXzVPxS9Oc0fJSFqly/LUDS573kvln3wBWByLNMMfe5zYXVd51u0IWqdpxEnN5U+uUd8qZMy
	4qW2yKfpfFOGhiwL88WBW2Jo01kYj7zQEl/+o5AwWHoo/FD6P77Sf3adJ8DysE710dDByvxnUfU
	1TMwwMjWWsie2KUw=
X-Received: by 2002:ad4:5cc8:0:b0:91f:1fb1:850b with SMTP id 6a1803df08f44-91f1fb1caa0mr101026206d6.29.1794658473606;
        Sat, 14 Nov 2026 04:14:33 -0800 (PST)
Received: from mbili.tail33bf8.ts.net ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d5e579sm41840486d6.17.2026.11.14.04.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 04:14:32 -0800 (PST)
From: Jamal Hadi Salim <jhs@mojatatu.com>
To: netdev@vger.kernel.org
Cc: Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Stephen Hemminger <stephen@networkplumber.org>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	Victor Nogueira <victor@mojatatu.com>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	cake@lists.bufferbloat.net,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH net-next v10 1/4] net/sched: cake: return the classifier result to the caller
Date: Sat, 14 Nov 2026 07:14:23 -0500
Message-Id: <QDISC-BA27.v10.r0.20261114071135-1@mojatatu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <QDISC-BA27.v10.r0.20261114071135@mojatatu.com>
References: <QDISC-BA27.v10.r0.20261114071135@mojatatu.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Preparation:
cake runs an optional external classifier from its enqueue path and then
computes the flow hash inside the helper. Have the helper return the
filter's overrides instead, so the caller owns the flow selection.

This is preparation for the accounting changes that follow. Packet
classification and flow selection are unchanged.

Link: https://lore.kernel.org/netdev/179269577009.3135.5221412623031392098@kernel.org/
Reviewed-by: Victor Nogueira <victor@mojatatu.com>
Acked-by: Toke Høiland-Jørgensen <toke@toke.dk>
Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>
---
 net/sched/sch_cake.c | 36 +++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/net/sched/sch_cake.c b/net/sched/sch_cake.c
index 3faccdbc03f7..24853d90c17e 100644
--- a/net/sched/sch_cake.c
+++ b/net/sched/sch_cake.c
@@ -1715,18 +1715,25 @@ static struct cake_tin_data *cake_select_tin(struct Qdisc *sch,
 	return &qd->tins[tin];
 }
 
-static u32 cake_classify(struct Qdisc *sch, struct cake_tin_data **t,
-			 struct sk_buff *skb, int flow_mode, int *qerr)
+/* Run the qdisc's optional external classifier. Returns true when a
+ * terminal TC action wants the packet dropped, with the reason in *qerr;
+ * the caller must drop the skb. Otherwise *flow and *host hold the
+ * filter's overrides (0 if none).
+ */
+static bool cake_tcf_classify(struct Qdisc *sch, struct sk_buff *skb,
+			      u16 *flow, u16 *host, int *qerr)
 {
 	struct cake_sched_data *q = qdisc_priv(sch);
 	struct tcf_proto *filter;
 	struct tcf_result res;
-	u16 flow = 0, host = 0;
 	int result;
 
+	*flow = 0;
+	*host = 0;
+
 	filter = rcu_dereference_bh(q->filter_list);
 	if (!filter)
-		goto hash;
+		return false;
 
 	*qerr = NET_XMIT_SUCCESS | __NET_XMIT_BYPASS;
 	result = tcf_classify_qdisc(skb, filter, &res, false);
@@ -1740,17 +1747,15 @@ static u32 cake_classify(struct Qdisc *sch, struct cake_tin_data **t,
 			*qerr = NET_XMIT_SUCCESS | __NET_XMIT_STOLEN;
 			fallthrough;
 		case TC_ACT_SHOT:
-			return 0;
+			return true;
 		}
 #endif
 		if (TC_H_MIN(res.classid) <= CAKE_QUEUES)
-			flow = TC_H_MIN(res.classid);
+			*flow = TC_H_MIN(res.classid);
 		if (TC_H_MAJ(res.classid) <= (CAKE_QUEUES << 16))
-			host = TC_H_MAJ(res.classid) >> 16;
+			*host = TC_H_MAJ(res.classid) >> 16;
 	}
-hash:
-	*t = cake_select_tin(sch, skb);
-	return cake_hash(*t, skb, flow_mode, flow, host) + 1;
+	return false;
 }
 
 static void cake_reconfigure(struct Qdisc *sch);
@@ -1761,20 +1766,25 @@ static s32 cake_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 	u32 idx, tin, prev_qlen, prev_backlog, drop_id;
 	struct cake_sched_data *q = qdisc_priv(sch);
 	int len = qdisc_pkt_len(skb), ret;
+	u16 flow_override, host_override;
 	struct sk_buff *ack = NULL;
 	ktime_t now = ktime_get();
 	struct cake_tin_data *b;
 	struct cake_flow *flow;
 	bool same_flow = false;
 
-	/* choose flow to insert into */
-	idx = cake_classify(sch, &b, skb, q->config->flow_mode, &ret);
-	if (idx == 0) {
+	/* Classify first: a terminal verdict means do not enqueue. */
+	if (cake_tcf_classify(sch, skb, &flow_override, &host_override, &ret)) {
 		if (ret & __NET_XMIT_BYPASS)
 			qdisc_qstats_drop(sch);
 		__qdisc_drop(skb, to_free);
 		return ret;
 	}
+
+	/* choose flow to insert into */
+	b = cake_select_tin(sch, skb);
+	idx = cake_hash(b, skb, q->config->flow_mode, flow_override,
+			host_override) + 1;
 	tin = (u32)(b - q->tins);
 	idx--;
 	flow = &b->flows[idx];
-- 
2.43.0

