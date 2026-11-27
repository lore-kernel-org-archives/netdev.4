Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779824;
	b=Yxt41OvAR4fF8arV269/A5nuRbxkhW4N0bvaAYaF0FG/HNGOuTG8Pq/hTSM+oAan11Qs
	 HghPMrqolE+Lb0PEuKwkbmH3AzeQZdHYqyP5Bp5Le4Jgz7ea6vgKOISKTwm70juXUxMS5
	 LZhwYirYAIgxxrycUqah671DUQ98my3vt7nuHUWJTMtMot0V14ehno7XufpRrtoPfPNvz
	 wNUE2gwNnDxLvyvDYwTeVhLpmYDDQRjqQ+wGZwaNJTrEKBuGh7YVmwokDAmS8fuHBhuQB
	 lx5pgEQbQarRq9Q9D2n/fuL5783Esn0uzd/NWSkCy+Sync+jXWRyRzujvnzNp08wjig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779824;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JfxRl6ryEk0iwVbD04Ub39VkD0Z3xzoRKlXr5gXHJv0=;
	b=HI+2u+tOR1FPNwaIrDnC1QKXLlxQrNmQB9/0iJa6b7JNLtqfvWDtOM7C8Ch+0YvuGjEN
	 LdfEuTmRiAMXF4LCDIhCQdWU3MOADc48MIUhWJ89JdCakFGlAUgYbF1BP0AMG/aDIFazp
	 XSqEsJ6dobQO8j+ErHpTuE2ltzQE/WG16VHMWLCLfqQFXEJ5KMrKZ9djIgRpR3no4Kvym
	 g7UEYF0ETgWTwbaxBRihvR4RVWox4oORnxEkXXb1DqhagXUWg/9tzwLuVSANxQyiFkYEo
	 O60thIB0aRY+d1/ISGTLRpm0OYtXnOtMNfihbhBMJkVMAGnJn7UxXd+ZHw1/i5EaKRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=jCR84be7;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB21606A324
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 11:43:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FB21606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=jCR84be7
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-55d6deecef6so79916271cf.2
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 03:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795779822; x=1796384622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JfxRl6ryEk0iwVbD04Ub39VkD0Z3xzoRKlXr5gXHJv0=;
        b=jCR84be7XA8oSEuPkLrJ+XhPbVZu3iN0q0fVhNVcpnJU9K4EwSBv+f9660N+nsGW0s
         lWriJt8LrZ9Q2yCi3lOftj9TIcDZ6lQo73wYpRhmVzJu4szkB/qOStvd/kQ+F//YLZws
         UCo+z7V/AnfLLtTfj0bAABKZ52lgqS0GNPxwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779822; x=1796384622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JfxRl6ryEk0iwVbD04Ub39VkD0Z3xzoRKlXr5gXHJv0=;
        b=jNzyMfn+UsYmEXKubDzgbsKAAJDywgQ05+pJPjsAbq28pQMG9K3p6d3YrsyNi2/bPl
         oGCRx5qeXtHiSSzi1HiUFq8jKqk3I5RK+GXJHCoF0RLJxP+BQXtfUl0hfJZBZBQ9xyRo
         cRLM7yZ9FeAFQVaO72XkhLhmUsqHskBkfQYMcYdRaHkHSFzLMsyyW/vD0G2fUjSgT+ub
         scapa7II8/dY2JBI5Bm2rdcpBEM0xqobZIXOjbfIw1VYveUJ2aMa2rYh6wUKHXUYuBHB
         ew4mUi6t91rt7Q64WrcVtimZulAlIjFN7t+5UK/j1OwfZTBgzBhT0xO+rZdIwdp3Go8t
         wFGg==
X-Gm-Message-State: APuU4Z89Hc+hBvHCI1nwGI/zDxpp+Isdg/AjVQjqJTYItrG9bJut1r9w
	sKqGg2onMJ9vmmKrqKpJUn5V4ddsE9Qeu+In2KZnl+TghKw2jZaOKIejiSQDu4p8rX782VluYUI
	xnQg=
X-Gm-Gg: AZFdTZc/dML1cxYwtZiaqbZOGDvC62gx/0kHrVRxgQhjuMToUsySA/zE1jfIGgBkxUd
	BQ+fT9w0FYpDgLIFWgju+/oMBA9rWlksCVG/Drj4L0V4s0eAVwTiMxyTHVb54ueaP7X8Mjxf8Co
	lNGfPtXfiag95iIRjC+IuXMi/2akrWDeLkLD30wgsNEnHLCtZvL4U5e4quAOzalOrr9qWNpoxu4
	biSGucEAeu1/mBAg9bpasWErvtXf7WMlk5w+GcjK8bz+wrgkxhZxevLtT8D6OlCPd8oR2mruLyt
	qgIc4HP+e1EuS1kSmfy7ufuduSBMYOd/F2mPfw6X+uL2FpwEhDeGTdpp9tgR94S94eM2wOG1QzC
	jQRPhycZL7oAb+Andbjew9Y6tzEbg3H9TZFmS0705CObVxp0d3PFtOMSRSjX/Z7aQozqTbk2wnG
	VhURAFf6i8JpueKEExT7IgyEDWRnuuolb5gdEcrPJTsE45G7zaQC23Pvl1WeqmB7Gvm9nBWLYNR
	+7j9EM9/R0hi04NEgL/7pOv/cV4TwHyxss3C2UOOcbzqCUlKjph8QGJkqpXm+UWWrKA/JhW6tL+
	0DPRYhCvZT0kUTltEiF6uUL7ODL/1Sssfe+Y1ZqSCvD3YiqYV7x1B37piA1KZaytPnFgsWV5CV5
	Uvm2jJhar4KGVEEA=
X-Received: by 2002:a05:622a:413:b0:55d:3347:8138 with SMTP id d75a77b69052e-55d76a5c564mr448911711cf.44.1795779822454;
        Fri, 27 Nov 2026 03:43:42 -0800 (PST)
Received: from localhost.localdomain ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55dcdd1a2c6sm16652551cf.20.2026.11.27.03.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:43:41 -0800 (PST)
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
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Victor Nogueira <victor@mojatatu.com>,
	stable@vger.kernel.org,
	syzbot+0054fed3dc9085390f51@syzkaller.appspotmail.com,
	shaos <shawnq1@163.com>
Subject: [PATCH net v5 1/2] net/sched: act_gate: bound the cycle time and start time arithmetic
Date: Fri, 27 Nov 2026 06:43:34 -0500
Message-Id: <ACT-WEXM.v5.r0.20261127063407-1@mojatatu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ACT-WEXM.v5.r0.20261127063407@mojatatu.com>
References: <ACT-WEXM.v5.r0.20261127063407@mojatatu.com>
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

The issue:
TCA_GATE_BASE_TIME and TCA_GATE_CYCLE_TIME are u64 attributes read into a
signed ktime_t; a value above S64_MAX turns negative and the cycle
arithmetic wraps instead of saturating.

With base_time = 1 and cycle_time = 0xffffffffffffffff the start time
comes out as 0: the timer is armed in the past and every expiry recomputes
it, so the softirq never finishes.  Neither attribute has ever been
bounded, so one request stalls a CPU on any kernel that has the action.

Reported by syzbot and independently by shaos; the request below
reproduces the stall.

The Fix:
Cap base_time and cycle_time at KTIME_MAX in the policy.  Both keep NLA_U64
and 0 stays accepted (a 0 cycle time derives from the entries); the _EXT
attribute does not drive the timer and stays unbounded.

Work out the part of the cycle still ahead of now and add it with
ktime_add_safe(), so an unrepresentable expiry saturates instead of
wrapping into the past.  gate_timer_func() reuses that helper, stores the
boundary it computes, and restarts the walk at the first entry.

Conditions to recreate the bug:
CONFIG_NET_ACT_GATE=y.  The action can also be created from a filter,
where the only capability check is netns-scoped, so a user namespace of
its own is enough:

  unshare -Urn
  ip link set lo up
  tc qdisc add dev lo clsact
  tc filter add dev lo ingress matchall action gate base-time 1 \
      cycle-time -1 sched-entry close 1000000

iproute2 parses the attribute as a signed 64-bit value, so -1 reaches the
kernel as 0xffffffffffffffff.  The raw RTM_NEWACTION path also tests
netlink_capable() against the init ns; the reproducer writes those values.

The send never returns and the CPU stays in the timer softirq.  With
softlockup_panic=1 and watchdog_thresh=5 the kernel reports

  watchdog: BUG: soft lockup - CPU#0 stuck for 13s! [poc:832]

with tcf_gate_init() on the stack; on the fixed kernel both requests are
refused.

Fixes: a51c328df310 ("net: qos: introduce a gate control flow action")
Reported-by: syzbot+0054fed3dc9085390f51@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=0054fed3dc9085390f51
Reported-by: shaos <shawnq1@163.com>
Link: https://lore.kernel.org/netdev/20261022144732.61188-1-shawnq1@163.com/
Link: https://lore.kernel.org/netdev/20260827191547.4004973-2-kuba@kernel.org/
Link: https://lore.kernel.org/netdev/20260827121751.33dac8aa@kernel.org/
Link: https://lore.kernel.org/netdev/DN37NBGPJJG9.2DSVDCKS3UYTV@gmail.com/
Suggested-by: Alexei Starovoitov <ast@kernel.org>
Cc: stable@vger.kernel.org
Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>
---
v4 -> v5:
- Split: this posting carries the regression fix and its tests; the 10 us
  entry-interval floor and its cases moved to net-next.
- Conditions: a filter reaches the same code with CAP_NET_ADMIN in a user
  namespace of its own; the earlier text claimed the initial user namespace
  was required (reported on the list).
- Changelog: KTIME_MAX equals S64_MAX, so the bound is the same value the
  earlier policy carried; name what removed the wrapped start time, the
  base_time bound and ktime_add_safe() (reported by Sashiko).
---
 net/sched/act_gate.c | 34 +++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/net/sched/act_gate.c b/net/sched/act_gate.c
index 711cf2443540..4835f6543901 100644
--- a/net/sched/act_gate.c
+++ b/net/sched/act_gate.c
@@ -45,8 +45,8 @@ static void gate_get_start_time(struct tcf_gate *gact,
 				const struct tcf_gate_params *param,
 				ktime_t *start)
 {
-	ktime_t now, base, cycle;
-	u64 n;
+	ktime_t now, base;
+	u64 cycle, rem;
 
 	base = ns_to_ktime(param->tcfg_basetime);
 	now = gate_get_time(gact);
@@ -58,8 +58,8 @@ static void gate_get_start_time(struct tcf_gate *gact,
 
 	cycle = param->tcfg_cycletime;
 
-	n = div64_u64(ktime_sub_ns(now, base), cycle);
-	*start = ktime_add_ns(base, (n + 1) * cycle);
+	div64_u64_rem(ktime_sub_ns(now, base), cycle, &rem);
+	*start = ktime_add_safe(now, ns_to_ktime(cycle - rem));
 }
 
 static void gate_start_timer(struct tcf_gate *gact, ktime_t start)
@@ -94,8 +94,8 @@ static enum hrtimer_restart gate_timer_func(struct hrtimer *timer)
 	gact->current_entry_octets = 0;
 	gact->current_max_octets = next->maxoctets;
 
-	gact->current_close_time = ktime_add_ns(gact->current_close_time,
-						next->interval);
+	gact->current_close_time = ktime_add_safe(gact->current_close_time,
+						  next->interval);
 
 	close_time = gact->current_close_time;
 
@@ -108,13 +108,10 @@ static enum hrtimer_restart gate_timer_func(struct hrtimer *timer)
 	now = gate_get_time(gact);
 
 	if (ktime_after(now, close_time)) {
-		ktime_t cycle, base;
-		u64 n;
-
-		cycle = p->tcfg_cycletime;
-		base = ns_to_ktime(p->tcfg_basetime);
-		n = div64_u64(ktime_sub_ns(now, base), cycle);
-		close_time = ktime_add_ns(base, (n + 1) * cycle);
+		gate_get_start_time(gact, p, &close_time);
+		gact->current_close_time = close_time;
+		next = list_first_entry(&p->entries,
+					struct tcfg_gate_entry, list);
 	}
 
 	gact->next_entry = next;
@@ -173,13 +170,20 @@ static const struct nla_policy entry_policy[TCA_GATE_ENTRY_MAX + 1] = {
 	[TCA_GATE_ENTRY_MAX_OCTETS]	= { .type = NLA_S32 },
 };
 
+static const struct netlink_range_validation gate_time_range = {
+	.min = 0,
+	.max = KTIME_MAX,
+};
+
 static const struct nla_policy gate_policy[TCA_GATE_MAX + 1] = {
 	[TCA_GATE_PARMS]		=
 		NLA_POLICY_EXACT_LEN(sizeof(struct tc_gate)),
 	[TCA_GATE_PRIORITY]		= { .type = NLA_S32 },
 	[TCA_GATE_ENTRY_LIST]		= { .type = NLA_NESTED },
-	[TCA_GATE_BASE_TIME]		= { .type = NLA_U64 },
-	[TCA_GATE_CYCLE_TIME]		= { .type = NLA_U64 },
+	[TCA_GATE_BASE_TIME]		=
+		NLA_POLICY_FULL_RANGE(NLA_U64, &gate_time_range),
+	[TCA_GATE_CYCLE_TIME]		=
+		NLA_POLICY_FULL_RANGE(NLA_U64, &gate_time_range),
 	[TCA_GATE_CYCLE_TIME_EXT]	= { .type = NLA_U64 },
 	[TCA_GATE_FLAGS]		= { .type = NLA_U32 },
 	[TCA_GATE_CLOCKID]		= { .type = NLA_S32 },
-- 
2.34.1

