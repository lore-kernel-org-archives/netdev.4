Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795722108;
	b=FVlLPOFkQLz6a1BprAt6ySu81BSoNm4nL0//p7qCS90HFn+zmAXXyDA3Mqr8GNBQO7Kv
	 FTyZU2PbLmLNh+zk4Zj2uBMpv0+YdmZmuVquTNhBym6OjG9g4Lmif4T3inbKA1BbNjz1D
	 aGE7DOCiXBO/CGjsVOEn0f0HkVmY+OkWGS7IJ15AmG8nQeJepm574MQzruqoUqavgsQaf
	 cL/AIgO7mHICZ3na0t2v14je7kUJuLLz9wmbJfe0poTH6l8CO8sWJLm7aKW8fA5tcuCVn
	 zaDYbsDv1kK60mBtTsxaFkKoif8NSUQ4nGOjSy0aI4M+yIJIZWRG0fLRpeBkLFNxg0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795722108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=xD//8q22S/IHhXaJDh0i2cSQrY+KOHbfhhS/puEIHwg=;
	b=jKMy2ZS0EY0Nd3vRtmaQxwxOWFS87X9fsHAS0YjMTMrLIuWNZeybdX0vLvnf1K9Hq8Qd
	 hoMUFy97LTQwZ91tOBPe7s18dzd6AV8vu/bip/SBeP1AQHJCZ61aOgcvDBXWNNzKVZpmi
	 q8ahz3Zb4cHiDAApkAi6ZqaYEz8Q/nFz7g1omcWAMtPSvMeQYv2IWSZT5o0eNOwqagw47
	 /vD/LyfyyeMTDgFTFTzgD1DEl7/CMisvVhPqrBOONkWaXIqMjHfxxf270Co1Hxa0Hgaev
	 gGrLAMemHZftt67o8SSIqoPDINXcxeyzw79abcjyGIRbGavGxGh1Dr6NLLh41AOUBZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RCeh6y8S;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4D1606A31E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 19:41:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB4D1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RCeh6y8S
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdba1bbde0bso2875776a12.2
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 11:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795722107; x=1796326907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xD//8q22S/IHhXaJDh0i2cSQrY+KOHbfhhS/puEIHwg=;
        b=RCeh6y8S/iSse39slkSEVKRWCAUeQVIVyV2XvoVB4x1gfcywimD1lu4U+WKPfGYuf0
         RJ7jr2nPI9ZAsZhlfs1VjWjOguMXusbpBg09cmR6mH7IIHFNpZUA/slwO1D1Y8QgeKT8
         e1ow4lxyKxQeeHSu3WtZ/I2HxbJY+Dw69VTSPayKSeyznj5vNxlY62eDck6UOjnd2pvE
         MBaFq8GWpZDtVOu9g3L1DSmVP8q+vdB34OTlTFrN42M/V+9kbrnJSKWlQhvuAUieRs8X
         0sZDJ2WKuNgJm8ImtNOT7vZNkx7uSDM1gJF614ncwmENSuBCxhCNkmp5Js1TN1sBjc7/
         wMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795722107; x=1796326907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xD//8q22S/IHhXaJDh0i2cSQrY+KOHbfhhS/puEIHwg=;
        b=ozSv7oz9pVzEJcAY+s3QK+pAhL7tHLa53W6mj6MCqK1rKbRiupdkcmHxLZSqPq2kdY
         IUfi3wuHR5VU7+85b5klCG3DwykD/s43E9O/0cVLauKpBBquMMe/1NsMD/cNM6A75JB0
         560K+dB+ADqFSTUIhMKZt/rKKAetrmRfqh1YGEK/Q7sIgpFc6Z2Rrd2DIu5Y1rThIUhn
         o8BKMXnptRGhphTF2OBcF20ueZEwphjy+hITDJH+qyWmeTiUHSHZ89/7KAKAocak/Q+G
         0YmX1e8lpnmFA7DUU1sQAqkvRRdIxzYcF59ucHjVfk1l8Zb6WOblzUGOazoeRnsydJVT
         z4vQ==
X-Gm-Message-State: APuU4Z/F+JPb8w+guwEmMoGTzLjfIc5oRKoyS/jInVEmeF1+CvVgwtPc
	f/XqXdW5Luzq1KswiK4iPblm+LzSdwNiiMHR73kSVhfpB7lvKJwUgYNPeKo5YPO5qf0=
X-Gm-Gg: AZFdTZevfj3m23N9P4pv41gle6sGbLjPsixFGKZ3PmnLwUE+2EF8hFd7u3OOMMEKNHN
	X4DuO9ZvjhO/i+xRiSGS7bAPr6bFDyjZLE76xQ1xf1RKXMXyVxXPqDh6k45XpiMPn8PTJp0zxGj
	zp29ImuSVCMWBA9h30rC9mrOjCEskLB4gSsWiea5FglVECzJ1t5CoZhNB3ismn1A5VHbPft73Xv
	goyXU21AcEpjmbLbsGs9zSUUvu0UKHj1IEkaGEpANchfLk4Bhjvro9p50xYUNOy1mLTUUuWFqX+
	TD094ImyclaigkWJW1oFo8jnWpjNTlUO4CFh94cIoaf+FJ/7VtXzgNN/VKJe2TPtLUam6r85W1W
	97VW2J8uFazPOtoeQ380klY/qgZ7FWAr2dBFSbDlJWYr94KPS7TxqL1WL4bo1HN5pN8nJT1jPiq
	PCOy5E0P7IP2Am6JZ/v9TkL6WXw0Jr38mwYJ2YYegjxrnI6mk2Ac3zqlQYAoGy6SbZ1J0Us/vf5
	aANh9G0t4OQ5ObR5Y14M+Cw+KLNOgMUcwSrcjMZ8ZUIGrauw15IxxLGUDjPbxN+agydmDU+cbNo
	6XGVFN/x96hZ/SE8Mw==
X-Received: by 2002:a05:6372:a757:b0:3e1:d43e:367f with SMTP id adf61e73a8af0-4014e94d908mr19509109637.73.1795722107105;
        Thu, 26 Nov 2026 11:41:47 -0800 (PST)
Received: from x1.hs.local ([2601:600:a482:7d70::5e59])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873442863sm11370474b3a.43.2026.11.26.11.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:41:46 -0800 (PST)
From: David Westen <davidlwesten@gmail.com>
To: netdev@vger.kernel.org
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	M Chetan Kumar <m.chetan.kumar@intel.com>,
	"Maciej S. Szmigiero" <mail@maciej.szmigiero.name>,
	David Westen <davidlwesten@gmail.com>
Subject: [PATCH net v3 0/2] net: wwan: iosm: fix S3 resume by re-binding the driver after it
Date: Thu, 26 Nov 2026 11:41:41 -0800
Message-ID: <20261126194143.32283-1-davidlwesten@gmail.com>
X-Mailer: git-send-email 2.56.0
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

On platforms where S3 cuts power to the WWAN card, the modem boots again
on its own while the driver still treats it as running, and the modem
can't be used after resume until the driver is re-bound. Patch 2 detects
this on resume and re-binds the driver then. Patch 1 fixes a
use-after-free in the cleanup, which the re-bind would hit with wwan0 up.

v2 unbound the driver before every S3 suspend. That runs the cleanup
against a modem that is still running, and the AI review and my tests
showed how many ways that goes wrong: the modem kept writing into the
freed MUX buffers (DMA faults with a strict IOMMU), and timers, tasks
and MSIs could outlive what they use. Fixing that properly means
reworking the cleanup. v3 instead lets the modem lose power, as it did
before, and re-binds the driver after resume, when the modem no longer
holds any of the driver's memory.

Changes in v3:
- Re-bind after resume, and only if the modem rebooted, instead of
  unbinding before every S3 suspend. Nothing changes where the card
  keeps power in S3 (AI review), or for s2idle, opportunistic sleep and
  an explicit freeze or standby (Maciej).
- Dropped "cancel the ADB timer on cleanup". Closing that race for a
  normal unbind needs a larger rework of the cleanup; patch 2 keeps the
  re-bind out of it, and out of the MSI race the AI review found.
- New patch 1.

On the ThinkPad X1 Carbon 6th gen I tested on, S3 takes the same suspend
path as s2idle, and the modem crashes before it loses power. That is
where the CD_READY in patch 2's log comes from. The s2idle series [1]
removes that crash, but the modem still boots again after S3, so both
are needed there. They don't depend on each other.

Tested on an XMM7360 in that ThinkPad:
- With KASAN, lockdep and a strict IOMMU: re-bound and connected again
  after each of five S3 cycles, also with wwan0 up through the suspend;
  no re-bind after s2idle; three unbinds with wwan0 up and traffic. No
  reports.
- Together with the s2idle series, on a kernel without debug options:
  the same, and s2idle connected again without a re-bind.

Not tested: the XMM7560 (MUX aggregation), platforms that use the D3L2
path, and hibernation, which this series doesn't change. Known limits:
- On the D3L2 path, interrupts from the rebooted modem reach the driver
  until its resume callback runs, as without this series.
- A modem that stays in its boot stage after losing power delays the end
  of resume by up to 10 s before the re-bind.
- For a normal unbind, the cleanup races with the ADB timer and with
  MSIs are unchanged.
- Re-binding three times or more without a power cycle can leave the
  link without downlink until the bearer is reconnected. That happens
  without this series too, and doesn't affect S3, where the modem loses
  power.

Patch 2 builds on commit 0b6f6593aa8c ("net: wwan: iosm: Fix hibernation
by re-binding the driver around it").

[1] https://lore.kernel.org/r/20261124172505.41520-1-davidlwesten@gmail.com

v2: https://lore.kernel.org/r/20261119042714.505405-1-davidlwesten@gmail.com
v1: https://lore.kernel.org/r/20261116031148.333990-1-davidlwesten@gmail.com

The investigation and the patches were done with an AI coding assistant
(Claude Opus 5.5). We wrote the patches together, and I ran the tests.

David Westen (2):
  net: wwan: iosm: free the MUX after the netdevs that use it
  net: wwan: iosm: re-bind the driver when the modem rebooted during S3

 drivers/net/wwan/iosm/iosm_ipc_imem.c      | 54 ++++++++++++++++++++--
 drivers/net/wwan/iosm/iosm_ipc_imem.h      | 18 ++++++++
 drivers/net/wwan/iosm/iosm_ipc_imem_ops.c  |  4 ++
 drivers/net/wwan/iosm/iosm_ipc_irq.c       |  3 ++
 drivers/net/wwan/iosm/iosm_ipc_mux_codec.c |  6 +++
 drivers/net/wwan/iosm/iosm_ipc_pcie.c      | 37 +++++++++++++++
 drivers/net/wwan/iosm/iosm_ipc_protocol.c  |  3 ++
 7 files changed, 121 insertions(+), 4 deletions(-)

-- 
2.56.0

