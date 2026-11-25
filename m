Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795573682;
	b=RblORYvS5C/vY85El2RHW/uhYhwMtT54UtZr8YbJiXGFImOt/pvBs98EfVgxRtS+oArO
	 /v52euFEBBDBZ11yltBI6CbSmeYJX+1r3huXIqMPbQ7y735PP+2uqIlIUHktRA6vvuKwR
	 srSc0nX5OzDMpxd5fTQgbllvaGAD4XWdxQaII7cOHMWJrE0pAeU6tJJ52GgTuNQUJmZYh
	 aBrNAzrvxlw43Ypv1GfX3DSG698nE+6M9srZdPTJ3INV7Khn1ACQ15i70kjQV+tyXyMlw
	 PNvvVLIcsahKKSXTI2Y6S/NBXW0ZRSOXg8WUCfPCAPtfAGG0H+8/4FdnB/nf88Qlheg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795573682;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gDxnzLaRy14zxoKiwsBabewsAmx6hWXhtiUNmVzNEZA=;
	b=qb12XMEUJbHCa4u4i81eJnomT6ohHgSiRyquNxHR/e7hOhNFG9QAoqeVWOjxnf6tMrLA
	 Qs5n3bkrq9t+3/97EOe85uh5+pFNVJI/PMsiS56RenWywFyKUaVUe8AXmf3awd7eH0MCe
	 3m41mdja6daLaORKrFBJ3aZ2iPUhA7QlSADoDoQgOefThC3/93JZl2mpvoTaGUQYNwfYN
	 5P2YG7gCpPLFvq7LjfxFmZbnaPiVBFMqpGZF8xvCqpB6DAPKO+GCQwTf4x0MISmXFP9VI
	 0Jn8ZUFOEv04mzWxT4K3GFRD5G+0Ej/2ExaqaLP6gxB37cCpc1nBqr9TQD1TKLmKXlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZyrnBWX0;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF19C606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 02:28:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF19C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZyrnBWX0
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b6a88e4341so2266708b3a.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 18:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795573681; x=1796178481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gDxnzLaRy14zxoKiwsBabewsAmx6hWXhtiUNmVzNEZA=;
        b=ZyrnBWX0ttgzqFgq0xyQTuGRtOjZfjiHXe7hGWHPPsV+Kxlj403bCAD+K6BtmeRdz0
         8nwOVbBI0bUqV8TTQj8GVoSEJZhq0rJlxVkbdavpA1pQTfIMgr+MoIsyRXh9721bGn2B
         p3/TaY9rLLqxym8n1Wv3nMfXOSxtjRy3O48e6LCg5at1b0dLYw08k3vDNX4ISE37ZgCa
         l7KhkJvcubBSG/XzOQa/3fEY2adfT0GGR4b+FPxYctlo+nV8SgvcJUQNhYhAEeY7I7j7
         2wf+tx1KWOLH6DEeOhCkj5m7iCvkecStfZhZByFG/d5H4LUufAMi/Lsgfdcxv9mm1kzc
         2SpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795573681; x=1796178481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gDxnzLaRy14zxoKiwsBabewsAmx6hWXhtiUNmVzNEZA=;
        b=kUG6Vh7JO5c5XKkv+zx/Xd+jtLpfhP8B4zkMkSTvA4Wau9GKLmNIPT97wigfOv0Y3k
         hQ5j36rXaeT9AIceujWt3ZHEveeAsHSWTgn8mNp/NBLvUuwcAaLxuJ3higfCRwAmQYPV
         llYPCngaiKo/Fk5roSLGSoor1kxPMYElLr300MbBi2vqXgWpYlthXZON5eTWUeAWrQlD
         6M4JkjUwVtGWFemhtPsjwHnWE9oa/ECkfEyVEwhrdTHY05Z4KfWKreoLYiGcl8kRySLv
         ke/x+czcmeAalEYpvseXZMoC9Jo6rHRjmPm49ZFhvi9/YsGYJlhkBb/x5C2W9V5QP/R5
         QFmA==
X-Gm-Message-State: APuU4Z81miiWEJR5haeDoy7IFPExuuJXCaHs79ZZV2QN9wtH0GC81zXb
	n5hPT8W9BZU/IjhDKfRFd+S+SOhnk5PIE/mU0Z2KaqzgsRsmjmtjMo7IfI8oTN9dVmxrxw==
X-Gm-Gg: AZFdTZcVdHBpgrcqffTrCzPEyz1i/rmgW9zbIP9AFc+sKetjGd8dC6E0q94x66jpEDp
	ApFEE2SrVZOY4AXnxzFIjwAplqiTivR3hO1tQmMewuem+XpEhGkhgB5qJWIfisL9PyxIh6Wov9E
	RnKwgqoTTtVrCQgW3yxq+X7cGOUbgg6Kgt52p6l/EKx1RxHBp6IH/BZmFz80OJ2u7IsVFVM+5IJ
	MEcizyQDax14ASyIswqaUSRJYI7q+pXIpgRjXmKFBimho7QNH2W4WwDy3T8mzH3cTjDDYIPdSoS
	I/mLAtqrikR6O1E63hXbv/CW7bPJLGZMY3BsGCF6CCk3mVnR44C3F9sjr1CRVNgk+kvTjrmR48j
	hYjicfV57p/3KgXane3XdYAc+kyVUoABj8XUKxLR13ocmzuMbOg/U2JvTwXSTWsOIJK7zifR7aa
	tiX6j6xIOUqptAmxRoqqwQo5OqlDHV4TWpYIdT4NysQpIEHS22QIlukv7nRPd6+QngHnNOyxUO4
	rxS2oRte/8simQwweBAxOWwFvelq+VbqDw+rdFe8zTMatrT22U99DpxrR00UmUnDmupX4GGICCn
	eFwm5IAT1MSoe+EF+0V60Em6tED8sh4QpKVaewmUjWEhRxMF3gW4MflWn/hRn6ml2sEly9kJmu5
	7E0yYm+my7q7UHSWKz1Q=
X-Received: by 2002:a05:6a00:6de7:b0:892:d40c:4f7b with SMTP id d2e1a72fcca58-8c87bdb52c0mr14274341b3a.10.1795573681357;
        Tue, 24 Nov 2026 18:28:01 -0800 (PST)
Received: from LDYT9Q2G2M.pvgl.sap.corp ([2a09:bac5:cad3:119::1c:2e7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8cdfd2d2fc4sm2475115b3a.49.2026.11.24.18.27.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 18:28:00 -0800 (PST)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: netdev@vger.kernel.org
Cc: willemb@google.com,
	jhs@mojatatu.com,
	jiri@resnulli.us,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	koen0607@gmail.com,
	chia-yu.chang@nokia-bell-labs.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH net v2] net/sched: dualpi2: refresh head timestamps after trimming
Date: Wed, 25 Nov 2026 10:27:55 +0800
Message-ID: <d6273ba14831fb2e63413a0c532ccc716512de78.1795573222.git.zhiqizhangg@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261118143500.dualpi2.1.543a9a1be910-zhiqizhangg@gmail.com>
References: <20261118143500.dualpi2.1.543a9a1be910-zhiqizhangg@gmail.com>
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

Reducing limit or memory_limit in dualpi2_change() removes packets with
qdisc_dequeue_internal(), bypassing the timestamp refresh performed by
dequeue_packet(). The cached c_head_ts and l_head_ts can therefore refer
to a packet that has already been removed. A drained queue keeps a
nonzero timestamp and reports an increasing delay; a partially trimmed
queue reports the delay of its old head. These stale delays are also
used by the PI2 controller.

Refresh both cached timestamps from the internal queue heads after the
trim loop, while still holding the qdisc tree lock. head_enqueue_time()
returns zero when the corresponding queue is empty.

I identified the issue and reviewed the fix. OpenAI Codex assisted with
root-cause analysis, the fix and changelog, and automated validation.
Local regression checks on arm64 net-tree kernels in QEMU pass three
controls and fail eight trimming checks before the fix; all 11 pass
with the fix. The tests use real AF_PACKET traffic in an isolated
network namespace with HFSC shaping, without fault injection.

Fixes: 8f9516daedd6 ("sched: Add enqueue/dequeue of dualpi2 qdisc")
Cc: stable@vger.kernel.org
Signed-off-by: Zhiqi Zhang <zhiqizhangg@gmail.com>
---
Changes in v2:
- Drop the 659-line selftest patch following review; retain the
  regression checks for local validation. The qdisc fix is unchanged.
- Add Chia-Yu Chang to CC and use Koen De Schepper's current primary
  IETF address; the Nokia Bell Labs address used in v1 bounced.
- Check the patch with --strict --max-line-length=80.

The local before/after tests cover C/L dequeue, complete and partial
trimming, mixed queues, and a configuration change without trimming.
The baseline passes three controls and fails eight trimming checks;
the fixed kernel passes all 11. These tests are not part of v2.

The two-line fix and its arm64 W=1 object-build results are unchanged
from v1. This revision does not claim a new full kernel build.

AI assistance: I used OpenAI Codex for root-cause analysis, drafting
the fix, initial tests and changelog, and automated validation. The
revision prompt asked to address the review of the DualPI2 patch.

V1: https://lore.kernel.org/netdev/20261118143500.dualpi2.1.543a9a1be910-zhiqizhangg@gmail.com/
Review: https://lore.kernel.org/netdev/willemb.4158a0ba73d8@google.com/

 net/sched/sch_dualpi2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/sched/sch_dualpi2.c b/net/sched/sch_dualpi2.c
index 4947def7c4..79eba7209e 100644
--- a/net/sched/sch_dualpi2.c
+++ b/net/sched/sch_dualpi2.c
@@ -938,6 +938,8 @@ static int dualpi2_change(struct Qdisc *sch, struct nlattr *opt,
 			break;
 		}
 	}
+	WRITE_ONCE(q->c_head_ts, head_enqueue_time(sch));
+	WRITE_ONCE(q->l_head_ts, head_enqueue_time(q->l_queue));
 	qdisc_tree_reduce_backlog(sch, old_qlen - qdisc_qlen(sch),
 				  old_backlog - sch->qstats.backlog);
 
