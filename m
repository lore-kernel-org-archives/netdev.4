Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779821;
	b=Ci4XLfsjFIbD8Jesh36Kt6Pj5W4vrjnZYS8oKta6Hn8UQ0/AcDS/nSadMo3eNxL5c6q+
	 US3Npyvm3FnvSKYJGKzROvFv9Qf1MAw4bOEtnTxrZwar3mIE6AXPXBIgV3h4u7qrdWnjP
	 jON+S3o+gUH/VxrQxc+cUbh4NyuJ1nFvHxgDTbpDsSaj1ju54HH0zgtx31OLv9ExG4mFl
	 SwzyqWbvZOMpmtm+Z+SOFCcEqmI1MugluZdgX64/UOR1dRku///cAMICsYGCl8lHiNQJO
	 TE7Yc4SLwkaBKtsQBeTjsr9LAsA3F8xENs1yAxMsLMiAVDpnIPMAxGhsO2WkgHnufbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779821;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=AECalRK44VdMHI1DCyGCv8j6AidnaiyQLrZWOxqztSk=;
	b=Xc85DGopv7VG+QBTP65JHFFFYBZDbVDx34EXm/gKjayGG6H4zbUDr63YUSMrkQuvvmaU
	 oki6xxWSnr1wcruuIg7Ffy1O2x0/lpkK+ui5gpcEQwKszTGagjkaL0D9SwZ7YzCYYr8eA
	 rZSOe3peJj4lJoPC11tBdtKX4obAD9v/HtJ5cR33lA4oOllz5Elkb2NlDgLt+Xo4u9AjY
	 monBs50PXAQyG+HcpNdX9zbpv/6vscQEJ18kUwBfi698i+hWNsBYBHx7TxozeAgxYV2bN
	 XcPk6f5pYWNKuLpDUN+bmC/cZEBl6b9yMw3uXjM4SbJX6y6z3Lb7Hj9MvthDOJD8AKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b="Yy/JZIXW";
	arc=none smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC06606A31F
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 11:43:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CC06606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=Yy/JZIXW
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-55c4e670fc6so61045691cf.0
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 03:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795779820; x=1796384620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AECalRK44VdMHI1DCyGCv8j6AidnaiyQLrZWOxqztSk=;
        b=Yy/JZIXWughqL+85ngdXxRaRNcs2VE5jmZLE7hvVJQlTSFHZ3zNt/rti6zabMR8QrG
         nzuI51uhXzo4miM5f6ENVfGerf4tNA+yPh+F3nHOYKqAuiszj2TY0zeN9gbg30XvVB3S
         nlcBK8XTi0CG+xnfMGQ/iJYcVr2TG03+QN410=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779820; x=1796384620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AECalRK44VdMHI1DCyGCv8j6AidnaiyQLrZWOxqztSk=;
        b=f/eAQW1l7+Ggap9lkc44x55jCjQIS0wxUePV9NaDAgyWWn3FVs45gO9+LVZkRqHysb
         1awf5je1L7mmMuQxhY6IGmHl1lQyH/61esFvJDiZUAyHiCIXalFYe7Rsi3DnJQ4Vo/KR
         lgAhkdB5Rx//unoAe7RXU03JeieFlxoCwLP992HXIRh5CojhvtOsHbpodXdXWqfKvj56
         EqqaNqGYP8B+u2uUs9pWZhogSlKjLNuTvzS9jzQsYxfUUDE3W8F480iDxzKsfZC43ENW
         PceD/UrgvJiSwrdjQa8ySalqJdPZ4R7cwg1vy9gYHaKcl2SyYlk0xXf5DbbTA8b44KuD
         oYrA==
X-Gm-Message-State: APuU4Z+sWMOjOL90Y18j6rbqMYZMIjRAWJGzf3HArYcng6NR+x6DNnad
	B5Q0zZOzQAcR3kjb1gRJfWDMONoH6zwdMcFVvrLf9ndAuwtjHaE7LYLwbQHWIbs8Bz/LlM+fHRD
	jojE=
X-Gm-Gg: AZFdTZc9viQAmQdagcpAa/LR18WlMS9g1bnujhnWs9bkiVyiPHtVWzNvMm/9Jp7x12R
	YIbGXSad2RiyQnErszqoIGGKthzjpXkV9vf+Sljb5G0seBPc2tX5inKuUkGOlPp1HZPecRJCHt4
	C1bQ6JJHnqQ3FSfryfM6DgHspMLQx0VHMIwMXHoeIjGeepZ3hqwiEjswrAJjcs/lpxSN1AIbEUp
	U8tPaJIm0MgkVOxisFe8FtdtaxhagEAm97+lLaJJo7dFesJB48wPYzWm+7aMvpoLNCWKo9lChHU
	sAsRmXuotsH9wf5cWvB+2EgBaNZIXBzqJxLQsJgCdVxnzGF8ZA1QNqya0xp/0SaK63vLYVX8DmL
	JCGieDOIzaPlPH8zPFGenyL0+h3Fmd+K2hMrTxBNjsc3363K/c0aKtgn2Sw6aUadYKlpqk7KAQS
	kaHw11ptAMfbfTIxb9P4G8c9QSaWXXXFzoYeo9JkL4i+vsomNcuUaJBGE7ikxZAlkDrAVF+LHIt
	Y/OEtSUVlRBG7HfNADjfv502JABTy++DuS/yOWeJd4opSs+fcRoh/0sk072Is0FnyYuODKbSKk3
	TwMKr2IXXflZrylE2Bx8QgBc2MOrBVMVi3BDUc1W0f26OGOnO6w9Dxt85XQc99S+m9WOT4/MLVx
	WzLLjBM/Qec3NuA==
X-Received: by 2002:a05:622a:258a:b0:55c:7f3d:260f with SMTP id d75a77b69052e-55d76a882demr428968481cf.63.1795779820213;
        Fri, 27 Nov 2026 03:43:40 -0800 (PST)
Received: from localhost.localdomain ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55dcdd1a2c6sm16652551cf.20.2026.11.27.03.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:43:39 -0800 (PST)
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
Subject: [PATCH net v5 0/2] net/sched: act_gate: bound the cycle time and start time arithmetic
Date: Fri, 27 Nov 2026 06:43:33 -0500
Message-Id: <ACT-WEXM.v5.r0.20261127063407@mojatatu.com>
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

The cycle time and the base time are read from u64 attributes into a
signed ktime_t, and the cycle arithmetic built on them wraps when either
value is above S64_MAX.  With base_time = 1 and cycle_time = all ones the
timer is armed in the past on every expiry, so the softirq never finishes
and the installing task soft-locks the CPU.

Neither attribute has been bounded since the action was introduced, so one
request is enough to stall a CPU on any kernel that has it.

Patch 1 bounds both attributes at KTIME_MAX and computes the next
boundary with ktime_add_safe(), so an unrepresentable expiry saturates in
the far future.  Patch 2 covers the accepted upper bound and both refusals
in tc-testing.

The 10 us schedule-entry floor from the previous posting is a policy
change and moves to net-next; it follows once this series lands, and is not
part of this series.

Changes since v4:
- Split: only the regression fix and its tests are here; the entry
  interval floor and its test cases move to net-next.
- Conditions states the user-namespace route through a filter, which is
  the minimum privilege that reaches the code (reported on the list).
- The test cases match the kernel's own message on a libmnl build as
  well as the strerror text, use deterministic signed values instead of a
  2^63 decimal whose conversion is architecture dependent, and assert
  the stored value instead of only the index.

Jamal Hadi Salim (2):
  net/sched: act_gate: bound the cycle time and start time arithmetic
  selftests: tc-testing: act_gate: cover the cycle time and base time
    bounds

 net/sched/act_gate.c                          |  34 +++---
 .../tc-testing/tc-tests/actions/gate.json     | 108 ++++++++++++++++++
 2 files changed, 127 insertions(+), 15 deletions(-)

-- 
2.34.1

