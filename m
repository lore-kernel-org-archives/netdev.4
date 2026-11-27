Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780681;
	b=vS934DvIdOhwAwLjCvzG37Am3tzfnXzwQYrqDyrm5wS5OpC4mwQxV4Ze343v7MKnx7Qh
	 JNOpQRetH/JsqXFcESKyN8X+lyX57TvtL/C1npMsx+NNlFBulMiBlev5uXX1D+bLbU3uJ
	 71B83gwgryk62XsmLTaVf0gXLQvJc56/jobzixRcFmh9NEO958UnwHDqTCENRimpVumYk
	 6Jbb1OcrBTmnq9mzGA42yS8/qsyAxVMg+fA45OMMgA//tCRiCwQw123YEBjiG4n6Eokky
	 te/w+5FDUW0KfMSNWptJ+2ZswukgcbcJrIr8TXGyWfcJwlzwzwmSuk0iD7jhPOKIEdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=KHs1el0hwP+l4nr/DbKt5Jzc63a6k/ZBlafc15qPCg4=;
	b=03YEltO5MFJzPfx0FSczawG3YDvJGrgsShPUIysp8xE6y6OJ68H3IvcJqUujMYf6Wtf7
	 ZwL96DAxnVgif7TKOdE7bfuiLRtJXEt4Sbsh/vFQNhTmKWa1DSOp/LwjxgtWRovT2hruY
	 8SyT0Wnk3ZsYx2huHkVlLwdnc1j1VXwlqPF8ScJhWferFzU+EHmYKJFQnJZIlEvfAmKsl
	 rmpZWPw/nHFFjJvbFHofVERINbC8iP3ialSx5QdGWnrCuH7yjL7vGGpbcNIeGVfP22qWw
	 9c6RMHsQg/XiCohT7Cx7/Kz9vk3b1Gh228tc25JSMg0LyTFISxxaYp33y+2qQ9LS8kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=sH+OKk8Z;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F7C606A31E
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 11:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1F7C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=sH+OKk8Z
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-949664ee41cso817095385a.3
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 03:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795780679; x=1796385479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KHs1el0hwP+l4nr/DbKt5Jzc63a6k/ZBlafc15qPCg4=;
        b=sH+OKk8ZUwo/nr6Z0M0QfeXhtmVKSmJj5M2TivasLsu7xyXtL2R0aOfxUVwcVWH3vZ
         35gbdgL89P4NaY9OauTH2rLnlIf8kmv+4Y7t54UcSKaE9/muArU0to1aGySDPVS+TcL/
         ClmZ+RDc8RBXB3z3tgrYdrxfuFDL6fV29WT9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780679; x=1796385479;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KHs1el0hwP+l4nr/DbKt5Jzc63a6k/ZBlafc15qPCg4=;
        b=L1smpSDa9+vlGmNVaVsRzLBcwPGrz2cyLSFko5C2SZtkESIMcPooA9WXZmvLBal1uN
         ln9IGxEV36Z5STj0XZwLVAV1danA8Trk+WSzKnWO9xqd7HzamKTBIjOvTkiCVoMB33Fd
         YZsduDJGtTt07YnirNgLWQwMZk7JSlUTNo9zQpGy6l3HLcFtZqinIwssGwS+SJfZu5eG
         fiyb4WZaAfQi6Fuyo3QsdyODMyfMDdpuZ1mfgWyaa2rd/xU/MY33VCCg+Wxkhz/Oq4d3
         8K1aSq1Hgqs8aVpaBvlEv3TJRYBYdpKyNVmQUglEwj0ljjJMxeMs7iDCw+qA4vFa4vuP
         apXA==
X-Gm-Message-State: APuU4Z/3BTMCk9ziOjEpftuKyfXKxbrKiH9QEbiJsocXa2jLIU/lCEwA
	JT7c6JGm9ZdKJ+C2ERAxLvCic770uRvX3fJM+un0GygS89ru9EGNhCCq1ZXndhSQZkRsfIT12X3
	Vy5c=
X-Gm-Gg: AZFdTZdmaqxPqZc/WAFDfgoJ/jBwd/n3Bwr+9yoX1o68Hpjy6Q98xGSR2fENqOUoqrH
	WxLbjBL95tIeLkFi4cUqDWUAlSwANcBpF4xGmPB+cy1RTQgPKofR/y6Y1SLN4EcoeQnm1PhnD1e
	/bUzZoZCH9PhcRh9M/nJ5Pf4Szf2L/7a1UmbJ0C70dIgctcWVKBtABtSHC34KbVZh9DkcRmxZs4
	LVdUSYAMuyaRtNpCbBMIK7RdwN6zp2lnrDUrPy0rH6el0MOzXsbLPULm2+sw91nXGF4ZJy2ny4B
	18uTj/+Ghcqz5sbATkAfX0kJEWXaL8NUS2h+7bnnqUv/ofTF+srbNSLmtDcU3PY7B+t4EGq+dW6
	MwA/VeEuKS6l+42NRrmDaEwcOm08l8GgC+OaiZjEtJNAwdQS1J9AZayUxHkQe9+0Y5CGeXRsK5X
	mK+awAyKQxxFVKtkLYROO1KE1esS/BJFCu/+ch7XcTDWxdJ+Fe5KzmQ9iajtHHu6JGEOUiZRXz6
	DvEU7vs/tZqbGO464wqK6JTyCS/O83Vhzz7s90co1eptRgS6wSfioAa8xReU0wvy1gsZD835WGQ
	NEEaVpf113pUWT9Mn7dPrgyOQY/lq9n6otWsJuwr1l5yP/gWY4//wL6BvRwpewJeGYL/VrcI2ZU
	=
X-Received: by 2002:a05:620a:2996:b0:93e:6620:bde7 with SMTP id af79cd13be357-949ba9b71admr4272841385a.20.1795780679632;
        Fri, 27 Nov 2026 03:57:59 -0800 (PST)
Received: from mbili.waya ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949caf98d34sm1588177985a.2.2026.11.27.03.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:57:59 -0800 (PST)
From: Jamal Hadi Salim <jhs@mojatatu.com>
To: netdev@vger.kernel.org
Cc: Jamal Hadi Salim <jhs@mojatatu.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>,
	Stephen Hemminger <stephen@networkplumber.org>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	cake@lists.bufferbloat.net,
	Victor Nogueira <victor@mojatatu.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH net-next v13 1/4] net/sched: cake: return the classifier result to the caller
Date: Fri, 27 Nov 2026 06:57:49 -0500
Message-Id: <QDISC-BA27.v13.r0.20261127065026-1@mojatatu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <QDISC-BA27.v13.r0.20261127065026@mojatatu.com>
References: <QDISC-BA27.v13.r0.20261127065026@mojatatu.com>
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
index f97134522727..2480ee4b9575 100644
--- a/net/sched/sch_cake.c
+++ b/net/sched/sch_cake.c
@@ -1717,18 +1717,25 @@ static struct cake_tin_data *cake_select_tin(struct Qdisc *sch,
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
@@ -1742,17 +1749,15 @@ static u32 cake_classify(struct Qdisc *sch, struct cake_tin_data **t,
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
@@ -1763,20 +1768,25 @@ static s32 cake_enqueue(struct sk_buff *skb, struct Qdisc *sch,
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

