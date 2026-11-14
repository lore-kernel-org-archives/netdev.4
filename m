Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794642474;
	b=AS7FVfOekCXt8O+2vrih/t3vem7s/Isr9uVstPTuwqFarMKkzRWia1t3Whu4IfGdZT9m
	 6WVkEOHA8zJVaUzzuUyW2qxtQF7X/jpdh1l7P1gluDUWTaCjcAEn6VnAZi/FUVJuALuh0
	 Lq7AMG1wy0b2dNxjpFe02InmUnLGDNotWxGEfAm/MuHCvF3JI1ow3q30sxADR9vFDfEgi
	 fJF3lHd79LccPI5QwRRFizaOd0DVwdeET0bbkihdwtCrwz6RVe+f/+XZXo1y/mCb6+3q4
	 eMyfXZENaZt8PVI1NW0Y2LLTDoHcrOXvDxUsa8MJ3bqzu+qJm9a57ObKzHKyr1mNtcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794642474;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=gVvQnD3Ao7aYmekOSgIv2NqBMYbDg5gxg5h/9henKKg=;
	b=tnTa8Aj6eGBsp9eWlTI38e1JazhO4OlOy/+t/qiOZhLtU0JF65QFJ/XDr9pVnucp77BI
	 wdxdBIdHPR5uXc4SfNJdCF9E+PIOieI7zEXFl/noBLk5icCwiGxLIO5tMbAKM2cuHf7wI
	 lWCCuNtMbOgVceF+lOef0v9rJDW6O/QK/z8DR8ZMDQburfp4a4FCkTDpIbPXwU9KI0uHy
	 E2DmVs9AsfbdvVDSxJMDbYzthgx28PXRPVQ24kCfvxeFSfr4/2+fNkUopKA3xcm1cC90Y
	 aezT5iIX+vV7jy23PSP7mq6U4IO3imBXp2AZJh0LJ7yKs2attTGkMFanNeLk+lxzeJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gHvL7rzS;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57921606A32E
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 07:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57921606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gHvL7rzS
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso814225a12.2
        for <netdev@vger.kernel.org>; Fri, 13 Nov 2026 23:47:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794642474; x=1795247274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gVvQnD3Ao7aYmekOSgIv2NqBMYbDg5gxg5h/9henKKg=;
        b=cQwtp22FEXbyB//ZpEX2oVwr+Jld1AJfUoRL1bHZyJdLaRmDzg8TpAyQF7WWNk3DXe
         bhVLsDoiq1+51b1yh37PAiMt6pL1frtgd7lfV+11ALNjCD+IVyCqf+psyZKc4t/ZRClL
         Q60Fhga5+XdKy1oSuSWFMt8dI2KXzPB9cyohtPtcggQFN6Cef0e82cJJnt/8rkfe39i0
         M6gZsmC+R55/ihF9nkXHcWbrabSdIh/eQnx9jCS1yCbofz+iK8YN9eCOJVKTnS/MlWen
         N595zTb47egBWee1TDz9cl+Rs1tTo7vS3r77Yc4wtsya69xI7WmCCjQKIBG/XpIk0kTP
         I9dA==
X-Gm-Message-State: APuU4Z91oEVHdlxsxAMax9ZQGP1/goO9nMUzRzZKLYk6G2kIqI+4nfon
	8uvV2bXkHJA01C9wl//hSaviV/P9SxvQbmKuBF8PxnV2dk7IY5wVPZG42Y7U6zYK1Hq0DK1NjX1
	ga9PB8lF+2t2yQZUHv5dGjwuulrWa6f/Px8PV6NwkTMWwoOz6VBx+K4f9MBVc3Ki9Dsvqg8ZrJv
	6CX7bkUCgFzPmwQx2/9ZH8qrVNQmELkNCvt51dp5255n8mVxv3RAtxPBOBJRE5bnvOrn1twKIT8
	tBE/Hn/OQ==
X-Gm-Gg: AYBFou0q/m1/AbeC/f3dbF+0z4ldQXah7X7xC8MoIuM6ENV4Z8VCPn0U9Vpvgq6mH3B
	6zB+M9DFtqeCOIWBBXKiU+VXZtyXWPUV7K7uSoniRTBfAk/PH5DyrNQa6RAAlegrT2BkEtmTIQS
	JWmIpg/IM/R5o3ycgSfV8lSb/RXyG2rJFY3yc5zuXPzKI6Uc7zcIzVkTUhpZa9ZTWBBAU9LlOJX
	W7i2KSukdLXYv+N1vJLyAjR7WhW3DoAXSGZBtyio7oAh8f/1L25c0S0in0F2NjUq2eeDS0FMTza
	nTJ6VE2rXe/IiSEBuVJ8oEbfEcOMK5LGUxw7Xn78zl6U4K6nc1FNaEoM2iPs1r6yq+cU4UCRQvV
	tejYrZJQvUfsB1mone4rNi/uicEmP8th1PTa9FXbEghh3khKD7PRne7a6jqz7BC7hP+Fb8YpCZB
	yBoEfLt9NwYebypTcl0n7g/j0TKnYmcxqxBSpq
X-Received: by 2002:a17:90a:c88b:b0:3ac:8741:e2e4 with SMTP id 98e67ed59e1d1-3b1b0a4e341mr4833753a91.52.1794642473673;
        Fri, 13 Nov 2026 23:47:53 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1ae9bbffcsm6820354a91.8.2026.11.13.23.47.52
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 23:47:53 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-139b62317d0so1531928c88.0
        for <netdev@vger.kernel.org>; Fri, 13 Nov 2026 23:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794642471; x=1795247271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gVvQnD3Ao7aYmekOSgIv2NqBMYbDg5gxg5h/9henKKg=;
        b=gHvL7rzSjHDEsPCzQ8C7iyia6L8UAg2IZWCht8BdRJpeDU0Mm3CrECO+VrUamO4F8T
         NqvuGNjy24pSsIbTlgyLYzR1XnJo0ImEoUVRLsWpus25YJz7uN5GeBF+f422LYP6BuNp
         AnfMGAa+8aIKySfEo6Yo00jL57RKfyzTflQQA=
X-Received: by 2002:a05:7022:f97:b0:1a7:216d:157c with SMTP id a92af1059eb24-1b503175931mr7756859c88.34.1794642471245;
        Fri, 13 Nov 2026 23:47:51 -0800 (PST)
X-Received: by 2002:a05:7022:f97:b0:1a7:216d:157c with SMTP id a92af1059eb24-1b503175931mr7756793c88.34.1794642470355;
        Fri, 13 Nov 2026 23:47:50 -0800 (PST)
Received: from H5-S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm23620914eec.21.2026.11.13.23.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:47:49 -0800 (PST)
From: Vikas Gupta <vikas.gupta@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bhargava.marreddy@broadcom.com,
	rahul-rg.gupta@broadcom.com,
	vsrama-krishna.nemani@broadcom.com,
	rajashekar.hudumula@broadcom.com,
	dharmender.garg@broadcom.com,
	ajit.khaparde@broadcom.com,
	Vikas Gupta <vikas.gupta@broadcom.com>
Subject: [PATCH net-next v7 00/10] add features to bnge
Date: Sat, 14 Nov 2026 13:17:32 +0530
Message-ID: <20261114074742.1484603-1-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.52.0
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

Hi,

This series adds ntuple filter, RSS context, and flow steering
support to bnge driver.
Patch 1 is a pure refactor (no functional change) that relocates the
filter and VNIC related code into the appropriate files. Patch 7 drops
the refcount usage from L2 filters, also with no functional change.
The subsequent patches then add the ethtool commands for configuring 
ntuple flows and RSS contexts.

Thanks,
Vikas

v6-v7:
    - Addressed valid comments from Sashiko
      https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261106093524.838341-1-vikas.gupta%40broadcom.com
      https://sashiko.dev/#/patchset/20261106093524.838341-1-vikas.gupta%40broadcom.com

v5->v6:
    - Addressed comments from Sashiko
      https://sashiko.dev/#/patchset/20261103123651.442893-1-vikas.gupta%40broadcom.com
    - Fix inline keyword use in C file.

v4->v5:
    - Addressed comments from Sashiko
      https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260928061307.1172344-1-vikas.gupta%40broadcom.com

v3->v4:
    - Addressed comments from Sashiko
      https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260917064548.773334-1-vikas.gupta%40broadcom.com
      https://sashiko.dev/#/patchset/20260917064548.773334-1-vikas.gupta%40broadcom.com
    - The patch count drops to 10 now that the HSI patches have been merged.

v2->v3:
   - Build fix.
   - Addressed comments from Sashiko
    https://sashiko.dev/#/patchset/20260908093053.2596020-1-vikas.gupta%40broadcom.com
    Below Sashiko comments are not valid:
     Patch-8: 
                Comment under bnge_toeplitz().
                 Explanation: bnge_toeplitz() is not used for aRFS.
     Patch-9:
                Comment regarding bnge_clear_usr_fltrs().
                 Explanation:
                  Both bnge_clear_usr_fltrs() (only invoked while the
                  interface is down) and bnge_grxclsrule() execute
                  under the netdev instance lock, so they are
                  serialized and never touch the filter list at the 
                  same time.
      Patch-10: 
                Comment "Does this direct dereference of the MAC
                header need a linearization ...".
                 Explanation: ndo_rx_flow_steer runs on the RX path
                after eth_type_trans(), which already accesses and
                pulls the Ethernet header.

                Comment Related to bnge_cfg_ntp_filters().
                 Explanation:
                   bnge_cfg_ntp_filters() runs from bnge_sp_task(),
                   which holds the netdev instance lock while executing.
v1->v2:
   - Build fixes.
   - Addressed comments from Sashiko
   https://sashiko.dev/#/patchset/20260814011435.194631-1-vikas.gupta%40broadcom.com


Vikas Gupta (10):
  bnge: restructure VNIC and filter code
  bnge: add NTUPLE/ARFS VNIC
  bnge: add helper functions for multi RSS contexts
  bnge: add RXFH ethtool support
  bnge: add ethtool support to manage RSS contexts
  bnge: remove refcount from L2 filter
  bnge: add NTUPLE filter infrastructure
  bnge: add NTUPLE filter support in ethtool
  bnge: add aRFS flow steering ndo support
  bnge: add cpu_rmap support for IRQ affinity

 drivers/net/ethernet/broadcom/bnge/Makefile   |    4 +-
 drivers/net/ethernet/broadcom/bnge/bnge.h     |   28 +-
 .../net/ethernet/broadcom/bnge/bnge_ethtool.c | 1145 +++++++++++++++++
 .../net/ethernet/broadcom/bnge/bnge_filter.c  |  838 ++++++++++++
 .../net/ethernet/broadcom/bnge/bnge_filter.h  |  137 ++
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.c    |  192 ++-
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.h    |    9 +-
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  |  551 +++++---
 .../net/ethernet/broadcom/bnge/bnge_netdev.h  |   94 +-
 .../net/ethernet/broadcom/bnge/bnge_resc.c    |  160 ++-
 .../net/ethernet/broadcom/bnge/bnge_resc.h    |    1 +
 .../net/ethernet/broadcom/bnge/bnge_vnic.c    |  379 ++++++
 .../net/ethernet/broadcom/bnge/bnge_vnic.h    |   96 ++
 13 files changed, 3276 insertions(+), 358 deletions(-)
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_filter.c
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_filter.h
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_vnic.c
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_vnic.h

-- 
2.52.0

