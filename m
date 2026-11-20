Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795138204;
	b=YGx8hIs4tcfnkNCaplNG3IJvaLl/CWy8NMeKGVDABhv4FO9HAbZKpLybrtM1m2QOD2TX
	 7RhWBjXBo/mwweD7x4CRZaDYHsMloqughzR/Szk1H1PIH5YL2iv7iAOnm1ur4CXZkVvmy
	 +R38f66lFHGxBUBUEWzk4buQBZ8qq5PSa4/VEhjLv4OowrG3EMZ4q9KIZJTVdhLTDPLd4
	 yoMEQ1Or7iXfqzzvukWdxE/N0YhYVz64NtK7ag3HJxbc3RvWD6KUjt9f2tQ7Cxz+emkUd
	 BqQpSskBTMGb9jQkrqbESCwKATExkY2jynIS3tUFR8c0uNpJ8S3VxoiG0AkRTZ3DpQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795138204;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=SgIP6ljdC6GLFeysGvBjfbf2Q7hCOVjRjwrB20YFAvg=;
	b=YMz58nFZUq+REEHfOI0cTQSCgmvwOXSo4fEkDqGtxs3WQsKTPLCVQu6mHAyg9YRxSGNS
	 IILkRD3ZANi9WCqG/cOPCTCG2Da0NB6OHcshI/UjcBErUzMwfp5AxsIXZU+kRWVQ9Op3e
	 ZsabApDnoS6egSRILV/4A80+HfLoXI7U1U5o0T4WPLN9316S1dHXh0pT0Kr4DslcDpxzK
	 SgKX3L1UVcnnkQdE4ab7Ex7pWTVZKR+D2I9xqOz6Ax/z2ptH+ug9YP91wgQUnjCzd8sj/
	 ArjXQ5DUO7BafXVeAFst+G7N1Op3c3ltZz+oLZ2YgJ6gDZQcA2YD7rLD/9BCJb/M44Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WHPjCg1v;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBEE606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 01:30:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACBEE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WHPjCg1v
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3b40f4d4b5dso216863a91.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:30:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795138203; x=1795743003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SgIP6ljdC6GLFeysGvBjfbf2Q7hCOVjRjwrB20YFAvg=;
        b=vxGEOv+0OZiNpVcm+acGT5AloJ2nVsbJNT3hw5Vu0B4JQSI7Fk8HQRDB6SYshQ9p3/
         w5IHrQwhhfOKsXZ4sdyRzmYgMSbKJFAbxWJvmgguC94B1pi5o7PJsPF82ujvLdBC/YZb
         RlpO1qdc35e9pS5V5Y7+gZj46eJyLBB4KpiWn9UFdVWw54R4oqcYoRJJHLpiOMSjun4E
         qv+KegN9u5SHiYaiRP7Xi9b5nHD2RjfBGgyxY4Zitrk4VdiYY+12xCO8VEjzbzzfeVld
         cEN+exRGo4lPXyUmxXBycL2DIFP3YPBbwBEXy0sRhqHBICOAFFpR6xmoEzMK+djcgXre
         D3sQ==
X-Gm-Message-State: APuU4Z/9yUdWVcX+jrNRQW+KSStGhMAKO+Oazgb027EzQPgoX+WtbNu0
	zPs3td87q1oMnVtkZqVVlTO+/huFG9PFtlXS0WAsRBK6iqFbDxeXiJzAgyM1xQF2r7GvKcUY+ih
	azTf9k4rRAASakjJzpRFIJ1v1LfJUFylQp0zUpS3ylp80fy0NtErTAhNyc+Ccq3TelLMiX3z88X
	Drt9gwSdzMp9LMaw6nBJZaGN09W7xt5SGdUPiP5sME7jrcYF3v5/LkbZUZiiYO3SrXx9LT4pitt
	LPjOQ/UguA=
X-Gm-Gg: AZFdTZdBPMt/fuLMmAx+sKvskywUXyXIRPAzr/vgIglDNz5KsYkPDobdLwB6L6U5FVy
	U8OgyIBhWl3sFolw4c5cEDLN5thnemQZn+p+p5kFQshjZ5lpk60QDApoPRq9gNRr1lwgnhzmq3z
	bxYd+aLa9Le5Vs4c7CXyy4z6nvg+Yk9GMDvT5Y8V2Mjy1x7NHXRg4rcmVMqjdD7iZrtbI7EO+jS
	p3MrJFGLgFQwT9uXU84RsS/lvQo69HEU+D4XLqLOTnXE4A1KuKCCJACfyck5BTCM1UCxdlx0ru+
	Oi7Di+CBWgBeqpWQRkrnXsgpzS6Mn2dhOrT2zJakxS7uPgPr/9FN/SEXwwTUtKMXpTGv1GhvtES
	K3iqaWh4eQCAWzfbIFvdAnwn1JofBOveudHTrYycXFguBzFY8s9s79jWaK4knvQByW7AcKyXCNd
	NGmaKhSVNjl2R/mZLRf1EeQLu2x9yAyT9quO7NKg==
X-Received: by 2002:a17:90a:e7d0:b0:3ac:929e:691 with SMTP id 98e67ed59e1d1-3b41c8d5a52mr1110966a91.17.1795138202547;
        Thu, 19 Nov 2026 17:30:02 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41d224ba3sm359962a91.1.2026.11.19.17.30.02
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 17:30:02 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55d32f54d21so7941521cf.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795138201; x=1795743001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SgIP6ljdC6GLFeysGvBjfbf2Q7hCOVjRjwrB20YFAvg=;
        b=WHPjCg1vjPrE+UM7hv+RfUfMS1ZR0fXE79zQRJnhNgpVSB4s57z8E6Kb2DNSkcnRJF
         ftoT4E84KmUAnIJVcAOQMrPPmFv7xF72j7JUvoNR0botERZTzT9T0gN5Hyb2h16JF+nx
         pZuPDpA2Ay9oowYTRadoKUz09SJGU1BA16HJM=
X-Received: by 2002:a05:622a:5e16:b0:55d:1db7:3ef2 with SMTP id d75a77b69052e-55d76aacdbbmr30899951cf.60.1795138200977;
        Thu, 19 Nov 2026 17:30:00 -0800 (PST)
X-Received: by 2002:a05:622a:5e16:b0:55d:1db7:3ef2 with SMTP id d75a77b69052e-55d76aacdbbmr30899551cf.60.1795138200393;
        Thu, 19 Nov 2026 17:30:00 -0800 (PST)
Received: from lvnvda3289.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b1e58sm12806616d6.12.2026.11.19.17.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 17:29:59 -0800 (PST)
From: Michael Chan <michael.chan@broadcom.com>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	pavan.chebbi@broadcom.com,
	andrew.gospodarek@broadcom.com
Subject: [PATCH net-next v5 0/9] bnxt_en: Ring accounting fixes
Date: Thu, 19 Nov 2026 17:29:12 -0800
Message-ID: <20261120012921.2537903-1-michael.chan@broadcom.com>
X-Mailer: git-send-email 2.54.0
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

The main purpose of this patchset is to fix ring accounting bugs
specifically when FW is unable to reserve all the rings requested
by the driver or when there are not enough MSI-X vectors.  This
issue was first reported by Sashiko when reviewing the driver
patches to support kTLS (patch #3 of 15):

https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260810051358.1244418-7-michael.chan@broadcom.com

kTLS support requires the new MPC rings, so the patches touch
the existing ring reservation logic and exposed the issues to
Sashiko.  The issues are real but only likely to be hit with a
large number of VFs, stressing the ring resources to the limit.
These issues were not found in the lab or by users, so Jakub
suggested splitting these out and posting them to net-next.

The patchset includes some refactoring and some related fixes
in this code path.  The driver will now scale down the rings
properly when FW is unable reserve all the rings requested by
the driver or when there are not enough MSI-X vectors.  The
default RSS context is also reset if the RX rings have been
reduced if needed.   Note that additional RSS contexts and
n-tuple filters have similar problems if the RX rings are
reduced and the fixes are deferred to a future patchset.

Patch #6 is new and removes support for the obsolete NITRO A0,
to make the fixes in patch #8 simpler.

Patch #7 is new in v4 to refactor 2 helpers.

Patch #9 is new in v5 to separate the MSI-X logic to a separate
patch after this commit landed that modified the dynamic MSI-X
logic:

af449230bd8d ("bnxt_en: Don't keep MSI-X vectors added before FW reserves them")

The patches were tested on 5750X and 5760X chips using production FW
version 237.x.x.x.

v5:
Added a new patch #9 to handle MSI-X separately.
Fixed 2 Sashiko reported issues in patch #1 and #8 (fixed in #9)

v4:
Improved patch #1 to fix a possible NULL bp->irq_tbl issue reported
by Sashiko.
Added a new patch #7 to fix the ring trimming issue in patch #8
reported by Sashiko.

https://lore.kernel.org/netdev/20261016064427.496944-1-michael.chan@broadcom.com/

v3:
Split from the original -net patchset (patchs 1 to 6)
Updated to address some more Sashiko comments.
Added the new patch #6 to remove NITRO A0.

https://lore.kernel.org/netdev/20261012220827.340998-1-michael.chan@broadcom.com/

v2:
Updated to address some Sashiko comments.

https://lore.kernel.org/netdev/20260928041712.3467803-1-michael.chan@broadcom.com/

v1:
https://lore.kernel.org/netdev/20260831024342.2161156-1-michael.chan@broadcom.com/

Michael Chan (9):
  bnxt_en: Clear bp->total_irqs when disabling IRQs
  bnxt_en: Fix bnxt_reinit_features() when irq_re_init is true
  bnxt_en: Refactor RSS table check logic
  bnxt_en: Refactor IRQs required logic
  bnxt_en: Reinit IRQ when configuring LRO/GRO/HDS
  bnxt_en: Remove support for the old NITRO A0 chip
  bnxt_en: Refactor bnxt_num_cp_to_tx()/bnxt_num_tx_to_cp() helpers
  bnxt_en: Fix ring accounting/validation when rings are constrained by
    FW
  bnxt_en: Fix ring accounting/validation when IRQs are constrained

 drivers/net/ethernet/broadcom/bnxt/bnxt.c     | 522 +++++++++---------
 drivers/net/ethernet/broadcom/bnxt/bnxt.h     |  14 +-
 .../net/ethernet/broadcom/bnxt/bnxt_ethtool.c |  22 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt_ulp.c |   7 +-
 4 files changed, 274 insertions(+), 291 deletions(-)

-- 
2.51.0

