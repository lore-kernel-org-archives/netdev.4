Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795139779;
	b=yUi2QyuhaSKNhhlgEQZ9rVQBksicIfShBrdPF8l8qREbLpnCmT1VsipEqSvkvg8pL/f8
	 9yH0EZqJ7e+kTkpLWDkd9WgarwVfniriMWp6vtY7JXmhzcgLHVOwahdIKWicCDHRQY5vF
	 qUCUZLTzmyVcsbJ18IswoqQOOuZRLuohGtcZBl2Heu77onIB+A3bw4H19zikVm90ST5kK
	 1YNrbdFHo+Fy7mhyoqlSt5upI4DFCBnJl+O86FPqHXELz6RrnGgMNiUowXSYlyGIVN/Tu
	 Pkr8QR8tluAWuLfoZWCsK13iUzHqgD7f1MIJbyMjRuStp+B2HI+mQoc8+6bl12m2xOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795139779;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OkbhqlAyWh5/Yy+HX+TxYjT70VGm5Abq0fqJanB9ny0=;
	b=CNpZRzGtKfxIK9SiY3slWJk97TxvaUykli8gOtZ0qkpMa19KrM56RFSWDGC2hDGF0Sge
	 Z+wq8VSmfspvkZavbhXmEeepfYMTKCvHsTMLsCxBWatHgg7tg4270t8dq5RwIS7ywUtD+
	 rphNuKaGpnt1Y+w2C4ru85hwn41NJCjfC6+3pP1bNZ+qoHy2ifvxQu3OedpyIFFuBZ+OU
	 yjS2bfEVl8au5AeySbltOl3U7RczFBqHH8A16ZH2ZYzdIm8wRMCVW5bmIZjYqivGxYaPF
	 3POrztVmilqEgoUSQj8HS7fOk+Mb5N6YFHyh2+0XmBl0P6xNhSKH9UkQbClZOIj5xig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ooFgZK/s";
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCB0606A325
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 01:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FCB0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ooFgZK/s
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b413997581so369942a91.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795139778; x=1795744578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OkbhqlAyWh5/Yy+HX+TxYjT70VGm5Abq0fqJanB9ny0=;
        b=ooFgZK/sqcQ2p4MiFRiiHGZxovN89mDo7Hd/mc6MS7Q1wnI8wkrf9m5iw7oNEbPvvI
         GUCR3ncfyOIn68toI0tJ1/KLiFGZayoWb86SlJq3ksvuyBGVVo6lgcJcOc/ocmVN8IW0
         WjAfVBVR1J83C7C1rQndqUNCj0aOGBvsXXINe4eDZofH7aSZgZ1WzCOOaFkTTin9yOyL
         FFgkFSe/Qw41Zcfukq9JgOdencE9ow0cbrzomt1oVUrcGAxU2D2OBxGb1wpRCanzjDbI
         t0jx+JaGdnqUYrcCwyP3oq4HpS3cCbNiLSI9Stm9SIpQ3HUm6hKQwG0tW9uaDn8dsl1V
         gWtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795139778; x=1795744578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OkbhqlAyWh5/Yy+HX+TxYjT70VGm5Abq0fqJanB9ny0=;
        b=Io0ml8PeIODO9XMpvImCY/6vbMcvGuNnVVmfTHOrXAqzmkVggPoOtwaE0BXy0HEdhG
         oHrq/BWi8kstsumqqLqqv5Ri+RX3h/+c95kbD2jI15PjahnY6ToOAYCRPen2nSnrvwk+
         bZIKVvN+tulnrDnRRJnCzvbGW/+rylbLNBEco1q+pCWyFpZ7eg+F7ukcA3pqH2K2bFv1
         LLg/15AwJJb9HmA0P0cbLViADVeYhTFeU85p4hkpvN6Loi1qRS6kCPq8CUhJtpnx2/+x
         8dixAVBlpioQjSz/yIXmmKiCoi8sIDxh6uoZvWM+HiJxVellWd9heGIAO1zDSTJyEFXH
         xQtA==
X-Gm-Message-State: APuU4Z9Swh7zFvqksacbflTqY1SFpn5t6BC9mUABV9Hb0hUPbMPQGKoW
	Pi2409HLsRIdO2GhOWJ3azqnNUYJ+yI7pSbAlVIitLfUc6atO8pclX0OJ7fhB9Zw
X-Gm-Gg: AZFdTZeRXoflVIKDaArMAf/RRdcWN4q4aEGWYa/dzn3t0GsaLuuGzN9sadPgUM1Y+2H
	tdz0ZS6apPAmYSiq0xHKhBZ9PjQo04Wj3NIcd4hDRQG+z9CDOi/2j/AOBxcy2xS6yNi+ve5IwnF
	uahRGoIretKn5SLzaWEmezNe8BC38zqsh91OiWumeza5o6+I/4TT5GiDXKXOYusOUs6dhfiJU/G
	Nc79vpeeMMZ2A/9zt+rPf9zTAGz0fLpOQkMRYAsCg6FgzF07PAl8AjJ1fb0zyDWkWHsMlFT4VRj
	Nj9xDXlyFbTOpE0KCofJLrbChvmZHzmZ4GsutmKM26geOIhDhDFX1tk7yfJn9hhh8tucufECOos
	TXiIfj0y3KvkYhxLf9oPJqL4K0mtEM+rj9gejADdrLNYAiHge0J81is94sXhXfgdS/XZC8EDE0S
	YC87inZ4ljdnzPOsS4B1WvnZJkr30bBF5iECf2dG2H5c4/ofLuRD4/3Sj8xU/PuvyNVouaaX7XB
	OyL2W6IKSv/Hff8khh2wPN3m222AY62Lp1hoo3TbLJi+jarOtoqFXKQfG8/O+rBjkSqDHQgQ0Hs
	Cj4UV/4VqLd2FnFPGUlQQeHppPytQtJ+axbLnlyikbE6RpQe/2w=
X-Received: by 2002:a17:90b:2cce:b0:3a4:967c:6947 with SMTP id 98e67ed59e1d1-3b41c909001mr1165606a91.21.1795139777792;
        Thu, 19 Nov 2026 17:56:17 -0800 (PST)
Received: from u.. (61-222-64-201.hinet-ip.hinet.net. [61.222.64.201])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d63728sm5355957a91.8.2026.11.19.17.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 17:56:17 -0800 (PST)
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
	Tim JH Chen <tim770802@gmail.com>
Subject: [PATCH net v7 2/6] net: wwan: t7xx: fix runtime PM usage count underflow on -EACCES
Date: Fri, 20 Nov 2026 09:55:52 +0800
Message-ID: <20261120015556.131547-3-tim770802@gmail.com>
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

t7xx_dpmaif_tx_hw_push_thread(), t7xx_dpmaif_tx_done(),
t7xx_dpmaif_bat_release_work() and t7xx_dpmaif_irq_rx_done() treat
-EACCES from pm_runtime_resume_and_get() as success and proceed to
access the hardware. That is intentional, but
pm_runtime_resume_and_get() has already dropped the usage count it
took before returning -EACCES, so the pm_runtime_put_autosuspend() at
the end of each context (in t7xx_dpmaif_napi_rx_poll() for the RX
interrupt) drops a reference that was never held.

Take the reference with pm_runtime_get_noresume() and resume with
pm_runtime_resume(), so that exactly one reference is held on every
path that touches the hardware, and drop it only on the errors that
abort the operation.

-EACCES is only returned while runtime PM is disabled and the device is
not active. Not observed; found by review.

Fixes: 46e8f49ed7b3 ("net: wwan: t7xx: Introduce power management")
Signed-off-by: Tim JH Chen <tim770802@gmail.com>
---
 drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c | 11 ++++++++---
 drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c | 14 ++++++++++----
 2 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c
index 5af90ca6e063..77770869d575 100644
--- a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c
+++ b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c
@@ -911,8 +911,10 @@ void t7xx_dpmaif_irq_rx_done(struct dpmaif_ctrl *dpmaif_ctrl, const unsigned int
 	 * which can't be done from softirq context the poll function
 	 * is running in.
 	 */
-	ret = pm_runtime_resume_and_get(ctrl->dev);
+	pm_runtime_get_noresume(ctrl->dev);
+	ret = pm_runtime_resume(ctrl->dev);
 	if (ret < 0 && ret != -EACCES) {
+		pm_runtime_put_noidle(ctrl->dev);
 		dev_err(ctrl->dev, "Failed to resume device: %d\n", ret);
 		return;
 	}
@@ -1068,9 +1070,12 @@ static void t7xx_dpmaif_bat_release_work(struct work_struct *work)
 	struct dpmaif_rx_queue *rxq;
 	int ret;
 
-	ret = pm_runtime_resume_and_get(dpmaif_ctrl->dev);
-	if (ret < 0 && ret != -EACCES)
+	pm_runtime_get_noresume(dpmaif_ctrl->dev);
+	ret = pm_runtime_resume(dpmaif_ctrl->dev);
+	if (ret < 0 && ret != -EACCES) {
+		pm_runtime_put_noidle(dpmaif_ctrl->dev);
 		return;
+	}
 
 	t7xx_pci_disable_sleep(dpmaif_ctrl->t7xx_dev);
 
diff --git a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c
index 798e4e95004f..48558b98e7c6 100644
--- a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c
+++ b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c
@@ -162,9 +162,12 @@ static void t7xx_dpmaif_tx_done(struct work_struct *work)
 	struct dpmaif_hw_info *hw_info;
 	int ret;
 
-	ret = pm_runtime_resume_and_get(dpmaif_ctrl->dev);
-	if (ret < 0 && ret != -EACCES)
+	pm_runtime_get_noresume(dpmaif_ctrl->dev);
+	ret = pm_runtime_resume(dpmaif_ctrl->dev);
+	if (ret < 0 && ret != -EACCES) {
+		pm_runtime_put_noidle(dpmaif_ctrl->dev);
 		return;
+	}
 
 	/* The device may be in low power state. Disable sleep if needed */
 	t7xx_pci_disable_sleep(dpmaif_ctrl->t7xx_dev);
@@ -461,9 +464,12 @@ static int t7xx_dpmaif_tx_hw_push_thread(void *arg)
 				break;
 		}
 
-		ret = pm_runtime_resume_and_get(dpmaif_ctrl->dev);
-		if (ret < 0 && ret != -EACCES)
+		pm_runtime_get_noresume(dpmaif_ctrl->dev);
+		ret = pm_runtime_resume(dpmaif_ctrl->dev);
+		if (ret < 0 && ret != -EACCES) {
+			pm_runtime_put_noidle(dpmaif_ctrl->dev);
 			return ret;
+		}
 
 		/* A runtime suspended device was resumed above and had its queues
 		 * restarted, so a stopped queue here belongs to a system suspend
-- 
2.43.0

