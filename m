Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795188520;
	b=1cY4Ce2H1rRYQgGgku7WDodzA+oLqtZWVPgYZt+Gk6xz7OkBnhod0z1RDN3NSCUMgg7s
	 1CTkqNmBWowXMFcB+SOGnyg6Rtr3nx//YTEE6ZEbGmr6kp7n8Rk1qF+2+LyzFhcy+IA82
	 uFZdi7qLkv8BZ/WsOcInYkU3vc5dbqaJtj25gFcBXQa0+BgWccktvJuYWFVgCKbZWhClY
	 W45sUBkV9nlq/xSau/fvSm9JNKU6j12QGglvbuLdZvRbUHUoTu/5xEgo0PINy0Sk1eUgY
	 hlUU1Qflztblodr9+f0dyj0P8yloGKadsbGmMmupd7qdAWv01XzJVK90u/3Eg9nIjfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188520;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=koDbTlOdxHjgcEYC8XUBotAtLLbm8SOR/Bu5+8z9BKI=;
	b=OPrcqDX3muz8r7iDJjdTK+7Fe9iO/ykmNfJoVcR4iwd3x/IGNgmDs9t0F8yONYe4hMfR
	 +wyUD91vObG+Bn5QU3YHnAyBAnP9+bYTOfVwiLmDuuX+GLmrEABvJrxOq7ERlpsN3FJOM
	 oJStpeXjTks85N/1VImRxDr+cMOMYcPCtOz6j5548nxBpxnaTYKcyhO8i2HrXYv1m5ZIk
	 QBcmmmFFapoh29bLWb32WtqABbdTURc5KZID8ogtIhN8UhLqutV1y1JCr/pQKiCLhMLAX
	 MZYSRmWDVfYXbqB1CvoTgPEE2FOnbMGMzIpiVaRNaOJOkZqd3LQGvdIM9DSNWfgjyMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EZsscIWB;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDB7606A33D
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 15:28:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDDB7606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EZsscIWB
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8b68e59ab33so809775b3a.2
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 07:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795188519; x=1795793319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=koDbTlOdxHjgcEYC8XUBotAtLLbm8SOR/Bu5+8z9BKI=;
        b=EZsscIWBCVof3n5OvddIh9fzbpVzbR3VVaH4g/Yl0n5DkRHoMYPg0OCwecW7LlEYiD
         UJTH3iTvauxBb9Ep3T2t5YiGFtC2064yIgx0jAICvqrMWfx7t/GRAUxmgQjcveNeJkkp
         yjMBh86t8MHQFOI/jDBn1JtqyAJUPj0RRSYuPkTLl1X04vMvygqDvK2RghqTingqe93u
         4qa3WNf1Vavo7iD7dARzf+ntljxL8zfOUzpxDDaAx5B6G3l6JgW2Ad2nqoZR6m6khWSX
         bPrOV4cpnY2l5eIslbW3Da5NCb+2NxQf/UWuq6GaEX7nudL4ELQtaOZtY+i1a5pL8Sjr
         tPjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795188519; x=1795793319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=koDbTlOdxHjgcEYC8XUBotAtLLbm8SOR/Bu5+8z9BKI=;
        b=24fBTvSnW/gfa1QxD4YabR6oDTmCCG3eQ39S9lfMjoNdpAl3PVqhnJNXxM1SWs6V2D
         UIKbvnADefeWgOdYbCSPo93LirqTbGpcr4MU8iqrEYzMtVByALkmVUCCN3H9226fQbC3
         owE80GhTUWjCzGsIyOjyOrOOQYlHLbEzLq7kgRtaf+40V3u+cyivMn/bGEfuOxyQwVo6
         7qClGIE7ahjmbp+N7iGHmQVnqddmcqeQnGOdkin97smuDxyN0mKdYVx9SLKE/EuOZ/m5
         DCbP3csyo5gN6LhPPlpXuf4sP7hmxe6CjJcuDGUS1fwFtTR5ZdLk5Fg4Tde5oXhQt8mM
         WWng==
X-Gm-Message-State: APuU4Z8eGmXPL+k0teYvEHxJUHceZR6FENQ3cnR0UGJcS/bhLqEwDsNp
	uLUz1/88msqcPa7yHJvjXtwgEc7KbmsnvX3B693I+dMIKIITkeA53gKiuZnFLnl9MBQ6sK75cQc
	GrbEl
X-Gm-Gg: AZFdTZcDM842wc56OV/wSkL/TanP/h6d+mCQrV12GUEE8kaWArKqX7mF7bR1x19bCmB
	LBJxlia1VqBPvOW2+TSz5UWg5e4UoWnR0w7i/ufQUvhhTqxmYASEtoDfYf47J94afwFOb6g/9Ds
	21qUbAh69+aJWyJl6gx+GUk8ey07mO+oywBYmvuOCYJxCNsHd2eP1JokGqzL2sAfbBk0pDtBwbE
	4IWeiPpKbpZXCFHOv8zJVKWbbdH2ax9mn2N+pTqrqreU1OaXWrmkcZmfenO6AyCle7Lc36dBcrD
	OQ7Ih3RiftMr7Y9p6WEkSw4uAfyWwZg8HMgjvPmwqbiz8K/Llv7xYirZ0EJR9gtgQnJdXn/WN1C
	/SPo2W2z8iGtysJ3nngWYBWk43iHN4Z4wcGfLCQKPX15jWjG6eDppiV/WiqeNfzfRB/fxP/wsUw
	1eIXyjAdfJARZbwr0M1A6s4tZXkgcErYdDBkhK8qmGvBjXo6P1WlFbdo3w3EXBrmgwY0BUBWMkc
	3N4eTsJLuO5gljyMZjsfsh1B7IAsiM0F4RZzkdYfDReMT/gX18i3Tt6S224Ow/0ecws59A/lcj9
	S485+ZlBCODfEFQXcBe+ljGok6sBgjLcqWw0qxSZwA==
X-Received: by 2002:a05:6a00:1741:b0:89e:37b0:d1b2 with SMTP id d2e1a72fcca58-8c87c48163cmr3444564b3a.37.1795188519117;
        Fri, 20 Nov 2026 07:28:39 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:8::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343fba6sm1632937b3a.38.2026.11.20.07.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:28:38 -0800 (PST)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	selvin.xavier@broadcom.com,
	kalesh-anakkur.purayil@broadcom.com,
	linux-kernel@vger.kernel.org,
	Joe Damato <joe@dama.to>
Subject: [PATCH net v6 0/5] bnxt_en: Make RING FREE more robust
Date: Fri, 20 Nov 2026 07:28:22 -0800
Message-ID: <20261120152830.699712-1-joe@dama.to>
X-Mailer: git-send-email 2.53.1
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

Greetings:

On two production systems, I saw the following dmesg pattern:

  NETDEV WATCHDOG: transmit queue 0 timed out 6073 ms
  Resp cmpl intr err msg: 0x51                  x20
  hwrm_ring_free type 1 failed                  x12
  hwrm_ring_free type 2 failed                  x8
  AMD-Vi: IO_PAGE_FAULT  x3

This suggests that, for some currently unknown reason, TX completions stall
and the netdev watchdog fires. The driver asks FW to free the rings, this
times out, but the driver ignores the possible failure and frees ring memory.
Since the FW didn't respond to the ring free command, it is possible that the
FW is still DMAing to the memory which was freed.

To address this, this series makes the driver stop DMA before freeing ring
memory when the firmware did not answer RING_FREE.

Since the RFCv4, I found a third system that hit this repeatedly:

  NETDEV WATCHDOG: CPU: 35: transmit queue 0 timed out 5459 ms
  hwrm_ring_free type 1 failed. rc:fffffff0 err:0    x64
  hwrm_ring_free type 2 failed. rc:fffffff0 err:0    x32
  hwrm_ring_free type 0 failed. rc:fffffffb err:1    x64
  hwrm_ring_alloc type 1 failed. rc:ffffffe4 err:4
  hwrm_ring_free type 1 failed. rc:fffffff0 err:0    x44
  Abandoning msg {0x51 0x3e35} len: 0 due to firmware status: 0x408100
  nic open fail (rc: fffffffb)
  DMAR: [DMA Write NO_PASID] Request device [47:00.0] fault addr
  0xffffa07ef000 [fault reason 0x05] PTE Write access is not set

This case differs from the first two in a few ways, but this series would have
still helped:

 - The ring frees fail on the close path and again on the error path of
   the reopen (bnxt_init_chip()), and the device then writes to memory the
   driver has already unmapped. The series stops DMA on both paths.

 - The interface came back up later, the watchdog fired again, and the
   cycle started over. The host logged 79 DMAR write faults in about 20
   hours. Patch 4 breaks this loop by refusing to reopen after DMA has
   been stopped.

 - The firmware answers each RING_FREE about 5 seconds late, after the
   driver has given up, and finally reports an error in its health
   register. Patch 2 does not treat these late responses as success because
   their sequence ids do not match.

In this most recent case, I suspect the hardware is faulty, but the driver
shouldn't hand memory back to the system while the device could still write to
it.

In all of the above cases, the IOMMU caught the error. If the system had no
IOMMU or the IOMMU was in passthrough mode, data corruption or crash would
have occurred.

In the future, this could possibly be extended to make recovery automatic.

I wonder if Sashiko reads cover letters and then avoids flagging stuff, let's
find out. (Unrelated: I wonder if anyone reads cover letters).

Sashiko: you pointed out a few issues which are real bugs but were not
observed in production and I am leaving out of this series which only
addresses an issue I've seen in production.

In particular, I am leaving out:
  - the per queue paths (real, but not observed in production)
  - completion and nq failures are not counted as stuck (all rings fail in
    prod, have not observed only nq failures)
  - The polling path in __hwrm_send() probably needs a dma_rmb (sashiko
    pointed out this pre-existing issue that is probably unlikely but also
    unobserved)
  - bnxt_resume, bnxt_fw_reset_task, and bnxt_io_slot_reset all call
    pci_set_master without checking the DMA bit

All of the above was outlined in the thread about the v5 [1].

Thanks,
Joe

[1]: https://lore.kernel.org/netdev/avIpEpoCYvLHYl3j@devvm20253.cco0.facebook.com/

v6:
 - Commit messages across all patches were updated and a new patch was added
   to the series, patch 5.
 - Patch 1:
    - Return the errno from hwrm_req_send instead of always -EIO.

 - Patch 2:
    - Respect BNXT_HWRM_CTX_SILENT for the new warning.
    - Read the valid byte with READ_ONCE(), then dma_rmb() before reading
      the rest of the response, including error_code.
    - Only check the response for HWRM_RING_FREE. HWRM_SELFTEST_IRQ and
      HWRM_RING_RESET keep the existing behavior.

 - Patch 3:
    - Count a ring as stuck only when no response arrived, not when the
      firmware replied with an error.
    - Don't stop DMA when BNXT_STATE_IN_FW_RESET or BNXT_STATE_FW_FATAL_COND is
      set.

 - Patch 4:
   - Add BNXT_STATE_DMA_STOPPED to BNXT_NO_FW_ACCESS() so HWRM commands sent
     after DMA is stopped fail right away instead of waiting for the timeout.

 - Patch 5 (new):
   - stop the ULP around bnxt_reset() and leave it stopped if DMA was
     stopped. The silent reset after a VF config change leaves the ULP
     running.

v5: https://lore.kernel.org/netdev/20261106191423.4194081-1-joe@dama.to/
 - Switched from RFC to actual submission
 - Patch 4 updated to use an un-used bit to make backporting easier.

v4: https://lore.kernel.org/netdev/20260925174404.2789072-1-joe@dama.to/
  - No changes to patch 1 or 2
  - Patch 3: reworded the message logged when DMA is stopped, a rebind is
    what recovers the device, not a firmware reset. No functional change.
  - Patch 4 added which adds a new bit (BNXT_STATE_DMA_STOPPED) that is set
    when DMA is disabled. When this bit is set, the device requires user
    intervention to bring back up.

v3: https://lore.kernel.org/netdev/20260923210744.3406861-1-joe@dama.to/
  - No changes to patch 1
  - Patch 2: Don't poll for the valid bit as Michael suggested.
  - Patch 3: bnxt_hwrm_ring_free now returns -EIO instead of stopping the
    device, so the remaining resources can be freed and the remaining commands
    can be sent before stopping the device, as Michael suggested. Note the
    switch to using pci_clear_master in this patch instead of
    pci_disable_device. This was done so that the normal shutdown paths can
    call pci_disable_device without generating a warning.

v2: https://lore.kernel.org/netdev/20260922182405.1290749-1-joe@dama.to/
  - No changes to patch 1
  - Patch 2 from v1 dropped
  - Patch 2 in the v2 now checks the response and logs state before giving up
  - Patch 3 in the v2 disables the device to stop DMA before freeing ring
    memory

RFCv1: https://lore.kernel.org/netdev/20260917233218.1160001-1-joe@dama.to/


Joe Damato (5):
  bnxt_en: return the RING_FREE status to callers
  bnxt_en: check HWRM response if completion never arrives
  bnxt_en: stop DMA before releasing rings the firmware did not free
  bnxt_en: refuse to open a device with stopped DMA
  bnxt_en: stop the ULP around the reset task

 drivers/net/ethernet/broadcom/bnxt/bnxt.c     | 141 +++++++++++++-----
 drivers/net/ethernet/broadcom/bnxt/bnxt.h     |   2 +
 .../net/ethernet/broadcom/bnxt/bnxt_hwrm.c    |  47 +++++-
 3 files changed, 149 insertions(+), 41 deletions(-)


base-commit: 00f445721c7f0e48aaff9813cfe1c065c6eb3b71
-- 
2.53.1-Meta

