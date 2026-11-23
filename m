Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438146;
	b=VU/PCiOB3O4q3WmIN1Kto4LBUc9G0oCsnPyVIyFk8yU64udNltYn4zAsDXYCvScXZNuN
	 Y6hm4W3GmvEuLJVUhtzUX895Pt2SC++8Pu/7l26bFd191GKV/Cuy9TkIyA87jOL8LXR5A
	 +vWcECCwYlNlCPiX09dX4kYrhxQe5q1qvEQ8mR5W5y43r4wq27tWWyja1Gv/Dnp7XzvjQ
	 87Tpfh5hb6TCdoXqTqb1cmoASaDiBGnwoMexX3ENvLqxHVhsNi/hGsA7NrwwHK1LyiVrA
	 DebocwXE5T7TnYAtsNJgdtc+l74CJSFJUl4KU0ZaNUVtemxmkrcEcooV4xjpxrhS5qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438146;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=DhK6CtMOLYZCVdUuss7wafvSK3dtx+GbAoe1f/T7oT8=;
	b=YxB8kolMfzscHVekmaF8OCvlbV6b6BcXm4Q5PgTJ1JKKYM7ZoQty7fQnPxrTI3kC9FLx
	 dWLaSnVDaTgw56tbf/5oGPC+S/bGWB0pcYaAZm/vNrhghFbg+6un33ZLiQit/smo4nDMK
	 cafMe/PD/Mb8dp8m6AiwiOCIFnVRjYT2DcziDrXb3hxhSfN3uJQumf6Sh7tyFrl6KvIDY
	 IBTJoe/DfQRFMym+goYOwg/wy7VanIRQCAK/tOnFRBs0pNYthzbLv0TLYC+Yw25pYxkGF
	 ANgzWYF0Y6wEjyoclIr676hij2h8QINAacvblGinZAwzysOmJDvolp+vZmvCm2cZzVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hsFF5YSQ;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4232F606A31F
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 12:49:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4232F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hsFF5YSQ
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso23050395e9.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 04:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795438143; x=1796042943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DhK6CtMOLYZCVdUuss7wafvSK3dtx+GbAoe1f/T7oT8=;
        b=hsFF5YSQpULfJ7UU3yf6gePPrgLzGPpQGEr9byySTcmMiZzNMUd5KQzuLtfMjRsSSq
         r/r4niBQPj2bPpnzW+fzmJkXDr8egb6JTq4pQ6o10q6NVz2odjdWWXX9AfLqTCUh9XTn
         1pfLoCDYjggp+DV/iAPRim4+9tKaQr3oOefVKTi3aBv6GxrO+J+sUteCKyYlkZFUqHKJ
         ewfrYdy8jNRy6SweMe760ZkOSF1rCZcUVjZnlgRQihnTABbeNtPpOAXIB5WwRSiPr+Wn
         Oy/so54F0sovqvmwz7pV+EGEsgQ46OypTUm6SphaM7pFCO+oOFKpe1mLM9YTtaT1sJlJ
         SiNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795438143; x=1796042943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DhK6CtMOLYZCVdUuss7wafvSK3dtx+GbAoe1f/T7oT8=;
        b=HQNfK9W5ijJTZlv1eqmk1mHOYPo45VZ4WcK6fVW3Vg08ZEpHNkw+/glrOGpKqryMxA
         eYKsaKuB2lv4AkK/rekuI/hCVzlPPlEyh6PcprBPDOqWAPnMLRKoZMV5s/p8p2SLbCpM
         XIl3DQmsmWTp6FNXLPQ57b4RlquSuBuQ/P1MDBWTrGeMD7rKBi4Jgs1YlrSPLnLzJu1s
         G31hk9IHlSPrTrUPNNS86HBipH1yig02ZKgtNEiaQ79+N8iVi+pno6I11uftJaiLHx2Y
         Xjn0uerwALTA14NiQ2SNamif2pGG2RStA/3xQ4Tp6VDxStUk+K+tBYpLZpd/3NS2Qi5/
         4J3w==
X-Gm-Message-State: APuU4Z/OGbnqAWse067bcyWBMK5qajL3T5aIViD/aEZBwNtwtqtjYHtZ
	DFR9auNlH7tJ+z6eypDeIgMQXcWZaX4nK/CCtEp1c41fXZAsA388Lcxt
X-Gm-Gg: AZFdTZdeMXOYxHxwz93qQbtqAQ/77NDJNjStK43cNTkqCWd3Qc6WWATyl6V/ORpGaak
	K7jRLJzH/a+SSgFDpVy3wE+mO1kKa4nKkQQrCzJ9AFqfMC1xtwtCcbbmZ3enpShg7yKS4lvrtLp
	tGX7kRIOmSgJ2x5GygiaxyXOgW5o7RiDj9Z1HZAjZnD3DBbfNHrGYBIq1hgEbtKqfhzJzGPYbgu
	/gQYEjSD71drwdccVhRcbMBenuwZezDZDLdqGO+2EI2Ygk65EUbGxnRbrfu54yV9GzK/IC/LH2v
	M/CWBs9dJefcMJ7d+LWx4Kr46h31Y4DEWXa9iNAaF754OPPmjDpVzCbYxPcJqFE0YIC2StPSXL4
	Ikhffz5LEs4VPDF3yycPRQgZi1lafKPRqJfh3pK6i8L0HNS9Vkt8+YQFm0rEE0hMR68F67wYBM8
	2Sna7kjfPYofAaOB4szabwxizVkm9BNFYgbzjd2oPNx2Xh36IID7flwcTtBeVWnaG9OEobVN7U6
	D5B379owMBwUckZ9/2kFgnnHRAMs437cWXg6dfp4ho3rSgUn1fmItLNxWiPKaiHx/pki3NTLqQd
	FBuA5WVjSNr25GhSs5GOcjNOMMeIz+nOEN2F8z7O
X-Received: by 2002:a05:600c:154e:b0:4a3:59ee:86b with SMTP id 5b1f17b1804b1-4bb887c3b63mr248348265e9.4.1795438143282;
        Mon, 23 Nov 2026 04:49:03 -0800 (PST)
Received: from Philipp-PC ([91.227.186.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906817ccsm165097045e9.5.2026.11.23.04.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:49:02 -0800 (PST)
From: Philipp Sudakas <filzador@gmail.com>
To: ronak.doshi@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com
Cc: netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	u9012063@gmail.com,
	Philipp Sudakas <filzador@gmail.com>
Subject: [PATCH net v2 0/5] vmxnet3: fix native XDP crash on oversized frames and XDP loss on reset
Date: Mon, 23 Nov 2026 15:48:50 +0300
Message-ID: <20261123124855.1021-1-filzador@gmail.com>
X-Mailer: git-send-email 2.56.0.windows.4
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

Fixes for native XDP on vmxnet3. A single frame from any host on the
same L2 segment can crash a guest that has an XDP program attached;
any device reset silently stops XDP; and the attach error path leaves
the driver with a program it holds no reference to.

Patch 1: the rx data ring XDP path leaves rx_ctx.skb pointing at the
ring head page after a non-PASS verdict. Patch 4 relies on rx_ctx.skb
being NULL between frames.

Patch 2: vmxnet3_xdp_set() releases the old program before the device
is active again and does not roll back on failure. Keep the old
program on failure. Patch 5 removes the side effect that used to hide
this.

Patch 3: with an MTU between 3051 and VMXNET3_XDP_MAX_MTU, full-sized
frames do not fit the 3072-byte rx head buffer. Limit the XDP MTU so
that they do.

Patch 4: a frame that does not fit in one XDP rx buffer (sop without
eop) reaches the skb path, which takes the page_pool page for an skb:
kernel BUG in skb_put(). With MTU 1500, a single untagged frame of
1523..1526 bytes is enough. Drop such frames.

Patch 5: vmxnet3_rq_cleanup_all() clears xdp_bpf_prog on every quiesce
(MTU change, down/up, ring resize, reset). XDP stops being called while
the program is still reported as attached, and its reference leaks.

Reproduced with stock modules on Debian kernels 6.12.113, 6.12.117 and
7.2.12 (7.2.12 untainted), VMware virtual hardware version 20. A small
reproducer (raw frame sender and an XDP_PASS counter program) is
available on request.

Testing:
- Run-tested: the patched vmxnet3 files of net as of today, with the
  driver's current vmxnet3_ethtool.c and headers, built as a module for
  a Debian 7.2.12 kernel; VMware virtual hardware version 20, MTU 1500,
  native XDP:
  - untagged frames of 1514..1522 bytes reach XDP; 1523, 1524 and
    1526 bytes are dropped and counted in drop_total; 1530 bytes with
    a VLAN 0 tag are dropped; no crash;
  - 5000 frames of 1500 bytes mixed with 5000 of 1524 bytes: exactly
    5000 XDP passes and 5000 drops;
  - with XDP_DROP attached, small frames over the rx data ring
    (64 and 100 bytes) are dropped by XDP, followed by normal and
    oversized frames without issue;
  - after an MTU change, down/up and an rx ring resize the same
    program keeps running; after detach no program is left loaded;
  - MTU 3051 is refused with XDP attached and attaching at MTU 3051
    is refused; at MTU 3050 frames of 3064 bytes reach XDP and 3073
    bytes are dropped;
  - attach and detach failures were forced with a test-only module
    parameter that skips vmxnet3_rq_create_all() and returns -ENOMEM:
    after a failed attach no XDP program is attached or left loaded,
    and after down/up the stack receives again; after a failed detach
    the old program stays attached and runs again after down/up, and
    is freed after a later detach.
  No warnings in dmesg.
- Not covered: the rx_error paths (no way to make the virtual device
  report a receive error), and VLAN tags other than 0, which the test
  switch does not pass.

Changes in v2:
- New patch 1, and the rx_error double count fix in patch 4, after an
  automated review of v1 (Sashiko).
- New patch 2: v1 patch 2 made the attach failure path in
  vmxnet3_xdp_set() reachable with a stale program pointer.
- New patch 3: v1 left the MTU 3051..VMXNET3_XDP_MAX_MTU range as a
  known limit; it is now refused.
- Patch 4 no longer counts the dropped frame against the NAPI budget:
  in mainline other non-PASS XDP verdicts are not counted either, so
  the v1 comment claiming so was wrong.
- Patch 4: fixed a line over 80 columns.
- Cc the networking, XDP and BPF maintainers and the author of the
  blamed commit, as get_maintainer.pl lists them.
- v1: https://lore.kernel.org/netdev/20261122002847.616-1-filzador@gmail.com/

The problems were found and analysed, and the patches drafted, with
the help of an AI coding assistant; reproduction and testing were run
on the reporter's lab systems.

Philipp Sudakas (5):
  vmxnet3: clear rx_ctx.skb after a data ring XDP verdict
  vmxnet3: keep the previous XDP program when attaching fails
  vmxnet3: limit the XDP MTU to the rx head buffer size
  vmxnet3: drop XDP frames that do not fit in one rx buffer
  vmxnet3: keep the XDP program across device resets

 drivers/net/vmxnet3/vmxnet3_drv.c | 27 +++++++++++++++++++++++++--
 drivers/net/vmxnet3/vmxnet3_xdp.c | 22 +++++++++++++++++-----
 drivers/net/vmxnet3/vmxnet3_xdp.h | 10 ++++++++--
 3 files changed, 50 insertions(+), 9 deletions(-)

-- 
2.47.3

