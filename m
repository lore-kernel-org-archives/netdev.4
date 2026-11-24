Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795529540;
	b=fQEVmfpLbA16CFOfGKW/rjkzglgW6uo3upGWOJ5eEXTH5AoKi1ex8BA8VDmV+Bx8vGkf
	 Nny6GaEExeBPXLvhktwNUuzehHp3SjrZ5UpXmAWuAfb0MOKjuWXL/mHgVrgZcfoFvVjoK
	 RvhdnLbQwScuxduVrnyP92sE6z2bIwKk38/Wotaaa0mM8Vgiy/YWKOoKGP8LOhiYnveV5
	 hFNdzpuGSurVahSQWxGt1T20IV5gqj6Z29Y6EaJPfyXO06u0Ke02p1VSd/qdCBtmMq4M0
	 uoAxD3YCksUqBdJX/FDuinsgTKpS6kIG9VcbGUs6B3yNOzoaB+dTIWWIJwgoIDSRhMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529540;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=1xGMs6jT7TfzD1rWb/wp0MZUHeeMb6G/nblIX2zqKoc=;
	b=WOGpr3uvgDHMaJ2uT6SOtsCTgTDxoJIO6L+14fBOI1zyUMu0L0qin3I1Jgg76A5WI3d9
	 L0oirC6no2oYVUbuoTekmW0APUM10J5F6UmXAwh23uf7pfeZtdCiNDPYlspZNxiKgxutB
	 qQKrAwlHfXnA98FKM51an64IRQc/aqpeEeAFMKUA/1DwDhl3wOrgXhRw0g2yTQPFgONNo
	 BHFPjBc57/pcTZIpB0d69V++TSx1PZj7Dax+9hI/6z+k99JVhsQ8MN4cv/eKcN8LYo2P0
	 UtZsI3YaogTiuXjbMw4EL2EDGJVDR/30gkSQdj59QKxfvcE47iVIJibdPm+R0GyfHng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=c+5KiT+9;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0291606A336
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 14:12:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0291606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=c+5KiT+9
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b596afb4c5so5224439a12.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 06:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795529538; x=1796134338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1xGMs6jT7TfzD1rWb/wp0MZUHeeMb6G/nblIX2zqKoc=;
        b=c+5KiT+93GkBxGQDnZLhMfbzB4uOpSJpkhB557s6VSmMDjh/WdWRmKGYd9rfHEpK83
         LLjyPPVRzMGVtn/owlTnBaSun1o3TfKtlYqcIUt88P9eCh4VtBNAbSTMfk1DKYHPfoGJ
         8/U/ct1dPt4Z+AdpQeggupLl8qwi8szv+PsUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795529538; x=1796134338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1xGMs6jT7TfzD1rWb/wp0MZUHeeMb6G/nblIX2zqKoc=;
        b=GVAAjcZAXntVPmoA3yRC++DBfNuO9AnCR8p04Kl7vm8yJEm0gmY5jHdB6624CGTPtg
         LKLoZcvX1qdnFms02WPPevFpGFAxDYeQ/737OqHi28JSevGPbPu3CqXMl83VKaE/mNp6
         lYe9lIecIuTJ4cO/EjW73oCbzMmth2ZDmzqfqGytgPPW6k56qJQujJANzjocPhyYdoaX
         Q9CqxqiCES4Nc1/a2zguDuxXcYiPbFj9NmgbypVmUsVBzNPU/8bP0ST2wRnVZgcpnmhV
         R3brezj0WCBY5nWkSQuTAsCIxczDvhM3r4TU5BSFf+WljesT8/TS8loxe+wz5imTo4T/
         hRpg==
X-Gm-Message-State: APuU4Z9/QjPlDyIkeM7sjIEFMRYM+T12a2Dkq1QyBM5YOfYAulukYIf3
	lV4sIdlnZwT1t5nTds+Bv9XlGLJAVMHv9YMY/Z0tSfSxALR/C/JFV7dGhwwEvqa5cGFGaflpRJg
	wre4=
X-Gm-Gg: AZFdTZeqx0bl0UPpbdsjsQpaekFRz/MJzdY7WZ1hSUl117G9HH6K/8ZpbomG6W5gg7B
	nKUmEgjiO4dTDGtIwHXk5g1q5v58Q8OiScmDvZlgvmC57PXfzd3a7+rJ1WQp9TXbpbG8f8N2WAU
	rtKUri9KaYjx8qhFj+m3O60sNLgVYBPMe6TzMFXaz0H4YP79vuyv6FV0qaZKu+QYcnhfoYX2t4Y
	7ZfsIHTtCTJkCy3NW6dhaq+n7SIkreCqHZqU4HCFh26tRoHfLsmX5CVrlfhp+VO4SofGh5A0PhQ
	2LG+K05PKgFO4all3OwuUrpJNYHFkY13HW3S8mjywbHtYo6Bu4PUu8JZC2lnUuKdXx8vAtW1azI
	BErrNPHC3Obq4HpKNysATJA8L+s7SfnO3tpM6ybEX0RauFdbC0BpFmSYf6DqFUf/P0Mr+vaov3h
	DWbBglqQIFdwlFSpAHALsTv3zywmDdUO00iK7gaxoRg59QFQiLU7PgciAgLCFpI4uQauAm4S3Ol
	ldvxwdgiBsw4olTZJKoH7pUhdndvb/v4LDaY2xwdXAn6E0A5ky4qCo0vItph15qHO3GC4o3wulV
	AV1HU9Ccf/y9UFzc11TLuzXAtucIRWHBSsn9cUFGtSa/rIsgswwUAsD+sS19m7gpG0BoX9tNa4O
	eB8E9jdqlBxNS96zlJDB2
X-Received: by 2002:a05:6402:1596:b0:6bb:6c8:c4d2 with SMTP id 4fb4d7f45d1cf-6bb06c8ce30mr1085338a12.31.1795529537654;
        Tue, 24 Nov 2026 06:12:17 -0800 (PST)
Received: from mbili.waya ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba7b9570e9sm5032739a12.36.2026.11.24.06.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:12:17 -0800 (PST)
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
	Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	linux-rt-devel@lists.linux.dev,
	Victor Nogueira <victor@mojatatu.com>,
	Edward Adam Davis <eadavis@qq.com>,
	Po Liu <Po.Liu@nxp.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+0054fed3dc9085390f51@syzkaller.appspotmail.com,
	shaos <shawnq1@163.com>,
	sashiko-bot@kernel.org
Subject: [PATCH net v4 0/3] net/sched: act_gate: bound the cycle time and refuse schedule entries shorter than 10 us
Date: Tue, 24 Nov 2026 09:12:07 -0500
Message-Id: <ACT-WEXM.v4.r0.20261124074514@mojatatu.com>
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

An act_gate schedule is armed from TCA_GATE_BASE_TIME and
TCA_GATE_CYCLE_TIME, both unchecked u64 attributes that are read into a
signed ktime_t.  A cycle time above S64_MAX turns negative on that read
and the cycle arithmetic that follows wraps.

That arms the timer in the past.  Every expiry then recomputes the same
past time, so the timer softirq never finishes and the task that
installed the action spins until the watchdog reports a soft lockup.

A schedule entry of a few nanoseconds reaches the same state from the
other direction: the entry interval is the period the hrtimer runs at, so
the handler is always behind its own next expiry and the action holds a
core for as long as it exists.

  1/3  cap base_time and cycle_time at KTIME_MAX, and make every
       start-time computation saturate instead of wrapping.
  2/3  require at least 10 us per schedule entry.
  3/3  cover the refusals, the largest accepted base time and cycle time,
       and both sides of the interval boundary in the tdc action tests.

Edward Adam Davis posted a v3 that capped cycle_time at S64_MAX and moved
the attribute to NLA_S64.  That refuses the reported value but leaves the
invariant to the wrap: base_time is read the same way into the same
arithmetic and stays unbounded, so an accepted pair can still compute a
start the timer was never meant to take.  The type change is also
unnecessary; S64_MAX is a fine range for NLA_U64.

Alexei Starovoitov traced the stall to this action on the syzbot thread
and sketched the saturating arithmetic used here:
https://lore.kernel.org/netdev/DN37NBGPJJG9.2DSVDCKS3UYTV@gmail.com/

This series keeps NLA_U64 for both attributes and bounds the computed
start time rather than one input's value.  cycle_time = 0 stays accepted:
it means "derive the cycle from the entry intervals".

The 10 us entry floor comes from the measured cost of one expiry rather
than a device's frame time, and 2/3 states the margin it leaves.  The
100 us floor proposed for taprio was withdrawn for narrowing working uAPI
and for a margin it never explained; this floor answers both.

Changes in v4:
- Reworked as a three-patch series on the current net tree.
- Bound base_time and cycle_time at KTIME_MAX, keeping NLA_U64.
- Saturating start-time arithmetic, shared with the catch-up path.
- Minimum entry interval, with its measured cost and its tdc coverage.

v1 -> v2: reject an out-of-range cycletime instead of clamping it.
v2 -> v3: move the range check into the netlink policy.

Jamal Hadi Salim (3):
  net/sched: act_gate: bound the cycle time and start time arithmetic
  net/sched: act_gate: refuse schedule entries shorter than 10 us
  selftests: tc-testing: act_gate: cover the new cycle time and interval
    limits

 net/sched/act_gate.c                          |  45 +++--
 .../tc-testing/tc-tests/actions/gate.json     | 189 ++++++++++++++++++
 2 files changed, 217 insertions(+), 17 deletions(-)

-- 
2.43.0

