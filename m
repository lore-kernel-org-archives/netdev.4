Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795115046;
	b=rPm4FoIEvZK5AWUptLP0PawEaYiyrpjpGJLWx7rtbgT3CW7Gb1lt1C+TRXplAG4HwHFz
	 /wiCtI7stoGoeCxGncq+7+hVoqlzY3hpgUGmeDAyHWXJB/CmA1O83M4IgcWk4TLC3NnuS
	 +lTSqrbx1HfxNibg0M1iKMBjvKUVVmIZDWBdv+e90VAXnt7MBcilqqnD62fBxm7YbjUSg
	 MUyirNw3O6fBRB4sRDzGN4xnI2+GiSqS60rbI2IwR0rQCuFBoHgcIQfrj3y/wmRb0mP1Y
	 eiZtWHSR+WCgCW01LL4UrtdRgf2do5iqt77+bHoG8IHMIlJUyz5vPsALXV9MjTbRp8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115046;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=z/CbJTcbRp/glPkwB0cSK2vtZBuPIO6Xzchj8qNgZMI=;
	b=rXqusub+bU2oRaAXIjd31VH+UkiXN4tbIBpEs+m55Nb1s3DqfSkGjr9n2QlcGde4Wcx5
	 mQSiMyxq5ABsN+cJa2KP/A05i0P1oNI+Y62k+68R0cLYHCVpuX9r/osb9u5mndEpRXV+x
	 fTdVep8R8bZZhMIUCPSpM+z3t//ZCItaZ01gb5VzH1vPl450drFCj2eeqKq5FvOgyATf+
	 tAegh/YfPxGM5jxuZ7Q+1nxDImElKkNC4VSpaCmPfRFkke2H4QpzFbJn5SIWZvQjzQL6p
	 vnZWnMoAxLIAitShoq2Nhti5KLSlzf3PpzjDKIEMdYzjchqZhzb04YKgJfUqcQMJLnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=e7VSaQqF;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A3C606A324
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 19:04:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98A3C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=e7VSaQqF
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cdb15cd8558so44090a12.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 11:04:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795115045; x=1795719845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z/CbJTcbRp/glPkwB0cSK2vtZBuPIO6Xzchj8qNgZMI=;
        b=Er9i8u+edsbtvkwBii9rnNTts5HnYFK38PBKSjUnQdu933QkpcqJHqIjCIUQBVX5x+
         WwcAjF3m46Ns8gVLtK0LOZ5sTa1Ey19FcHzXTcP/dhTThXtEWnuYv0YYpyYvzqCSZ+z6
         1hQpHZ35SAQbDsFi8SFHCX5IUPgQSU9/Yt92Tl394AtNhtL7G0pKSz67w+RVhBWV1Nuj
         2LLB05tJksT7Hb0AQyrvQ3TlFpgnZIfq0e/Smk/g74gAfj/CHqzdYw/HPgFtApDZybMe
         F937FenUjUsDGNixKYCiH6F7txyqRxIep0OjMgnWldW+olKXFp0rninLGPSZ1aHFLuqL
         7uJw==
X-Gm-Message-State: APuU4Z+w74gmBDQjVzrLAEr4lynggOuqiCOmsnMu7rjKQfGHPHtjitZS
	8+oTx6CykY2ZZvpqRINJiomuvIKKB++UfGrlzUX6K8XRrh28XZTEsvAPeBi+Q7vsMbWPZk2rsiH
	COH41cB1GcIjGybKx5s5nYV9s44/dWJDQ3AgKvBdtcOfHGevwmnkfMKcXdUnizPAwo+vYt3/0MY
	15xohotSmrt4NFDfIL7jLSbyBhrNSymRYgx5BR46Nrzc2W3bz/2CMAfB5SY1bBSM2MoAi4dj8tS
	DYtSfEnzgtv36p1
X-Gm-Gg: AZFdTZeXAhxZd3FynZMXAoVz+eNyLNva6UyoQuMy7647YYZWfxsolZotW1MqL3dmy4z
	VwmX52LWoTVhLmPFZKHEYDvUAiAEjnAIF1LRZet4fBZLHmEAZjoP9i219BRMhtriTJLsGWvJODJ
	+ZDWPp19v7UpsvtPidY8eN9UcVsGoNBVdHAFgY9Vktzhr2z7PKHK2hKqGUsxmCBAuA/011DiC3x
	8U0VU63Kzx4+mFCd7oCDiOyuVRJwkYETR36jY4h0MbGJsv/NJygAIFzTuJwCjoe7owEOR2IBboa
	QFMVxpianQJbFCSyRzTkW2BUTWrzd0kj8bzpR32EGLTLrT2gLFv6Nvfe1jGNIC/q7DDmKgRSUTs
	cVjUMxjgzdz/JUsQGcoUN0Ee7MMKj0TVKfuSxJQuTxmUmjL5hGw6nYr/9gF3TF/u8vPvuC+vu6W
	xSJI8h9ONSc2HUF4wS5dNWFpQbwQCTb9WyVv/Sn3+2
X-Received: by 2002:a17:90b:2c84:b0:3b3:c18f:d8e3 with SMTP id 98e67ed59e1d1-3b41c98a445mr202510a91.20.1795115044852;
        Thu, 19 Nov 2026 11:04:04 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b411775fa6sm996809a91.1.2026.11.19.11.04.04
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 11:04:04 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-920f9885cb1so2341406d6.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 11:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795115043; x=1795719843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z/CbJTcbRp/glPkwB0cSK2vtZBuPIO6Xzchj8qNgZMI=;
        b=e7VSaQqF9wOIuLoMc3wT9WHlKQqwIgdgzbpcagLnw3lzDMXNhF0DPmWeDLBFQgizqs
         lrq3tOdAdQI1BgmJRTLz4uUcdi+eQMzybBQHhJAy8Ar1CCRbRPJUQUUP63grx/KYSasd
         4c3Fcl757kNx6ymSAomIa0FVpNtYN6NdHMVVY=
X-Received: by 2002:a05:620a:460e:b0:93f:5677:9950 with SMTP id af79cd13be357-949ba9e7547mr87160485a.53.1795115042975;
        Thu, 19 Nov 2026 11:04:02 -0800 (PST)
X-Received: by 2002:a05:620a:460e:b0:93f:5677:9950 with SMTP id af79cd13be357-949ba9e7547mr87153585a.53.1795115042438;
        Thu, 19 Nov 2026 11:04:02 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3f7cf3sm24063285a.31.2026.11.19.11.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:04:01 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v7 0/6] net: dsa: b53: Preliminary fixes
Date: Thu, 19 Nov 2026 11:03:42 -0800
Message-ID: <20261119190348.2317702-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

This patch series contains fixes to issues reported by Sashiko on the
b53 PCS bug fixes being submitted, and then some more that came from
code review and testing.

Except for issue #2, all of the other issues did trigger in testing and
needed to be corrected.

Changes in v7:

- reduce the series from eight patches to six, following Sashiko's review
- move the BCM5325/BCM5365 mirror encoding fix ahead of the other mirror
  changes, adapting it to the original add/delete paths (now patch 5)
- combine v6 patches 4, 6 and 7 into patch 6 so destination ownership,
  source reference counting, register error handling and initialization
  are introduced together, without intermediate regressions
- introduce b53_mirror_init(), its declaration and both setup callers in
  the same patch; explicitly document the dependency on the encoding fix
- drop Jonas' Reviewed-by from the combined mirror patch because its
  scope has changed substantially
- keep the other four fixes unchanged; the override-register fix is now
  patch 4, and the final tree is identical to v6
- validate both mirror patches with ARM built-in and module builds,
  strict B53/SF2 driver compilation and mocked register regression tests;
  no switch hardware or suspend/resume hardware testing was performed

Changes in v6:

- patch 3: drop the commit message paragraph claiming that deleting an
  absent entry now returns -ENOENT, the return value is unchanged (0)
- patch 4: describe the b53_mirror_del() capture port clear as a
  cleanup rather than a separate fix
- patch 5: add a Fixes: tag for 41af38324341, which covers the 2 Gbps
  set path on GMII override registers
- patch 6: do not propagate the ds->ops->setup() error from
  bcm_sf2_sw_resume(), setup re-registers the devlink VLAN resource on
  resume and would return -EEXIST, leaving the user ports down
- patch 7: document that active mirror rules are restored on resume and
  that the patch depends on patches 4 and 6; verified the mirror
  register offsets against the BCM6368, BCM6362 and BCM63268 datasheets

Changes in v5:

- resolved build warning in patch #7 by moving b53_mirror_init()'s
  declaration into patch #6

Changes in v4:

- Return success when deleting an ARL entry that does not exist per
  Sashiko's review
- Restrict the 2 Gbps override bit to BCM5301x and BCM58xx
- Restore mirror configuration on resume, moving mirror initialization into the reference-counting patch
- Propagate SF2 setup errors on resume and disable the clock on failure when WoL is inactive
- Add a patch fixing BCM5325/BCM5365 mirror port encoding, including CPU port bitmap translation

Changes in v3:

- patch 2: added Daniel's R-b tag
- patch 3: mention in the commit message that deleting an absent entry
  now returns -ENOENT, including when the lookup runs out of space
- patch 4: document that the patch also fixes the clear of the capture
  port field in b53_mirror_del()
- patch 6: reference count the mirror source bits per port and
  direction, ignoring deletions without a matching reference
- patch 7: new, harden mirror register programming:
  - reset the mirror capture and source control registers at setup for
    b53 and bcm_sf2, since not all switches are reset
  - check and propagate all mirror register read/write errors, only
    taking a source reference once hardware programming succeeded
  - use the source masks rather than MIRROR_EN to decide whether the
    destination is occupied, and write the destination before the source
- log failures in b53_mirror_del() since it cannot return an error
- patch 8: new, fix the mirror capture port encoding on BCM5325 and
  BCM5365, which use an 11-bit bitmap (CPU port at bit 8) instead of a
  port ID, and translate the CPU port in the ingress/egress source
  masks as well (verified against the BCM5325E, BCM5325M and BCM5365P
  datasheets)

Changes in v2:

- collected Jonas' R-b tags
- corrected logic in patch #3 to propagate -ENOENT, memset after the
  debug print, translate -ENOSPC to -ENOENT when deleting


Florian Fainelli (6):
  net: dsa: b53: initialize the jumbo frame size register offset
  net: dsa: b53: fix the SRAB grant timeout check
  net: dsa: b53: clear stale state when creating an ARL entry
  net: dsa: b53: use the correct override register 2 Gbps bit
  net: dsa: b53: fix mirror port encoding on BCM5325 and BCM5365
  net: dsa: b53: fix mirror destination and source state tracking

 drivers/net/dsa/b53/b53_common.c | 209 +++++++++++++++++++++++++------
 drivers/net/dsa/b53/b53_priv.h   |   4 +
 drivers/net/dsa/b53/b53_regs.h   |   1 +
 drivers/net/dsa/b53/b53_srab.c   |   2 +-
 drivers/net/dsa/bcm_sf2.c        |   4 +
 5 files changed, 179 insertions(+), 41 deletions(-)


base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
-- 
2.53.0

