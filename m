Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795139792;
	b=XqYja76OR2q7YKSPK3AEeZY4/y7z/CkMA8r0iZYeVcJLLcEzkDOCcmE2Mxz+QCklUKFq
	 +JTd8S5AJY+bBDnHlvsx7OeLlCRBm2W+yvj/CwkQr45eZVBNe5aUjBAC+oOJo3zwRSmsF
	 mul6mS3n7OJmOev86ywpGRxrYEpzKJ28ujFUlEfCDH5CUm9BuQbou50NGrbjpjQ+PijlQ
	 68O++RYSmpy1E+ZfXOM5LI3/xlEzArxLFlJ889x2L5H7hQx2zCBr1ULSngrtSUmYLimhv
	 6Yr2/w4EhBV4sNzaGPxLrzbfNDxxFVz/GxLNW2ybwt4osK4iJjje8BK/DJsneCp1HVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795139792;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NkVoEL8R6+jFswtX2KmwPOjhnhN80a9T2KLgPaWg2qw=;
	b=L2J53m02839Txe72pzzO/EGUROKMf6RI6UE01odIiSOiF2vWxoG/hfRNWdykyxiIeZEa
	 Ff7p1LKJV84Nz+o2vhTBDQHkmg1Gcoz+6IwgD4xCIBSOngXIMrlqcJ4zhJUu6n5WzMby1
	 dYZSZxzyNZy7YJ+KvWjB0RpZWbYyqtIUc2UuJ05eovA0SVNvIzKxIK4aQmnW014RZ/zqo
	 G16+5N/4LzCEBOBY4wqL7a/f788jSQLUsuWbFSRlzhvcEc4uafpLRHZcHAkOb12Cg1MDC
	 crm4CHR0ZPxcCWKfLbXbMsrAQdihiTuc8kA/jRuOYavCnF5ICMv9WO4wcALnjRtZw8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="RBArh/Tb";
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23D9606A334
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 01:56:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A23D9606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RBArh/Tb
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso200774a91.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795139791; x=1795744591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NkVoEL8R6+jFswtX2KmwPOjhnhN80a9T2KLgPaWg2qw=;
        b=RBArh/Tb/F97/TrDoqVqjqL+RAsNjTutN9aSWTNbjdsCe58AjcclftNURZgvk+xAH6
         QxSDAGtpD4t8K/nDGG83OvLBLp1QM7Q0UlB895cUOYly+AkFZo+GakF9Zm3f0fwxQut3
         5JJ1UU/8cdqgw/ryvR/0uWWtz20Ke+DoMaUpUru3DsiHyedM2IsPVtry3G8VgABL7AWE
         aGNcdHv1gwq8BkPyI6s8zHO843SZgzicg1EiozcTdksZTmdpoIvHK2kw77yJRTvro7/Q
         OXpEkp3D465Qi2xtfSP8x6Swts4AXb4Y+9dUsrF/BLwfZ23pAA1utxe0vUyoykfKE8g1
         m0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795139791; x=1795744591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NkVoEL8R6+jFswtX2KmwPOjhnhN80a9T2KLgPaWg2qw=;
        b=yxYTFrgARtTt7778JnIWBLjDXr0dPsRMM1wnkmIKIM4uDN8efV/IDRVdMCrZbRESZ4
         FFoRRL+HyA2d1wgzmFqdLbco4OJCI/nq0TNSDaahov39PWv2IxP6YvvztlE4UrrpY4gX
         peN42gLJkyFfbnN8brRZAJ3zV4MENWTKWKwXrfnIK/8hfRJYOdIqfNhEZxR1kaAku8D0
         QRJSbtjiLfKBk2zTblxrFni8jGew0jQunnFrDZbnp1do4rZuIfGBEhbN+Fu3R4e7235P
         BufiiiVCnVVumM3aa3HNtJCNLiApv0jD0brDtV3reM3Y/KPB7stzAAV2x2VJHyRm4acP
         BPvw==
X-Gm-Message-State: APuU4Z/ihBoOcF6kyoiTvTyQxNAfwBz3B7yr4zUqcMVDImHJCU776uau
	56mjclaMcmmlGuHI+uDJkzGsMuwkITSjHX044dSjXGQcMZqNaqBXvadCdmB/MwCC
X-Gm-Gg: AZFdTZeiVRMOJM67oLrsPL1tO5H1juLd020yBHhQgm5iZZD0OTYZAl6YTEpQTbb9MMU
	CvzE0/bN6Istvs/sepnTDLziYjSuRdy5MuA1wqLo24PHMA5O3sKjlpA4oXJ9hKmAJBoGbFIQRvU
	yo2NqKDuupxXrO3CiQQogB2E30bAE/VNg4b7qcSRraftLwm52L9G2pXllX8jPJzjr+9ncIe+3po
	I9I1K9cnKb0ic1+pRbg7amqflax1XbQDF4Ibeu+wda9DdZ0BjSeCDdq/LeXPsP08gBzXl1okpz5
	qgNPS80K/RUQBUPAxdfA8+COVgYBWNNy6vYoJqODiALzJgONXUd2j12U7rild4SihGhsBt/4DWE
	/g4zfdU4zT7U9o5c8H8+HLm7DSShqdxyV59/wmD7l0dgJOUntHK6ADlOFwUMT2fgjHGnw65iw26
	k65yIGYsmooSpM0QOi7I2+lwIrU0JuVy38vNTczcCrkMMgEjF/zHjlNhNLu9Irl4xHqWmSPE38o
	ob6TawryKA6bhax92YJvPwakW90MyrduMAu7fE+8MaTECNoaIYtcbttdV0XnH89StyO2PmsqUvo
	0U2bpdrdPo9Rm1ssaYxgtjCAq9BgzsuTYiROPJ4Jxp8rxe9SoUsN
X-Received: by 2002:a17:90b:4d10:b0:3b3:ce10:7659 with SMTP id 98e67ed59e1d1-3b41c7ac261mr1431787a91.5.1795139790906;
        Thu, 19 Nov 2026 17:56:30 -0800 (PST)
Received: from u.. (61-222-64-201.hinet-ip.hinet.net. [61.222.64.201])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d63728sm5355957a91.8.2026.11.19.17.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 17:56:30 -0800 (PST)
From: Tim JH Chen <tim770802@gmail.com>
To: netdev@vger.kernel.org
Cc: chandrashekar.devegowda@intel.com,
	haijun.liu@mediatek.com,
	ricardo.martinez@linux.intel.com,
	loic.poulain@oss.qualcomm.com,
	ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	sreehari.kancharla@linux.intel.com,
	m.chetan.kumar@linux.intel.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	tim.jh.chen@wnc.com.tw,
	Chih.Hung.Huang@wnc.com.tw,
	Tim JH Chen <tim770802@gmail.com>,
	Andreas Haerter <ah@foundata.com>
Subject: [PATCH net v7 4/6] net: wwan: t7xx: do not exit the TX push kthread on resume failure
Date: Fri, 20 Nov 2026 09:55:54 +0800
Message-ID: <20261120015556.131547-5-tim770802@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120015556.131547-1-tim770802@gmail.com>
References: <20261120015556.131547-1-tim770802@gmail.com>
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

t7xx_dpmaif_tx_hw_push_thread() returns, ending the kthread, when the
runtime PM resume fails with anything other than -EACCES. kthread_run()
keeps no extra reference to the task, so the task_struct can be reaped
or reused while dpmaif_ctrl->tx_thread still points at it. A later
t7xx_dpmaif_tx_thread_rel() then calls kthread_stop() on the stale
pointer. It also stops TX permanently and silently.

This was hit in the field after a runtime suspend failure ("SAP
suspend error: -110") left dev->power.runtime_error set: every resume
returned -EINVAL, the thread exited, and a later write to the PCI
remove attribute crashed in kthread_stop() with a NULL
worker_private. The remove then hung in D state holding
pci_rescan_remove_lock and the machine could not shut down cleanly.

Log the failure and retry every second instead of exiting. Only the
first failure of a streak is logged. The wait ends early on
kthread_stop(), so the thread stays alive until
t7xx_dpmaif_tx_thread_rel() tears it down. Recovering from a sticky
runtime_error is a separate problem and is not attempted here.

Fixes: 46e8f49ed7b3 ("net: wwan: t7xx: Introduce power management")
Reported-by: Andreas Haerter <ah@foundata.com>
Closes: https://lore.kernel.org/netdev/20261106054532.201311-1-ah@foundata.com/
Signed-off-by: Tim JH Chen <tim770802@gmail.com>
---
 drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c
index 48558b98e7c6..00e456bdd808 100644
--- a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c
+++ b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c
@@ -448,6 +448,7 @@ static void t7xx_do_tx_hw_push(struct dpmaif_ctrl *dpmaif_ctrl)
 static int t7xx_dpmaif_tx_hw_push_thread(void *arg)
 {
 	struct dpmaif_ctrl *dpmaif_ctrl = arg;
+	bool resume_failed = false;
 	bool txq_stopped;
 	int ret;
 
@@ -468,8 +469,19 @@ static int t7xx_dpmaif_tx_hw_push_thread(void *arg)
 		ret = pm_runtime_resume(dpmaif_ctrl->dev);
 		if (ret < 0 && ret != -EACCES) {
 			pm_runtime_put_noidle(dpmaif_ctrl->dev);
-			return ret;
+			/* Do not exit: t7xx_dpmaif_tx_thread_rel() kthread_stop()s
+			 * this task. Retry until the resume works or we are stopped.
+			 */
+			if (!resume_failed)
+				dev_err(dpmaif_ctrl->dev,
+					"Failed to resume for TX push: %d\n", ret);
+			resume_failed = true;
+			wait_event_interruptible_timeout(dpmaif_ctrl->tx_wq,
+							 kthread_should_stop(),
+							 HZ);
+			continue;
 		}
+		resume_failed = false;
 
 		/* A runtime suspended device was resumed above and had its queues
 		 * restarted, so a stopped queue here belongs to a system suspend
-- 
2.43.0

