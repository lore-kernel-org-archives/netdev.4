Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795862029;
	b=agQwzdlBuqasy7vKmWu+EbfVeQqcOFwz+/xZr+A9vF4FYfnQy4+QpJlmHYJLvyougVVT
	 edn8Lzs4DK3I4uJkIb98RIrHzCpUzVE/A95ALgpHzBy8+AGTYTlj7sepi24QDpfIij6Hc
	 JGJrKpDRzhqY38Q+b/OxjeVrVjfvJ5rUHKRyOQwTPz6ZWUDmFfhw54NcOdhDl36k64xKN
	 mmMdKHvFlX5ZPRfOipIVL3N8hi5sV9POF0IReXa0o5xkI6w9T8Nk4tRz3NhGmhTeF1F7T
	 H2/5FiKnXM4xuzzfvTdR4UIb3S4m4G/ZBLaQBC7kY/9GWc9ggiPt9D8h+9XQYPHEd8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795862029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=AHvYKHq95D+qAXx/ZpNwF1YDR0GRXaHoHUy1ieoCmCI=;
	b=UcJCia1VbK5ZzfVIVpFnXqDni19MSyrWI60R6KfoH2zJC7/+KM3RJI42LpNmAzW3ibMU
	 3UoAWY1mtQ180RwPKqcl190YrY1o4M80dZggFxRCd2spRX/U/40U82uwCF/vJMBa5GY+c
	 XMrW1AZgXMSmXmMVyee5Bvxc60NfSZz6BFO5+wQ0T0bMjTpe4Mz6uPWbjsh5fd/dlwIcw
	 GqH5HdUCZS0k+JXufBBJY0VupiHEklygbafQnsyTTJzxZhPKY0ERDOcpMJVqqz0OTPF35
	 FlKd35JBIrn4NDqbnvlVDAsS/liCwQ+/1X3iXncHu+QpwRd8/1Lb4Xnaev45R71w6iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=e2W4lw6v;
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9782606A321
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 10:33:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9782606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=e2W4lw6v
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-949b0d32315so721781685a.1
        for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 02:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795862028; x=1796466828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AHvYKHq95D+qAXx/ZpNwF1YDR0GRXaHoHUy1ieoCmCI=;
        b=e2W4lw6v95tCcg1Vkwlnk4Dv0h1zAJzs9oyxGnURqDy9ElwtavGEaG15l9vEoVGek9
         tAPPm4H2aoSmu4h5EJFayN9mWiWQUaSY5S7tosTA/OX68C9Kyh5CU0EtRjYuEZ15LBA+
         xjBVnY7O1oHIedrv93liO87v6oBKPrLe7iGRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795862028; x=1796466828;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AHvYKHq95D+qAXx/ZpNwF1YDR0GRXaHoHUy1ieoCmCI=;
        b=E4lilcqDZNiiYYiEkok9p+jn/DCyF4CPjI7LzLLnhiotjppS8JExK9u61hp1U0p4qo
         ENWRk1pSZXKNRCx1OhO6dWfOPzEP5qK3cysQFcpFIRTlyCgFAYh7Wst4e1GX+dEPa8aY
         fW7s1zvFEqv3QcF3C45I+gLTH8R3vGO/s01lTjfJUQwwtWdWQDV+OmBVREIg6kXMLN2n
         1C2TLtE8LzF/IQbq+xyhqiqjhPGCBXy+N3jHOqxYYm4NXIMXGBYLR1GTXix/u2mezF0k
         soUv0a5UHfA5cDzi3cZ1vBDdmjqDfWUTADpCtlItEWSPYSx1kjehn5kwK63Glw6TNdMj
         X6zg==
X-Gm-Message-State: APuU4Z9RFFsMwuGUy8G3NbYNVS3Z5W4uQhDZN+Fp5zG+aMszPDF79kFx
	7RDxCxaPVOgqa6BgAmRH4BGGMyxViErfps9yw3ffJ8W4v/72RgEk5URSS8D+wBsbUZekLJ9ZeLd
	KX3c=
X-Gm-Gg: AZFdTZdBmCDAETTWLe7vyfkEatFRVJFgbFyjDg3U7S8xQoeNGH1RJ9/225/bjGYkk89
	ejdHZcmZZHy7O9Zr40TgnKaB+P5HbeQPDOwBSdJ0XcoEaYjot/EWgcB0jLjxR75i/4hROtiq82m
	M7KmK0W0SKNhm7srUTNwlfN/8nWulxUSWVcMtW+ZtjAufzYE61a7P1V1kcimeqeoRoGSZoHwGb2
	FFV69kXqlX8yZ58GwAtDMV8h+HEyCWK4rv0UPRJGNhCm97eUABF/4wJM1CwGKFXesv6bneMWGEs
	SdNdZrSZ3zu7SnSCBIm2feNCOUsPlCn/CSBY0MyPB2p03yDQI8wgcxWiX0jn6rRlnZrUcuAmDf5
	/yA4VJSXmVB8eHszd9jbjVwj9mD0dI6E9Ji6WicmOBbp+4lYAf+obRDvxqfr0suvJPQH5yIOdA4
	6l4SoLoM78rw2mFX2jdq1VEWlEK/EbfKJB9t37p0dZ4zT6J14McyCuWeTSddYK4LYINMCDYaqIO
	HnFFR5uZWTwP9x2ylZjPaRxQVJr5xzUXW/ruK9df8O3FgpbQPyMlMXaCIaZWxb2qPciulL6mpFC
	RSWh+RHo3DhWi9dvX+E2G4gehrocA0JGp6jlnG8kWa9thp4aX7WaXXoJrqDqRwPwsJxLwJEX1mu
	rw4EH
X-Received: by 2002:a05:620a:3722:b0:949:472f:226e with SMTP id af79cd13be357-949bab15455mr5419372385a.71.1795862027745;
        Sat, 28 Nov 2026 02:33:47 -0800 (PST)
Received: from majuu.waya ([184.147.180.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3f5c31sm2053970085a.30.2026.11.28.02.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 02:33:47 -0800 (PST)
From: Jamal Hadi Salim <jhs@mojatatu.com>
To: netdev@vger.kernel.org
Cc: Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-rt-devel@lists.linux.dev,
	wenxu <wenxu@ucloud.cn>,
	stable@vger.kernel.org,
	Victor Nogueira <victor@mojatatu.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH net] net/sched: sch_frag: guard against same-CPU re-entrancy
Date: Sat, 28 Nov 2026 05:33:33 -0500
Message-Id: <QDISC-R0QC.v1.r0.20261125082538-1@mojatatu.com>
X-Mailer: git-send-email 2.34.1
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

This is a followup of commit 975b5b067f52 ("ipv6: sr: restore network
header before routing and forwarding") as reported by Sashiko. That change
fixed the negative L2 length that could reach sch_fragment(); this patch
addresses a separate pre-existing bug in the same fragment path.

The issue:
sch_fragment() holds the per-CPU local_lock_nested_bh across
ip_do_fragment()/ip6_fragment(). Their sch_frag_xmit() callback calls
data->xmit(skb), which may re-enter TC egress (cascaded act_mirred
redirect to a qdisc that calls sch_frag_xmit_hook() again on the same
CPU). Re-entering re-acquires the per-CPU bh_lock:

- on PREEMPT_RT this is a real spin_lock, so the same-CPU recursion
  self-deadlocks;
- on non-RT the inner call overwrites the shared per-CPU sch_frag_data
  (dst, cb, xmit, l2_data), so when the outer fragment loop resumes it
  uses the inner call's stale state.

With the lockdep detector built in, the recursion reports itself as:

 ============================================
 WARNING: possible recursive locking detected
 7.3.0-rc7+ #44 Not tainted
 --------------------------------------------
 python3/20084 is trying to acquire lock:
 ffff8e80bd7b44d0 (bh_lock#2){+.-.}-{3:3}, at: sch_fragment+0x288/0x560

                but task is already holding lock:
 ffff8e80bd7b44d0 (bh_lock#2){+.-.}-{3:3}, at: sch_fragment+0x288/0x560

  Possible unsafe locking scenario:

        CPU0
        ----
   lock(bh_lock#2);
   lock(bh_lock#2);

                 *** DEADLOCK ***

 Call Trace:
  <IRQ>
  sch_fragment+0x291/0x560
  sch_frag_xmit_hook+0x74/0x90
  tcf_dev_queue_xmit+0x1f/0x30
  tcf_mirred_to_dev+0x2da/0x560
  ...
  sch_frag_xmit+0x169/0x260
  ip6_fragment+0x8dc/0xa70
  sch_fragment+0x33f/0x560
  sch_frag_xmit_hook+0x74/0x90

The Fix:
Prevent same-CPU re-entrancy by recording which task owns the per-CPU
fragment state. A deeper call must not re-use the outer call's per-CPU
state, and it must not transmit the skb: sch_frag_xmit_hook() has
already determined that the skb exceeds its recorded fragment MRU. Drop
it and return an error instead.

Owner identity, not nesting depth: on PREEMPT_RT a second task that
reaches sch_fragment() on the same CPU waits for the real spin_lock and
then works on its own state, so only the task that already owns the
state is the recursive one. A depth counter would refuse that contender
too, and reporting -ELOOP for it would be wrong.

Conditions to recreate the bug:
  # Minimum privilege: CAP_NET_ADMIN in a user-owned network namespace,
  #   e.g. via `unshare -Urn`; nothing outside that namespace is required.
  # Build with CONFIG_DEBUG_LOCK_ALLOC=y for the recursive-lock splat;
  # on PREEMPT_RT the same recursion is a hard self-deadlock instead.
  ip link add vetha type veth peer name vethb
  ip link add vethc type veth peer name vethd
  ip link add vethe type veth peer name vethf
  for i in a b c d e f; do ip link set veth$i up; done

  # outer: reassemble the fragments on ingress, then redirect to vethc
  tc qdisc add dev vetha clsact
  tc filter add dev vetha ingress matchall action ct zone 1 \
      action mirred egress redirect dev vethc

  # inner: the refragmented egress re-enters sch_fragment() on the same
  # CPU while the outer call still holds the per-CPU lock
  tc qdisc add dev vethc clsact
  tc filter add dev vethc egress matchall action ct zone 2 \
      action mirred egress redirect dev vethe

  # then send a multi-fragment IPv6/UDP datagram out vethb (the zone-1
  #   ct reassembly sets cb.mru so the redirect enters sch_fragment()).

Fixes: 20d677d389e7 ("net/sched: Use nested-BH locking for sch_frag_data_storage")
Reported-by: Sashiko (gemini) <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260827092345.2301937-1-fouriezhang@tencent.com
Link: https://lore.kernel.org/netdev/20260827092345.2301937-1-fouriezhang@tencent.com/
Cc: stable@vger.kernel.org
Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>
---
 net/sched/sch_frag.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/net/sched/sch_frag.c b/net/sched/sch_frag.c
index 75ee52750919..980f1490b027 100644
--- a/net/sched/sch_frag.c
+++ b/net/sched/sch_frag.c
@@ -17,6 +17,7 @@ struct sch_frag_data {
 	unsigned int l2_len;
 	u8 l2_data[VLAN_ETH_HLEN];
 	int (*xmit)(struct sk_buff *skb);
+	struct task_struct *owner;
 	local_lock_t bh_lock;
 };
 
@@ -98,10 +99,19 @@ static int sch_fragment(struct net *net, struct sk_buff *skb,
 
 	if (skb_protocol(skb, true) == htons(ETH_P_IP)) {
 		struct rtable sch_frag_rt = { 0 };
+		struct sch_frag_data *data;
 		unsigned long orig_dst;
 
+		data = this_cpu_ptr(&sch_frag_data_storage);
+		if (READ_ONCE(data->owner) == current) {
+			kfree_skb(skb);
+			return -ELOOP;
+		}
+
 		local_lock_nested_bh(&sch_frag_data_storage.bh_lock);
+		data = this_cpu_ptr(&sch_frag_data_storage);
 		sch_frag_prepare_frag(skb, xmit);
+		WRITE_ONCE(data->owner, current);
 		dst_init(&sch_frag_rt.dst, &sch_frag_dst_ops, NULL,
 			 DST_OBSOLETE_NONE, DST_NOCOUNT);
 		sch_frag_rt.dst.dev = skb->dev;
@@ -111,14 +121,24 @@ static int sch_fragment(struct net *net, struct sk_buff *skb,
 		IPCB(skb)->frag_max_size = mru;
 
 		ret = ip_do_fragment(net, skb->sk, skb, sch_frag_xmit);
+		WRITE_ONCE(data->owner, NULL);
 		local_unlock_nested_bh(&sch_frag_data_storage.bh_lock);
 		refdst_drop(orig_dst);
 	} else if (skb_protocol(skb, true) == htons(ETH_P_IPV6)) {
-		unsigned long orig_dst;
 		struct rt6_info sch_frag_rt;
+		struct sch_frag_data *data;
+		unsigned long orig_dst;
+
+		data = this_cpu_ptr(&sch_frag_data_storage);
+		if (READ_ONCE(data->owner) == current) {
+			kfree_skb(skb);
+			return -ELOOP;
+		}
 
 		local_lock_nested_bh(&sch_frag_data_storage.bh_lock);
+		data = this_cpu_ptr(&sch_frag_data_storage);
 		sch_frag_prepare_frag(skb, xmit);
+		WRITE_ONCE(data->owner, current);
 		memset(&sch_frag_rt, 0, sizeof(sch_frag_rt));
 		dst_init(&sch_frag_rt.dst, &sch_frag_dst_ops, NULL,
 			 DST_OBSOLETE_NONE, DST_NOCOUNT);
@@ -129,6 +149,7 @@ static int sch_fragment(struct net *net, struct sk_buff *skb,
 		IP6CB(skb)->frag_max_size = mru;
 
 		ret = ip6_fragment(net, skb->sk, skb, sch_frag_xmit);
+		WRITE_ONCE(data->owner, NULL);
 		local_unlock_nested_bh(&sch_frag_data_storage.bh_lock);
 		refdst_drop(orig_dst);
 	} else {
-- 
2.43.0

