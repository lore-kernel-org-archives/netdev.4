Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607694;
	b=OKQ/gTAUn3SUIkol3+MCyRc6n18Qy3PnSoGjFgj+lr6+4hSJSBfPR3gne/9pbvTnHNMu
	 QFEZi+dGkKM7NuCpDQ96Pbjq0LC7lnIqf9/OhpPuGBJ7P42dEhYhZQtlpHygB6a6+iYyN
	 SrX5RGjx2DsLLiyHrODoOWXGIwEVeCNpyPiJ8npaU3bl5Ipe3fdXAvQVFkUK1HDOP+MtW
	 +1ZBn9a9MnrymbW/MXeKLjLrytxiEjXvHBTfTI/ONn09Kwx4FtBY9Z/aRxsmbIGWHOZWv
	 FHSd/FKXddcMimq88Q/N/H2Aqje4fwW9kCxpnCpIPIIr1+RdMT8oD8c6TPpRbE7Xx/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607694;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=j1lK+KL8jsRcbhgEh1ZN2hINijxdBHiLPsRycSS2iUo=;
	b=CTg2rsWs5+CE+PLNKE/P7njUSHhnXYWZQsPh432rYcSrOfoNa6cAJcNw2aBGLV3WqYDw
	 4qopYz5VhHS4cwedP4nRv5ULfFz41/tR2EuRT8//DODRaz29/IundEhs4EZgQYjV4DQ/x
	 fFsJh9YiBnRxbFoJg9FUqIZHHRK+lD/3HkJl6FpdVWrG0Qqk86gt98zpquPjMCq4h074j
	 qokmlhTKnEli9uzLmGfhgVceSDVEUC17YRh0bh0dFbqyITjpa8sRBVvTx9QaDKKNKkkJD
	 5T73iGCdtsKOFh5UYgg7cJwna34+Zz64GwMEfxTEVCPah6b5K6fzcO5e6tshESH08LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="LbQ/GscB";
	arc=none smtp.remote-ip=74.125.82.225
Received: from mail-dy1-f225.google.com (mail-dy1-f225.google.com [74.125.82.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A809606A688
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 11:54:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A809606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LbQ/GscB
Received: by mail-dy1-f225.google.com with SMTP id 5a478bee46e88-38699cf08dfso6658774eec.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 03:54:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607693; x=1796212493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j1lK+KL8jsRcbhgEh1ZN2hINijxdBHiLPsRycSS2iUo=;
        b=AX2/SgW17onOLBejWOGQGBZs46da9oZ/5VlXhYksjDa+qPgH+Oe7sEfx7CMEpY3hoy
         2DCy+7Mo/W91iej5XoxBog0EbOkMw798O5fDt3+1SSgeXW9OvDxwulcziHopGWMlOrcy
         IRdvQRw4BZEhVb98nr9iPiyTWPMVL3Hcex5141SCsNDdfl/Z+WiKA4cNeeqKHHB8F9fN
         Xj40vv8R/89SK0qX8LSCIvnJZRtkApi4Jhd+pFumn4dUcXyLFwhrnFWdgB1+s0M6VeDS
         BD6DteyIaZ+1t4PVluSU5A2Xv3qdqc6WSPlZGv9JdXRa2GKokHRT/hOd/ugmrAcq0LrZ
         JEXQ==
X-Gm-Message-State: APuU4Z+4BKjAcli0rJD7qfIrYf2gJarx+6fq3t9dUnErZh4xcsS5biGf
	/uvKUqeCTo/9QuSmbfiv5omCHQpcZAspdFbbZCe6C9IdVNF/InJ89NrYvWstwIruw86DAFvTNJM
	KS82VfQjts3SSB7JnPlgMW0+kF/aOY8tjBNSBMo3wARsiJSsheDrO23ZM/T4RwZ7uiHgTypDLbf
	sQ654f7JiUo7Z1noxHTpkD/FftRHJ2bu2uEO9vbUyJHzu+tc18aKZdb2fXDBKWXoTd0AMgFKk3V
	yR4GjN6kw==
X-Gm-Gg: AZFdTZfhEb8tATtm7mLMhW6Cc2tl1EHk38wLck1Bd5gdf9CJ8wWwnHSvhP4zTnF8epU
	bXQH0icSSlbUqegh1h4o7MxBguAoO5rZ/YqobudL99kiwwmxqaYpSJNLjqvY1MN5/KIclUtG1zz
	aQBox41FZVv41szpXDnFREtSqLop8in9ajP0ytokgzhPzccY/JfzUH7MdkB4zfuJc9paEGKSOa3
	mXsEBDoWCmRQ0OEXXkt9oUNYZxHG8GO641UacGEbnOT7uHlYYHVSpVUNcVbDZMn1tBsmYdszzhB
	+HJwCR76yJZRgL7a+nKSPnP3MhrrQa30nJGfrijFeMzMSoyfM4Rc6AZngkqMPuDaWHnE8tf5ozJ
	pPWEQxrn+rpoR1bXYr4aDzyriIB0LpKt+OqMGxC9FomycQmIPCGXR174Ey3Cv3UVh1fE4ogAqnD
	n1Rh/fQoopmLPJU5qYoQCzba63RGpf3h6fEQ==
X-Received: by 2002:a05:7301:714:b0:379:730d:db52 with SMTP id 5a478bee46e88-3857045098amr16729319eec.32.1795607693178;
        Wed, 25 Nov 2026 03:54:53 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-386c22c9eaasm949517eec.10.2026.11.25.03.54.52
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Nov 2026 03:54:53 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3854627c1c8so8089649eec.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 03:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795607691; x=1796212491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j1lK+KL8jsRcbhgEh1ZN2hINijxdBHiLPsRycSS2iUo=;
        b=LbQ/GscBZW03uEFVwxEmtF5TL7kc0O/4yYuH9y3XXIC8pYuMVgBsiUcm7enoZdqgGm
         q703WFe30CHd5Lm4CJ7BCrcz9mCb+EuA6mMJkBgJPVP1Qp+P/CO4LpOGOKw3GNVgpkKJ
         IqaseVwv5mrkOPs+ywob3xtsidoNtdenD1if0=
X-Received: by 2002:a05:7301:714:b0:36a:7b3c:4e0a with SMTP id 5a478bee46e88-3856fd5e4a4mr18499557eec.24.1795607691441;
        Wed, 25 Nov 2026 03:54:51 -0800 (PST)
X-Received: by 2002:a05:7301:714:b0:36a:7b3c:4e0a with SMTP id 5a478bee46e88-3856fd5e4a4mr18499531eec.24.1795607690750;
        Wed, 25 Nov 2026 03:54:50 -0800 (PST)
Received: from H5-S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm56693813eec.22.2026.11.25.03.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:54:50 -0800 (PST)
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
Subject: [PATCH net-next v10 00/10] add features to bnge
Date: Wed, 25 Nov 2026 17:24:24 +0530
Message-ID: <20261125115434.2080590-1-vikas.gupta@broadcom.com>
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

v9-v10:
    - Addressed valid comments from Sashiko
      https://sashiko.dev/#/patchset/20261123100746.1975030-1-vikas.gupta%40broadcom.com
      https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261123100746.1975030-1-vikas.gupta%40broadcom.com

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
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  |  574 ++++++---
 .../net/ethernet/broadcom/bnge/bnge_netdev.h  |   94 +-
 .../net/ethernet/broadcom/bnge/bnge_resc.c    |  164 ++-
 .../net/ethernet/broadcom/bnge/bnge_resc.h    |    3 +-
 .../net/ethernet/broadcom/bnge/bnge_vnic.c    |  379 ++++++
 .../net/ethernet/broadcom/bnge/bnge_vnic.h    |   96 ++
 13 files changed, 3294 insertions(+), 365 deletions(-)
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_filter.c
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_filter.h
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_vnic.c
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_vnic.h

-- 
2.52.0

