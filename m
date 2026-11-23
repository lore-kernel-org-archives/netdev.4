Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428479;
	b=n6ktFUgB4nuDkizePyiG0eFfN+rysKOr/csE6qE22XcXeODgOHoJmajD5Xl/eOaDGymf
	 IMv4qFjFIAwLPMoqAUOzPqRLckatJmAc/4bNLdQ06d0w9vU59XeEQ14yXeZ4KaFcJvFdC
	 RDcjYFMMHiO+MDBvbSKZQspcovQDUlHT2Y2xeplUmvnWYtVHpzYaqaRk43hyR7HTIg9ct
	 kMFvbYg6Y97ehfvhmORJYmfo1YMTUYHI45t0R6QGcfjHWGzs4aFsx3rmduV+xXZt8yT33
	 8tJKXcJLabizTGpiDv2NNgf7SrQDMbDBYL9FZKJ+3YbnchCX2/9nGeaMSm29NaS6DJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428479;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=qp8AGd60G0fwr6K2rygdNI5NkaIRDQZvwIb0BjBfWEQ=;
	b=bT+wNblLXznTFxcjgE5lW93AlVfRaurMv9fuxzqCPPd6Ds/Pr1bPYi582h2XH8XhMMrf
	 iJ8DORChXJEvh7WGdEMsfnJV1QkXmPHw69r6sGVYZfenu6DM+WybmbJ/ulrDITD2WFKZf
	 YBDGwKtzxaqhxLnRoH8kdeo2GrP4WgZkPd7YXaDQZfqUIwm6dvmfjpa/V/5S1piDaFK0g
	 vQgivijJFZf+c2ulcl0iH3s1P+6eXwowOJ9X1z17TGy6PIw4C80ceFIVRThONKw44IRUQ
	 CocgLBh8+iXNhIK/0XEEPyeLNaji84LNFqogUegV1+btvibf48XlcVNywR5vNVqjyGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=NhWXnRCL;
	arc=none smtp.remote-ip=209.85.222.98
Received: from mail-ua1-f98.google.com (mail-ua1-f98.google.com [209.85.222.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D9D606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 10:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9D9D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=NhWXnRCL
Received: by mail-ua1-f98.google.com with SMTP id a1e0cc1a2514c-996eeadfbeaso1722362241.3
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 02:07:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795428477; x=1796033277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qp8AGd60G0fwr6K2rygdNI5NkaIRDQZvwIb0BjBfWEQ=;
        b=gxXu5SFQJICKPSDczeUR0ZTdWfrzjZ/7GqMPmWORxaL0MkpW8uKJz8BmgJGyVLRGEn
         Y7PR/sBOiAk54J9EYG/WzsOVuU3wnv7MK0FLBk+Pn+OLOc+IeKkynua3bQIIeyiOTaBf
         yijMXvijY7/KYq1juW3UKrthomuNZZxx3gg0fjw50nmVSubTCLB/gmBzf12bvQX8qf02
         4rkuRzvJwpRN8r5p9FMmoFGtiorwhG/1rq/i/TiCwLjTUmvPeOyDIM33nAx6McVh+4+q
         F+F3cIZBWvXU/et4C1aZg087T21sk74nRWFg/ELkNwrS8FkxLEdZkWLSVApxeiw368s8
         rGuw==
X-Gm-Message-State: APuU4Z+1dVH/epGWF6LsSn1U9d45b1DSz+EyApo1WE7PpicOSCdFVpEW
	rurxXLDzs6Kqs5BcABmljZgDmYZygBnNZdW6mLVtqRGxkTrL8lcGbO+nYEpZNIJ5mGgVTGyxroo
	4oa3lXCIiuiZ+Jsie52mGdu2y3HFtpGFLJJIgFBR+Rc3ID2ZVRORznV3UPGfqTPalAluSB1hQHA
	rLj+KbTQ6lQ8wdu4ifWRJNiLUTrHqJdJJwlNHwTHBPpJtxmqVb7tolpKXr0W5tK4m/bSIacDeWV
	zx2uIOdKA==
X-Gm-Gg: AZFdTZeh5dAiATpbijyxE1vdhP9TPopaFTl5sY5lyjOAcU+xEkOOdQpAjf/v1xKvLId
	Y6rEDUCT1CR6sm6slo1tvLQp6yysh0SwqEpVcHPM5HjQOdrtM73mkrU2NxXzQxB8oXT0gVOsaSD
	cgNHIIJfSEJtSDCjZrtSlWUiOaVIZeVEPNXVOYg06AzJC5syvNrMx+DVSoSuiTWGoc0IDe5MaGr
	dsrP/p1foY2roeAbMxXQw5hWxy3+7o4WvyKUA6rFSvZeHO5U1m4Q7VliqHHROjGFs4FKgoKJnpR
	lSGpQ+Ho2FfiNWFRKVl0qSYFOgiWjeuTXUkCZylGxHqmhTwAaLM1w7Oy4rjSImqM4KL30oa0gus
	0mKVGItumBhX3BS5zKArh83dTba6gYZTC8vzlo4vFmtTCNJiV1sEfA3wXdHocOre7eCZR0ViIKk
	AvAMiI78AWSzbSIubqfXA4fM/liBG0J/uUWRLZ
X-Received: by 2002:a05:6102:f11:b0:7d0:6cf3:d8f0 with SMTP id ada2fe7eead31-7d7393ff876mr5517216137.18.1795428476763;
        Mon, 23 Nov 2026 02:07:56 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-99e6e1b3904sm1111971241.19.2026.11.23.02.07.56
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Nov 2026 02:07:56 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386a65fca25so1586011eec.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 02:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795428476; x=1796033276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qp8AGd60G0fwr6K2rygdNI5NkaIRDQZvwIb0BjBfWEQ=;
        b=NhWXnRCLnL+495SFMWbsVCErMbGN5dbDTqA3KRkytEOXZgs/2ewSUS2jOQu/VJVRhT
         5AlnREgStHFekv1zHv7nd6DYhGFKAilYrtZZKIladuVdUOfmAmy2SSI1l7FMP4otqlRx
         +D67qUGY+WdSyhDPK5mW4Q0nQhvn5tqwgICeg=
X-Received: by 2002:a05:693c:65c1:b0:386:9cae:abef with SMTP id 5a478bee46e88-3869caeeec6mr7677512eec.36.1795428475370;
        Mon, 23 Nov 2026 02:07:55 -0800 (PST)
X-Received: by 2002:a05:693c:65c1:b0:386:9cae:abef with SMTP id 5a478bee46e88-3869caeeec6mr7677483eec.36.1795428474712;
        Mon, 23 Nov 2026 02:07:54 -0800 (PST)
Received: from H5-S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm1084358eec.9.2026.11.23.02.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:07:54 -0800 (PST)
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
Subject: [PATCH net-next v9 00/10] add features to bnge
Date: Mon, 23 Nov 2026 15:37:36 +0530
Message-ID: <20261123100746.1975030-1-vikas.gupta@broadcom.com>
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

v8-v9:
    - Addressed valid comments from Sashiko
      https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116140653.1685797-1-vikas.gupta%40broadcom.com
      https://sashiko.dev/#/patchset/20261116140653.1685797-1-vikas.gupta%40broadcom.com

v7-v8:
    - Addressed valid comments from Sashiko
      https://sashiko.dev/#/patchset/20261114074742.1484603-1-vikas.gupta%40broadcom.com	

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
 .../net/ethernet/broadcom/bnge/bnge_ethtool.c | 1140 +++++++++++++++++
 .../net/ethernet/broadcom/bnge/bnge_filter.c  |  839 ++++++++++++
 .../net/ethernet/broadcom/bnge/bnge_filter.h  |  137 ++
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.c    |  192 ++-
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.h    |    9 +-
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  |  560 +++++---
 .../net/ethernet/broadcom/bnge/bnge_netdev.h  |   94 +-
 .../net/ethernet/broadcom/bnge/bnge_resc.c    |  163 ++-
 .../net/ethernet/broadcom/bnge/bnge_resc.h    |    1 +
 .../net/ethernet/broadcom/bnge/bnge_vnic.c    |  379 ++++++
 .../net/ethernet/broadcom/bnge/bnge_vnic.h    |   96 ++
 13 files changed, 3279 insertions(+), 363 deletions(-)
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_filter.c
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_filter.h
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_vnic.c
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_vnic.h

-- 
2.52.0

