Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795222104;
	b=nycrVdAndnDfqOzlA4r9sZyay3uDUkxCHx+y2Jd8at/5zCo/Y8+bvcMhxXlNwmNUlsej
	 ir5E5jmb/FbInIqLes/9gs4JNs/PQSbInSPx6jE/Tk7qJba9HJ4tRN6+NJD1ElI3q8ZQx
	 8ps1UPpFCQ5Hen9Z03u9x/UNoc5QD1HWoZuWrAdKf8tpESCdA1BJneP182RZcQgDF1MoJ
	 HMS1xqClotI2aAwMT7w9/IuBMs8f3t5AErM7qm0MGFxRo9mdDfakj7wWt0uqEJn0Zv7oj
	 lMt+RVlm/wDp4oE8gY3PqOF55LquU3Y+8P582Jw8nsqlL5hTO47TxeIwOzaDmAsFttg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795222104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=//vA9dP3Be1uUm0QkNGBH9GBDtRTEjo14yWfpfoCKZY=;
	b=A22zPr2L7UJpoZ/Ou3QRrVg1+a88BDCDWLiaZ0N8+2S7mM+Ib6HRYnADA7OM5rwD8xse
	 3PM0nhqhSa7aEmdf0DzN5IcwWmKxbWuDZLY8O1A2PmEsdHg8QN9xhygxJTfXpurQ3gOJ+
	 dc+jvcQpreT+M2maH5aZA4QmfMFdTCHRUjmSS/65ODnYkujQXXVlnqQ8P1KGRsSPQD12w
	 TmNV24hipurDIvv7WnUrnipwv1oyt5Qr9jMaZSi2oYDvl3WDAOfSY2FtZvYaX/gNkpI9/
	 flIThHa0CwYzUp69kErvMqgpF1Qg2fgxlBnlbHyoCbakpyTHO8o9QcPbAs7pJ3mCC8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OiPvnQPW;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A681606A32A
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 00:48:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A681606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OiPvnQPW
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso1903787c88.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 16:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795222092; x=1795826892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=//vA9dP3Be1uUm0QkNGBH9GBDtRTEjo14yWfpfoCKZY=;
        b=OiPvnQPWluhVONITmBpo8/JYyA8u7lvnaA4EB2hmBRwBGIWKxZa5IYWlu0bgo3H2Od
         5aXCf6gqXoDY5a3dyF5shRg9+F/yRs9PRwZtLRFjkvde2lnd6Zw4CRlAQh/8pG6p9cUB
         BgFpTJIlCNXgwaXItFl7PvgufLeLNq8N7AOw83wjBoQx9nhLra0WRH21RanlnCPqo3kk
         3fJUK8a76GBp37KWvil+wrJfgmtMbT6SXc3c/SqGimdLp0EKWkQDQDOjqcxnSItVvmN3
         o7e9HKoJiPCe5qB6BrIMzQixMmV1hUj1W64In4oX0whizJzMqT6iJJb8SIZXNwt/0lD3
         jAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795222092; x=1795826892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=//vA9dP3Be1uUm0QkNGBH9GBDtRTEjo14yWfpfoCKZY=;
        b=oIPZmkQMQDaXGHoy3tf8fl2ZWRjIisA6lFnGpLbgTjxmAyC3SkWQJkFVUg5/1V26gA
         qdN+Eys6DqIO5PbsuNd10GeM8t+vgDtUaFjNqLuBrulLaPOvsZ5W5ky9ThmzzDFfVnDm
         SqyI/UbPX4eoRksURDN2pZxnytayztVNAhKZBwvqd1P4Nv3Q90fHw01AQeXUJBTbSS3x
         hVzfbbCa1W7y4IpjULo8uKGmgRybBxz7nlmAlQ+MIUBTlqGyonzBz3w9RXkQrfSalJiP
         LvMK79tZyv08bPJN2JJ7ScHgLZwQ+ealidnEcarRdhzLKT23lrG+qEOlcaa2GpMcbqmF
         EyCA==
X-Gm-Message-State: APuU4Z98MYyRCfEyZBcJc1iWaa/gm4auB+d+cfKIRQTK+4/Y71Lfkmlm
	juxYEmzmgDBPDtCQKmsgz8zpyRxTuwINlasxj+hJsOUQNz+SAz32VlaWpOKxSg==
X-Gm-Gg: AYBFou1V3Hr7GOHV80fEnD9bHFeHLZRA9JL28LsxqGbXN/cZAbvzGBN6t7MPP7L3Mje
	B3wOO1vJ/v4mhxsEGbN1spTyKQhQNPisUDlTTw2u3gYJ9FXp1H+8EXCEd0fbCS0Vp4kzPdm003F
	E2AllfktM5ZrZKLIkTwlA9SL7dH4y/WmmUjawxbxnTiegAk9rOGFlgDtH9cDjRgJi/qRCY9wjP0
	ijTEwlaNIXW+HO9QWZR71FP/imp4HLf3DFjb2JpcPvlrPb6nk0OdZHtXMemqKM1mz6O+E9ILHxr
	ljfP9w+ldhS3N38TCn98AWoFcP8bB3FLcrRqRcD7l329mOBHDsTciKUurhSMpzfosp5cfKLrGJX
	0zoc2EA+N8ET9KBNm0Q9fDWn3NEbWQuq/ehl1xelIkqLOOZKltSqICAXu7A7sB1Vi1J5mPrD0j2
	reXod7NdBanw6QWQ7dcqmE212TW2eOKkz6DcQz34ufosI08fbjr6TPNEOxpowXAw+aLGT0ltoeW
	474zjq2hdoZiXPqHxzNs55eA6nAmXqDLJDm6oOZlLllN0GjwkG+6mXW+iftPDDIex2hMy4Hrf0A
	dRCV5jXw
X-Received: by 2002:a05:7023:b12:b0:141:5281:8a41 with SMTP id a92af1059eb24-1b55687fbc9mr4673071c88.9.1795222091859;
        Fri, 20 Nov 2026 16:48:11 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm11462472c88.13.2026.11.20.16.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:48:11 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Jijie Shao <shaojijie@huawei.com>,
	Simon Horman <horms@kernel.org>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	David Yang <mmyangfl@gmail.com>,
	Herbert Valerio Riedel <hvr@gnu.org>,
	Danny Kukawka <danny.kukawka@bisect.de>,
	Mugunthan V N <mugunthanvnm@ti.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	Manuel Lauss <manuel.lauss@gmail.com>
Subject: [PATCH net v4 00/10] net: au1000: Bug fixes
Date: Fri, 20 Nov 2026 16:47:59 -0800
Message-ID: <20261121004809.1690280-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
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

This series fixes RX descriptor recycling, receive filtering, MDIO error
reporting, TX ring synchronization, MAC/PHY lifecycle ordering, and TX
bounce-buffer bounds in the Au1xxx Ethernet driver. It also adds the
LAN83C183 PHY resume delay needed for MII clock recovery on the MTX-1.

Changes in v4:
- Correct the PHY-disconnect commit message: the attachment path uses
  polling, so describe device/module reference leaks and the stale
  netdev attachment instead of surviving PHY interrupts. Document the
  existing repeated-reset hazard after register_netdev() failure.
- Narrow the TX critical sections to descriptor reservation and final
  publication. Copy and pad the packet outside the IRQ-disabled lock.
  Clear TX_T_DONE and advance tx_tail before dropping the lock when
  submission reclaims a completed descriptor, preventing double reclaim
  by a completion interrupt during the unlocked copy.
- Document that the SMSC PHY driver must bind before MAC attachment.
  The tested early-boot configuration uses CONFIG_SMSC_PHY=y; loading
  smsc.ko after genphy has attached does not replace that binding.
- Add the LSI/SEEQ OUI/model comment and document that the LAN83C183 PHY
  ID is shared with the L80227, which receives the same conservative
  resume delay. L80227 hardware remains untested.
- Add MAC-managed system-sleep callbacks. Explicitly stop and quiesce
  MAC RX/TX before stopping the PHY, including PHY states without a
  link-down callback. Restore the PHY before MAC initialization on
  resume. Handle inactive interfaces and keep failed resumes detached
  with the MAC reset; prevent IRQ-disable nesting on a subsequent retry.
- Move the link-down quiesce wait outside the device lock and use a
  sleepable wait with local interrupts restored. Retain existing atomic
  waits in the duplex-change and reset paths.
- Extend validation with TX/PM sanitizer harnesses, simultaneous TX/RX
  traffic, RX-stop descriptor observations, and device suspend/resume
  tests on MTX-1.

Changes in v3:
- Drop the no-platform-data MAC-address patch: in-tree platform devices
  always supply platform data, so this is defensive hardening rather
  than a fix for an in-tree configuration.
- Drop the buffer descriptor free-list insertion patch: the affected
  list is only rebuilt during teardown and is never consumed again.
  The series now contains 10 patches instead of 12.
- Distinguish MDIO write-completion timeouts from pre-write busy
  timeouts in the diagnostic message.
- Clarify that the LAN83C183 recovery-delay patch and the following
  au1000 MAC/PHY sequencing patch are both required to fix MTX-1 reopen.
  Keep the PHY patch first so its delay is available to the MAC fix.
- Remove the unreachable initialization-error branch and PHY rollback
  from au1000_open(). Correct the commit message to distinguish the new
  synchronous PHY resume from the existing initialization-before-
  phy_start() ordering, and reconcile the reset comments.
- Expand the TX bounds-check commit message to cover plain AF_PACKET
  sendmsg(), PACKET_TX_RING, and oversized software-GSO segments.
- Rebuild the kernel and root filesystem and repeat MTX-1 regression
  testing after the review changes.

Changes in v2:
- Rebase onto net.
- Reset the MAC after PHY/MDIO teardown, and avoid MAC control accesses
  when its clock is already disabled.
- Use sleepable polling for MDIO write completion.
- Advance tx_tail when submission reclaims a completed TX descriptor,
  and consume transmitted skbs outside the lock with an IRQ-safe helper.
- Restore receive filtering before enabling RX, with the address-list
  and device locks held to keep the programmed filter consistent.
- Resume the PHY synchronously before MAC initialization, clear cached
  link state on open, and use acknowledged link/duplex state under the
  device lock. Place the LAN83C183 recovery-delay patch before this fix.
- Add a TX length check to prevent overflowing the DMA bounce buffer.

Testing:
The current series was rebuilt with Buildroot and tested on a Meshcube
MTX-1, using the Alchemy PROM Ethernet-address lifetime fix as a separate
boot prerequisite. That prerequisite is not included in this series.
CONFIG_MIPS_AU1X00_ENET=y and CONFIG_SMSC_PHY=y were used, and boot logs
confirmed attachment to the SMSC LAN83C183 driver.

The final run passed all 11 boot-smoke checks, including 15 down/up
cycles across normal, promiscuous and all-multicast modes, opened/closed
and never-opened removal/rebind, and connectivity recovery. Five
additional device suspend/resume cycles passed: three with the
interface up, one down, and one never opened after rebind. These used
pm_test=devices with freeze and CONFIG_PM_DEBUG=y. The final ping
received all 10 replies, and the kernel-log check reported no findings.
Actual platform suspend-to-RAM was not tested.

An earlier run with the revised TX locking completed 20 seconds of
bidirectional iperf3 traffic at approximately 14.4 Mbit/s TX and
40.9 Mbit/s RX. RX missed-frame errors increased by 10, while TX errors
did not increase. There was no before/after overrun or IRQ-latency
measurement; this test does not establish elimination of RX overruns.

The extracted TX functions passed 432 ring, copy, padding, IRQ-state
and completion-interleaving cases under ASan/UBSan, plus busy and
oversized-packet paths. Tests rejected the original locked copy and a
variant omitting the early TX_T_DONE clear. A separate PM harness
checked up/down and PHY-less cases, missing link-down callbacks,
error cleanup and retry, and the unlocked link-down wait.

A logging-only kernel captured 44 RX descriptor snapshots across 11
stops during duplex changes under incoming traffic. Nine descriptors
had advanced addresses with EN set and DN clear before stopping; all
nine had DN set after the existing 10 ms wait. The reported state with
an advanced address and DN clear after stopping was not reproduced.
This finite MTX-1 test does not establish behavior for every silicon
revision or link-loss timing; no RX reload change was made for that path.

Full AF_PACKET overflow triggers and hardware fault injection were not
exercised.

Sashiko AI review identified issues addressed in the revisions. OpenAI
Codex assisted source and datasheet analysis, code and changelog
revisions, patch consolidation, test harnesses and regression testing.

Florian Fainelli (10):
  net: au1000: recycle RX descriptors on allocation failure
  net: au1000: clear all-multicast mode when restoring hash filtering
  net: au1000: disconnect the PHY before freeing the MDIO bus
  net: au1000: report MDIO transaction timeouts
  net: au1000: serialize TX completion with packet submission
  net: au1000: restore receive filtering before enabling RX
  net: au1000: restore RX buffer addresses when restarting the MAC
  net: phy: smsc: wait for LAN83C183 power-down recovery
  net: au1000: keep the MAC stopped until the PHY link is ready
  net: au1000: reject frames larger than the TX bounce buffer

 drivers/net/ethernet/amd/au1000_eth.c | 248 +++++++++++++++++++++-----
 drivers/net/phy/Kconfig               |   2 +-
 drivers/net/phy/smsc.c                |  27 +++
 3 files changed, 233 insertions(+), 44 deletions(-)


base-commit: 145480b28ca82e9fae789427cc4569e596515a32
-- 
2.53.0

