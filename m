Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795288877;
	b=hbeAeiFK9PLON5we7YOGh/71zxJgU4M34UBcblEKxxo0K7PQy6sObq8jRCuTaStFWHot
	 kF0x7zuQ6uQqzPrwusKBj9viJF78gfrF2rAnvxUW++AAmgLe0zYwk48HSTLExQphgxmw2
	 8owSGWhKv1HI4rWbAnZ5a/av2OIKvBOhGK+CZPplWGhx14l7gFc6ntP5HsB9RIVfFIEaJ
	 yuYn6i1n/bQYcY0NZ0fw3/xJSeKpYzpTV7QzEFtyUrY1M97ZP/TOMkaSh/POBXvJ9S87a
	 FJEAzWx51MqMUlCMeweqwO447dhgS29yhLQ+Dr/S8kHeEau09m7uKgKrGIb693Ywc+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795288877;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=tTIiLpDOOjOiY6YNXTXY68AsLZjNpjTi2i4PTJ3SyLA=;
	b=MzCg2nxBUzhVpWkcD5wFcMYlc/eRCZS2KVizAStuCOO3pfoK3eGyLys2ErS+y9fnFCE7
	 t2bTKg0EgEKvCl+7zPcjNIvke/sngsoPBeveGQTYXToMuKFA7772NUDsS5MRXsqg/+XUm
	 0tn7H2miOz1xExF/c4qu1/KpukCLjWe79qVtLwIrgGnBR+qHsUpLJ29Hgu1KFO9Tlod11
	 o8pT9RyMo6yOBArAaGYqxLE2oiqYEnOFscUTRx0CryukamVXEjm3HnNNKchHeM8Zj3Ivi
	 igITDz6+bvki/hWU8WcmL/vOa9QIj5FZ7IsvrZVYk3NKiMCiRJrIy5qCYmSeK5QUxkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=hAR4x1Uz;
	arc=none smtp.remote-ip=209.85.222.169
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69358606A334
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 19:21:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69358606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=hAR4x1Uz
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-949664ee41cso228262185a.3
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 11:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795288876; x=1795893676; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tTIiLpDOOjOiY6YNXTXY68AsLZjNpjTi2i4PTJ3SyLA=;
        b=hAR4x1UzrkPH/UKfsg8PkyT0MRLohsss2imck/wmpBvSeC+WejjjZCFUbLWsP0lQws
         I9n3gxkpC+hvIHS2q+3MLfpQ0XEP+WZDmpAyHMsJA2S+9A57CL2FLN2OheqgvLUV9aWp
         m+CrSJ0+Ze8B6vfSIAr/klSitIQMR+U6x1SHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795288876; x=1795893676;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tTIiLpDOOjOiY6YNXTXY68AsLZjNpjTi2i4PTJ3SyLA=;
        b=ZcoM5rvY2OtfgUINezLxp40b+MTs25UvfwDTnGh/9WaEfHzEEEpn4AYfbcKL2U0TZ7
         ZMPAyFCrRCJz3CSYIPmRMEys4wcb1XYn23AFh5xF28XHz6UO5jiTDrFbBDD+M+nnyRCa
         7KA9EC8wb7oM4mjZtzrbYh9qW7y+0IdxkfXSelwF/U8RsP8b1FLFf7ZVw9Ju7HEurI0j
         Fo9yoVoJ6aERKxs+l2/qOJDCy0Fc2d07Ha07FgWvaiKcw83lBl1VTFM8BuK3G53kuo0Z
         9eq2FRUMpLjaqN2nuLmwqQHsZa4kVow4Z9j8Mizas7y03oh4J9Tb/yzWfzFNBMOL0im4
         A5TA==
X-Gm-Message-State: APuU4Z/sx8Abozi4aYcJWvcD7e9/Xq6D8k/bsucZpt3bhkK8AJB/h+nI
	SuMuwMGrcrg24wGiTWRkfenkhiHIqI7/4HZCN6bNL3nhYxHFhpLHXcLsljsyuIydad5fCwpLtIL
	3oYA=
X-Gm-Gg: AZFdTZcaIigvomfinTJ/pgf2deeqEwgkBytiZ+YD4DMA4KgOa9XnNd4Bm+8avGj4hSa
	g7lPhZZBQdQcVhIqtpDgx9TAnsTxX7r/S2hisRgHyUuUa/pOXDlTTrt/TIEpAoEfB61kF8tLA8E
	odGq49TdIUW8IR04xynfkuPTkqFa1GJA1ZrHnjMaXnyhxdCfbrgRaJCOstQBRR9HjfEdQD20LTe
	YNKYdM3ehDjn9DeRYNBjYBoBeHDLkQXqtMxFakPRrj6EcK+TBnzzGjOh31HDgbZQFNEByhsLl0d
	iDjvrLUQ36bVqYt9IyDvy8Hqwn9sJsCnBIcg+ZaRo6WyISBlumCZ9B/cedaIx/jTtSerQGanAgi
	bAbl1PYilqYc85viTUBLuZ6nVc8KD95LkqaMNz9v6HFZxWR4IUwdA0GkuiSpvuWJHa4hFlU2VR2
	M4yR+oyDhkyj1orv4w931cPTbdq+GG1stPl4MjQ6jqz8Xafp44WUpW5pIYJw6JU/g7kve8/yWFl
	ZqCTAgm2W65XxWCEwQa9ZtjEg8+46AGUE86hnBviaPsVYSNM2aJEVfX06Dzj7skxTOxirhw79rQ
	JPmu6NyMU4HfWYzpyVKJxknVH741gdZqZa4lbCFgZuGxY55CfAGVgMloRYOWJ6P1D4deXV5p3is
	=
X-Received: by 2002:a05:620a:3726:b0:949:66eb:77eb with SMTP id af79cd13be357-949ba827b33mr1231731085a.10.1795288876380;
        Sat, 21 Nov 2026 11:21:16 -0800 (PST)
Received: from mbili.waya ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3cb882sm472764685a.27.2026.11.21.11.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:21:16 -0800 (PST)
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
Subject: [PATCH net-next v12 1/4] net/sched: cake: return the classifier result to the caller
Date: Sat, 21 Nov 2026 14:21:07 -0500
Message-Id: <QDISC-BA27.v12.r0.20261120184210-1@mojatatu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <QDISC-BA27.v12.r0.20261120184210@mojatatu.com>
References: <QDISC-BA27.v12.r0.20261120184210@mojatatu.com>
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

