Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794859561;
	b=OYtGuVTX8pgDSV8Y8VMxvVXjhWc9hqSMGouERE3SN06f/fzhUfPMZWJD7szzvYXW6pyf
	 UFqVr++nedECi7EwVCSpsI3NGy5OrAL+wLzfoPNuuufyXbw0Tekz02HgPchQDj84JIgtv
	 BFha3RQKHld3Nqb/pDJPDkSHLYRMy5Hv0HSiC0HNyu2AmDE1ln/e91BTdasM7jodRpPTy
	 Tnl4r8fxeUnJXNha4f7YLKYzcsuCFTKqsnTjMbYLrj0zj5WMfEivFhWJ2VXXlL9zenEEY
	 1t9yCML1GOO6j5h/pc64vKZWu+6dvKrlTRjUBZnP0K2ViF+z1UShx6kVXa1wMFW68Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794859561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=Tv0v3+2vbn7YacSYnLd/MPJp85r3e3jdDWjTlsKXhGE=;
	b=Cn9u4SY6gQHBrwDklA/EVZggkQRprCH+N2TwoclAKOeQHj0B3+s8ibksvQNWiOZo/cRA
	 hRIpQnM2ENPcdKetgm11TtmsdKj157/OkLu5KM+2X4pSQ8w9Fr5oHNI4bjeo2t720cbrl
	 M8aTO6wU2R5gboRiq3b5dNzuuOndAMeAL2AnaRt/M6OrNl7u9o1tqJ7BM8lZL7pW4G63b
	 mApazt297EeEhbgvJuglq2MwU2QlXY/KRhDbpqaTLqvhUIvkCkB0JaxisDNt6Pnw80bAN
	 VexbiCxu4wVoHUb4cHQP512lV9ALPdzZsxDezsNe1TZipG0kE/O06oqd8tGv0N/lqhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b="AFYdZU/L";
	arc=none smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3770606A32C
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 20:06:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3770606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=AFYdZU/L
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91eb46044c4so67027106d6.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 12:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1794859560; x=1795464360; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tv0v3+2vbn7YacSYnLd/MPJp85r3e3jdDWjTlsKXhGE=;
        b=AFYdZU/LrI6WW81uvDuVDoG2D6cQs5osk9b0EKY38QkcbHgpGVsigkD1rI6ROdYiJh
         4d0gevcMP+CWC4cy+9h77JuYP9R5R/ui7Uf8l/9GGnEHaVUacAKarepIDAD8Sf0g6FYv
         P1YqX451oOiCHiKymdPDugUURmQ+e81oaMSNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794859560; x=1795464360;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tv0v3+2vbn7YacSYnLd/MPJp85r3e3jdDWjTlsKXhGE=;
        b=Qdu0NFD9o/GMzdeE38wis1KIFII0MKfnyr+5Gd39mqausX3Aunx59cGJ/nIt1ZtKmc
         zCISPhtYQmBBrOuJ/wVGYz3xdv6zMYp/EmZdWD3cfDh/cmzX6kf3w0w5fgu/GtZw7mxB
         jKKRJkQLNTEMP582xAR8fuFN7BQdTTrruI4BINUnmKQTKoIVlGBf5GcmAR8ld/B/C0yS
         3FtRi/m7CG4crkhS3hOflMCOf0HNCdInNHlFAIhpB4M3Fr1xcSf/LUCPSQ3HImbvLdYr
         lPKfMV6qu7aGyUEIa8j/zEACBWjfz2EHZXwYYZB2oOWQ3J5UR4XrCBW1w/Asf7x6Qb6A
         0EmQ==
X-Gm-Message-State: APuU4Z/bb2WVmdx9bahlJ49vr9RmBxstV4XT2gfKLW+Ie0mW1yk7jdIS
	RjHW1NaZBBm3mrsoIJtPcM7a3YbYUG3utn+gr+T/zmBRJE4R48uDp2eN4eHkW4f9kf5shPjq7pO
	0dz0=
X-Gm-Gg: AZFdTZfKguB27eoc2HGRjuolal5kEKKodEyLj/IUrgi6j9nGDE0B71En5NOaUH0PmMA
	3Llg5WmeZPNkijfk6unYBqopZttCJwkaXel6qnwX49hqJ25F8zPvCH30PxaRjuLSSGYkLS3yvuZ
	dRb/zogYs6SiJUdLTX466wdgki56gnQjXKE0HVRhWPQ4O6bi6ZTg0M/p4GocacMKoJill/z9nQg
	6XC+6L4jFLF8BcupFwY7vhi3p4IdgdjvjKNFu/A26aahRJYwUcq6+E8OUCbeDAx2hvG/E34tAo1
	QAdMWAv5IrGBHHsUXzmAlnEEwhDnwvtdbYym+YRszD1NqnafMkReUft7py3+nojinbbBbGsawa7
	vUM2J6iXkfkuGMIl/uEuoazgX+c5CQMMe4txktXDSQ15ACfFOnv2ehAe8d+pZZoC2DKy2sxBkAz
	BK3nB+Xo8N7ZMBZ9bZ2EzHE+HhRnTkO0XWf7fMpmtFvCxj5JMYbRr+JeGc0n24v2vtIZCsGtpbn
	M3yRUyhINLDsFAMQaH9LBYDX8XoqrjdeF/59WmQvRiXsliPr3xfRBkwe3+PZWT3309y492wWlMv
	R+ZoMOlZiDbDR0eMrgHDhBphnqxXfdpu6TrtA3IHxdyySG5wY3bOnLfQz5cuRGQW48bcUoEGx1z
	d
X-Received: by 2002:a05:6214:5d87:b0:91e:8a02:6eb8 with SMTP id 6a1803df08f44-91f2428dfa4mr173100676d6.54.1794859559491;
        Mon, 16 Nov 2026 12:05:59 -0800 (PST)
Received: from mbili.waya ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d7b607sm94333936d6.26.2026.11.16.12.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:05:59 -0800 (PST)
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
Subject: [PATCH net-next v11 1/4] net/sched: cake: return the classifier result to the caller
Date: Mon, 16 Nov 2026 15:05:51 -0500
Message-Id: <QDISC-BA27.v11.r0.20261116134053-1@mojatatu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <QDISC-BA27.v11.r0.20261116134053@mojatatu.com>
References: <QDISC-BA27.v11.r0.20261116134053@mojatatu.com>
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
2.34.1

