Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107857;
	b=yJqEuQACzqoV7MAc8BDvbpIysxThHv1s903Nxk6WOPqgDnSJkgHKVu+FdILpIIawaynp
	 e2bM0tcLkcZ1hw/0XLmXGxF8SC41TrkiIcpKY5d653PfKR/V27hQykSojo/KRJP5dbJmF
	 pOlYD5qJY+iJOXYb3QXfGotfcoI2qrE+vO5tWsmkZTBbrIIVfYMkJVZn3uh01zT1+yibV
	 11KRPMTP2uWlNtBtoZN71eYRsxNtLZ/yHW7ALpzMVyRfBvAsbDtXxCrfzK7Qn5/kTvFOy
	 NXSyhQA45WZ4+16o+trTs/LmqB02ELYeQEKVKVyi2NukbKlpXMl0jqTUht8jOswagUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107857;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=kOTTaMiFKsMjsQWe0kVsqaO6Sbtr1FRrysMCgSH4psE=;
	b=Cejs/WOfwsywdX2EVc/ssIXZ/EZVuR60w8w+75ooSJLPwNZv25pRHlqIMh5uQWIokKDe
	 0zmS2LATd0DrhC1CEjfVwY0BSjYmMX7X21VXaD3nMhdzyy7F2mUEAZY2f/NFefmVnvTn7
	 kK7VSr4sQFiPyC/UsD1crzzAzdsA9J4gdujvkaAdNFHWKCXIWgMHD02iI6fuO/Jxhvkv5
	 1KyRVNnqhbRFfaL8dgBp5yYso2aCz3xcIF4lmkA46V1b5nUP4sqVRAgfazS4XJ1tmTjvc
	 7uxFOyiRvHLrp3mxp2n2k8symoR5m6j7gNDgSMJFuQrlSmfZRQQBMHTThGtBJtIR0qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="EFs2/LkB";
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242F8606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:04:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 242F8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EFs2/LkB
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b3b63b9665so2299228c88.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 09:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107856; x=1795712656; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kOTTaMiFKsMjsQWe0kVsqaO6Sbtr1FRrysMCgSH4psE=;
        b=EFs2/LkBGD0fA+gME3DkGP3fg5+W0u+rIFwyfGvqO7TcvSNxlxaABLArIcy4cG6QaE
         RdadVeXd6g85U7RiOez0/jfpqGhEtmw+iCM5pqXhEegOjRbGtHLUniEKYP4ncY5v7NZU
         FMlptozCA2Ckg0bWPdnJtR4+uo3g76aMWs0a5CC5zMyFsp0pKkVPYygAvqsLV9XSVMJ1
         PJ4Msma/LM5Y5ZFGYrLOQlQHjzgHIjQc/+MDrzrX8VbNO3BFqTN7+gMvNfRBL709SFlp
         Rq8QW3pk1k5rEuJuDLQ0HFtbDvTnNPLheTB5iP6QjW725lvtjzdeK5XjS6TTZBfq5ddH
         /f5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107856; x=1795712656;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kOTTaMiFKsMjsQWe0kVsqaO6Sbtr1FRrysMCgSH4psE=;
        b=zlinHGKqj+UME5wpfzFa+KbTpgEV5GEFBcopZTx8TSV6wyAtn96TDjYVvsWMDdCoD9
         jV+j3/isNB5tlQyjI3l9zVwsinvu2KLzsvSi8MocuG1/EIdF+9gijEVP53NDtLsuLJMI
         uJhUjUPDONKKB8xd7QeimlVExjKc8/5b9yZjDMGc8dMN7SYrbT3z2il8xsoUDf7pObnc
         9KkPIpYVdEkGKhB0gX43EzA/yf6SKKl//MlwImo+y09dfcw3IEA78Yd8s0EXsA1JxyQc
         SWbSNBOYvdcZyuWbAHahWoDPmtD6QHkdCoOwO4X+5/350XdEjjPVuUBhhF2Ru39gBzci
         5gDg==
X-Gm-Message-State: APuU4Z98eMOqJ5odhI3+QgX/9Va4HhQBmWHjgeZodDHV5YMAAc8b9nfC
	Q7bZ18KRYx6pQEFt0thdevqs715gXrFUH8U+N3DoKn/M0gtIDpPi3P0c+cvzl77JdRxMRnDbsIY
	5oLm4CUOa9A==
X-Received: from dlbsw11.prod.google.com ([2002:a05:7022:3a8b:b0:19a:1425:bb9c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:2522:b0:1aa:47e7:97e3
 with SMTP id a92af1059eb24-1b5568bc56emr304733c88.15.1795107855617; Thu, 19
 Nov 2026 09:04:15 -0800 (PST)
Date: Thu, 19 Nov 2026 09:04:12 -0800
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170412.1511344-1-irogers@google.com>
Subject: [PATCH net] qed: Fix missing bar_id comparison in qed_hw_bar_size()
From: Ian Rogers <irogers@google.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

When PGLUE_B_REG_PF_BAR{0,1}_SIZE reads back as 0 on older management
firmware with multi-hwfn devices, qed_hw_bar_size() logs that it assumes
256 KiB for GRC (BAR_ID_0) and 512 KiB for DB (BAR_ID_1), but evaluates:

  return BAR_ID_0 ? 256 * 1024 : 512 * 1024;

Because BAR_ID_0 is enum constant 0, the ternary condition is always
false and qed_hw_bar_size() unconditionally returns 512 KiB even for
BAR_ID_0, doubling the computed GRC BAR offset for the second hardware
function.

Compare bar_id == BAR_ID_0 as intended (matching the bar_reg selection
at the top of qed_hw_bar_size()).

Found by enabling Clang's -Wunreachable-code on an x86_64 allyesconfig
build, with AI coding assistant help to audit the warning and prepare
the fix. Build-tested with Clang; not runtime-tested on QLogic hardware.

Fixes: c2035eea3e9e ("qed: Correct BAR sizes for older MFW")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/net/ethernet/qlogic/qed/qed_dev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/qlogic/qed/qed_dev.c b/drivers/net/ethernet/qlogic/qed/qed_dev.c
index dd75c47758e1..3e84f53dfb50 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_dev.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_dev.c
@@ -1264,11 +1264,11 @@ static u32 qed_hw_bar_size(struct qed_hwfn *p_hwfn,
 	if (p_hwfn->cdev->num_hwfns > 1) {
 		DP_INFO(p_hwfn,
 			"BAR size not configured. Assuming BAR size of 256kB for GRC and 512kB for DB\n");
-			return BAR_ID_0 ? 256 * 1024 : 512 * 1024;
+		return bar_id == BAR_ID_0 ? 256 * 1024 : 512 * 1024;
 	} else {
 		DP_INFO(p_hwfn,
 			"BAR size not configured. Assuming BAR size of 512kB for GRC and 512kB for DB\n");
-			return 512 * 1024;
+		return 512 * 1024;
 	}
 }
 
-- 
2.56.1.708.g77570a6a1d-goog

