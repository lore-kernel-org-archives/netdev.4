Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593188;
	b=fQOoLxfKGZjf3mv3WFmAbnaCPMr9BhSoPJMYCYPzbH3PtOcQda3C6ksqrTdqB/S92Guy
	 KZaaohILqW36i2SxM0nhKltwyINPLNlwGnd6DyMl6mdF0/E8OTtKq+P/bF/vmoM6+CQdz
	 nweSx5+eO7tzciSik27JpOVKnPL0BPXChX3nE/eCrfFnB2Ow4q/Pbnz5Sdv7KNSE5DF1W
	 LjSRt9YDJuxaCRbEGAoYXW+z9q3uS7RCD1INt5N6705hc6f0hdsBtdsTN5QvDd0UPItH4
	 Ih04MYim4MGEP2BWclc2Om7X+U9S/8jradoLJVBxQF7mXOXWS6gEt4TsMs3NcD2f3Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=zf9bT3s9LlKEPRvd3hDZDLoiBKI5UFbuOVhEvjeVPsA=;
	b=QZxgLGMzSKcKaxrg6CGekYawOIO8QEBFq0dfYuo18CP+J1kAxXHuQMfYbAToWDmMrMJu
	 Q36hqpViN+XT9OKOrCUZvKP7aK/8fRf8bDZtIrswHUkbe5T3J5n4Wf765lkDK75Rwa7pi
	 dhTfNyovln50SCLpcnfIdzyGYlVlY2OpR1pTzdB+H7PFx0o3Nwnx+CGZH6MXkHRVcEbuy
	 RrC7G3b9Uxn/dkUpcWoqEAGYfgr/gX8P7a26VzPdpj8P2mF0ocjkHY3w/mg8FpULl5ISF
	 BiamuKHCoeQWFdA+yv2lwSJYyx9qPsK1E6RCZDGZVjwfwF1rBWePYUVqYFxHipYqLSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hiRBpv9q;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46935606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 07:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46935606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hiRBpv9q
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so4721661f8f.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 23:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795593186; x=1796197986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zf9bT3s9LlKEPRvd3hDZDLoiBKI5UFbuOVhEvjeVPsA=;
        b=hiRBpv9q/vOunC5kU5u8bpgrywiQq7ASpBIOlKeRlIX3xeczrKzMl/olm/kNSQI2fD
         JS5njJjmdoXlc8xTb46BqEhuGcCT5G+bJGBWI9B44LQN2zmy0tdO1/ZRrFaFVbjoAvbK
         tkPVGUc+ACY7Z+UC433c/LEa8RsVFb7M8TwvmSHSF5mEa3u7kE1yMzvUGHhrtR56YGOf
         KXuhHnZY5NYEyDNeAizUuKXTcs2UfvNMj5BnhHs1yCNrElWR3w+jrhnHAzRVH6GFiqxQ
         IRwA8Qt6yCiG2Q3tFvZEXLlhzoFiOtzHggw/XFXySvre9DXWJMJUlQVPkTJ5O7oIlyU/
         +NlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593186; x=1796197986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zf9bT3s9LlKEPRvd3hDZDLoiBKI5UFbuOVhEvjeVPsA=;
        b=HahGFh4h60I+rVV+gKyFtgd7LcMTnGh0PWno0GQI1+Ixcx/UTbl4W/mrt/GBhNHGkj
         iyRkLpPzrc0ZTarhbuEv9v2pFWDIS15f30zw6ZoPiLdOQQ2q6IBxNDAcFFTa2m2Ejckd
         aR8dIvU8x4osOfKJ0Ab2ybSDrIFO2i/5ViWPOy5cDOCXaQzMZaaRUFAcYj9l03/iLBBB
         POcyWiTR/4/IyOBDiZJsJPYV+41T1x6XNovO4xEdBw3FHHaHG6p8RwNVHvZGL4PlK+62
         YV53TMLkxTVdCjeuDFFT8mel7hlXIOyf5fSO/J7Zf8dvf0fod6t/OPlXOoWlhST6jf6U
         TuUw==
X-Gm-Message-State: APuU4Z8sG8K54yzPip5TDyOhSAE/RngoA/uW+gN9K0/Z6YQEU54TVJua
	qBO/Lsw3jpZGkKf28O9DxtYLoTt7hqQfxE0uKns44o4km3e+ADHrmyS0
X-Gm-Gg: AZFdTZfBbdk5KEkyN4BwnI66MYEJakwo2V65cx+onTTR2grm1E0iZyjqZJ1dDBbGMbu
	qWEmNcj38EeL/qQXACSXOFgaRQcR/2UMDxqyjOKafhRHYhcJTsHMktw3/6vFQcnHEGC6TAw+xNn
	7CCuYXQyqkDs+OdHAqAPqLS9Qw7iKezLYo0zno1wSGQm4z8WMWe8PhNpmBmMMk1p49+EcrJtASW
	Onm9BY8T5pWuAZNhky5olFBvmeRf6Ul6q5s4ym5m7zM5yd2rA9H5SX4k1LYn/2FmmNGqYMDHowM
	PFnreNJWQsH2gngNeKJyCbs+s9x8qexZ8LxbQ/tDlr3bJRYAaYf7cQkfuYk29/1gaEKShknNsBA
	gqyV2JqNUBVntHhvxk98IP/MymfwEoZmkf8CodsMrP1RUgtsibnnFKUjKSiFktvXBIa9brTsGlH
	O8YPI+O7ClzJU9xRqC0mUp9JoZ0/Gv2SJ8e9ws35TFQm9oQPq4+u8I7O9HeDKbRRgNdyOK5dzR0
	3YgkDvlrI2D6zTpoDMzhbljTsMBYhJU8tdW5y74YbXLJLWCgQycp2iZMBHuf6COZ8dJByvHy1pT
	v73xdoGKzmDwX4qrj93xRBPwu4t9Q7b9D1z2qBqi
X-Received: by 2002:a05:6000:29d3:b0:4a5:4367:dc84 with SMTP id ffacd0b85a97d-4abb400bcd6mr21015674f8f.18.1795593186427;
        Tue, 24 Nov 2026 23:53:06 -0800 (PST)
Received: from Philipp-PC ([91.227.186.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a680483sm33001138f8f.28.2026.11.24.23.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:53:06 -0800 (PST)
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
Subject: [PATCH net v3 0/5] vmxnet3: fix native XDP crash on oversized frames and XDP loss on reset
Date: Wed, 25 Nov 2026 10:52:50 +0300
Message-ID: <20261125075255.1517-1-filzador@gmail.com>
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
any device reset silently stops XDP; and a failure while switching XDP
on or off leaves a stale program pointer and a half torn-down device.

Patch 1: the rx data ring XDP path leaves rx_ctx.skb pointing at the
ring head page after a non-PASS verdict. Patch 4 relies on rx_ctx.skb
being NULL between frames.

Patch 2: when vmxnet3_xdp_set() fails to recreate the rx queues or to
reactivate the device, it neither rolls back the program exchange nor
restarts or closes the device. A failed attach now brings the device
back up without XDP and returns the error; a failed detach is
completed, so the driver and the core agree; if the device cannot be
restarted, the interface is closed. Patch 5 removes the side effect
that used to hide the stale pointer.

Patch 3: with an MTU between 3051 and VMXNET3_XDP_MAX_MTU, full-sized
frames do not fit the 3072-byte rx head buffer. Limit the XDP MTU so
that they do.

Patch 4: a frame that does not fit in one XDP rx buffer (sop without
eop) reaches the skb path, which takes the page_pool page for an skb:
kernel BUG in skb_put(). With MTU 1500, a single untagged frame of
1523..1526 bytes is enough. Drop such frames. This also fixes an older
cross-poll BUG_ON on the non-XDP path; see the commit message.

Patch 5: vmxnet3_rq_cleanup_all() clears xdp_bpf_prog on every quiesce
(MTU change, down/up, ring resize, reset). XDP stops being called while
the program is still reported as attached, and its reference leaks.

Reproduced with stock modules on Debian kernels 6.12.113, 6.12.117 and
7.2.12 (7.2.12 untainted), VMware virtual hardware version 20. A small
reproducer (raw frame sender and an XDP_PASS counter program) is
available on request.

Testing (v3):
- Run-tested: the patched vmxnet3 files of net as of today, with the
  driver's current vmxnet3_ethtool.c and headers, built as a module for
  a Debian 7.2.12 kernel; VMware virtual hardware version 20, MTU 1500,
  native XDP:
  - untagged frames of 1514..1522 bytes reach XDP; 1523, 1524 and
    1526 bytes are dropped and counted in drop_total; no crash
    (v2 also: 1530 bytes with a VLAN 0 tag are dropped);
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
  - replacing a running program: the new one runs, the old one is
    freed;
  - failures were forced with a test-only module parameter that makes
    the next N vmxnet3_rq_create_all() calls in vmxnet3_xdp_set() fail
    with -ENOMEM:
    - attach, 1 failure: the error is returned, no XDP program is
      attached or left loaded, the interface stays up and receives,
      and a new attach works;
    - attach, 2 failures (recovery fails too): the error is returned,
      no program, the interface is down; after "ip link set up" it
      receives;
    - detach, 1 failure: 0 is returned, no program is attached or left
      loaded, the interface is down; after "ip link set up" it
      receives;
    - attach while the interface is down does not reconfigure the
      device and is not affected.
  No warnings in dmesg. (An intermediate version that used
  vmxnet3_force_close() on failure triggered "Trying to free
  already-free IRQ", hence dev_close() in patch 2.)
- Not covered: the rx_error paths, failures inside
  vmxnet3_activate_dev() itself (only the queue creation failure was
  forced), and VLAN tags other than 0, which the test switch does not
  pass.

Changes in v3:
- Patch 2 reworked after automated review of v2 (Sashiko): on a failed
  attach restart the device without XDP, complete a failed detach
  instead of restoring the old program (dev_xdp_detach_link() ignores
  the error), close the interface if the device cannot be restarted,
  return the real error, change the redirect target feature only once
  the change is done (also when the interface is down), and use
  rtnl_dereference(). It does not wait for VMXNET3_STATE_BIT_RESETTING
  under RTNL, which could deadlock against vmxnet3_reset_work(). New
  subject.
- Patch 4: count the two body buffer allocation failures in
  drop_total, so that skipping rx_error for a dropped frame never
  loses a count; the commit message now says that the non-XDP path
  changes too, and that the drop is not counted against the NAPI
  budget, like other non-PASS XDP verdicts.
- Patch 3: fixed a line over 80 columns.
- v2: https://lore.kernel.org/netdev/20261123124855.1021-1-filzador@gmail.com/

Changes in v2:
- New patches 1, 2 and 3, the rx_error double count fix in patch 4, and
  no NAPI budget accounting for the dropped frame in patch 4.
- v1: https://lore.kernel.org/netdev/20261122002847.616-1-filzador@gmail.com/

The problems were found and analysed, and the patches drafted, with
the help of an AI coding assistant; reproduction and testing were run
on the reporter's lab systems.

Philipp Sudakas (5):
  vmxnet3: clear rx_ctx.skb after a data ring XDP verdict
  vmxnet3: fix the error path of XDP program setup
  vmxnet3: limit the XDP MTU to the rx head buffer size
  vmxnet3: drop XDP frames that do not fit in one rx buffer
  vmxnet3: keep the XDP program across device resets

 drivers/net/vmxnet3/vmxnet3_drv.c | 31 +++++++++++-
 drivers/net/vmxnet3/vmxnet3_xdp.c | 84 +++++++++++++++++++++----------
 drivers/net/vmxnet3/vmxnet3_xdp.h | 10 +++-
 3 files changed, 95 insertions(+), 30 deletions(-)

-- 
2.47.3

