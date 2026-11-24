Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541949;
	b=Fsf1/8ccibqck4BGOelIagbRG+QZcCU50xb5N6+XhvdESDvGBUon0IfMn4sXs5b3rUIq
	 Ohk5vP0OX3cx7O104VYMBQKf5chlAdnLRVdCvx/KiL/zLQFMKuadMVYixAniSSEg5APEz
	 gF9Zzo3GnByD2dczfMzqNS0nOwH+OcloMTqwsPCP4XyxXeKM5ru05Y75J739AR50mUJja
	 Z6gE5ToMUDL5aO43zwzM/K79N49pXK+iLvyeyhpXiwoNmIoyqrMSHIlWwiR8j8f+DsGQE
	 6/ijc2To2eDLH+XAF1Zpa4lJeW4HVSv02r6eqdbDgb92jydvijhdXxDbtzkB2dBQIcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jyCwvSiXyapt+odS15hCGmLJu951HzG6HR13+BbHYtg=;
	b=rHEtrhzCWfoZuGJ+wvcfDeVjoaAyXF/Y5LzEu9h1cTRQRXEfU9Eu8j0hUpRPyP7b8KKq
	 VURApkBBI4lC28VSNFbga9FuyVckEotTOuFl5tJXteVrrBoQnDRqghHwsx1sQBhrnA9tK
	 inqFQ1cdnP51Wwq8TF3PFfdhKJJQ+IEK97ixGTEHLbi4vCQ+Ft1QQ824Z1a73ehiLdR+O
	 /OXSh1n1ItR4RqOGgTQaWaiaB+bXnAWZHyw6jTnE3w7KeE0+7ccErZNPZakKL5MJCXwFS
	 rE/LJ5e0xGf0Ui753Amr3Hg1KIFZeFa5RJMSJHnLe+o43ir5ohNYyfxfonqV49MLsXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=f2gEbtGR;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BA4606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 17:39:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70BA4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=f2gEbtGR
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-8470d7d430fso2345101a34.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 09:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1795541947; x=1796146747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jyCwvSiXyapt+odS15hCGmLJu951HzG6HR13+BbHYtg=;
        b=f2gEbtGRDi6lbeomSvcpQ0QdCX8uct4QfSd6rDXyt5iasOa3HaTU0kM2N1y9PouN3U
         wr4j/znsIErMIKVSR++Um1IzoeWvwqgaeBK3tt8KD0bJhpLZiGfMS7V/8t/wDR/WIVui
         Xr/WcdODDDLYQ7EFrl2dovxre9oWWQOFKQgWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541947; x=1796146747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jyCwvSiXyapt+odS15hCGmLJu951HzG6HR13+BbHYtg=;
        b=1xme5CdQq2BvLE51xopTlYBUXWWK1N31MLfcM97+35JU7534/HiTKUvE4BS/k0w1Hi
         YS+A4RvmbWvQojbkp5Wh6YoleHi6t5m5TG6sLxH4+1qcUTh4A1HSKMbmmzM0TNQKbC9/
         PElbCkovgxNDP3HJz//cyu3PXRElRniWPLsOimQU5WPIg1EQUG0+CE5kRC0Tp2aeuqXs
         XY36oIIpE2CDIfNvvrHwojaIlq+j01oxh48/qmVmgRglViMOp6ojKB1zhxM2EvQ1tXxn
         eiz/XsuGMJFSP4NaroPzf1kwtmiPe+pa+s7YYFaoqdtiHRxFBXOdoz00f9LFYA9gNsJm
         xvtA==
X-Gm-Message-State: APuU4Z+btGTp3dCNMlxSVk8L+bkZk/wg7159UkiTkOl9SidO8+H/hLFW
	x3eW/O0dXYrjCJxpwDxWPFjxGaXpEP/6CTPVhl9HPjmJRpBky5y9io4VVrY6a8aWCXZlRxK7mLe
	does2jTY=
X-Gm-Gg: AZFdTZcthlvZl4vsEt4zrViWf9Jig5KPhXH1MxFXS02aHX5As9jEnRHAWRJFg5U57jW
	vdLGLhEEdaG1DW/30ha5QQwdT+3w1PgZ+IGHzxzZTZWwRhn1TQ+HvptSbwRIPAghpQG44t1u3nX
	oxaWcyhmqrvkvtMYz0xzoVhZGWcNazeC/B2IAQsqrqPNZPeQY2ezvrvIg6N3/W9UUuW2MmxdNdh
	KNh0bnXTiWztECUw4hqvq5coj0HSqZqa68ZsumfecDBrt720je8TlIhSqJPqWiQfLUw03fkm6uz
	xtPkW8q36oW/5bkI7dYRF0cFUN1X3Pyc/oHbTHieHVNaf2cnp8dViv+0n0M8NjzUqBhpSujmVqD
	w1dc5KrOOtB+hmiCz3kFpo2qwf+v4v4MP1NhgR2uxKmaWQ2SLkbLd3m468SP+tW28CV3DZxwm3X
	IqmSzSLyYfpDZq/OLQXQ7Rzv1X0ytEWp9rIhXdmWaabLplYsPoHaqNOU0+82yoOFftQYidJnzpO
	UoqJfmik7d50uHnHmA6mF3kWjIHDuqbULd0hJ9MqAcj2SQ2tRahNOn/DkUPAGVUaNDTJqwqZSUQ
	63LBA2CUk4LJr1wZBrduPNY5bjPosdd/MYpneZLoa8qEZjjfnqRlLAYiMLGM05wyH2f6VCOhbHd
	mudi+LX3l43UnOboFgUKuHJIO6DGh/uE/vhay+Vxx7WEOgZwXy7k3
X-Received: by 2002:a05:6830:4487:b0:861:5b84:4fab with SMTP id 46e09a7af769-863159af3b6mr15626513a34.27.1795541947281;
        Tue, 24 Nov 2026 09:39:07 -0800 (PST)
Received: from com-75606.corp.openai.org ([199.47.143.1])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168bdaf7sm11667094a34.5.2026.11.24.09.39.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 09:39:07 -0800 (PST)
From: Kyle Zeng <kylebot@openai.com>
To: netdev@vger.kernel.org
Cc: jhs@mojatatu.com,
	jiri@resnulli.us,
	kuba@kernel.org,
	edumazet@kernel.org,
	horms@kernel.org,
	pabeni@redhat.com,
	Kyle Zeng <kylebot@openai.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 0/2] net/sched: serialize qdisc timers and defer SFQ rehashing
Date: Tue, 24 Nov 2026 09:38:12 -0800
Message-ID: <cover.1795540952.git.kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261110044450.51921-1-kylebot@openai.com>
References: <20261110044450.51921-1-kylebot@openai.com>
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

This series retains the v2 timer/reset fix and adds one focused SFQ
change for the detached-timer accounting issue identified in review.

Patch 1 has the same source changes as v2. Patch 2 moves periodic SFQ
hash perturbation to enqueue, where the key change and rehash run under
the packet-path lock. This prevents the autonomous timer from walking
the live device's ancestor handles after its own hierarchy is detached.

The separate HTB queue-association and offloaded-leaf purge findings
remain follow-up work. This revision does not claim to fix those paths.

The original PoC caused SFQ memory corruption on an unchanged kernel.
A separate unchanged-kernel QEMU run reproduced the detached-SFQ warning
in qdisc_tree_reduce_backlog().

Changes in v3:
- Retain v2 as patch 1, with its code unchanged.
- Add the SFQ-only detached-timer fix as patch 2.
- Preserve the first perturbation interval and use deferred skb freeing.

v2: https://lore.kernel.org/netdev/20261110044450.51921-1-kylebot@openai.com/
Review: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261110044450.51921-1-kylebot%40openai.com

Kyle Zeng (2):
  net/sched: serialize autonomous timers with qdisc resets
  net/sched: sfq: perturb the hash from the enqueue path

 include/net/sch_generic.h | 20 ++++++++++++++++
 net/sched/sch_dualpi2.c   |  3 +--
 net/sched/sch_fq_pie.c    |  3 +--
 net/sched/sch_generic.c   | 11 +++++----
 net/sched/sch_pie.c       |  3 +--
 net/sched/sch_red.c       |  3 +--
 net/sched/sch_sfq.c       | 50 ++++++++++++---------------------------
 net/sched/sch_taprio.c    | 16 +++++++++++++
 8 files changed, 62 insertions(+), 47 deletions(-)


base-commit: 5f22fb20497f4983094131f00a734362300d22d2
-- 
2.55.0.openai.911.g06873a30d2f3

