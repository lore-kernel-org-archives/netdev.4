Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795062443;
	b=rof18q+N8bWkVSf/ReWIo3BN6xpY5ABH+nD2fIuTWYSnyRtYffVrXSJU2KvvwBm2OUyS
	 XHqatXPaAcz+cBm/OUJGyTBMiXPL9xTC1hEueYLTfoLRxKzJ8QYG07LBHLBX741A8yPFO
	 ASYR6U5nhclYueZqMcdBhhEwwQ0YRMK9IJb2TT9LTY/8vGCCwi6Hg1QFlNeaQhSbtM10s
	 LWz4fdKEk6NAQ5Wph0daLrLe4KAIWFdM5wAFJ66N/XbzowDG8ofvs2Ar4REAobHKO/qfe
	 VfM4CL8eAUQrmM0hTgqBwkQkMlTesNVLpNOPYJzSVnVf5Si8Cl4HpNCCcprcgRgbUOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795062443;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=3Hxcc3mWV4vpK8u9zPUdfbWlyMV/Lx3auErCWtJ/vww=;
	b=ytNjqFBRlLZ/bbgJFsYWrm4YaBeow785E2sJ/yluQAtx08r25F1PoKlPys+oNTxVKoCi
	 ZsTweNrUYY5l84mSvZHJD7PeYqrlXWFQFDPW8S8JWEoSMy3O+VjmgHc9ZELiWV2SJpNLC
	 QPGaGHATimc0YyOKXwGjcJeAO5FM4fR0DNsUW/bvoLnzn/kxUjrCFhJVM+R9xo9+k6mYG
	 7Bvk5SvkNThva/IU3Q+sjaxBuUlSWqeBzr2u/fWnTOc9iLrEo+A18AiXlHeIi45mB7CEo
	 HkgvjmOKKaZkqvLf9SBcP3c6Q13ed+iDPczSIVYIcfuMowJd12tqx9nSYiIOMRddaJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bdZ5luSc;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1EE606A32A
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 04:27:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F1EE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bdZ5luSc
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8b68e59ab33so1409324b3a.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 20:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795062442; x=1795667242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3Hxcc3mWV4vpK8u9zPUdfbWlyMV/Lx3auErCWtJ/vww=;
        b=bdZ5luScc7SG3YNewnCwCgsSUxO4L668OOhIJJW+3KnwrEKUzPXmaSbigfrzIcBnmx
         KSSVyoP2KeqXVWwDmBezvL61+GjMSe5jcv1IZ3far/x5lRc83bqAxViV0F4PAEXwxPKL
         c1u1XZLNxpy68zHWWUf1R50aWbfH2GW5QDf10KXIb/BEDYi/a/FbdDYN187YRU2YMrN9
         3OO0SSj2PDmW3LtQ2oRzhDhpjoLpJ88j/9KCYJQv/9E//M1g5b0AYOtCWcAwR7EVpmgi
         /AuSMNFGnNZ+OqO1BMWddOQU0ex6UIrbgjooIM/z8mfpUy56tsAX+bwPOpNgxnPwt896
         Z4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795062442; x=1795667242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Hxcc3mWV4vpK8u9zPUdfbWlyMV/Lx3auErCWtJ/vww=;
        b=CmizIG3gdCZIgeT5i2IEfoJe/69Qd7l2gh+/29FqYPgQMaFDq7ilO8JgYiUIhifNPD
         fVHdk1ujkYcP9AsIrNloKJ1H0ZOlsn21EByCvMlR/HuUoV2/DPyItdQh7XF8R5ns71kD
         Y+R00FM7XQuGqGOJiNpsOVFCTiE6bjPu12coGHelJcMvvYPFHlZSmigUNHn/u98d9bEO
         VBINVSVE0u8MQq3wY5zmCUyF5nW4GbwWl7bcR9gcorhCm+6i++3d3k/KRJ4KYJC4mC/1
         uiUU3VtZYZlTLLom+6OquO4duCsS6EmMLHttkCHzuvCY6RqJpXhPQsfl2czH8rVLbMs3
         bLhA==
X-Gm-Message-State: APuU4Z/LOespEGY+qkgSFjuUcQz61BSZ08fLkDKsyDzO7boF4ynvClXD
	5EPF1j1uG/Y2PneGKuTT9GIntWvkQ536P5Vww1TFQKgpIe7AHMMcz34YAqeq9qnT
X-Gm-Gg: AYBFou2Xk9nlBi7acRXDcJJnyR0gBmuxEG42H3hZhYPnnC1SfvV9ehj2QHLulIwgSv5
	fAj02R6grh0CbqMBaVja2fyS0yFF56X60bB92yEjt78wbeSSRmS5P0bMFLRcaMjqPUio/qHGFZI
	2amI3j6B9qZyP28gG2rw2pl05yLxRVUH0LbFO9wqktabS7Jp+wfp+K86o1/D9Sd87Otgjl/v3RA
	4IJlmQi5ivbrRk8wuIIwsMa8JHO1yZGyAXouZIiVfvIpDqXOGwhTrsig2nJgOpPI35IXlPS/DkA
	iTiEaJQ1BsitQ9A2fgJorqMHNx9YDT3rwtlHwVyLthNs9MkYUOd/+ghVTTbqDOqrqstj4I0BKby
	w6yAgl/CgEUYBAmx23JW+bGAjE5tnOpBWP59XN4WxAsIcQX6BQwIjFpm4PV1nPap5mxSq1vQ1+2
	AOtXWtsFV3BKEcPEt0ezso5AMJtUbNzPOYgUuctFGxohxqr5gWPUXg3JWhKflxFzUoO2oQgOpmm
	zsM/ZSlV1sFU2SeMQ39efipfIQdDB9t7nypKsIV8SKNBfxr4a7ZEOXbsqqQs79XkSPXNprTFnqT
	JSc8qnito+INV2Lx
X-Received: by 2002:a05:6a00:4c17:b0:89d:eb23:4e83 with SMTP id d2e1a72fcca58-8c5d3d12f10mr4182188b3a.30.1795062441855;
        Wed, 18 Nov 2026 20:27:21 -0800 (PST)
Received: from x1.hs.local ([2601:600:a482:7d70::5e59])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cb35830bsm2077636b3a.33.2026.11.18.20.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 20:27:21 -0800 (PST)
From: David Westen <davidlwesten@gmail.com>
To: netdev@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com,
	ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	m.chetan.kumar@linux.intel.com,
	linux-kernel@vger.kernel.org,
	mail@maciej.szmigiero.name,
	nihaal@cse.iitm.ac.in,
	David Westen <davidlwesten@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net v2 1/2] net: wwan: iosm: cancel the ADB timer on cleanup
Date: Wed, 18 Nov 2026 20:27:13 -0800
Message-ID: <20261119042714.505405-1-davidlwesten@gmail.com>
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

ipc_imem_cleanup() cancels the other imem hrtimers but not adb_timer,
which the UL aggregation path arms for 500 us. If it is still pending
when the device is removed, its callback queues a task that finishes
the ADB on the freed MUX, and the hrtimer itself is freed with the
imem.

Cancel it along with the other timers.

Fixes: 1f52d7b62285 ("net: wwan: iosm: Enable M.2 7360 WWAN card support")
Cc: stable@vger.kernel.org
Signed-off-by: David Westen <davidlwesten@gmail.com>
---

Notes:
    Build-tested, and run as part of this series on an XMM7360 that uses
    MUX aggregation, so the timer is armed there. I haven't reproduced the
    race itself.
    
    It comes before the S3 fix in the next patch, which makes this teardown
    run on every S3.

 drivers/net/wwan/iosm/iosm_ipc_imem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wwan/iosm/iosm_ipc_imem.c b/drivers/net/wwan/iosm/iosm_ipc_imem.c
index 4405c8531888..20f8da53a3ea 100644
--- a/drivers/net/wwan/iosm/iosm_ipc_imem.c
+++ b/drivers/net/wwan/iosm/iosm_ipc_imem.c
@@ -1239,6 +1239,7 @@ void ipc_imem_cleanup(struct iosm_imem *ipc_imem)
 	hrtimer_cancel(&ipc_imem->tdupdate_timer);
 	hrtimer_cancel(&ipc_imem->fast_update_timer);
 	hrtimer_cancel(&ipc_imem->startup_timer);
+	hrtimer_cancel(&ipc_imem->adb_timer);
 
 	/* cancel the workqueue */
 	cancel_work_sync(&ipc_imem->run_state_worker);

base-commit: e203d8a4751d48aa00eda31e3b320ba8e0d47dbf
-- 
2.56.0

