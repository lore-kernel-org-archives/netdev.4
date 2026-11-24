Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514897;
	b=YXn64U+s7ax7lBtpRPfC9YmhSnimFXhRF2CZQwRI30UNZPQ3XeuQI9qLeqiwKHA+1svy
	 8DrA6cnsroZQVBPIe74txzLWCgT0m2GrQd8RWSO3cokSXT/Vs8U5AduBl78eLVoAb6elT
	 d1yoKseaJPEB1Nh65+otVUs6dXM9alfJ34uFDZxoTdiS4ngTu05MasejJLT1sUZQJ0M3V
	 3X/LwFW4/W52PR4D1FmdrIQyISR0xvAwJ1lujYfBncl9yJ5JgOf6yz6fh/HXiYTVqcRP1
	 b23Lcx/Iw80uYaykdZT4dnNstp6KNRB3orOLPjmH9JA+OxBfEPmYcPl7nMtUHs5E3KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514897;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=2kR+AtKBdq8y6iVbWORBPJQjt4HuMFIisprY6swBHsQ=;
	b=TCa6pwXJ52itb8y6SdMon+rPYK//W2LJU2IpRV+4UXj51A0CaJ/ufKWXtNGmLWt9vTHe
	 guzXMm/1wp0r+1lmXIzoR3uRqbKz820HJJFmke2HThdxnNJ9xfSvsH3haKy7fIWlay49g
	 uHB6NZfvzCW1hRN37qPOz11cGFWYJ2WFuoV1Rv77CySZMQ1AysyL0FIk0G5+LP5NLHZZ6
	 pHWPr83GBVZidETBHl+1YFR39BKtbbsGyDlnSMoUSxd+EkdwadSNJ7TWNUrSa7DJryTaT
	 xc6Nir8smrJnSclzXimwCAQTb2a+2Yn5uP/axyD2/Wf/yYbMsnEjhxQoMXqc4v3cqBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HSdvmux9;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD6A606A33D
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 10:08:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCD6A606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HSdvmux9
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3b4cd193b50so394248a91.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 02:08:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795514896; x=1796119696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2kR+AtKBdq8y6iVbWORBPJQjt4HuMFIisprY6swBHsQ=;
        b=CywOnKFbI7LkVC5mavISjWIXQCmhgFBmgNeS8S5bsnbxBHAK5IHKNpcq/codw7frf4
         Bla+RBpFYg2Eeh6UUeof7dFAKNzOehIfQDdB49KC/g+f0Ld5i8lsGpIg7tABZl0LAJ2C
         stqUAfQs4uP5Vb87X9Ggga3+a+2OLO8c5Yx1hovSwOMUY82e0ONoXb3Hj1Q9AbIEKA3w
         YbQDOW6wq86tN6Z5qtIqh86yUHU7Er7ZWRULGToBY5sz6hpi9qJ5d4uoG81petp9KWbT
         bE0Obpvzvw1kd2HUVybJR2Sjr+qQTQZyEMWO7Fj4M8/zma0kLtVKZYL1fz5ILxlW8/r5
         IGxQ==
X-Gm-Message-State: APuU4Z/HeKMdrCQgZM+W3ic9Eef3fk5Y+vN093N/DDTuV2ZOHchF4NWW
	OuK85XYSPuont61HmMURH10xuvQYdhmqIY8s6uT7Va8sXGBX0e1e3T2TqAYNsF3RdN08/HLukKl
	Va9099BljJlQNEOeRfJk2a3cHf1nuNhR10u1eOUFIMbq0W5NnaBQTOJpkJRV587agh3VVqy4ZKY
	RWA2ksDjGuosjG+CGZNWKO2+dpwgzubbOds7c8CgIt6KRQh70q2Vq2ZXwJOlr+mr27r2w3ZzgaX
	+bqQIV1XVLpMbxkUA4wvg==
X-Gm-Gg: AZFdTZfqdByTaQY9nXZc+43mM+SCYmROYjkMboExc9wPLl4XJtSzK3qPjiMPqgGPPCV
	bwDFz0KJBMh12P83bfjtNPCQIVFN4gt9pk8Qm6H2M2gLiVswjWy560xZJzTJhwmADpgqwq7jAOL
	zpKHFuFnyeLHF92n4TwFj+OEgwaumWW/HRfNUZt8RN9bCZMiQg/OhCe+zxSKN97MqS/p0ys1BYc
	RpGPrMyHMd4EEC23r0nX0KGxg7Cf8i5XY5WWEsbBOcTdzYWxTWvE5T1JqV/SqLKHiki9u2ZL61S
	jQWsmAQ6y+FUF8lPeIlqduyLgF7lbUMGtAjvskwFNjY9JWT3Jkt4CeCrrthyj/A8K9Rv6D320tB
	SWFBudF89t8R7ou4LBYu2P43e+OjwDNy0PqM403eyo2fu/yX3CDUdV0j583bL3z6NlzbOhXU6ib
	8uYeMy4buPqYLiZ6ANfu9dd0CCdw1seYm+G6I2OxYboqFvXA==
X-Received: by 2002:a17:90b:48d1:b0:3b1:832b:bb3d with SMTP id 98e67ed59e1d1-3b41c9817dfmr12776512a91.57.1795514896076;
        Tue, 24 Nov 2026 02:08:16 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b40625d66bsm10989608a91.4.2026.11.24.02.08.15
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 02:08:16 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3846d5f54c1so5451229eec.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 02:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795514894; x=1796119694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2kR+AtKBdq8y6iVbWORBPJQjt4HuMFIisprY6swBHsQ=;
        b=HSdvmux9LO4hjYlvoM7zoyiJsfybCw9nHmSArUCyXoZ4h4iv9Kpgjz9Cavij+CKbps
         Z3wa4vJZLt9P92RINQvqvkW5wlRXwQtVjiIKz+REWqOZcjFBUSjZBtD3hvYxk1yuhuzl
         WetOcjYr9wCt3BeGUtHxc6EpcqPo6MLAJD9JI=
X-Received: by 2002:a05:7301:929:b0:376:37a2:87f3 with SMTP id 5a478bee46e88-38570f25262mr13497721eec.31.1795514894490;
        Tue, 24 Nov 2026 02:08:14 -0800 (PST)
X-Received: by 2002:a05:7301:929:b0:376:37a2:87f3 with SMTP id 5a478bee46e88-38570f25262mr13497688eec.31.1795514893697;
        Tue, 24 Nov 2026 02:08:13 -0800 (PST)
Received: from H10-S2 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm49931870eec.26.2026.11.24.02.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:08:13 -0800 (PST)
From: Ramakrishna Koduri <ramakrishna.koduri@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vsrama-krishna.nemani@broadcom.com,
	vikas.gupta@broadcom.com,
	bhargava.marreddy@broadcom.com,
	ajit.khaparde@broadcom.com,
	Ramakrishna Koduri <ramakrishna.koduri@broadcom.com>
Subject: [PATCH net-next 0/2] bnge: Add ethtool register dump support
Date: Tue, 24 Nov 2026 04:07:49 -0600
Message-ID: <20261124100751.179270-1-ramakrishna.koduri@broadcom.com>
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

This patch series adds ethtool register dump support (`ethtool -d`) for
the Broadcom BNGE Ethernet driver by implementing the `.get_regs` and
`.get_regs_len` ethtool callbacks.

The dump support covers:
- PXP registers
- PCIe signal integrity and PCIe Latency Histogram statistics
- Adaptive QoS TX and RX MBUF registers

Ramakrishna Koduri (2):
  bnge: Add HSI definitions for register dump
  bnge: Add support for ethtool -d register dump

 drivers/net/ethernet/broadcom/bnge/bnge.h     |   9 +
 .../net/ethernet/broadcom/bnge/bnge_core.c    |   3 +
 .../net/ethernet/broadcom/bnge/bnge_ethtool.c | 168 +++++++++++++++++
 .../net/ethernet/broadcom/bnge/bnge_ethtool.h |  19 ++
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.c    | 178 +++++++++++++++++-
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.h    |   5 +
 include/linux/bnge/hsi.h                      | 149 +++++++++++++++
 7 files changed, 530 insertions(+), 1 deletion(-)

-- 
2.52.0

