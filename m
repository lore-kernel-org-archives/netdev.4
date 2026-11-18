Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795032832;
	b=Omzz/iK09z5TPRkL0eSNmF9mPGga0aGGE7tWzOs04yh6GxMU6GOcx2zpUP5CADsI5tv8
	 V5O7oenI4uU/a/hCYX859NjDAIQzk68ea6nGLjGrUjGJ5G7IWqoRJa4LEwKR9TOuL8B04
	 PYSZVFsVRcQ7wVDUUydm0Nwmmca6OeHKpRLW0e4MerAi98Lr2AGeANWVEMphZOtTvjx1j
	 8h0zyKiTkGO0hxvYnO9zPS6eBPJQWfCE8hBeojkWKtSEHeTSSpd8ef1CE1aa5xvDW3ePd
	 4pORrfaBY1HTGBFSjfqOB/OzblAemZhWzT/sPClZMexn9aWAIwccoKnqVGaM14cMQ/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032832;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=aTzD2aWzK4y106Q4turWhvgJUGfskZNqD81yrb/wDlI=;
	b=haPkYLhukvPOAbAd1/qJxUbFHd4jtrkgEX4cTsrh4xot8OjRWaCrQCtcJZfu4vJDancn
	 0kqDI6pZZpxbkEwJiEKLA1SY6eR6ypatv+kU8WrgfpG0SfBe2JJlTCNQkYPu2S3F6fdSh
	 DZT6gFIz5xv7B/VMqlH+rvLIodU6OVslYb00BZdn6dZK3KPezHTp1hWmaSCGSI918MzC/
	 6zl5dCDr+5T0LjQEwmJPK/gZGTuRc1Q0nAeU4IDj6t8UTVMblmSchLr85kECpwOSHHGq7
	 KPgH7U+cogT+QRE/k06cV9OFZ1IoWsogCLjSoelpirB4n7p0yW5acCdN0YU45x2mSTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EcnMcg+p;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F901606A320
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 20:13:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F901606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EcnMcg+p
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3adac5b29ebso921706a91.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 12:13:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032831; x=1795637631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aTzD2aWzK4y106Q4turWhvgJUGfskZNqD81yrb/wDlI=;
        b=e2pEZtbApF82Ad1rl4QcD73FhTzyBWQfDgQJNB2tCx+3e5p8QqlaLCisXREy7PXqMF
         77YKNcTGlGs8erS4dc2W1I9w5TZDWYrzrMVmfNdDUi8J+k3Xjkj6TFBy8OWDcbwBUlak
         A+ogfcT1U4SPc0svS/ldZy4itJWFYiqX8tb6rG4I9/7wsKtOwz9duoYDf97I1y64ow4f
         UOgy/ladWHkWmKO4hNbzctIL73wIEsAN3TkcxcP07ohYGIEwrFZGp2/zOpkjwTHojTIR
         CzTnXPTYwfff4HRvBSIiFGwdg3lTlawHetP2ac5VqXQ0Z1t5DunQDc0l+cjgZ+OGwqa3
         oUDA==
X-Gm-Message-State: APuU4Z/moMJyRTjIE1FSA3vs2l9+k9BXYnWHow37aZuQbRGbyrAkzZeQ
	DGzR9mijfzWmCjTKU116outd9TiU/MAkXbtIufHWeLDTymTDUef2K8kNxosPhuTQ1LRextuF4V9
	DDz3maUb91YTkQWzCOrfMSlssPb58WyHGzjFhVRWJ6YQqE5tPu0jFRqkoUcRnUXBXBX6b7RIvB0
	VxKEfP2+N0TG4M6uYfjfioLFiCJtsVa+TK8Tbcv+1MjsyQdl+eiafCTg7SPE5f1qAp363DOYuJD
	aAJ85WgltGTHrnu
X-Gm-Gg: AZFdTZd37AXiS8482nc7Ll0OlByKQwBCf1vYBHrW/6E4wjGnDPskY9mIRDxOMl5X0np
	4HegMUvnaBKBMnVzlsvOKvoqLXRMr7BbIN42LiV/yJBG9268L/VH35L14v1CZyRPHVcH0E5lNe3
	beC2Kwro+nCE7OeiWN3P7BPMdNXHtOevVbPMtkNHaa9z8WZc/CsxaZ1B3T2wRhig/adH6IC/dza
	OcsNPDearC8JtqC1B8I0ffEIuAKuceb7VoIVlZ/xSzMNQNowDJDkZrKeK4l2771/FGT4ZnFGaAP
	jxSBL4yYPfqD7hvUhZbESxqW4gZo6Djjr8+fOX6KQLn5WT67uGXetdcdxNyu8KdM6Qh54AqOAbE
	i7xHDDy8se1XkWOpyDUgsBy1rhqMqottI4AD37a/Olf7QGIf11wU7pKnq9qpHciK1K9Vd3JFZrU
	3K+hNaZCHtL8PytmvPZZ/5YuQai64rCNlOfBAnrvrV
X-Received: by 2002:a17:90b:3f88:b0:3a4:f8da:2478 with SMTP id 98e67ed59e1d1-3b3d076601bmr3570618a91.29.1795032830866;
        Wed, 18 Nov 2026 12:13:50 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3f6f5df9esm368097a91.7.2026.11.18.12.13.50
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 12:13:50 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f32050e72so380379185a.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 12:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795032829; x=1795637629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aTzD2aWzK4y106Q4turWhvgJUGfskZNqD81yrb/wDlI=;
        b=EcnMcg+pj4DD81piCV7cmJQrVefYzvFVLEk4AkTXVzEMWCyqPt+KqltiIdTrmmUrpv
         Xeh+vD355s8wizgxcwUZVm5HWxnXJK/xOtpWJ3zwd9w3YEP2Vo+A/1TVif4Unh9LBDOz
         cwE0zMKljtC9NbA614J0iUSO3AgbackW9Wj3I=
X-Received: by 2002:a05:622a:4cc9:b0:55d:34ae:98d with SMTP id d75a77b69052e-55d5a36e1famr59604371cf.10.1795032829467;
        Wed, 18 Nov 2026 12:13:49 -0800 (PST)
X-Received: by 2002:a05:622a:4cc9:b0:55d:34ae:98d with SMTP id d75a77b69052e-55d5a36e1famr59603571cf.10.1795032828766;
        Wed, 18 Nov 2026 12:13:48 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66c2a5a2sm7675091cf.21.2026.11.18.12.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:13:48 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Toshiaki Makita <toshiaki.makita1@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	netfilter-devel@vger.kernel.org (open list:NETFILTER),
	coreteam@netfilter.org (open list:NETFILTER),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Subject: [PATCH net 0/4] netfilter: flowtable: Preliminary fixes
Date: Wed, 18 Nov 2026 12:12:46 -0800
Message-ID: <20261118201250.2075007-1-florian.fainelli@broadcom.com>
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

This patch series was created based upon the Sashiko review of the
Broadcom Flow Accelerator support:

https://lore.kernel.org/all/20261116222519.1416501-1-florian.fainelli@broadcom.com/

These changes were not encountered in real world testing but appear to
be valid. Test cases were added to ensure there are no regressions
moving forward.

Florian Fainelli (4):
  netfilter: flowtable: do not queue offload work after DESTROY
  netfilter: flowtable: restore the GRE conntrack timeout on teardown
  selftests: netfilter: check hardware offload work after DESTROY
  selftests: netfilter: check the GRE timeout after flowtable teardown

 net/netfilter/nf_flow_table_core.c            |  12 ++
 net/netfilter/nf_flow_table_offload.c         |  13 ++
 .../testing/selftests/net/netfilter/Makefile  |   2 +
 tools/testing/selftests/net/netfilter/config  |   4 +
 .../net/netfilter/nft_flowtable_gre.sh        | 137 +++++++++++++++
 .../net/netfilter/nft_flowtable_hw_destroy.sh | 162 ++++++++++++++++++
 6 files changed, 330 insertions(+)
 create mode 100755 tools/testing/selftests/net/netfilter/nft_flowtable_gre.sh
 create mode 100755 tools/testing/selftests/net/netfilter/nft_flowtable_hw_destroy.sh

-- 
2.53.0

