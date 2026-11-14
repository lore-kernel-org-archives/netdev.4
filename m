Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794658481;
	b=J4SFV3cZblLBVhui+s1ANfZBI3POZLyAO6Q7B0MbPSNc7FBYBpz6Qrzg/bWupqDE1EL1
	 6sc2dF80lL4q/73TBfWmSx0vdjrm9u2W7r3lx9ov9g9LVWFULC7Si+47YX6glHG+IqVA5
	 p7J62fNuH1iOQ5C2fY7DiDrgx1VV9oa0LqM7WOM2jnqiwmM2myF3IBhoNbBg6xSmFY+dr
	 uv+oQpFXBV3z8k09iO242GeBRDC0vU0bpDhThs4xV1vJ7iquBMpk/hU2FKwuLjqOv0pje
	 NzZeLT8u2JGVfA53JCLooNs8ZPWgHpEDvagC39L1AZgl8PQaZ/syseIq7XvkTy6Y8QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794658481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0K0uHc3l9LMDBVz9JVpSk9n7sOlddF6hpFQsgOynWJc=;
	b=Mah0v09jSsD48dbdo0dRW0etuE5Lyhp05jHl/GmFrtEY/5/het25twAnu+nclIkLI6bX
	 jkz6rtKLDGs+0j+jS9uQLFMvnwVwJ3E1Q758y0pp6A4ZHMG+4bm1Xjwgz7SHxa6ZYQl54
	 f2fxqRNn5F3HmlJxglPWd3inkBQWKAQX1j9QieFGuQFhVPjI9PK9yjvqTKlY19kJm2UHN
	 y4qDprkZcS3BdMf1bZ4QkRpQg2dMo+f7lpRhg5SnhZC8wPqZhoXCFgAuVRl5QakkoJzry
	 zThSrtWXPnDu0Vs5hlReJRahoXRcKtkrY2ecPL7gu53RQB1wKAXmF5ilpX6nCgS4xXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=wSWAYFn1;
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF1E606A329
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 12:14:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DF1E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=wSWAYFn1
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91ea0c05c92so33567186d6.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 04:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1794658479; x=1795263279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0K0uHc3l9LMDBVz9JVpSk9n7sOlddF6hpFQsgOynWJc=;
        b=wSWAYFn1CrAbg0ZZIloVfg3mzln2FBoIzNMQOS8JEUcFaDKQdKlbaclQdpXd1j1oMZ
         MvmlUjnxwaMugJNP4D7cp7g2FKDz5bURALxSeSMFsoMDGuaib9uBHr66DUU4OqNuz8jH
         999IHlw4/Bl7/xLWvGIksL10aeyM3jHJZ9cR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794658479; x=1795263279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0K0uHc3l9LMDBVz9JVpSk9n7sOlddF6hpFQsgOynWJc=;
        b=ErbfOc5iiBLqagbYwV6KIw9pbazKxteoS7JsXMaSjdKYPuvGyIvPW4Ld7jJOmTY9RX
         pYzMw8s1um2pGDL69lDzYLZbEJrkRmphfaALkiYY8qbwwg3MK0FzoJQex/NAnqesjHUw
         yGpFDBvxy9ffrqhuS7OP+xmh1j5zBswcCuZ6MuFg5mMKCc34XKekssg26Lt2wVQLwjWv
         TPdW8yfTJACn5gbPiEqEzBNPYulUW4VA8EJqkq1lajS9B7KypSvZ6qV6vVsOq1Lm/GKq
         Xapq6crK4zu351sA6XsqlJVdcgKkCgZPwgJ9TtNnxopMWNBEC1c0jEomABCAbq3dxg5b
         jO8g==
X-Gm-Message-State: APuU4Z+RrxxkJJuid+x84eWuKxWQGyBYTAOhztFa0GrvVjCK6xWAZNhl
	52MUhsaT+UWXzm1aOn/Iw4g4Dvsxg4QKk+fcSJWTEwhMrBp4kLeSQwgdxLogDQt58Uwj0JqP/JO
	Gm+w=
X-Gm-Gg: AYBFou2l8T4C4Jl8SjaYaC17jrnLm/ApkOrWjR5VwTo6oP1bQ1gr21oYgwY1A9m7p1k
	W4oZRMnuuI+B03H5OmTHqDtBVzc1LW+jm71CIi8wj5qlAWqW7mvhtvOpcZkW20NZi2Vj+98ILMB
	x27Q4TscAp46KeGr4J3QSVsGwxirUwN6VuL+ilXhEyGU1aT68Q6Uaif5gVqqIXz6zvpPZMlvHh/
	RnMvGDQa3upxI0m+2MLUcITrchpQpiRrAOtMK0NKzJVrrSch+c7RMztOs12V5XS2/k2n4Smg8Mm
	1TphzXrzcYvyraR6iYuDXh3cSlTrvXURyy/48Smq0L0uMwvqYX2ATLkVGGb5cMQrscPCeVKsEUT
	VhCXsPnxTOxGLHXq3binJM5thl7F0hmzrXwaCroNLexzxVMQXTnYxu3dqr9GkjiDiIeFz1eMbiv
	FN6mSTVhFtUqiA0Gc5B/xJMmJDYLKWYLPwdevGddwdwvlv2P1i0ju0xgOzRQbNWslvk0UgBI0A2
	5cZdc674hDyeHFIURFg5yN3CPOx2IwEOCCPsWZ+65dX2u9YxpSO9SKC7cov+oIUGdl83E/SbbZ7
	5lsHWMquegJrKLcFNbV0f8PG9/U4w0GwthfFMt0gsZc5BGFyN6ch1GXlgOuRFxj/vk8kk9dzT/o
	vlSkXUV+4JUL6iUA=
X-Received: by 2002:a05:6214:528e:b0:91e:a228:d695 with SMTP id 6a1803df08f44-91f23f21151mr87144456d6.0.1794658479273;
        Sat, 14 Nov 2026 04:14:39 -0800 (PST)
Received: from mbili.tail33bf8.ts.net ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d5e579sm41840486d6.17.2026.11.14.04.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 04:14:37 -0800 (PST)
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
Subject: [PATCH net-next v10 3/4] net/sched: cap the accounted backlog before it can wrap
Date: Sat, 14 Nov 2026 07:14:25 -0500
Message-Id: <QDISC-BA27.v10.r0.20261114071135-3@mojatatu.com>
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
Content-Transfer-Encoding: 8bit

This is a followup of commit 709f34f7c28d ("net/sched: fq: add overflow
bounds to quantum and initial quantum") as reported by Sashiko.

The issue: fq_codel, cake, codel, pie, fq_pie, dualpi2, RED, pfifo,
plug and (non-WRED) gred account every enqueued packet's stab-adjusted
length into the 32-bit sch->qstats.backlog. A crafted tc size table
inflates qdisc_pkt_len() up to QDISC_PKT_LEN_MAX (1 MiB), and a
supported BIG TCP aggregate can account more than that through the
headers qdisc_pkt_len_segs_init() replicates per segment, so a few
thousand packets wrap the counter mod 2^32.

The AQM then reads a small backlog and makes the wrong drop decision,
and the dequeue-side subtractions leave it corrupt (for non-WRED gred
it is the reported stats and the dequeue-side subtractions that go
wrong instead). In fq_codel a wrapped per-flow backlog can also make
fq_codel_drop()'s scan pick an empty flow, dereferencing a NULL
flow->head.

The Fix: drop at enqueue once the stored backlog cannot represent the
incoming packet's accounted length.

Ordinary packets (qdisc_pkt_len() at most QDISC_PKT_LEN_MAX) are
covered by a standing ceiling: drop once the backlog is within
QDISC_MAX_BACKLOG (U32_MAX - QDISC_PKT_LEN_MAX) of the wrap point, the
largest backlog one more 1 MiB packet cannot wrap, so there is no
per-enqueue 64-bit add.

A larger wire estimate is checked against the space that actually
remains (len > U32_MAX - backlog): qdisc_pkt_len_segs_init() adds the
headers replicated on every output segment, so a supported small-MSS
BIG TCP aggregate can carry a wire estimate above 1 MiB while its raw
length stays within GSO_MAX_SIZE, and such traffic must pass on an
empty queue.

qdisc_pkt_len() itself stays truthful for every input: it is not
clamped and the initializer keeps succeeding, so BPF
__sk_buff.wire_len, act_police and the HTB/TBF shapers read the real
length, and sch_handle_ingress() -- which ignores the initializer's
return value and reads pkt_segs for packet statistics -- keeps
complete metadata.

Cover sch_plug, pfifo, non-WRED sch_gred, the leaves fq, sfq, hhf,
skbprio, netem, choke, etf and taprio, the classful parents prio, htb,
drr, ets, qfq, hfsc, cbs and sfb, and tbf's direct enqueue path as well,
since each adds the packet's own length to a 32-bit backlog. In RED,
account the packet before handing it to the child, bound the child
backlog too, and re-derive the aggregate from pre-reservation snapshots
on failure.

The guard bounds each qdisc's own enqueue path: a child that segments a
GSO skb (tbf, netem) can still grow a parent's aggregate through
qdisc_tree_reduce_backlog()'s unclamped byte delta, which is left to a
separate change.

CAKE's split-GSO branch is the other exception; 4/4 sums and checks those
segments before linking any of them.

Conditions to recreate the bug:
  ip tuntap add tun0 mode tun
  ip link set tun0 txqueuelen 32 up
  ip addr add 10.99.0.1/24 dev tun0
  tc qdisc add dev tun0 root handle 1: stab overhead 2000000000 \
      fq_codel flows 1 limit 20000 ecn
  # hold the tun fd open without reading so the backlog persists, then
  # send 6000 packets: the counter wraps and the unfixed kernel reports
  # a wrapped backlog, while the fixed one drops at the ceiling.

Reported-by: Sashiko (nipa) <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/netdev/20260818101130.16203-1-jhs@mojatatu.com/
Link: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260818101130.16203-1-jhs@mojatatu.com
Link: https://lore.kernel.org/netdev/CANn89iLfMJV7ancKH1Gjzzm7ZUG-gKcrczkJjJEWN5sCuWd-ug@mail.gmail.com/
Link: https://lore.kernel.org/netdev/CANn89i+GOFH_8g+vSV0jUj0aBqLYVWuFOrHuDggZu9kPC_m6tQ@mail.gmail.com/
Link: https://lore.kernel.org/netdev/87a4oottcj.fsf@toke.dk/
Link: https://lore.kernel.org/netdev/87pkxks68f.fsf@toke.dk/
Link: https://lore.kernel.org/netdev/179231932946.3135.7497478990186385688@kernel.org/
Link: https://lore.kernel.org/netdev/179269577131.3135.3967915390403138015@kernel.org/
Reviewed-by: Victor Nogueira <victor@mojatatu.com>
Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>

---

v9 -> v10:
- cover the rest of net/sched.  The leaves fq, sfq, hhf, skbprio,
netem, choke, etf and taprio, the classful parents prio, htb, drr,
ets, qfq, hfsc, cbs and sfb, and tbf's direct enqueue path all add
the incoming packet's qdisc_pkt_len() to their own 32-bit backlog, so a
leaf can wrap its own counter and a parent can wrap the aggregate it
keeps over its children.  (Sashiko nipa review of v9)
- drop plug's redundant qdisc_backlog_overflow() test. plug is classless
and q->limit is a u32, so its byte test alone already bounds the stored
backlog below U32_MAX.  (Sashiko nipa review of v9)
- refresh the RED comment, which still described the pre-rework behaviour.
- drop the Acked-by from the v9 posting, since the patch now covers 29 files

---
 include/net/pkt_sched.h   |  1 -
 include/net/sch_generic.h | 20 +++++++++++++++++
 net/sched/sch_cake.c      |  7 ++++++
 net/sched/sch_cbs.c       |  6 +++++
 net/sched/sch_choke.c     |  6 +++++
 net/sched/sch_codel.c     | 16 ++++++++------
 net/sched/sch_drr.c       |  6 +++++
 net/sched/sch_dualpi2.c   |  1 +
 net/sched/sch_etf.c       |  6 +++++
 net/sched/sch_ets.c       |  6 +++++
 net/sched/sch_fifo.c      |  6 +++++
 net/sched/sch_fq.c        |  6 +++++
 net/sched/sch_fq_codel.c  |  9 ++++++++
 net/sched/sch_fq_pie.c    |  3 ++-
 net/sched/sch_gred.c      |  9 ++++++++
 net/sched/sch_hfsc.c      |  6 +++++
 net/sched/sch_hhf.c       |  6 +++++
 net/sched/sch_htb.c       |  6 +++++
 net/sched/sch_netem.c     |  6 +++++
 net/sched/sch_pie.c       |  3 ++-
 net/sched/sch_plug.c      |  3 ++-
 net/sched/sch_prio.c      |  6 +++++
 net/sched/sch_qfq.c       |  6 +++++
 net/sched/sch_red.c       | 46 ++++++++++++++++++++++++++++++++++-----
 net/sched/sch_sfb.c       |  6 +++++
 net/sched/sch_sfq.c       |  6 +++++
 net/sched/sch_skbprio.c   |  6 +++++
 net/sched/sch_taprio.c    |  6 +++++
 net/sched/sch_tbf.c       |  6 +++++
 29 files changed, 210 insertions(+), 16 deletions(-)

diff --git a/include/net/pkt_sched.h b/include/net/pkt_sched.h
index 90d3e7943b19..18a419cd9d94 100644
--- a/include/net/pkt_sched.h
+++ b/include/net/pkt_sched.h
@@ -12,7 +12,6 @@
 
 #define DEFAULT_TX_QUEUE_LEN	1000
 #define STAB_SIZE_LOG_MAX	30
-#define QDISC_PKT_LEN_MAX	(1 << 20)	/* 1 MiB */
 
 struct qdisc_walker {
 	int	stop;
diff --git a/include/net/sch_generic.h b/include/net/sch_generic.h
index 1acaadb3e2cf..a5a6bdf55e0a 100644
--- a/include/net/sch_generic.h
+++ b/include/net/sch_generic.h
@@ -915,6 +915,26 @@ static inline unsigned int qdisc_pkt_len(const struct sk_buff *skb)
 	return qdisc_skb_cb(skb)->pkt_len;
 }
 
+#define QDISC_PKT_LEN_MAX	(1 << 20)	/* 1 MiB */
+
+/* Largest backlog that still has room for one more 1 MiB packet. */
+#define QDISC_MAX_BACKLOG	(U32_MAX - QDISC_PKT_LEN_MAX)
+
+/* Would this packet's accounted length wrap sch->qstats.backlog?
+ * Packets up to QDISC_PKT_LEN_MAX fit below QDISC_MAX_BACKLOG; GSO
+ * can make the length larger, so compare against the real headroom.
+ */
+static inline bool qdisc_backlog_overflow(const struct Qdisc *sch,
+					  const struct sk_buff *skb)
+{
+	u32 backlog = READ_ONCE(sch->qstats.backlog);
+	u32 len = qdisc_pkt_len(skb);
+
+	if (likely(len <= QDISC_PKT_LEN_MAX))
+		return backlog > QDISC_MAX_BACKLOG;
+	return len > U32_MAX - backlog;
+}
+
 static inline unsigned int qdisc_pkt_segs(const struct sk_buff *skb)
 {
 	u32 pkt_segs = qdisc_skb_cb(skb)->pkt_segs;
diff --git a/net/sched/sch_cake.c b/net/sched/sch_cake.c
index 88ff3e4f6754..803ead499ae9 100644
--- a/net/sched/sch_cake.c
+++ b/net/sched/sch_cake.c
@@ -1781,6 +1781,13 @@ static s32 cake_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 		return ret;
 	}
 
+	/* Drop before touching the hash or shaper state. */
+	if (unlikely(qdisc_backlog_overflow(sch, skb))) {
+		qdisc_qstats_overlimit(sch);
+		return qdisc_drop_reason(skb, sch, to_free,
+					 QDISC_DROP_OVERLIMIT);
+	}
+
 	/* choose flow to insert into */
 	b = cake_select_tin(sch, skb);
 	idx = cake_hash(b, skb, q->config->flow_mode, flow_override,
diff --git a/net/sched/sch_cbs.c b/net/sched/sch_cbs.c
index 1c93469c56e3..3c018ef70e23 100644
--- a/net/sched/sch_cbs.c
+++ b/net/sched/sch_cbs.c
@@ -92,6 +92,12 @@ static int cbs_child_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 	unsigned int len = qdisc_pkt_len(skb);
 	int err;
 
+	if (unlikely(qdisc_backlog_overflow(sch, skb))) {
+		qdisc_qstats_overlimit(sch);
+		return qdisc_drop_reason(skb, sch, to_free,
+					 QDISC_DROP_OVERLIMIT);
+	}
+
 	err = child->ops->enqueue(skb, child, to_free);
 	if (err != NET_XMIT_SUCCESS)
 		return err;
diff --git a/net/sched/sch_choke.c b/net/sched/sch_choke.c
index 73d3e673dc7b..9ce02273b624 100644
--- a/net/sched/sch_choke.c
+++ b/net/sched/sch_choke.c
@@ -215,6 +215,12 @@ static int choke_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 	struct choke_sched_data *q = qdisc_priv(sch);
 	const struct red_parms *p = &q->parms;
 
+	if (unlikely(qdisc_backlog_overflow(sch, skb))) {
+		qdisc_qstats_overlimit(sch);
+		return qdisc_drop_reason(skb, sch, to_free,
+					 QDISC_DROP_OVERLIMIT);
+	}
+
 	choke_skb_cb(skb)->keys_valid = 0;
 	/* Compute average queue usage (see RED) */
 	q->vars.qavg = red_calc_qavg(p, &q->vars, sch->q.qlen);
diff --git a/net/sched/sch_codel.c b/net/sched/sch_codel.c
index a1ba2e355f2d..78c5d72d6406 100644
--- a/net/sched/sch_codel.c
+++ b/net/sched/sch_codel.c
@@ -116,15 +116,17 @@ static struct sk_buff *codel_peek(struct Qdisc *sch)
 static int codel_qdisc_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 			       struct sk_buff **to_free)
 {
-	struct codel_sched_data *q;
+	struct codel_sched_data *q = qdisc_priv(sch);
 
-	if (likely(qdisc_qlen(sch) < sch->limit)) {
-		codel_set_enqueue_time(skb);
-		return qdisc_enqueue_tail(skb, sch);
+	if (unlikely(qdisc_qlen(sch) >= sch->limit) ||
+	    unlikely(qdisc_backlog_overflow(sch, skb))) {
+		WRITE_ONCE(q->drop_overlimit, q->drop_overlimit + 1);
+		return qdisc_drop_reason(skb, sch, to_free,
+					 QDISC_DROP_OVERLIMIT);
 	}
-	q = qdisc_priv(sch);
-	WRITE_ONCE(q->drop_overlimit, q->drop_overlimit + 1);
-	return qdisc_drop_reason(skb, sch, to_free, QDISC_DROP_OVERLIMIT);
+
+	codel_set_enqueue_time(skb);
+	return qdisc_enqueue_tail(skb, sch);
 }
 
 static const struct nla_policy codel_policy[TCA_CODEL_MAX + 1] = {
diff --git a/net/sched/sch_drr.c b/net/sched/sch_drr.c
index 8621d057edd9..eeef304f76a7 100644
--- a/net/sched/sch_drr.c
+++ b/net/sched/sch_drr.c
@@ -342,6 +342,12 @@ static int drr_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 	struct drr_class *cl;
 	int err = 0;
 
+	if (unlikely(qdisc_backlog_overflow(sch, skb))) {
+		qdisc_qstats_overlimit(sch);
+		return qdisc_drop_reason(skb, sch, to_free,
+					 QDISC_DROP_OVERLIMIT);
+	}
+
 	cl = drr_classify(skb, sch, &err);
 	if (cl == NULL) {
 		if (err & __NET_XMIT_BYPASS)
diff --git a/net/sched/sch_dualpi2.c b/net/sched/sch_dualpi2.c
index 4947def7c49e..7331f0ec1c8f 100644
--- a/net/sched/sch_dualpi2.c
+++ b/net/sched/sch_dualpi2.c
@@ -392,6 +392,7 @@ static int dualpi2_enqueue_skb(struct sk_buff *skb, struct Qdisc *sch,
 	struct dualpi2_skb_cb *cb;
 
 	if (unlikely(qdisc_qlen(sch) >= sch->limit) ||
+	    unlikely(qdisc_backlog_overflow(sch, skb)) ||
 	    unlikely((u64)q->memory_used + skb->truesize > q->memory_limit)) {
 		qdisc_qstats_overlimit(sch);
 		if (skb_in_l_queue(skb))
diff --git a/net/sched/sch_etf.c b/net/sched/sch_etf.c
index aaafcf640bc7..a534b11eadd0 100644
--- a/net/sched/sch_etf.c
+++ b/net/sched/sch_etf.c
@@ -168,6 +168,12 @@ static int etf_enqueue_timesortedlist(struct sk_buff *nskb, struct Qdisc *sch,
 	ktime_t txtime = nskb->tstamp;
 	bool leftmost = true;
 
+	if (unlikely(qdisc_backlog_overflow(sch, nskb))) {
+		qdisc_qstats_overlimit(sch);
+		return qdisc_drop_reason(nskb, sch, to_free,
+					 QDISC_DROP_OVERLIMIT);
+	}
+
 	if (!is_packet_valid(sch, nskb)) {
 		report_sock_error(nskb, EINVAL,
 				  SO_EE_CODE_TXTIME_INVALID_PARAM);
diff --git a/net/sched/sch_ets.c b/net/sched/sch_ets.c
index 6cc902a03838..7f74f79ea6b6 100644
--- a/net/sched/sch_ets.c
+++ b/net/sched/sch_ets.c
@@ -420,6 +420,12 @@ static int ets_qdisc_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 	struct ets_class *cl;
 	int err = 0;
 
+	if (unlikely(qdisc_backlog_overflow(sch, skb))) {
+		qdisc_qstats_overlimit(sch);
+		return qdisc_drop_reason(skb, sch, to_free,
+					 QDISC_DROP_OVERLIMIT);
+	}
+
 	cl = ets_classify(skb, sch, &err);
 	if (!cl) {
 		if (err & __NET_XMIT_BYPASS)
diff --git a/net/sched/sch_fifo.c b/net/sched/sch_fifo.c
index 1b6388d50967..16c8d4f74e7e 100644
--- a/net/sched/sch_fifo.c
+++ b/net/sched/sch_fifo.c
@@ -29,6 +29,9 @@ static int bfifo_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 static int pfifo_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 			 struct sk_buff **to_free)
 {
+	if (unlikely(qdisc_backlog_overflow(sch, skb)))
+		return qdisc_drop(skb, sch, to_free);
+
 	if (likely(sch->q.qlen < READ_ONCE(sch->limit)))
 		return qdisc_enqueue_tail(skb, sch);
 
@@ -43,6 +46,9 @@ static int pfifo_tail_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 	if (unlikely(READ_ONCE(sch->limit) == 0))
 		return qdisc_drop(skb, sch, to_free);
 
+	if (unlikely(qdisc_backlog_overflow(sch, skb)))
+		return qdisc_drop(skb, sch, to_free);
+
 	if (likely(sch->q.qlen < READ_ONCE(sch->limit)))
 		return qdisc_enqueue_tail(skb, sch);
 
diff --git a/net/sched/sch_fq.c b/net/sched/sch_fq.c
index a282812c192e..03d06b65ed03 100644
--- a/net/sched/sch_fq.c
+++ b/net/sched/sch_fq.c
@@ -628,6 +628,12 @@ static int fq_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 	u64 now;
 	u8 band;
 
+	if (unlikely(qdisc_backlog_overflow(sch, skb))) {
+		qdisc_qstats_overlimit(sch);
+		return qdisc_drop_reason(skb, sch, to_free,
+					 QDISC_DROP_OVERLIMIT);
+	}
+
 	band = fq_prio2band(q->prio2band, skb->priority & TC_PRIO_MAX);
 	if (unlikely(q->band_pkt_count[band] >= sch->limit)) {
 		q->stat_band_drops[band]++;
diff --git a/net/sched/sch_fq_codel.c b/net/sched/sch_fq_codel.c
index e0fcda26ff62..5feb50db41e8 100644
--- a/net/sched/sch_fq_codel.c
+++ b/net/sched/sch_fq_codel.c
@@ -201,6 +201,15 @@ static int fq_codel_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 	}
 	idx--;
 
+	/* Drop before the flow is touched, so a dropped packet cannot
+	 * create or update flow state.
+	 */
+	if (unlikely(qdisc_backlog_overflow(sch, skb))) {
+		q->drop_overlimit++;
+		return qdisc_drop_reason(skb, sch, to_free,
+					 QDISC_DROP_OVERLIMIT);
+	}
+
 	codel_set_enqueue_time(skb);
 	flow = &q->flows[idx];
 	flow_queue_add(flow, skb);
diff --git a/net/sched/sch_fq_pie.c b/net/sched/sch_fq_pie.c
index 5982847df8f8..9f927a08b7bc 100644
--- a/net/sched/sch_fq_pie.c
+++ b/net/sched/sch_fq_pie.c
@@ -155,7 +155,8 @@ static int fq_pie_qdisc_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 	memory_limited = q->memory_usage > q->memory_limit + skb->truesize;
 
 	/* Checks if the qdisc is full */
-	if (unlikely(qdisc_qlen(sch) >= sch->limit)) {
+	if (unlikely(qdisc_qlen(sch) >= sch->limit) ||
+	    unlikely(qdisc_backlog_overflow(sch, skb))) {
 		q->stats.overlimit++;
 		goto out;
 	} else if (unlikely(memory_limited)) {
diff --git a/net/sched/sch_gred.c b/net/sched/sch_gred.c
index f3d9a7252949..de96badff654 100644
--- a/net/sched/sch_gred.c
+++ b/net/sched/sch_gred.c
@@ -170,6 +170,15 @@ static int gred_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 	unsigned long qavg = 0;
 	u16 dp = tc_index_to_dp(skb);
 
+	/* Per-VQ limits don't bound the total: every VQ adds into the
+	 * same u32 backlog, so check it before picking a VQ.
+	 */
+	if (unlikely(qdisc_backlog_overflow(sch, skb))) {
+		qdisc_qstats_overlimit(sch);
+		return qdisc_drop_reason(skb, sch, to_free,
+					 QDISC_DROP_OVERLIMIT);
+	}
+
 	if (dp >= t->DPs || (q = t->tab[dp]) == NULL) {
 		dp = t->def;
 
diff --git a/net/sched/sch_hfsc.c b/net/sched/sch_hfsc.c
index 284490fd6ca9..c11457e6cc24 100644
--- a/net/sched/sch_hfsc.c
+++ b/net/sched/sch_hfsc.c
@@ -1564,6 +1564,12 @@ hfsc_enqueue(struct sk_buff *skb, struct Qdisc *sch, struct sk_buff **to_free)
 	int err;
 	bool first;
 
+	if (unlikely(qdisc_backlog_overflow(sch, skb))) {
+		qdisc_qstats_overlimit(sch);
+		return qdisc_drop_reason(skb, sch, to_free,
+					 QDISC_DROP_OVERLIMIT);
+	}
+
 	cl = hfsc_classify(skb, sch, &err);
 	if (cl == NULL) {
 		if (err & __NET_XMIT_BYPASS)
diff --git a/net/sched/sch_hhf.c b/net/sched/sch_hhf.c
index fca20c50c97c..df63051f43d8 100644
--- a/net/sched/sch_hhf.c
+++ b/net/sched/sch_hhf.c
@@ -377,6 +377,12 @@ static int hhf_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 	struct wdrr_bucket *bucket;
 	unsigned int prev_backlog;
 
+	if (unlikely(qdisc_backlog_overflow(sch, skb))) {
+		qdisc_qstats_overlimit(sch);
+		return qdisc_drop_reason(skb, sch, to_free,
+					 QDISC_DROP_OVERLIMIT);
+	}
+
 	idx = hhf_classify(skb, sch);
 
 	bucket = &q->buckets[idx];
diff --git a/net/sched/sch_htb.c b/net/sched/sch_htb.c
index 1ba67b121de4..4ee8d3fe9cae 100644
--- a/net/sched/sch_htb.c
+++ b/net/sched/sch_htb.c
@@ -630,6 +630,12 @@ static int htb_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 	struct htb_sched *q = qdisc_priv(sch);
 	struct htb_class *cl = htb_classify(skb, sch, &ret);
 
+	if (unlikely(qdisc_backlog_overflow(sch, skb))) {
+		qdisc_qstats_overlimit(sch);
+		return qdisc_drop_reason(skb, sch, to_free,
+					 QDISC_DROP_OVERLIMIT);
+	}
+
 	if (cl == HTB_DIRECT) {
 		/* enqueue to helper queue */
 		if (q->direct_queue.qlen < q->direct_qlen) {
diff --git a/net/sched/sch_netem.c b/net/sched/sch_netem.c
index 1dc2924890eb..9a7b11594fff 100644
--- a/net/sched/sch_netem.c
+++ b/net/sched/sch_netem.c
@@ -467,6 +467,12 @@ static int netem_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 	unsigned int prev_len = qdisc_pkt_len(skb);
 	int count = 1;
 
+	if (unlikely(qdisc_backlog_overflow(sch, skb))) {
+		qdisc_qstats_overlimit(sch);
+		return qdisc_drop_reason(skb, sch, to_free,
+					 QDISC_DROP_OVERLIMIT);
+	}
+
 	/* Do not fool qdisc_drop_all() */
 	skb->prev = NULL;
 
diff --git a/net/sched/sch_pie.c b/net/sched/sch_pie.c
index 3b7863ffd284..2a5fc493a7e5 100644
--- a/net/sched/sch_pie.c
+++ b/net/sched/sch_pie.c
@@ -89,7 +89,8 @@ static int pie_qdisc_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 	struct pie_sched_data *q = qdisc_priv(sch);
 	bool enqueue = false;
 
-	if (unlikely(qdisc_qlen(sch) >= sch->limit)) {
+	if (unlikely(qdisc_qlen(sch) >= sch->limit) ||
+	    unlikely(qdisc_backlog_overflow(sch, skb))) {
 		WRITE_ONCE(q->stats.overlimit, q->stats.overlimit + 1);
 		goto out;
 	}
diff --git a/net/sched/sch_plug.c b/net/sched/sch_plug.c
index b60ddfee6a68..5654e5310fb5 100644
--- a/net/sched/sch_plug.c
+++ b/net/sched/sch_plug.c
@@ -89,7 +89,8 @@ static int plug_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 {
 	struct plug_sched_data *q = qdisc_priv(sch);
 
-	if (likely((u64)sch->qstats.backlog + skb->len <= q->limit)) {
+	if (likely((u64)sch->qstats.backlog + qdisc_pkt_len(skb) <=
+		   q->limit)) {
 		if (!q->unplug_indefinite)
 			q->pkts_current_epoch++;
 		return qdisc_enqueue_tail(skb, sch);
diff --git a/net/sched/sch_prio.c b/net/sched/sch_prio.c
index 79437c587e7e..11f9354f57c2 100644
--- a/net/sched/sch_prio.c
+++ b/net/sched/sch_prio.c
@@ -72,6 +72,12 @@ prio_enqueue(struct sk_buff *skb, struct Qdisc *sch, struct sk_buff **to_free)
 	struct Qdisc *qdisc;
 	int ret;
 
+	if (unlikely(qdisc_backlog_overflow(sch, skb))) {
+		qdisc_qstats_overlimit(sch);
+		return qdisc_drop_reason(skb, sch, to_free,
+					 QDISC_DROP_OVERLIMIT);
+	}
+
 	qdisc = prio_classify(skb, sch, &ret);
 #ifdef CONFIG_NET_CLS_ACT
 	if (qdisc == NULL) {
diff --git a/net/sched/sch_qfq.c b/net/sched/sch_qfq.c
index e900890e9c54..8e0b2702669e 100644
--- a/net/sched/sch_qfq.c
+++ b/net/sched/sch_qfq.c
@@ -1236,6 +1236,12 @@ static int qfq_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 	struct qfq_aggregate *agg;
 	int err = 0;
 
+	if (unlikely(qdisc_backlog_overflow(sch, skb))) {
+		qdisc_qstats_overlimit(sch);
+		return qdisc_drop_reason(skb, sch, to_free,
+					 QDISC_DROP_OVERLIMIT);
+	}
+
 	cl = qfq_classify(skb, sch, &err);
 	if (cl == NULL) {
 		if (err & __NET_XMIT_BYPASS)
diff --git a/net/sched/sch_red.c b/net/sched/sch_red.c
index d7598214270b..f3783e436da7 100644
--- a/net/sched/sch_red.c
+++ b/net/sched/sch_red.c
@@ -73,9 +73,22 @@ static int red_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 	enum qdisc_drop_reason reason = QDISC_DROP_CONGESTED;
 	struct red_sched_data *q = qdisc_priv(sch);
 	struct Qdisc *child = q->qdisc;
+	u32 child_backlog;
+	u32 red_backlog;
 	unsigned int len;
 	int ret;
 
+	/* RED reads the child backlog into red_calc_qavg() and mirrors the
+	 * child's growth into its own counter, so both must have room for
+	 * the packet.
+	 */
+	if (unlikely(qdisc_backlog_overflow(sch, skb) ||
+		     qdisc_backlog_overflow(child, skb))) {
+		qdisc_qstats_overlimit(sch);
+		return qdisc_drop_reason(skb, sch, to_free,
+					 QDISC_DROP_OVERLIMIT);
+	}
+
 	q->vars.qavg = red_calc_qavg(&q->parms,
 				     &q->vars,
 				     child->qstats.backlog);
@@ -136,14 +149,37 @@ static int red_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 	}
 
 	len = qdisc_pkt_len(skb);
+	/* Reserve the length before the child sees the packet: netem
+	 * can re-enqueue a clone here before the backlog is updated.
+	 */
+	red_backlog = READ_ONCE(sch->qstats.backlog);
+	child_backlog = READ_ONCE(child->qstats.backlog);
+	qstats_backlog_add(sch, len);
 	ret = qdisc_enqueue(skb, child, to_free);
 	if (likely(ret == NET_XMIT_SUCCESS)) {
-		qstats_backlog_add(sch, len);
 		qdisc_qlen_inc(sch);
-	} else if (net_xmit_drop_count(ret)) {
-		WRITE_ONCE(q->stats.pdrop,
-			   q->stats.pdrop + 1);
-		qdisc_qstats_drop(sch);
+	} else {
+		u32 propagated, grew;
+
+		/* Re-derive the aggregate from the snapshots: the child may
+		 * have dropped the packet or evicted another one, and may or
+		 * may not have reduced the ancestors' backlog itself
+		 * (pfifo_head_drop, sfq and fq_codel do; hhf and skbprio
+		 * return NET_XMIT_CN without qdisc_tree_reduce_backlog()).
+		 * Keep what the child actually accounted for, and pass the
+		 * difference on to the ancestors above RED.
+		 */
+		propagated = READ_ONCE(sch->qstats.backlog) -
+			     red_backlog - len;
+		grew = READ_ONCE(child->qstats.backlog) - child_backlog;
+		WRITE_ONCE(sch->qstats.backlog, red_backlog + grew);
+		if (propagated != grew)
+			qdisc_tree_reduce_backlog(sch, 0, propagated - grew);
+		if (net_xmit_drop_count(ret)) {
+			WRITE_ONCE(q->stats.pdrop,
+				   q->stats.pdrop + 1);
+			qdisc_qstats_drop(sch);
+		}
 	}
 	return ret;
 
diff --git a/net/sched/sch_sfb.c b/net/sched/sch_sfb.c
index ed39869199c0..7e8edb481edc 100644
--- a/net/sched/sch_sfb.c
+++ b/net/sched/sch_sfb.c
@@ -296,6 +296,12 @@ static int sfb_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 	u32 slot = q->slot;
 	int ret = NET_XMIT_SUCCESS | __NET_XMIT_BYPASS;
 
+	if (unlikely(qdisc_backlog_overflow(sch, skb))) {
+		qdisc_qstats_overlimit(sch);
+		return qdisc_drop_reason(skb, sch, to_free,
+					 QDISC_DROP_OVERLIMIT);
+	}
+
 	if (unlikely(sch->q.qlen >= q->limit)) {
 		qdisc_qstats_overlimit(sch);
 		WRITE_ONCE(q->stats.queuedrop,
diff --git a/net/sched/sch_sfq.c b/net/sched/sch_sfq.c
index 8bbcfc9e85d9..67d797f50755 100644
--- a/net/sched/sch_sfq.c
+++ b/net/sched/sch_sfq.c
@@ -351,6 +351,12 @@ sfq_enqueue(struct sk_buff *skb, struct Qdisc *sch, struct sk_buff **to_free)
 	struct sk_buff *head;
 	int delta;
 
+	if (unlikely(qdisc_backlog_overflow(sch, skb))) {
+		qdisc_qstats_overlimit(sch);
+		return qdisc_drop_reason(skb, sch, to_free,
+					 QDISC_DROP_OVERLIMIT);
+	}
+
 	hash = sfq_classify(skb, sch, &ret);
 	if (hash == 0) {
 		if (ret & __NET_XMIT_BYPASS)
diff --git a/net/sched/sch_skbprio.c b/net/sched/sch_skbprio.c
index 52abfb4015a3..44e9dd97a859 100644
--- a/net/sched/sch_skbprio.c
+++ b/net/sched/sch_skbprio.c
@@ -75,6 +75,12 @@ static int skbprio_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 	struct sk_buff *to_drop;
 	u16 prio, lp;
 
+	if (unlikely(qdisc_backlog_overflow(sch, skb))) {
+		qdisc_qstats_overlimit(sch);
+		return qdisc_drop_reason(skb, sch, to_free,
+					 QDISC_DROP_OVERLIMIT);
+	}
+
 	/* Obtain the priority of @skb. */
 	prio = min(skb->priority, max_priority);
 
diff --git a/net/sched/sch_taprio.c b/net/sched/sch_taprio.c
index 5a1dca9d5e9d..bdb2596de0ef 100644
--- a/net/sched/sch_taprio.c
+++ b/net/sched/sch_taprio.c
@@ -590,6 +590,12 @@ static int taprio_enqueue_one(struct sk_buff *skb, struct Qdisc *sch,
 {
 	struct taprio_sched *q = qdisc_priv(sch);
 
+	if (unlikely(qdisc_backlog_overflow(sch, skb))) {
+		qdisc_qstats_overlimit(sch);
+		return qdisc_drop_reason(skb, sch, to_free,
+					 QDISC_DROP_OVERLIMIT);
+	}
+
 	/* sk_flags are only safe to use on full sockets. */
 	if (skb->sk && sk_fullsock(skb->sk) && sock_flag(skb->sk, SOCK_TXTIME)) {
 		if (!is_valid_interval(skb, sch))
diff --git a/net/sched/sch_tbf.c b/net/sched/sch_tbf.c
index 58c9687efb0f..5a23b6749758 100644
--- a/net/sched/sch_tbf.c
+++ b/net/sched/sch_tbf.c
@@ -255,6 +255,12 @@ static int tbf_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 	unsigned int len = qdisc_pkt_len(skb);
 	int ret;
 
+	if (unlikely(qdisc_backlog_overflow(sch, skb))) {
+		qdisc_qstats_overlimit(sch);
+		return qdisc_drop_reason(skb, sch, to_free,
+					 QDISC_DROP_OVERLIMIT);
+	}
+
 	if (qdisc_pkt_len(skb) > q->max_size) {
 		if (skb_is_gso(skb) &&
 		    skb_gso_validate_mac_len(skb, q->max_size))
-- 
2.43.0

