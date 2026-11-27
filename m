Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780679;
	b=k+jeLOqrH1lmE49W/2gtmj41kF/EqsElrTKcFZYoknVW5I86WaFm29dKBSNtHqpRDOgl
	 JT840FW9wsHAwG/K7D0tScn5MA1oSSyVNircY9gWbF/2USTuLA2uoakH2kQIiE/xbEvpX
	 CNCKdDO+nc5rQMsC6KGaweSyK9YyWIiPMNBBylmMBf9tEboI4n3zTZVXRnB+9V5025Rwt
	 1U/LzPAwNp84JRCGnrtdW7PViGJnUdkSuG6ATsKKcEbmN4mLyQQJVLrW/0K7BP0rjq9wz
	 j7D5j5PO2cL+kEteLuxXyxBg2bWoySWubVGbHLtBe7bz6q4oGuGdfkiwDAfsv/7/J9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780679;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=BsfpblzBhrRHfyZGQKRLOaVkjiPtdfhHbAWNklqE3H0=;
	b=socyp95HRgoQJEDy7VG9eFpunWY4iyxZ55GqPAgYV4JhKfgyjB+KDwlSDTpFdlIz0vKr
	 V9Bgl2r9opt3x+/t9ZhTgBHEj/2Rew3UGLiOg68R+qPsuqxRXc3Lg8pW6I6siVw817SZa
	 zN8GMxJfqVNwkJa5DWG1rHke7iWhWfsmJIAJtv/3h9/EO6OzYQRZXxnvTjws58GqeXxGR
	 YEhSmYXaJHXLwKjth9zV0ax2WT2MUIQIeArugf5nX93d0f98u1qcfLV0yWVZgZKLqsrqz
	 ImWKBqMnHFpWCDEaCPteI9R17MZBwa5zSqAP692/9i71/TYC8D/zJAiW3X3pssKZqwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=UFb+VmW8;
	arc=none smtp.remote-ip=209.85.222.170
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC3D606A31F
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 11:57:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABC3D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=UFb+VmW8
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93f2049ea7aso564625285a.2
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 03:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795780677; x=1796385477; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BsfpblzBhrRHfyZGQKRLOaVkjiPtdfhHbAWNklqE3H0=;
        b=UFb+VmW8GYNiSYxstZKCVRnMKKo3Rjnk9uKwyEQc2VjSwDv7SCMDWvpglAma6XGmgP
         aEHf9SF2rsP7iUi3xiTPxnsGCulTY4EfNuKcaJ8+DABiRjRCCSy5wYSJb4kijlRhh3pE
         nrWse3PjDcMmtfU3C9299v8V1LmpXS4dKlP5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780677; x=1796385477;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BsfpblzBhrRHfyZGQKRLOaVkjiPtdfhHbAWNklqE3H0=;
        b=bOrgVpTyg7RUBMYKg2aE5apBdKZIeZubvWDSiSXkwyrGn2p9GuArsjZBupU0GDGuIl
         w+Xiu2Bjt3XzWGKuiSm7PbeEvdsrWj+BfnrToNnnsFOheheKyj6hxhaN02bDxCWvonN7
         wUJF1tjKppqRYBxVlztQoH/v2Bld9vJPbmjb8IoRQtGTw+QTxZqsC5X4DVgHskHGuEgx
         mWFSr7DhZdVRLqQ7LKm0Qxu9ROGye6kylHRsgTZtLYvIGVKxYEKtYJWqYp2AY33PyNJr
         /yWbvf31Xa8GidoGRyToB0lcQQhDV2vesID2Wbzpxs6GoeAKh5tRL6+3dJcZ/t0/4ZPv
         B+xg==
X-Gm-Message-State: APuU4Z/96qsfAdI/VRNCjukttEH3Gtt9/V1GbyU5l6SSH2VaG6l6Kywr
	CPhpE2TnhzpG+yKUHcTCU5L06yYpyRXy5BAK11yvJGljO2xSfClHGg9U8vW+kFWT/DAeI6moVEd
	6Whk=
X-Gm-Gg: AZFdTZczYDsjmB48YqAjiIHXo23focmYvPgP5fvE/aS/8fuQSQM5xre+jo76XUSsixP
	iwFCvLifeJwo7yxnj3ChJLr+DfplKydOtkAtgn4UjQdnDB3KGa86EKv5RMfvfJEsMKEatcodS/A
	wcxVmMPRsLyr6VlXTCAkVhLGaiPqAgqw4ZFMqKkkB1x495MPOMqQgkBOug6FXnclsufeUyUyeLM
	kjPOiwZ4kgJFYQtFFvNO6FD+JNIKOnV/hyFC0CRAUB97PFA6LE+EOmOvzBYDAE3fcqvTeGSt/br
	t0GClBD0xgkVFpRdUsxEXmYeV3dO25N/EZNMdVctHgEFRTJjY/IW+NWdkFp5Tj9otWTRu8WyhXq
	4eQT4qU6GoaA23c/u9L1VWSk6FZN4STMLEdOI33F7yMKcy/KeVJJue27M899Vu88+e/SGQvrFqM
	XPL/KFaPmyD1YRjX7IzotjB8eYNs9mM+SS8fsvM8D2rFEsD0Uye4UaBw/kEHakaY6A+5opkhWRE
	UbuNTYYmRBIXNS9Jt/fgjdHVj4eIbf0bR4VVyfMkxpnFeR44JsNwG82DbJblAoQnp78DPkUu9yW
	kdk5bDeFzyXdSm1rFqTM0DKlpDPfWWDFz0fCmGmKEqCDmm7/9GG11i1gib4JrfkBH0pLNAsAEnE
	tFEcRXLoShDnPK0oYxRsEHg==
X-Received: by 2002:a05:620a:29ce:b0:949:8bd1:15d with SMTP id af79cd13be357-949ba9b3e0bmr4601207185a.26.1795780677639;
        Fri, 27 Nov 2026 03:57:57 -0800 (PST)
Received: from mbili.waya ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949caf98d34sm1588177985a.2.2026.11.27.03.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:57:57 -0800 (PST)
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
Subject: [PATCH net-next v13 0/4] net/sched: cap the accounted backlog before it can wrap
Date: Fri, 27 Nov 2026 06:57:48 -0500
Message-Id: <QDISC-BA27.v13.r0.20261127065026@mojatatu.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series bounds the accounted backlog of the AQM qdiscs so that it
cannot wrap mod 2^32.

  1/4  cake: classifier refactor: cake_tcf_classify() returns its result
       to the caller.
  2/4  cake: use a dedicated split-GSO list iterator.
  3/4  the fix: drop at enqueue once the stored backlog cannot represent
       the packet's accounted length, and saturate every subtraction from
       the counter.
  4/4  cake: split cake_hash() into key extraction (on the unsegmented
       skb) and resolution (after admission), move the split-GSO path
       ahead of the resolution, and refuse a split an ancestor cannot
       absorb.

For the sashikos: net-next, no Fixes: (the aggregate wrap predates every
touched qdisc).

1/4 and 2/4 are unchanged from v12 and carry no revision-history block.

Changes in v13 (Sashiko nipa and gemini reviews of v12):
  - every core subtraction saturates.  An offloaded qdisc is exempt from
    the ceiling: its counter carries hardware bytes, so wrong statistics
    there beats a permanent drop.
  - taprio mirrors the child's net change at dequeue too, and books only
    the outermost handoff to a child.
  - htb bumps q->overlimits, which htb_dump() copies over the qstats
    field.
  - 4/4 refuses a split an ancestor cannot absorb, and its Conditions
    section states the shape that reaches the check.
  - Toke's Acked-by is dropped for the substantial change; he stays in
    the Cc.
  - rebased onto net-next at ccb81d5e317b.

Jamal Hadi Salim (4):
  net/sched: cake: return the classifier result to the caller
  net/sched: cake: use a dedicated split-GSO list iterator
  net/sched: cap the accounted backlog before it can wrap
  net/sched: cake: hash before segmenting and reject an overlong split

 include/net/pkt_sched.h   |   1 -
 include/net/sch_generic.h |  70 +++++++++++++-
 net/sched/sch_api.c       |  37 +++++++-
 net/sched/sch_cake.c      | 190 +++++++++++++++++++++++++++-----------
 net/sched/sch_cbs.c       |   6 ++
 net/sched/sch_choke.c     |   6 ++
 net/sched/sch_codel.c     |  16 ++--
 net/sched/sch_drr.c       |   6 ++
 net/sched/sch_dualpi2.c   |   1 +
 net/sched/sch_etf.c       |   6 ++
 net/sched/sch_ets.c       |   6 ++
 net/sched/sch_fifo.c      |  12 +++
 net/sched/sch_fq.c        |   6 ++
 net/sched/sch_fq_codel.c  |   9 ++
 net/sched/sch_fq_pie.c    |   3 +-
 net/sched/sch_gred.c      |   9 ++
 net/sched/sch_hfsc.c      |   6 ++
 net/sched/sch_hhf.c       |  18 +++-
 net/sched/sch_htb.c       |  16 +++-
 net/sched/sch_netem.c     |  18 ++++
 net/sched/sch_pie.c       |   3 +-
 net/sched/sch_plug.c      |   3 +-
 net/sched/sch_prio.c      |   6 ++
 net/sched/sch_qfq.c       |   6 ++
 net/sched/sch_red.c       |  10 ++
 net/sched/sch_sfb.c       |   6 ++
 net/sched/sch_sfq.c       |   8 +-
 net/sched/sch_skbprio.c   |  17 +++-
 net/sched/sch_taprio.c    |  98 ++++++++++++++++----
 net/sched/sch_tbf.c       |   6 ++
 30 files changed, 509 insertions(+), 96 deletions(-)

-- 
2.43.0

