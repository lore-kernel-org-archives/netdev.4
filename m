Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794838037;
	b=4y7e1zh6muHB7Z5BuOXVVYJhvkcThLBX23TRzEa4bLxrdGgWbaA3SysmOzwzjz0t8YsQ
	 24+uSUUTWtq8is0Dr7DbOFVznGmQiJfWbjJB4u8deuh7w6REK2cQySkHWxFZNfkrr1mLK
	 //0+LFN9kkUUcORhVTpsVFQ+oGvbAihuWzh7SluWfiLp7PbQ66pTKdJ1vmj/j/4Mct559
	 4dxVMrBjp16yYXKGf22FlRUcyEnn1nI3AtVLnGSH78GRK5zUOUROt8qLRJmagDtk2n66j
	 PySZem/yGaACxhjrhxHr3kpFGi6yJdWXeW91wkDpX8ba+pgaOlGCnCOUpBUWJNd++tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794838037;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=VkhSOeU2iPSFm4yiqVr/PAV71Y3lGX2cZjUnVH0y7oQ=;
	b=UdFKDiUbJHEBoih8q81vcMOTj6zLBUrE8NSprJ97BAs+D+i3J4HdGa12DV4Wd1x7sI0u
	 a37p3Kklu8o8Z+lJE+n6s1N3vODtQZDUvcbGguFTs3yl/W4MwogeqWI53iQYcUwkedftK
	 0tSWbxtKlLvlziQauKxWiNbeObaqWYKfLLLEDfK61imCqyEVLVtj7qpnJkAR8OtzE+lHM
	 DjHfvo1cwChDJ1XHkPntoO6XqaKJzCWqTE5dLSxnuZBtEjpG7fv2HYVqNUVYTO+459KxR
	 0euqfIUYsqWWUfoYLzZf+Jw3PiVtAtk3rkqxAQ1y+pFz47ncjMIYqleeqoEnKTeWMpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=CLQh8XTt;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D01606A331
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 14:07:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92D01606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=CLQh8XTt
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so3021969a91.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 06:07:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794838036; x=1795442836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VkhSOeU2iPSFm4yiqVr/PAV71Y3lGX2cZjUnVH0y7oQ=;
        b=DtB2uL5UbznSbdGwSpsxBAPRHffpseR7nhkE0DL8ILy4jN5fTmSAaT+F/7F4Vr6cpf
         f0OdMIX38YJBUsSDYykAWquiyBth91YQllqt5pe4cpErV2iS9mK0ZerNgENUio6yJr1U
         D+vMdt7q4028HrOrd65uFyEctDUWijurzxH7f5++UvB2fp0062IriBJZdbdu7MmgwVFO
         wCPJyucVGJ26zxa/fywYUKkB34jdGXK6bM+npuSKMx/b77rGg9MoG2i6u1sid3CMXAO+
         mpxmUHePXM6rIZPq8FFpCI0UaYVR+9r/8aBXMZcmohWmmt37pWMEo+rWMnKYzNXdWvOI
         e2+g==
X-Gm-Message-State: APuU4Z/vbIDxKP2XLj1mxWqDqsJmkw6M8EP/q2Mjh9WcxJOP2+J/lUpl
	USAfyTcL5Hw6CMCXFN+I/KIdCKd/dEsZvPJ/dCQjdIhedgabp6OCufsMWCQ+lzRvgZViMv7BPUt
	Vb++oR19VYnBhk94p0JoDf7v1YTAXLZHqrZYtEaL9pv3AW4rxLCiBVuzGAWwLEy7mOPLJD2JGbh
	1gW8IgWYqfJwJd+aagIy5uuYtV077wFRdFpu4en7/7KyaWOVbM3NPAoqFLMLHcjRH2Og2nWW32w
	vavLDQrOQ==
X-Gm-Gg: AZFdTZeLCCeM6sYkB119DHA2AZ4W+BqBGy7YHZYBVIAuDBqWdKGSbNXRb/CZXrPEiu+
	diz2cNKdysjptWhfV72d2w4Suu9EF/vfmYk5qzoNrU19MrnLID61R3WPYqmQFa3lJQKA5eItLYH
	7SA+K7r2WCWrlI4m05w71g3vilzoIPIPCP29+WLPx74Y14zmhASEhZf/fMhJvEGu5UkA3K/Lcg6
	6UJCA59nmTRn7sXomkwoj26lRPEsm18N/HyAtfPsZaiuLa67JzatpsErUCSQEegG3PDeneSFti9
	WPZLPe8ORyzngX23Yxp7kUSB9zIqghX+2tFjKWmLiXYYAqoLWfG4nBdcVIbaxHI24qHEukmUBZi
	S/lEc2jtVg+IauRAT5/9TmPkTuXmxmw9Kz8l1dR9dyF/QU30mXi9H1xt6SBInWjLvui3eIxOyf1
	3tQTS/7MjfAjfCFxoyI8HoRtlF1YQq3HkzsKmV
X-Received: by 2002:a17:90b:3c4e:b0:3ab:afca:1d79 with SMTP id 98e67ed59e1d1-3b1b0b6672bmr10353767a91.21.1794838035461;
        Mon, 16 Nov 2026 06:07:15 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1ae96f125sm11687463a91.4.2026.11.16.06.07.12
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 06:07:15 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso4372246eec.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 06:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794838031; x=1795442831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VkhSOeU2iPSFm4yiqVr/PAV71Y3lGX2cZjUnVH0y7oQ=;
        b=CLQh8XTtuRIH2uCz6Ki+TYo6Q2hFtqXegJNIb/j9086mAlkkS9Yd5Tbu83qQ1+0IDR
         lkspVmeFMGqxZbZGE5FoStu6SeKQWXztGIPn/zoeLkqc0bdAVh+8MxutQN7vrWT/C6eS
         rwSVRJeaBA7MytOC3v5Qidf4G23cSTRxvk3to=
X-Received: by 2002:a05:7022:258f:b0:1b0:430d:d81c with SMTP id a92af1059eb24-1b503112636mr12241010c88.25.1794838031310;
        Mon, 16 Nov 2026 06:07:11 -0800 (PST)
X-Received: by 2002:a05:7022:258f:b0:1b0:430d:d81c with SMTP id a92af1059eb24-1b503112636mr12240886c88.25.1794838029111;
        Mon, 16 Nov 2026 06:07:09 -0800 (PST)
Received: from H5-S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b98e5sm35251269c88.14.2026.11.16.06.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:07:08 -0800 (PST)
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
Subject: [PATCH net-next v8 00/10] add features to bnge
Date: Mon, 16 Nov 2026 19:36:43 +0530
Message-ID: <20261116140653.1685797-1-vikas.gupta@broadcom.com>
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
 .../net/ethernet/broadcom/bnge/bnge_ethtool.c | 1145 +++++++++++++++++
 .../net/ethernet/broadcom/bnge/bnge_filter.c  |  838 ++++++++++++
 .../net/ethernet/broadcom/bnge/bnge_filter.h  |  137 ++
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.c    |  192 ++-
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.h    |    9 +-
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  |  556 +++++---
 .../net/ethernet/broadcom/bnge/bnge_netdev.h  |   94 +-
 .../net/ethernet/broadcom/bnge/bnge_resc.c    |  163 ++-
 .../net/ethernet/broadcom/bnge/bnge_resc.h    |    1 +
 .../net/ethernet/broadcom/bnge/bnge_vnic.c    |  379 ++++++
 .../net/ethernet/broadcom/bnge/bnge_vnic.h    |   96 ++
 13 files changed, 3282 insertions(+), 360 deletions(-)
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_filter.c
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_filter.h
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_vnic.c
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_vnic.h

-- 
2.52.0

