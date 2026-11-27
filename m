Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780686;
	b=HjTEIF9IthOyP+TUG18hfWch11tvH72ZmSqCJf79X5ml3cFOwhzioqVMKzLq2EMdfS77
	 VkIaZtgcyfzA9btp8RfYMKfnxfBh9TRK6FtIj8FzY5DiXrpOXMR8TLbZ9B+XsL/8zllS3
	 Ci+jgjh0AMV5W+asUgs8yhu+C27dXDGCXosFFmXRY8hr+GFdebgKG2F29y9VhabS4WJlm
	 5FJjgs6ZXcKwnYyY9vO7e7NNWC0Al4pLTAocRBfvqDwHSLMS35XwnwZ3Pz8WDpoUizov7
	 eW0xGA5GA9l0iHcQ0oyXTkfLAx72C3CnhWC7gO08Lke71xN5VJJA17OGRRs92Fg1f0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=D3xyNAIM5saBcqBGGxkfjdaSkeXd4zhO/5vEnVnnGgw=;
	b=TosW/w+NzIstkQ+eefqBXoA+n+yJBlDZMv2ifIE68p033fsjpchGlNS1/z+tzO6WgsAi
	 FLX32WHZKKtfCyBx7ozl/n+nFiijt6nnRmH3E+q/Uuy6kKglBAgF1vV0tSXjyfoGT381w
	 g6ClVJdBphPVNmHkjujprzohBAT+cgPwtw9sTabOdeU/xO/iwR1REwFcFW8l6ovGkfpdT
	 KUoCy2j+4nknTfWP3cThJQWhg6dd+qF1o2XQgFw8ZhTJVMa9WY5mDc5Ogna9hCMeyaSaA
	 Y67yY80lIFUkZbyDCpgNu9BndppFubOIDt3Gstfkd1oxrz6yqGfa/ryL4VaLGPuaUVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=vgOYPA7W;
	arc=none smtp.remote-ip=209.85.222.181
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93A0606A31F
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 11:58:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C93A0606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=vgOYPA7W
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93f22a8515eso683002485a.2
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 03:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795780685; x=1796385485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D3xyNAIM5saBcqBGGxkfjdaSkeXd4zhO/5vEnVnnGgw=;
        b=vgOYPA7WVpGnu6AJvfeokyxrE8Ur6hzy038oUKcU2OjZwvUnn7uPNjVBpa/2Bzszp8
         NGU1PKnwZZcJdnmxwzPt+UlarvUGdrZOb+nrZhqPpceaJH4I8JypShdAS1XByPepan57
         WCZBM9fNX5ANqDY3t5D7IoslrNX3QN/T5qfSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780685; x=1796385485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D3xyNAIM5saBcqBGGxkfjdaSkeXd4zhO/5vEnVnnGgw=;
        b=FtrMENIi6V1MfL12XmjpVdtfkKWxjub/69oV4CDn9DLL5THyWFRGlPqLyDi0AeKh6/
         WolPCAfuxF/cbhhRRnmxLO2TBSbzI6HcM2YogUbxRvy8vkPv59sVjiJZKrRz7O7kxcTQ
         Xt8VqMsYak+tuvG9ciarCyLdtrWHZS/rN39EvwpHviqrLahXW7w5g5t4lVZyseoZNw+Z
         6HgVv53nAKxaxk5tIPBZTSDDAon1nJ9+o/IzbVrRnNO4mNW885qGkgC84zYTH1JGBAGY
         FNxn/owp+mq7ijqmMg1DM7JZqkOvVbEyubyw49uAPU8KaRxuhzv543pmun1CHDMGieTJ
         wAjw==
X-Gm-Message-State: APuU4Z+LYrPrdiN7DVS1DkxZfa4JQAhpjLef/WubFqfxxGVVM/Uwc10b
	cpUQIJILqri5SNbkDBZcXKRmp1J4Nfa4t0FWg00RYlfRhsu4iukdCsNT9r40jqaSqWuPD+M+ulI
	1X0w=
X-Gm-Gg: AZFdTZdMdzq2V2/FAqiMbs1VaNPsvi3k0JBvxG+w8npbwsND5osk9X5JyEDJ5tFe2j4
	k0vD3NWSq9H8YrvaQ5i4UgKLggV+hXIYVR6qBPJlFD3Hi+Ex9dta/EfFANGj7FYF47ZUsKwLRkL
	EPOcbD9mbUCZ1IN8jibEBroQb5JTnRMdyMKL/dOEN6FE3pwDExmDK1Xd1hicuJEUDXRu2KUE867
	CzZAucMGB8FMMKSB6Fsf97llTP6ogNN+F1MWL1ecDJVASg4SztokksNGWEx/cNMuCCKqCEdGWaD
	9ysmFUel4dASdMB1Nuitwtsupc1/cQgQ7KjW5msC5lmI2OpHKdLdPBVpYV3Haz5fw+ds9VZtnu0
	tbtSuFCLlonc65P3jcWhPXb/UFDSLMQv2JArNVfIy1PTwYZVn1yG1xD5FlwCyIqKT6cF6Z9sc37
	k4/l77/Bi9ZJxdermmz26irUpABJh6Jzi/syBTG9qS12i5Pe/a2cWaoyxwAOjkgGA+OC4ekGZ97
	66wTh5lhQvbv1rgiuw2s7lY7v4Lg0k6jx+9sWUEBOmyK050uVoHgQMsqcLgObbIhScEpc9aNIR1
	vfda9boSDed+QzRqQOXO+GDef4tcYUt2VLZMZW5rYnV3xUzdyUtNS/T6m+7K8VoUVsxU9IbtNK0
	n
X-Received: by 2002:a05:620a:448e:b0:949:696f:c997 with SMTP id af79cd13be357-949bab480dcmr4041185185a.80.1795780683954;
        Fri, 27 Nov 2026 03:58:03 -0800 (PST)
Received: from mbili.waya ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949caf98d34sm1588177985a.2.2026.11.27.03.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:58:03 -0800 (PST)
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
Subject: [PATCH net-next v13 3/4] net/sched: cap the accounted backlog before it can wrap
Date: Fri, 27 Nov 2026 06:57:51 -0500
Message-Id: <QDISC-BA27.v13.r0.20261127065026-3@mojatatu.com>
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
Content-Transfer-Encoding: 8bit

This is a followup of commit 709f34f7c28d ("net/sched: fq: add overflow
bounds to quantum and initial quantum") as reported by Sashiko.

The issue: every AQM qdisc accounts each enqueued packet's stab-adjusted
length into the 32-bit sch->qstats.backlog. A crafted size table inflates
qdisc_pkt_len() to QDISC_PKT_LEN_MAX (1 MiB), and a BIG TCP aggregate adds
the headers replicated per segment, so a few thousand packets wrap the
counter mod 2^32. The AQM then reads a small backlog and drops from the
wrong flow; in fq_codel a wrapped per-flow backlog can make
fq_codel_drop() pick an empty flow.

The Fix: drop at enqueue once the stored backlog cannot represent the
incoming packet's accounted length. Packets up to 1 MiB are covered by a
standing ceiling, QDISC_MAX_BACKLOG == U32_MAX - 2 * QDISC_PKT_LEN_MAX
(one packet plus the duplicate a netem child may book); a larger wire
estimate is checked against the room that actually remains.

The same ceiling covers every qdisc in net/sched that adds the incoming
qdisc_pkt_len() to its own backlog, and the writers below it saturate so
its precondition holds: qstats_backlog_sub() stops at zero and
qdisc_qstats_backlog_apply() takes the signed delta that sfq's head drop
and the tree reconciliation report. An offloaded qdisc is exempt, because
its counter carries driver-maintained hardware bytes. taprio mirrors its
child's net change at dequeue as well and books only the outermost
handoff, and htb bumps q->overlimits, which htb_dump() copies over the
qstats field.

Some context: qdisc_pkt_len() stays truthful for every input, so BPF
wire_len, act_police and the HTB/TBF shapers read the real length. RED
books the packet on success again, as the tree did before v11.

Conditions to recreate the bug:
  ip tuntap add tun0 mode tun
  ip link set tun0 txqueuelen 32 up
  ip addr add 10.99.0.1/24 dev tun0
  tc qdisc add dev tun0 root handle 1: stab overhead 2000000000 \
      fq_codel flows 1 limit 20000 ecn
  # hold the tun fd open without reading so the backlog persists, then
  # send 6000 packets: the counter wraps and the unfixed kernel reports
  # a wrapped backlog, while the fixed one drops at the ceiling.  Setup
  # needs CAP_NET_ADMIN in a user namespace of its own (unshare -Urn); the
  # payload itself does not.

Reported-by: Sashiko (nipa) <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/netdev/20260818101130.16203-1-jhs@mojatatu.com/
Link: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260818101130.16203-1-jhs@mojatatu.com
Link: https://lore.kernel.org/netdev/CANn89iLfMJV7ancKH1Gjzzm7ZUG-gKcrczkJjJEWN5sCuWd-ug@mail.gmail.com/
Link: https://lore.kernel.org/netdev/CANn89i+GOFH_8g+vSV0jUj0aBqLYVWuFOrHuDggZu9kPC_m6tQ@mail.gmail.com/
Link: https://lore.kernel.org/netdev/87a4oottcj.fsf@toke.dk/
Link: https://lore.kernel.org/netdev/87pkxks68f.fsf@toke.dk/
Link: https://lore.kernel.org/netdev/179231932946.3135.7497478990186385688@kernel.org/
Link: https://lore.kernel.org/netdev/179269577131.3135.3967915390403138015@kernel.org/
Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>

---
v12 -> v13:
- saturate every core subtraction: qstats_backlog_sub() stops at zero, and
qdisc_qstats_backlog_apply() takes the signed deltas.  (Sashiko nipa)
- do not apply the ceiling to an offloaded qdisc, whose counter carries
driver-maintained hardware bytes.  (Sashiko nipa)
- taprio: mirror the child's net change at dequeue too, and book only the
outermost handoff to a child.  (Sashiko nipa and gemini)
- htb: bump q->overlimits, which htb_dump() copies over the qstats field.
  (Sashiko gemini)
- shorten the commit log; the v12 body read like a changelog.
  (Note to the sashikos: reduced because humans complained.)
v11 -> v12:
- taprio: read the child's backlog and queue length before the handoff
and mirror the net change afterwards, instead of booking the packet when
the child returns NET_XMIT_SUCCESS.  Some children free the skb and still
report success (tbf_segment(), cake's split path), so the v11 code read
the packet after it was gone; and because taprio_graft() sets
TCQ_F_NOPARENT, a child that evicts on NET_XMIT_CN never reaches taprio
through qdisc_tree_reduce_backlog(), so booking only on success let the
dequeue subtraction run ahead of the booking and the counter wrapped.
The segmented path reads the segment length before the handoff and no
longer counts a segment drop twice.
  (Sashiko nipa and gemini reviews of v11)
- RED: book the packet on success again, as the tree did before v11.  The
v11 delta arithmetic re-derived the aggregate from the snapshots and so
dropped any offload-driver update that landed while the child ran, and it
passed that same amount on to the ancestors.  With the child and the
netem duplicate propagating their own changes, the plain accounting is
correct and cannot wrap.
  (Sashiko nipa review of v11)
- qdisc_qstats_backlog_dec() stops at zero.  An offload driver updates
sch->qstats.backlog from the dump path while holding only RTNL, so a
datapath increment can be lost; the matching decrement then wrapped the
counter and the new enqueue guard turned the wrap into a permanent drop.
  (Sashiko nipa review of v11)
- leave room for two full-size packets in the standing ceiling, because
netem books a duplicate before it re-enters the tree and one enqueue can
then add twice the packet length.
- pfifo's backlog drops report QDISC_DROP_OVERLIMIT and count an
overlimit, like the other guards added here.
  (Sashiko nipa review of v11)
- drop the Reviewed-by; the taprio and RED accounting it covered was
replaced in this version.
---
 include/net/pkt_sched.h   |  1 -
 include/net/sch_generic.h | 71 +++++++++++++++++++++++++++-
 net/sched/sch_api.c       | 44 +++++++++++++++++-
 net/sched/sch_cake.c      |  7 +++
 net/sched/sch_cbs.c       |  6 +++
 net/sched/sch_choke.c     |  6 +++
 net/sched/sch_codel.c     | 16 ++++---
 net/sched/sch_drr.c       |  6 +++
 net/sched/sch_dualpi2.c   |  1 +
 net/sched/sch_etf.c       |  6 +++
 net/sched/sch_ets.c       |  6 +++
 net/sched/sch_fifo.c      | 12 +++++
 net/sched/sch_fq.c        |  6 +++
 net/sched/sch_fq_codel.c  |  9 ++++
 net/sched/sch_fq_pie.c    |  3 +-
 net/sched/sch_generic.c   |  9 ++++
 net/sched/sch_gred.c      |  9 ++++
 net/sched/sch_hfsc.c      |  6 +++
 net/sched/sch_hhf.c       | 18 ++++++-
 net/sched/sch_htb.c       | 16 +++++--
 net/sched/sch_netem.c     | 18 +++++++
 net/sched/sch_pie.c       |  3 +-
 net/sched/sch_plug.c      |  3 +-
 net/sched/sch_prio.c      |  6 +++
 net/sched/sch_qfq.c       |  6 +++
 net/sched/sch_red.c       | 10 ++++
 net/sched/sch_sfb.c       |  6 +++
 net/sched/sch_sfq.c       |  8 +++-
 net/sched/sch_skbprio.c   | 17 ++++++-
 net/sched/sch_taprio.c    | 98 +++++++++++++++++++++++++++++++--------
 net/sched/sch_tbf.c       |  6 +++
 31 files changed, 398 insertions(+), 41 deletions(-)

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
index 1acaadb3e2cf..677cd089ad5d 100644
--- a/include/net/sch_generic.h
+++ b/include/net/sch_generic.h
@@ -735,6 +735,12 @@ void qdisc_destroy(struct Qdisc *qdisc);
 void qdisc_put(struct Qdisc *qdisc);
 void qdisc_put_unlocked(struct Qdisc *qdisc);
 void qdisc_tree_reduce_backlog(struct Qdisc *qdisc, int n, int len);
+/* Does every ancestor of @sch have room for @extra more bytes below its
+ * enqueue ceiling?  A child that turns one skb into several reconciles the
+ * difference through qdisc_tree_reduce_backlog(), growth that never passes
+ * the ancestors' own enqueue guard.
+ */
+bool qdisc_ancestors_backlog_room(const struct Qdisc *sch, u64 extra);
 
 static inline void dev_reset_queue(struct net_device *dev,
 				   struct netdev_queue *dev_queue,
@@ -915,6 +921,37 @@ static inline unsigned int qdisc_pkt_len(const struct sk_buff *skb)
 	return qdisc_skb_cb(skb)->pkt_len;
 }
 
+#define QDISC_PKT_LEN_MAX	(1 << 20)	/* 1 MiB */
+
+/* Largest backlog that still has room for a 1 MiB packet and a netem
+ * duplicate of it, so that a single enqueue can never run out of
+ * headroom before it is accounted.
+ */
+#define QDISC_MAX_BACKLOG	(U32_MAX - 2 * QDISC_PKT_LEN_MAX)
+
+/* Would this packet's accounted length wrap sch->qstats.backlog?
+ * Packets up to QDISC_PKT_LEN_MAX fit below QDISC_MAX_BACKLOG; GSO
+ * can make the length larger, so compare against the real headroom.
+ *
+ * An offloaded qdisc's counter also carries driver-maintained hardware
+ * bytes, so the ceiling does not describe the queue it protects.
+ */
+static inline bool qdisc_backlog_overflow(const struct Qdisc *sch,
+					  const struct sk_buff *skb)
+{
+	u32 len = qdisc_pkt_len(skb);
+	u32 backlog;
+
+	if (unlikely(READ_ONCE(sch->flags) & TCQ_F_OFFLOADED))
+		return false;
+
+	backlog = READ_ONCE(sch->qstats.backlog);
+	if (likely(len <= QDISC_PKT_LEN_MAX))
+		return backlog > QDISC_MAX_BACKLOG;
+	/* The duplicate a netem child books means one enqueue can add twice. */
+	return (u64)backlog + 2 * (u64)len > U32_MAX;
+}
+
 static inline unsigned int qdisc_pkt_segs(const struct sk_buff *skb)
 {
 	u32 pkt_segs = qdisc_skb_cb(skb)->pkt_segs;
@@ -991,13 +1028,43 @@ static inline void qdisc_bstats_update(struct Qdisc *sch,
 
 static inline void qstats_backlog_sub(struct Qdisc *sch, u32 val)
 {
-	WRITE_ONCE(sch->qstats.backlog, sch->qstats.backlog - val);
+	u32 backlog = READ_ONCE(sch->qstats.backlog);
+
+	/* Saturate: an earlier clamp or offload update can leave the
+	 * counter below the amount being removed.
+	 */
+	WRITE_ONCE(sch->qstats.backlog, backlog > val ? backlog - val : 0);
+}
+
+/* Apply a signed net change: positive removes, negative grows.  The
+ * negative form is a contract of sfq's head drop and of the tree
+ * reconciliation.
+ */
+static inline void qdisc_qstats_backlog_apply(struct Qdisc *sch, int delta)
+{
+	u32 backlog = READ_ONCE(sch->qstats.backlog);
+	u64 next;
+
+	if (delta >= 0)
+		next = backlog > (u32)delta ? backlog - (u32)delta : 0;
+	else
+		next = min_t(u64, (u64)backlog + (u32)(-(s64)delta), U32_MAX);
+
+	WRITE_ONCE(sch->qstats.backlog, (u32)next);
 }
 
 static inline void qdisc_qstats_backlog_dec(struct Qdisc *sch,
 					    const struct sk_buff *skb)
 {
-	qstats_backlog_sub(sch, qdisc_pkt_len(skb));
+	u32 backlog = READ_ONCE(sch->qstats.backlog);
+	u32 len = qdisc_pkt_len(skb);
+
+	/* An offload driver can update the counter from the dump path
+	 * while the packet is in flight, so a lost increment can leave
+	 * the backlog below the length being removed.  Do not let that
+	 * wrap: the enqueue guard would then drop every packet for good.
+	 */
+	WRITE_ONCE(sch->qstats.backlog, backlog > len ? backlog - len : 0);
 }
 
 static inline void qdisc_qstats_cpu_backlog_dec(struct Qdisc *sch,
diff --git a/net/sched/sch_api.c b/net/sched/sch_api.c
index f36c41224bcc..062e5d6f158e 100644
--- a/net/sched/sch_api.c
+++ b/net/sched/sch_api.c
@@ -877,13 +877,55 @@ void qdisc_tree_reduce_backlog(struct Qdisc *sch, int n, int len)
 			cops->qlen_notify(sch, cl);
 		}
 		WRITE_ONCE(sch->q.qlen, sch->q.qlen - n);
-		qstats_backlog_sub(sch, len);
+		qdisc_qstats_backlog_apply(sch, len);
 		__qdisc_qstats_drop(sch, drops);
 	}
 	rcu_read_unlock();
 }
 EXPORT_SYMBOL(qdisc_tree_reduce_backlog);
 
+/* Does every ancestor have room for a growth that qdisc_tree_reduce_backlog()
+ * would apply without its own enqueue guard seeing it?
+ */
+bool qdisc_ancestors_backlog_room(const struct Qdisc *sch, u64 extra)
+{
+	const struct Qdisc *p = sch;
+	u32 parentid;
+
+	if (!extra)
+		return true;
+
+	rcu_read_lock();
+	while ((parentid = p->parent)) {
+		if (parentid == TC_H_ROOT)
+			break;
+
+		if (p->flags & TCQ_F_NOPARENT)
+			break;
+
+		p = qdisc_lookup_rcu(qdisc_dev(p), TC_H_MAJ(parentid));
+		if (!p)
+			break;
+
+		/* An offloaded ancestor is exempt from the ceiling for the same
+		 * reason the enqueue guard is: its counter carries hardware
+		 * bytes the core does not own.
+		 */
+		if (unlikely(READ_ONCE(p->flags) & TCQ_F_OFFLOADED))
+			continue;
+
+		if (unlikely((u64)READ_ONCE(p->qstats.backlog) + extra >
+			     QDISC_MAX_BACKLOG)) {
+			rcu_read_unlock();
+			return false;
+		}
+	}
+	rcu_read_unlock();
+
+	return true;
+}
+EXPORT_SYMBOL(qdisc_ancestors_backlog_room);
+
 int qdisc_offload_dump_helper(struct Qdisc *sch, enum tc_setup_type type,
 			      void *type_data)
 {
diff --git a/net/sched/sch_cake.c b/net/sched/sch_cake.c
index 2bc0dac9123a..25c7e20ec123 100644
--- a/net/sched/sch_cake.c
+++ b/net/sched/sch_cake.c
@@ -1783,6 +1783,13 @@ static s32 cake_enqueue(struct sk_buff *skb, struct Qdisc *sch,
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
index 1b6388d50967..53f159d5b723 100644
--- a/net/sched/sch_fifo.c
+++ b/net/sched/sch_fifo.c
@@ -29,6 +29,12 @@ static int bfifo_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 static int pfifo_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 			 struct sk_buff **to_free)
 {
+	if (unlikely(qdisc_backlog_overflow(sch, skb))) {
+		qdisc_qstats_overlimit(sch);
+		return qdisc_drop_reason(skb, sch, to_free,
+					 QDISC_DROP_OVERLIMIT);
+	}
+
 	if (likely(sch->q.qlen < READ_ONCE(sch->limit)))
 		return qdisc_enqueue_tail(skb, sch);
 
@@ -43,6 +49,12 @@ static int pfifo_tail_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 	if (unlikely(READ_ONCE(sch->limit) == 0))
 		return qdisc_drop(skb, sch, to_free);
 
+	if (unlikely(qdisc_backlog_overflow(sch, skb))) {
+		qdisc_qstats_overlimit(sch);
+		return qdisc_drop_reason(skb, sch, to_free,
+					 QDISC_DROP_OVERLIMIT);
+	}
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
diff --git a/net/sched/sch_generic.c b/net/sched/sch_generic.c
index d2e0d20f3ba1..dcf7dc7d20a3 100644
--- a/net/sched/sch_generic.c
+++ b/net/sched/sch_generic.c
@@ -824,6 +824,15 @@ static int pfifo_fast_enqueue(struct sk_buff *skb, struct Qdisc *qdisc,
 	unsigned int pkt_len = qdisc_pkt_len(skb);
 	int err;
 
+	/* qdisc_clear_nolock() can strip TCQ_F_CPUSTATS on graft, after which
+	 * this books the shared (u32) backlog; guard it like the others.
+	 */
+	if (unlikely(qdisc_backlog_overflow(qdisc, skb))) {
+		qdisc_qstats_overlimit(qdisc);
+		return qdisc_drop_reason(skb, qdisc, to_free,
+					 QDISC_DROP_OVERLIMIT);
+	}
+
 	err = skb_array_produce(q, skb);
 
 	if (unlikely(err)) {
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
index 1ba67b121de4..6d62feaaa218 100644
--- a/net/sched/sch_htb.c
+++ b/net/sched/sch_htb.c
@@ -625,10 +625,20 @@ static inline void htb_deactivate(struct htb_sched *q, struct htb_class *cl)
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
+		/* htb_dump() copies this over sch->qstats.overlimits. */
+		WRITE_ONCE(q->overlimits, q->overlimits + 1);
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
index d7598214270b..738868f08a2e 100644
--- a/net/sched/sch_red.c
+++ b/net/sched/sch_red.c
@@ -76,6 +76,16 @@ static int red_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 	unsigned int len;
 	int ret;
 
+	/* RED feeds the child backlog into red_calc_qavg() and books the
+	 * packet on its own counter, so both must have room for it.
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
index 8bbcfc9e85d9..ef16ca17bd11 100644
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
@@ -427,7 +433,7 @@ sfq_enqueue(struct sk_buff *skb, struct Qdisc *sch, struct sk_buff **to_free)
 		/* We know we have at least one packet in queue */
 		head = slot_dequeue_head(slot);
 		delta = qdisc_pkt_len(head) - qdisc_pkt_len(skb);
-		qstats_backlog_sub(sch, delta);
+		qdisc_qstats_backlog_apply(sch, delta);
 		WRITE_ONCE(slot->backlog, slot->backlog - delta);
 		qdisc_drop_reason(head, sch, to_free, QDISC_DROP_FLOW_LIMIT);
 
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
index 5a1dca9d5e9d..42364c785c83 100644
--- a/net/sched/sch_taprio.c
+++ b/net/sched/sch_taprio.c
@@ -123,6 +123,10 @@ struct taprio_sched {
 	u32 max_sdu[TC_MAX_QUEUE]; /* save info from the user */
 	u32 fp[TC_QOPT_MAX_QUEUE]; /* only for dump and offloading */
 	u32 txtime_delay;
+	/* Child whose net change the in-flight enqueue mirror is
+	 * accounting; see taprio_enqueue_one().
+	 */
+	struct Qdisc *mirror_child;
 };
 
 struct __tc_taprio_qopt_offload {
@@ -585,10 +589,36 @@ static bool taprio_skb_exceeds_queue_max_sdu(struct Qdisc *sch,
 	return exceeds;
 }
 
+/* The child cannot correct us: taprio_graft() marks it TCQ_F_NOPARENT, so
+ * its qdisc_tree_reduce_backlog() stops there.  Mirror its net change.
+ */
+static void taprio_mirror_child(struct Qdisc *sch, struct Qdisc *child,
+				u32 backlog_before, int qlen_before)
+{
+	/* apply() takes the amount to remove, so a child growth is negated
+	 * and a child eviction adds.
+	 */
+	qdisc_qstats_backlog_apply(sch,
+				   -(int)(READ_ONCE(child->qstats.backlog) -
+					  backlog_before));
+	WRITE_ONCE(sch->q.qlen,
+		   sch->q.qlen + (int)(qdisc_qlen(child) - qlen_before));
+}
+
 static int taprio_enqueue_one(struct sk_buff *skb, struct Qdisc *sch,
 			      struct Qdisc *child, struct sk_buff **to_free)
 {
 	struct taprio_sched *q = qdisc_priv(sch);
+	struct Qdisc *mirror_prev;
+	u32 backlog;
+	int qlen;
+	int ret;
+
+	if (unlikely(qdisc_backlog_overflow(sch, skb))) {
+		qdisc_qstats_overlimit(sch);
+		return qdisc_drop_reason(skb, sch, to_free,
+					 QDISC_DROP_OVERLIMIT);
+	}
 
 	/* sk_flags are only safe to use on full sockets. */
 	if (skb->sk && sk_fullsock(skb->sk) && sock_flag(skb->sk, SOCK_TXTIME)) {
@@ -600,10 +630,23 @@ static int taprio_enqueue_one(struct sk_buff *skb, struct Qdisc *sch,
 			return qdisc_drop(skb, sch, to_free);
 	}
 
-	qdisc_qstats_backlog_inc(sch, skb);
-	qdisc_qlen_inc(sch);
+	/* Snapshot before the handoff: the child may free skb (tbf_segment(),
+	 * cake) or evict another packet.  A netem duplicate re-enters this
+	 * qdisc on the same child and books there, so only the outermost
+	 * handoff to a child accounts.
+	 */
+	if (q->mirror_child == child)
+		return qdisc_enqueue(skb, child, to_free);
+
+	mirror_prev = q->mirror_child;
+	q->mirror_child = child;
+	backlog = READ_ONCE(child->qstats.backlog);
+	qlen = qdisc_qlen(child);
+	ret = qdisc_enqueue(skb, child, to_free);
+	taprio_mirror_child(sch, child, backlog, qlen);
+	q->mirror_child = mirror_prev;
 
-	return qdisc_enqueue(skb, child, to_free);
+	return ret;
 }
 
 static int taprio_enqueue_segmented(struct sk_buff *skb, struct Qdisc *sch,
@@ -620,10 +663,11 @@ static int taprio_enqueue_segmented(struct sk_buff *skb, struct Qdisc *sch,
 		return qdisc_drop(skb, sch, to_free);
 
 	skb_list_walk_safe(segs, segs, nskb) {
+		unsigned int seg_len = segs->len;
+
 		skb_mark_not_on_list(segs);
-		qdisc_skb_cb(segs)->pkt_len = segs->len;
+		qdisc_skb_cb(segs)->pkt_len = seg_len;
 		qdisc_skb_cb(segs)->pkt_segs = 1;
-		slen += segs->len;
 
 		/* FIXME: we should be segmenting to a smaller size
 		 * rather than dropping these
@@ -633,10 +677,12 @@ static int taprio_enqueue_segmented(struct sk_buff *skb, struct Qdisc *sch,
 		else
 			ret = taprio_enqueue_one(segs, sch, child, to_free);
 
-		if (ret != NET_XMIT_SUCCESS) {
-			if (net_xmit_drop_count(ret))
-				qdisc_qstats_drop(sch);
-		} else {
+		/* Every drop above is already counted by the site that
+		 * performs it; only keep track of the admitted segments
+		 * here.
+		 */
+		if (ret == NET_XMIT_SUCCESS) {
+			slen += seg_len;
 			numsegs++;
 		}
 	}
@@ -743,8 +789,10 @@ static struct sk_buff *taprio_dequeue_from_txq(struct Qdisc *sch, int txq,
 	struct net_device *dev = qdisc_dev(sch);
 	struct Qdisc *child = q->qdiscs[txq];
 	int num_tc = netdev_get_num_tc(dev);
-	struct sk_buff *skb;
+	struct sk_buff *skb = NULL;
 	ktime_t guard;
+	u32 backlog;
+	int qlen;
 	int prio;
 	int len;
 	u8 tc;
@@ -752,18 +800,26 @@ static struct sk_buff *taprio_dequeue_from_txq(struct Qdisc *sch, int txq,
 	if (unlikely(child == &noop_qdisc))
 		return NULL;
 
+	/* Mirror the child's net change, not just the skb handed up: it can
+	 * drop inside peek() and dequeue(), and cannot correct us itself.
+	 */
+	backlog = READ_ONCE(child->qstats.backlog);
+	qlen = qdisc_qlen(child);
+
 	if (TXTIME_ASSIST_IS_ENABLED(q->flags))
 		goto skip_peek_checks;
 
 	skb = child->ops->peek(child);
 	if (!skb)
-		return NULL;
+		goto out;
 
 	prio = skb->priority;
 	tc = netdev_get_prio_tc_map(dev, prio);
 
-	if (!(gate_mask & BIT(tc)))
-		return NULL;
+	if (!(gate_mask & BIT(tc))) {
+		skb = NULL;
+		goto out;
+	}
 
 	len = qdisc_pkt_len(skb);
 	guard = ktime_add_ns(taprio_get_time(q), length_to_duration(q, len));
@@ -772,22 +828,26 @@ static struct sk_buff *taprio_dequeue_from_txq(struct Qdisc *sch, int txq,
 	 * guard band ...
 	 */
 	if (gate_mask != TAPRIO_ALL_GATES_OPEN &&
-	    !taprio_entry_allows_tx(guard, entry, tc))
-		return NULL;
+	    !taprio_entry_allows_tx(guard, entry, tc)) {
+		skb = NULL;
+		goto out;
+	}
 
 	/* ... and no budget. */
 	if (gate_mask != TAPRIO_ALL_GATES_OPEN &&
-	    taprio_update_budgets(entry, len, tc, num_tc) < 0)
-		return NULL;
+	    taprio_update_budgets(entry, len, tc, num_tc) < 0) {
+		skb = NULL;
+		goto out;
+	}
 
 skip_peek_checks:
 	skb = qdisc_dequeue_peeked(child);
+out:
+	taprio_mirror_child(sch, child, backlog, qlen);
 	if (unlikely(!skb))
 		return NULL;
 
 	qdisc_bstats_update(sch, skb);
-	qdisc_qstats_backlog_dec(sch, skb);
-	qdisc_qlen_dec(sch);
 
 	return skb;
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

