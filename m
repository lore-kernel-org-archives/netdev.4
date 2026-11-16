Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794859565;
	b=MrxXSpXUQPWLMn4sXAoK8aslmN+S8cDDYALd39sHL2+n+x4ezF9hbWbDXaQ+X7Q2o7RY
	 6NFSaIo1TQ3tpeuchYShuDMou7Yv9VUeX7gArl5u3jBH+GvtxJOHahl5k89Rc0QBQNceV
	 x7U3B6HThexybtJsajOmWUdAZBwaihREy9GBtZ71VlqZdPdqJMZxw1WKu1WGsSg5ZAERp
	 D/7y3/YR8ADEsOCIylib0/uQkoovNHScYNEHGvWpo/XIWjaPa8qMS62khQdXDJhiZigsZ
	 BI04/aV+gXTYW3zIk5r8GlX327WBkryGfLKL2T5QpJZkOc3D2Mp16PovvRdUvJ6A+Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794859565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7CsvDGSOFy4gQJcyZNOpgRwOM92gZcnNQz4RgIli3W0=;
	b=AON5Yw42Eqo5xNKa6mSvggCxFPfgMFc90Xxg1bgF7BIQw0wW83RRIO9Q4JcIIL8fn5da
	 t7HBOx+mwXrjChvadNS5eP3cJRYF8GIryEWOGeMgzZcRUlhE+Dh8BW9LBWiBOYL6Al5ML
	 8wgihq9AtVyAbDAN+ifr3Zgz1JnIe8tK5JQntnY0HFg9kg8wYnqZV1o7Q5kn2jq1V1hyj
	 JEAnnJecXul/ioj1DlSCI2FS1Z7zwCbH9Nh6COAbKLqxrGkOaZWoc7sDGE/4GHyCWxawS
	 6giu/75iFrohhLv8y4WEQdnybdOuQHtlPwK3xcs75NRt64KUUWQfsiF58es0b8HCI+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b="V2tODxN/";
	arc=none smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631A8606A333
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 20:06:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 631A8606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=V2tODxN/
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-91ec396c93dso69446756d6.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 12:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1794859563; x=1795464363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7CsvDGSOFy4gQJcyZNOpgRwOM92gZcnNQz4RgIli3W0=;
        b=V2tODxN/2WUAH71aGxlUTxus/2pS+som+t/gOpR9cAD+aM3rdwUQCfgc4YAMH3ys9T
         AQleR6XTCO0BqN//o9N4bNTg0ZKMG/GBb+K3gYoBc2wN2yOMSIH3/OwA/x0rb6r9zrb9
         7ZY080WClKjz9XLGTTxDvrngsHLAgkjXjA3RQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794859563; x=1795464363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7CsvDGSOFy4gQJcyZNOpgRwOM92gZcnNQz4RgIli3W0=;
        b=OqgY4Jp4+IzWama+IaqoPghI5NYDx7UxXYM/uHZNwgDCLAq0c1/T1lCSPfeE86Sn51
         GxBrs8ESJ6RQpEk4sj/hE4Z+oocrH5FMfFt7HWsQvCOSEjy915nkcZ1kSgEFMOnjaG5M
         aoQTH1or2ku/aMH6iV4D0ASqbp5JNaEe/AUWfa3YXvTkTkyhtuRb4u8dGYysdGi/Nkt8
         AUr6rpZCJlsJs8VOb/UWgC4UGi7RTvFhwmw1i3QqbPXgoD6yWTAL1Ftl9ZIB33p6oYYp
         YXgGztgKr4EUrCVj4keji0sc4hove0mrFvNGjte2FxLzXWy/4rYeg7RTEY22ADd+bwqc
         YNbA==
X-Gm-Message-State: APuU4Z+C4dUkziNidrby/9XgoTLCuSfRpYwhNjV4aDlsXL0RaHEiZlfq
	qtmWdXBpUl7v0l01B27yZ95EmSmEkK4ZWzaUj8sep7dK3i+KAa9z2W+Sy+bKDLNs4sHDxNE/iWe
	bDKQ=
X-Gm-Gg: AZFdTZdBWChSNzfnCWuPpLUgRr6pQA1pIg7i1bgfNeU9CdttByK+udONzCQb2J1rsS7
	DNY/y79P+DBNTWkWhMWGqlyH0c04P9jfE4d57zwwJYpulj1U8Rc39s4sFNAF6KQNYp286eVIlj/
	0U0bX7gGt77wLsr/lSx7zIL44ofPjj7vezqvDTvrI6kcX4IdKcDwZ05ALL5v/zzdb1VmpKJXNXI
	3Pyo9ymGR8szzfrXEdBBxpSt3g6CFSOyr6pjbKlOHdp8Kz4Tldra0wXLx6K3R3Qm3wr3GCstu7M
	2OEOIT9AcQAAN4KvfvGARwCB8Ao1VZZNP6eCr+YyCmyYWYUF0n+0rC6FqaUn2JrW7jbk2pxTviZ
	+dW+TxlmUMM+DxO0pIPGspgdSgH+2X2EkTEDzhTBqh4UBmItUHMphoqp+8ngGXpZ3T/65yUIW6v
	6/cXyfC05ObHufHfeYQj3tphBlnom/jfAc+8cP3azaguFIoHR8SmU19MH48MmmlD1rIs9VxVkP5
	YQneFZEwlR8J7iTTH1RHnRdWsjzMOf3nEhCBKaH1VRwM8SJxk+Vc1prGG/EPDn1SPSy2q4dYnY8
	PAA2x9QkTQuSoOFcoSA4gyzpO1RRnMtztadTxoRVaJkNG4+/dXR4G9Sldfnwd2XlV4RHrWjKmyn
	1Yh7Nrz3yYzHgjNe2Pyky
X-Received: by 2002:a05:6214:2126:b0:91e:ad04:87f2 with SMTP id 6a1803df08f44-91f2423c86emr187730226d6.50.1794859563149;
        Mon, 16 Nov 2026 12:06:03 -0800 (PST)
Received: from mbili.waya ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d7b607sm94333936d6.26.2026.11.16.12.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:06:02 -0800 (PST)
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
Subject: [PATCH net-next v11 3/4] net/sched: cap the accounted backlog before it can wrap
Date: Mon, 16 Nov 2026 15:05:53 -0500
Message-Id: <QDISC-BA27.v11.r0.20261116134053-3@mojatatu.com>
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

v10 -> v11:
- taprio books the packet only when the child accepted it, and the
segmented path adds a segment to the tree adjustment only when it was
accepted, so the tree reduce matches the bytes that were accounted. A
child that dropped left its length in taprio's backlog, and 4 GiB of
those drops turned the leak into a permanent egress stop.
  (Sashiko gemini and nipa reviews of v10)
- netem accounts the duplicate before it re-enters the root and undoes it
afterwards, so the re-entry no longer reaches every guard with a backlog
that does not hold the clone yet.
  (Sashiko gemini and nipa reviews of v10)
- hhf and skbprio pass the net change of an eviction to the ancestors
when they return NET_XMIT_CN; the parent does not book the incoming
packet on CN, so the two counters stayed apart until the parent's
backlog sat just below zero and the guard stopped the tree.
  (Sashiko nipa review of v10)
- htb classifies after the guard, so a terminal action verdict is not
turned into an overlimit drop.
  (Sashiko gemini and nipa reviews of v10)
- RED applies the correction as a delta instead of restoring the
snapshot taken before the child enqueue, so a concurrent update from an
offload driver is not lost.
  (Sashiko nipa review of v10)

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

 include/net/pkt_sched.h   |  1 -
 include/net/sch_generic.h | 20 ++++++++++++++++
 net/sched/sch_cake.c      |  7 ++++++
 net/sched/sch_cbs.c       |  6 +++++
 net/sched/sch_choke.c     |  6 +++++
 net/sched/sch_codel.c     | 16 +++++++------
 net/sched/sch_drr.c       |  6 +++++
 net/sched/sch_dualpi2.c   |  1 +
 net/sched/sch_etf.c       |  6 +++++
 net/sched/sch_ets.c       |  6 +++++
 net/sched/sch_fifo.c      |  6 +++++
 net/sched/sch_fq.c        |  6 +++++
 net/sched/sch_fq_codel.c  |  9 +++++++
 net/sched/sch_fq_pie.c    |  3 ++-
 net/sched/sch_gred.c      |  9 +++++++
 net/sched/sch_hfsc.c      |  6 +++++
 net/sched/sch_hhf.c       | 18 ++++++++++++--
 net/sched/sch_htb.c       | 14 ++++++++---
 net/sched/sch_netem.c     | 18 ++++++++++++++
 net/sched/sch_pie.c       |  3 ++-
 net/sched/sch_plug.c      |  3 ++-
 net/sched/sch_prio.c      |  6 +++++
 net/sched/sch_qfq.c       |  6 +++++
 net/sched/sch_red.c       | 50 +++++++++++++++++++++++++++++++++++----
 net/sched/sch_sfb.c       |  6 +++++
 net/sched/sch_sfq.c       |  6 +++++
 net/sched/sch_skbprio.c   | 17 +++++++++++--
 net/sched/sch_taprio.c    | 18 ++++++++++----
 net/sched/sch_tbf.c       |  6 +++++
 29 files changed, 258 insertions(+), 27 deletions(-)

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
index fca20c50c97c..a3d1e7c850e6 100644
--- a/net/sched/sch_hhf.c
+++ b/net/sched/sch_hhf.c
@@ -373,9 +373,16 @@ static int hhf_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 		       struct sk_buff **to_free)
 {
 	struct hhf_sched_data *q = qdisc_priv(sch);
-	enum wdrr_bucket_idx idx;
+	unsigned int len = qdisc_pkt_len(skb);
 	struct wdrr_bucket *bucket;
 	unsigned int prev_backlog;
+	enum wdrr_bucket_idx idx;
+
+	if (unlikely(qdisc_backlog_overflow(sch, skb))) {
+		qdisc_qstats_overlimit(sch);
+		return qdisc_drop_reason(skb, sch, to_free,
+					 QDISC_DROP_OVERLIMIT);
+	}
 
 	idx = hhf_classify(skb, sch);
 
@@ -409,8 +416,15 @@ static int hhf_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 	/* Return Congestion Notification only if we dropped a packet from this
 	 * bucket.
 	 */
-	if (hhf_drop(sch, to_free) == idx)
+	if (hhf_drop(sch, to_free) == idx) {
+		/* The parent does not book this packet on CN, so pass the net
+		 * change on instead.
+		 */
+		qdisc_tree_reduce_backlog(sch, 0,
+					  prev_backlog - sch->qstats.backlog -
+					  len);
 		return NET_XMIT_CN;
+	}
 
 	/* As we dropped a packet, better let upper stack know this. */
 	qdisc_tree_reduce_backlog(sch, 1, prev_backlog - sch->qstats.backlog);
diff --git a/net/sched/sch_htb.c b/net/sched/sch_htb.c
index 1ba67b121de4..37c6f28b1d26 100644
--- a/net/sched/sch_htb.c
+++ b/net/sched/sch_htb.c
@@ -625,10 +625,18 @@ static inline void htb_deactivate(struct htb_sched *q, struct htb_class *cl)
 static int htb_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 		       struct sk_buff **to_free)
 {
-	int ret;
-	unsigned int len = qdisc_pkt_len(skb);
 	struct htb_sched *q = qdisc_priv(sch);
-	struct htb_class *cl = htb_classify(skb, sch, &ret);
+	unsigned int len = qdisc_pkt_len(skb);
+	struct htb_class *cl;
+	int ret;
+
+	if (unlikely(qdisc_backlog_overflow(sch, skb))) {
+		qdisc_qstats_overlimit(sch);
+		return qdisc_drop_reason(skb, sch, to_free,
+					 QDISC_DROP_OVERLIMIT);
+	}
+
+	cl = htb_classify(skb, sch, &ret);
 
 	if (cl == HTB_DIRECT) {
 		/* enqueue to helper queue */
diff --git a/net/sched/sch_netem.c b/net/sched/sch_netem.c
index 1dc2924890eb..c25ce4c3175e 100644
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
 
@@ -567,7 +573,19 @@ static int netem_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 		struct Qdisc *rootq = qdisc_root_bh(sch);
 
 		skb2->tc_depth++; /* prevent duplicating a dup... */
+		/* The clone re-enters the tree before this packet is booked,
+		 * so every guard it reaches would compare against a backlog
+		 * that does not hold it yet and admit two packets where it
+		 * has room for one.  Account it here and undo, because the
+		 * normal path below books it again.
+		 */
+		qstats_backlog_add(sch, prev_len);
+		qdisc_qlen_inc(sch);
+		qdisc_tree_reduce_backlog(sch, 0, -(int)prev_len);
 		rootq->enqueue(skb2, rootq, to_free);
+		qdisc_tree_reduce_backlog(sch, 0, prev_len);
+		qstats_backlog_sub(sch, prev_len);
+		qdisc_qlen_dec(sch);
 		skb2 = NULL;
 	}
 
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
index d7598214270b..de33e9e02c64 100644
--- a/net/sched/sch_red.c
+++ b/net/sched/sch_red.c
@@ -73,9 +73,22 @@ static int red_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 	enum qdisc_drop_reason reason = QDISC_DROP_CONGESTED;
 	struct red_sched_data *q = qdisc_priv(sch);
 	struct Qdisc *child = q->qdisc;
+	u32 child_backlog;
 	unsigned int len;
+	u32 red_backlog;
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
@@ -136,14 +149,41 @@ static int red_enqueue(struct sk_buff *skb, struct Qdisc *sch,
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
+		/* Apply a delta rather than restoring the snapshot: an
+		 * offload driver may have updated the counter while the
+		 * child ran, and an absolute store would lose it.
+		 */
+		qstats_backlog_add(sch, grew - len - propagated);
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
index 52abfb4015a3..688a786364a9 100644
--- a/net/sched/sch_skbprio.c
+++ b/net/sched/sch_skbprio.c
@@ -70,11 +70,18 @@ static int skbprio_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 {
 	const unsigned int max_priority = SKBPRIO_MAX_PRIORITY - 1;
 	struct skbprio_sched_data *q = qdisc_priv(sch);
-	struct sk_buff_head *qdisc;
 	struct sk_buff_head *lp_qdisc;
+	struct sk_buff_head *qdisc;
+	unsigned int to_drop_len;
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
 
@@ -113,10 +120,11 @@ static int skbprio_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 	lp_qdisc = &q->qdiscs[lp];
 	to_drop = __skb_dequeue_tail(lp_qdisc);
 	BUG_ON(!to_drop);
+	to_drop_len = qdisc_pkt_len(to_drop);
 	qdisc_qstats_backlog_dec(sch, to_drop);
 	qdisc_drop(to_drop, sch, to_free);
 
-	q->qstats[lp].backlog -= qdisc_pkt_len(to_drop);
+	q->qstats[lp].backlog -= to_drop_len;
 	q->qstats[lp].drops++;
 	q->qstats[lp].overlimits++;
 
@@ -133,6 +141,11 @@ static int skbprio_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 	if (prio > q->highest_prio)
 		q->highest_prio = prio;
 
+	/* The parent does not book this packet on CN, so pass the net
+	 * change on instead.
+	 */
+	qdisc_tree_reduce_backlog(sch, 0, to_drop_len - qdisc_pkt_len(skb));
+
 	return NET_XMIT_CN;
 }
 
diff --git a/net/sched/sch_taprio.c b/net/sched/sch_taprio.c
index 5a1dca9d5e9d..e5aee9c650c9 100644
--- a/net/sched/sch_taprio.c
+++ b/net/sched/sch_taprio.c
@@ -589,6 +589,13 @@ static int taprio_enqueue_one(struct sk_buff *skb, struct Qdisc *sch,
 			      struct Qdisc *child, struct sk_buff **to_free)
 {
 	struct taprio_sched *q = qdisc_priv(sch);
+	int ret;
+
+	if (unlikely(qdisc_backlog_overflow(sch, skb))) {
+		qdisc_qstats_overlimit(sch);
+		return qdisc_drop_reason(skb, sch, to_free,
+					 QDISC_DROP_OVERLIMIT);
+	}
 
 	/* sk_flags are only safe to use on full sockets. */
 	if (skb->sk && sk_fullsock(skb->sk) && sock_flag(skb->sk, SOCK_TXTIME)) {
@@ -600,10 +607,13 @@ static int taprio_enqueue_one(struct sk_buff *skb, struct Qdisc *sch,
 			return qdisc_drop(skb, sch, to_free);
 	}
 
-	qdisc_qstats_backlog_inc(sch, skb);
-	qdisc_qlen_inc(sch);
+	ret = qdisc_enqueue(skb, child, to_free);
+	if (ret == NET_XMIT_SUCCESS) {
+		qdisc_qstats_backlog_inc(sch, skb);
+		qdisc_qlen_inc(sch);
+	}
 
-	return qdisc_enqueue(skb, child, to_free);
+	return ret;
 }
 
 static int taprio_enqueue_segmented(struct sk_buff *skb, struct Qdisc *sch,
@@ -623,7 +633,6 @@ static int taprio_enqueue_segmented(struct sk_buff *skb, struct Qdisc *sch,
 		skb_mark_not_on_list(segs);
 		qdisc_skb_cb(segs)->pkt_len = segs->len;
 		qdisc_skb_cb(segs)->pkt_segs = 1;
-		slen += segs->len;
 
 		/* FIXME: we should be segmenting to a smaller size
 		 * rather than dropping these
@@ -637,6 +646,7 @@ static int taprio_enqueue_segmented(struct sk_buff *skb, struct Qdisc *sch,
 			if (net_xmit_drop_count(ret))
 				qdisc_qstats_drop(sch);
 		} else {
+			slen += segs->len;
 			numsegs++;
 		}
 	}
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

