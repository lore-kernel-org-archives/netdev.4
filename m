Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795529547;
	b=Tx44VuVyss8wAirtVqdKj2iGtxlTmrdSfi2M0wqkLxRl+DP773qokscVOU9pfs9U303m
	 pD0d+P5aQED/zGWPVt54wbfjkfPSk700cKGzoFjBTgY54npRJw9xXsovdlQIiG/xrQN2s
	 XhpL+2wF0ME71pU7tkBpxKg1hVQkbbyfVbY7CMK/1cby+NERrkbfNwGyWPEKPf0oe9PgC
	 1VpNh3Ky+uqDYWvbnBwb75I3BHULIS0f9juNVH7jhlFXizZZaarGDGPSL6VN8y0K4+9o0
	 abh+X9lhWiOcGCcknB5PJrTSz5fBQHoItng72aycrXo36fmruvXe851aBMJ/sXX9uSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=phUozZ9UmERABn/pPGUaQNiwGGv5ztLQHvi9xNV+FYI=;
	b=LywYE8rocj1UCY0J0Ly3/ypXR+22SAfZ8ljuJeL7rHXtNJKVmN/ur+sGbHJmyjkJB6Zk
	 XHmRmL7SqLr2LPtfzPi+ss+90TRpB6QgOW8lx+NGgXIEsqBGIINeKHPO2lzpiDNIHGiSs
	 46C67cybMEDHoNivHlGQALzx6ZMj/vcQNJVL8EraZHJl6YZLtFvM256TNWL3DdzHovQmv
	 4G2yuJ29N9dpURyq6A/twkokrjXiDjIE2tA2+ZDyZZjkIbCep2jfOoNY4qkbKj6ay6zjU
	 mdDRkrtDFd28XSKMirrVnrBo9U3KpB//3RN0V8dRsqiYXsO8TqXobOdeLblME9wa0/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=uis4V8ye;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2293606A339
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 14:12:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2293606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=uis4V8ye
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b88d143160so5583398a12.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 06:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795529545; x=1796134345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=phUozZ9UmERABn/pPGUaQNiwGGv5ztLQHvi9xNV+FYI=;
        b=uis4V8yeb/qTxc4bubBEs9VnJacXPlg5J02zHhTig087RA5WXyILFdTLn2SfWRbo9z
         RJwUc9CLY0tElT8DvuxOGHTJBwt/N5M+Xhu8LMPBaucPYnR5z44cSgsceeY7wI2G7ttX
         Gx/FDKOeqpKaHyS8qZ6wCzwqjG6ZJL00hXDv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795529545; x=1796134345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=phUozZ9UmERABn/pPGUaQNiwGGv5ztLQHvi9xNV+FYI=;
        b=w9NYWGP7u5wkDkTADd3utL3LvafmtYmj0QCtZguOVh3hAYYFMg0BsBYazStihSE+Ni
         7EkKSj81tYV4xF5WR3lwCGhHy2GGvvGbuA89eJaL8uWp5+IhddUYADac1fKk7BzY+jGI
         Gmx5vQeM5L18NvEhJ8rmBkbxGRgxdr92/RG3aSOPMZe6NY2BE7b3Bi6EJPZgnwqV9nVy
         yk9Y73itGVhXOJVjNyE9jcZi69a+1bZjmgsaAcNYfmiaiCd9IMDq65+E6tG9NX2PDDy4
         6wPadPOdUUWrq+WUwja82cUXnZJUg5PEwV8oAU6F1WFLZzt2EAi+hu0XvSHLsSyEAPrs
         fc0g==
X-Gm-Message-State: APuU4Z/mmDxZHs4CK+LbuKA1B1RwbA2xuJCwxvEJ5536s2gFTvPLUCUQ
	xjNOZK23NB3OuFDE+sRn0/Q0QJFX1Gr2GBpA2gAT+WYbJHXJIHTmeFeuAQ4mbAOq0nGfJgv7XK6
	2qk8=
X-Gm-Gg: AZFdTZc+pCIgmPF4SLGZcMiganDu3H0Cw1wnJBZ80lU+6+n8Kw1U6cnfzVHczZkBdCc
	w2xHg5h7GLkiJ/8vzS+rFmaog/A+qkT10xupmmAlhWepJA8cl7k8+7NlVhp0PwQ4qjtJ1jj1CIc
	7XkauGInuvnie0KghTer5r3LiwnFCyqUbiJFtE3eWBaKtMqm2pV4NHBn4kc2rZj1rCCQrWJ3DAN
	YxYS5Qu5rwMS3E1aa3b5kir2DcW+oqfSWWvQR88eU16L2KZtVfr6QLP5vf5zwwaRYq3VvETBh6A
	2c1H4LsJn/t69vdKwcu5Hcn3G9bgTRo07zAdLq6ilWoIA+/MWlffWYNx92p8AhKwMv1W7vEgHUb
	58UhlcJW6vaa0eHu9MRdsylRiHsSoV68fFr6Ha2K6B+fzHr+bVHZm7fFSTlRBC4Lu6Cx3zipqNb
	xEtkI2/ozgD4OinYG2904ErqG4sE8D6JXY+3K0Zm3k91PPUcIQYz5ba+eoeN1V51m4MtTiS7xxg
	+0yBLzv7BWrrT4dXUh1XQbLjFraJCSFFPJ24ruk8u3iSjKZFScTjmxMFT7NKCkzZXWdXf4AH+Tg
	bcBl67bHgyIrb0PH+HDYO3Ph7RNbEvueSV0ZGS4+VOsUBGfiL+RV8hJRsmIPUtJTKtUiXAgTsU9
	pPUYxcaPiwrXDe2l4UN0e
X-Received: by 2002:a05:6402:210e:b0:6b8:50e:3bb0 with SMTP id 4fb4d7f45d1cf-6ba37ec6490mr11204252a12.43.1795529544904;
        Tue, 24 Nov 2026 06:12:24 -0800 (PST)
Received: from mbili.waya ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba7b9570e9sm5032739a12.36.2026.11.24.06.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:12:24 -0800 (PST)
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
	Victor Nogueira <victor@mojatatu.com>,
	Po Liu <Po.Liu@nxp.com>,
	stable@vger.kernel.org,
	sashiko-bot@kernel.org
Subject: [PATCH net v4 2/3] net/sched: act_gate: refuse schedule entries shorter than 10 us
Date: Tue, 24 Nov 2026 09:12:09 -0500
Message-Id: <ACT-WEXM.v4.r0.20261124074514-2@mojatatu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ACT-WEXM.v4.r0.20261124074514@mojatatu.com>
References: <ACT-WEXM.v4.r0.20261124074514@mojatatu.com>
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

This is a followup of commit a51c328df310 ("net: qos: introduce a gate
control flow action") as reported by Sashiko.

The issue:
fill_gate_entry() only rejects an interval of zero, but that interval is
the period gate_timer_func() re-arms the hrtimer at, and a few
nanoseconds is below the cost of servicing one expiry: the next is due
before the current one finishes, so the action holds a CPU in the timer
softirq for as long as it exists.

On a 2-vCPU guest, entries of 1 us and below hold 86% to 90% of a core,
2 us holds 61%, and 3 us holds 22%; from 3.5 us on the cost falls to a
few percent and it reaches zero by 100 us.

The Fix:
Require at least 10 us per entry.  An act_gate schedule is not tied to a
device, so unlike taprio there is no frame time to derive a bound from;
the bound has to come from the cost of servicing one expiry, with room
for a kernel that services it slower.

On a 2-vCPU guest one expiry costs a few hundred nanoseconds, so 10 us
sits 25 to 50 times above it, and that margin is also what holds on a
debug or PREEMPT_RT kernel where the cost is a few microseconds and a
floor at the 3.5 us knee would slip back in.

That is what the withdrawn 100 us taprio floor got wrong.  It refused
schedules that cost a fraction of their own interval, a 250 us cycle
split into four windows among them, on a margin over the measured cost it
never explained.  This floor admits those windows and states its margin.

The interval == 0 test is subsumed.  A change cannot bypass the floor: a
change carrying a list re-validates every entry, and one without a list
copies entries the running kernel has already accepted.

Some context:
The request that reproduces the cycle-time stall also carries a 1 ns
entry interval.  With the cycle time derived from the entries, that alone
sets a 1 ns timer period: the report covers both defects.

Conditions to recreate the bug:
CONFIG_NET_ACT_GATE=y, and CAP_NET_ADMIN in the initial user namespace
(netlink_capable() checks init_user_ns, so a user namespace of its own
does not help), in a new network namespace:

  tc actions add action gate index 1 sched-entry close 1

The action is accepted and the CPU running the timer softirq stays busy
for as long as the action exists.  An entry of 10 us or more still
installs.

Fixes: a51c328df310 ("net: qos: introduce a gate control flow action")
Reported-by: Sashiko (gemini) <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/tencent_4ED9536B0375C96183B2244CF7709768C605@qq.com
Cc: stable@vger.kernel.org
Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>
---
 net/sched/act_gate.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/net/sched/act_gate.c b/net/sched/act_gate.c
index 4835f6543901..797562dbde69 100644
--- a/net/sched/act_gate.c
+++ b/net/sched/act_gate.c
@@ -25,6 +25,11 @@ static struct tc_action_ops act_gate_ops;
  */
 #define GATE_ENTRIES_MAX	1024U
 
+/* An entry shorter than this lets the next expiry land before the softirq
+ * servicing the current one can finish, so the timer stays permanently behind.
+ */
+#define GATE_MIN_INTERVAL_NSEC	10000U
+
 static ktime_t gate_get_time(struct tcf_gate *gact)
 {
 	ktime_t mono = ktime_get();
@@ -199,8 +204,10 @@ static int fill_gate_entry(struct nlattr **tb, struct tcfg_gate_entry *entry,
 	if (tb[TCA_GATE_ENTRY_INTERVAL])
 		interval = nla_get_u32(tb[TCA_GATE_ENTRY_INTERVAL]);
 
-	if (interval == 0) {
-		NL_SET_ERR_MSG(extack, "Invalid interval for schedule entry");
+	if (interval < GATE_MIN_INTERVAL_NSEC) {
+		NL_SET_ERR_MSG_FMT(extack,
+				   "Entry interval must be at least %u ns",
+				   GATE_MIN_INTERVAL_NSEC);
 		return -EINVAL;
 	}
 
-- 
2.43.0

