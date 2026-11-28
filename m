Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795837058;
	b=qqeBHBg6gmIFYBLPFreesh7oKeIUwlFuRTqlcGU+VwrRKlMI2aT/LM464zOdjOQx1xUq
	 iWABSX8Tqqzszua9/ONX/Zpa2hC1TJymQqzcF+YpldIYRhlxAXKNbhWbzw1T3k+IkYjPk
	 Ekrao679R3QQTLacLI0OnFqizDvEyUMpHvW/ilHkT+eOyYxUU01uzbfrZHAiMtZAxzHJo
	 8Wm+X34QVienfpQTSoKIB0Pj7Ateu6bqhM5kIAN5Whp8Shb3k1A04fNAXX8R9/olFEnDn
	 +l5ZoUurnj7D+8fdmhzj84jAPqW55SSBaO6b4AcaM+XSY+ITqqdeLJWUAX1CxEETtUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795837058;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8kVwYZ1mIBLHJGNNGwqW6ng8APu6uVBnAbfyiIE9tJs=;
	b=fcSrFLP98SDtA0SU8ynO862DT6VS3y4+mBbH8ST9UW2GfQ5Hlwht7btoOcofNeNFAPg/
	 7azjwwchdg/4PbGHJ5QrRaWrm0FfuE/mZEetaeOJsl1Pm5zk1Sb/lnLH2t9rks0wRtAFi
	 2Zgj8ZBywo2TW9gqIQren8KnnTDDMEaJHHOWVbvvbNsv2CxDRY5z1A+6faVjanIgHBV6V
	 6b6Sc+A3m2mBfSBPMZIzG5TvPBOMrb7yqQ3F2vZ1es501k60MnmhTEHms2DsIBbqvr+fJ
	 qQIzzwHKW42Y799vgA1gtjzkoQbErHB36FMf5Rud3IpaE15h/qKpBQQ+3CIrR28KwCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=DYUo+wws;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B910606A31C
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 03:37:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B910606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=DYUo+wws
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8b600fae14dso3197620b3a.2
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 19:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795837056; x=1796441856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8kVwYZ1mIBLHJGNNGwqW6ng8APu6uVBnAbfyiIE9tJs=;
        b=DYUo+wwsdvZ2uBVBZOzEm5U5W9GPYaVG1B8lE1wMMB7M3GYkXY/ojl5G64dKGlD5tr
         +q62VVyLgX2hgoJ5ZMiqd416cH3sn1HOGQznwFmVhzGhK8TRN0DxLf60ZTJD2CIYBGh3
         Uq5Ey4kfu+SBCGCHCr+DVX4r/H76UKVF2MX/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795837056; x=1796441856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8kVwYZ1mIBLHJGNNGwqW6ng8APu6uVBnAbfyiIE9tJs=;
        b=NXuYtsWF5qxYaW6IUEa6eJXjkEmYedUZ3ci/OeC4bKBs11012G7OJoH/j9PfN+509Q
         jeo3PsBimtOyj6J1KLxF0JBNpxIWWoHlcQykJ4UJ783ekBRB/SVit+FvpqHBQG3UgV2k
         bSlR8C1incoKxQ13kHWj54DHVbZrv31B6fQcpg6/bRonkfJWqAmMo8EzWVAnt6uXNw8M
         C7rIsZ61toyt7XVrVYXbkSOMa2l24RikE0UZ7XZMWlXcgEzk352SoFzQMPjh/KYoLFXG
         ZQa/K0i6SvX15GgesPKqwH73orvRVXzcREjM38YLRpis6x3fHiJQQAzDV9TRLHstRV/u
         ys8Q==
X-Forwarded-Encrypted: i=1; AL+hErEW+34nrbMW2FJ/AP+yQ1iWGww7+8YuNsrBBMWYJzPLbfOHjIaDUMPvtuXEb1+pL7W2kDW7Hqg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HmbNR9V7BWMrRp/BPwnZuzd8BmB+UCMNaaa+z8aiFW0EfGV6L
	4HTQMmaKzYoS4g6YlQ6uM2ZK0RYkFylG0OBGDmCHcJ2ajEjd3ibN3OlmzKo9kaUU5DM=
X-Gm-Gg: AZFdTZfAKXGz7qLdO5Hc5kRuautWbthAp6w1nyiQgl8WY1H0PQVtTdjcVXmzH3ZXDG9
	dJrA+R93xeDTDr8/ynD4iqh8OtZlgskfATNr7pmnW7rWDltFZ1zrlnpO7/aG90Zd7Z1Sqxya9dp
	X8IDG5s0FPM20by4WtwjsDS7YMDr2RAnEeyqpsJCErLNkrI/W5YsqV3ZKv1dyGdF/lHC2xS6Oy8
	s9UHixq+SamvtwHi8kCpgnFg7hXEuMorBMFqnCoecADyaD88mmdcXwW0+YIxD95e0UtkH8en3fu
	rBuAm+9EKN+spNtESal/fa6dUhysAeB+f8jSDnO959HTQw/aLjTMCYKMAaZZTXcBAnXMTCEPg2k
	jMexuUYWMNfuglAIjW6JfMnas2P4HTWnz5EVXaUchkvNMwRiTF14iM5h/hAoUFjkqB9j4KuOoGQ
	OjcoxSVWj7bplqFOnkj2Zi5eepponOxHuDpsnjOx2DioC0TV/wdOr0OhvDuY+gA1kjiQbIUi8Bp
	MjdKscy4KYkRNplE5CydK8Hm7cgd5pzUmkhbuAUYZNTaPmJ/+yWZP9V8MAMRsaOqwoq/WyY/dDs
	tB2Wdz4fizTneWcvcFH31gtu3yr5zAoAQrZH5Ih/lY/vxusc/00+9vZJI50wX//rnhpbYjUKrIe
	JoZA3wzyPJ1ZqdAddIJtd20bT97N1qSM6NRScXQf/TLkP5mAMBf+iT2URdVYdEtqZ
X-Received: by 2002:a05:6a00:f8e:b0:89f:d620:232 with SMTP id d2e1a72fcca58-8c87c864543mr23366688b3a.35.1795837056560;
        Fri, 27 Nov 2026 19:37:36 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343f83dsm13590256b3a.39.2026.11.27.19.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 19:37:36 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: Allison Henderson <achender@kernel.org>,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>
Subject: [BUG] net/rds: use-after-free of the rdma_cm_id freed by connection shutdown
Date: Sat, 28 Nov 2026 09:07:30 +0530
Message-Id: <20261128033730.467831-1-piyus@iiitd.ac.in>
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

Hi,

rds_ib_conn_path_shutdown() frees the connection's rdma_cm_id and clears
ic->i_cm_id only afterwards:

  net/rds/ib_cm.c
	rdma_destroy_id(ic->i_cm_id);
	if (ic->rds_ibdev)
		rds_ib_remove_conn(ic->rds_ibdev, conn);
	ic->i_cm_id = NULL;

rds_ib_remove_conn() takes locks and can sleep, so ic->i_cm_id points at
freed memory for a while.  Both FRMR paths read it with nothing excluding
this teardown:

  - rds_ib_get_mr(), from sendmsg()'s RDS_CMSG_RDMA_MAP handling, which
    tests !ic->i_cm_id || !ic->i_cm_id->qp and then registers;
  - rds_ib_unreg_frmr(), from the MR pool flush.

The NULL test in rds_ib_unreg_frmr() does not help: the pointer is not
NULL, it is dangling.

Reproduced on 7.4.0-rc1 (63fe746a609a) with KASAN, by closing a socket
whose MR pool still holds segments while the connection is shutting down:

  BUG: KASAN: slab-use-after-free in rds_ib_unreg_frmr+0x119/0x860
  Read of size 8 at addr ffff888022d67010 by task poc/9559
   rds_ib_unreg_frmr+0x119/0x860
   rds_ib_flush_mr_pool+0x685/0x9f0
   rds_ib_flush_mrs+0x57/0xc0
   rds_release+0xc9/0x220
   __sock_release+0x65/0x160

  Allocated by task 37:
   __rdma_create_id+0x48/0x4f0
   __rdma_create_kernel_id+0x3c/0x80
   rds_ib_conn_path_connect+0xfa/0x320

  Freed by task 9508:
   kfree+0x1c7/0x660
   rds_ib_conn_path_shutdown+0xc2b/0xd30
   rds_conn_shutdown+0x3ca/0x940

The registration side reaches the same dangling pointer.  On 7.3.1 a
fuzzer caught it posting a work request to the QP of a cm_id already
destroyed, which rxe reports itself - WARN_ON_ONCE(!qp->valid), "qp has
been destroyed" - before faulting on qp->state_lock:

  BUG: KASAN: slab-use-after-free in do_raw_spin_unlock+0x15/0xf0
   rxe_post_send+0xfa0/0x1130
   ib_post_send+0x9c/0xe0
   rds_ib_post_reg_frmr+0x396/0x570   net/rds/ib_frmr.c:167
   rds_ib_get_mr+0x26d/0x470
   __rds_rdma_map+0x555/0x7d0
   rds_cmsg_send+0x27c/0x3b0
   rds_sendmsg+0xda0/0x16a0
  freed by rds_ib_conn_path_shutdown -> rdma_destroy_qp -> ib_destroy_qp_user

How reliably it reproduces.  The window is the span between the free and
the clear, so hitting it needs a registration or a pool flush to land in
it.  To make that dependable we inserted a 300 ms sleep there - debug
only, not part of the patch - and then ran six processes registering
memory regions on a connection being torn down repeatedly.  With the sleep
the KASAN report above appears within a few minutes; without it, it is a
fuzzer's odds, which is how it was first seen.

One detail worth passing on, since it cost us several runs: an address is
only in rds_ib_devices' list while a connection using it is up, so
rds_ib_get_mr() returns -ENODEV for a socket whose connection has gone.
A reproducer that tears connections down aggressively never reaches the
FRMR code at all - 2096 of 2096 calls to __rds_rdma_map returned -ENODEV
in one of our runs.  The connection has to be up when the registration
starts.

A patch follows.  It clears ic->i_cm_id before destroying the cm_id, so a
racing reader sees NULL instead of freed memory, and adds the pointer test
to rds_ib_post_reg_frmr(), which was the one FRMR site dereferencing it
without one.  With the patch applied - and the 300 ms sleep still in place
- the same six processes produced no report over 14 teardowns and 17636
registrations.

It does not serialise the two sides: a reader that has already loaded a
non-NULL pointer can still be preempted before using it.  Closing that
needs the registration path to take the exclusion the other users of
ic->i_cm_id have, which seemed a bigger change than we should propose
uninvited.

The reproducer is fuzzer-derived and we are happy to send it on request.

Thanks,
Piyus
