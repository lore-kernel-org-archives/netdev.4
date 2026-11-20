Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795139772;
	b=ywugprbEEbX9ixF5Ksc7nDPWQ2efPz5XB3C6cIE78UB89I4mhG0Z33kWdo73U8I6dmM5
	 2CzmNf06gCRWq+qb/7jHjvKTdV99LTkQjoWNvG3FASnBExFPj0Wz4r3BCiEBcZ1RJXpM0
	 umEq/ukMR7WbYWJeKvLydYcs157ilyGTeDNTkTCID1rQFwMpCSFnvM3xdqDDjkyt8GrsH
	 8KaXUaQ4l08SosrlZjf5aPxlClVDLkJWYheSQECo32eX6H9kKNWH+DKz98EZbpqf0+BBG
	 gukhV14VF92TJfDFt6vFSAJ9xSas15zdM7FQ+j+N1fVkEq+KdUr9n4CbZFc+EHanaLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795139772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oPmYdno3g8WSLKD4XaUSvZ7KnfsPKwYsTc83SiDb58I=;
	b=pdCM01rhWYabwBBYtqzracR2OLlgt74HUTF3M0RsVcOGsRsue/PDp7JCQS+QnTtFber9
	 IeeJbddJUb88Me2IXKPiVv0npa2OywOFFGX2pTUFPhRepSv2xa59m7Dxlb/X3WBKU4tOh
	 PeYt9MpI/bQEpWo5bCmOw+dW1zlFOGrSWme9llbMmdrDWHAt/ys4homneBuN9PSdwc2nA
	 GDmae1zsa0i5zYzXXwC0QHwDJFTVX9ZN40FsvG4by/+v71nubuT2LJ6//DXS6LAbi4T5O
	 P5nwMO3QrlI2FDNAkEDYJm/4yWyeWdtSgJXW1DqQkQTaaUXIdhWzY/M92w+UWgBF/HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vt8u0qdV;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460D0606A333
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 01:56:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 460D0606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vt8u0qdV
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2f00fc215f9so2560065ad.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795139772; x=1795744572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oPmYdno3g8WSLKD4XaUSvZ7KnfsPKwYsTc83SiDb58I=;
        b=Vt8u0qdVzKznUyLCtJOxfbqD1RvjbGLJmsTkmayi633oL1nxvM3Cnxy+yTPRViS9rt
         YIXnXBxOxjXB7icDJa6zR6KhnESI0iifY61PrUfAXarE7Oo78xwkhcnv7/6RGqD3NX23
         yALY5UE+K1RqBmpIGL7knk9bddWE8tCNi1RRjqpydLWj2JdlmSo+oSR+D/t0DO3W4txI
         pEf8dh/4ZMGmSbDthrRiQUxfhFf93+qsnqvuStnTAnYxgI+6K1wci/jwJj8EZapIsha7
         KJBG+1UcejiyKPzX2Ctsd/DlIIDcn3uq0VooYmRGbJJcf64lmJbMw9ca48JZj1gw2kFj
         3Hkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795139772; x=1795744572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oPmYdno3g8WSLKD4XaUSvZ7KnfsPKwYsTc83SiDb58I=;
        b=K/6tw2xbxLDkNsbBjU3t5Q38gDNfF23JF0vAmvXKfdwewihnB0i6wluuw01DlU0eqy
         vD+z4ZLIVsTvJeEaRjltCJtXIXzsM4nc6aB3FPnd9y/gO2Q1ArvWSNTEl1yDaLmFxXpu
         WlnYsWmve55SZ6Je5PwXHFYScNvSsXNudJqBwJNIQtTkeOto+iLHdXeOpFodfgO+Mru/
         ARrwaXsOSWjXMmaX+2MoGSq6lkeaJONJvDlmtbAjVvbB+9zS/G2SJ4gFRBUjpEjwIlbr
         6QoNfPU3+gKOoCcjxCBTqVLwCZyLxyj15XjkeScDfIIeuA7oA7Y+sWTvJxRWe09EjbEy
         6J+Q==
X-Gm-Message-State: APuU4Z8UmwI3eq0YMNkD/BbnWkx+mxjvcjz9tAD7SsWWAb7iGoHvt3ia
	2GmeCCMAkzUSxNeaulTp1h+InKMDOSKHlrGkqag1Y9ZRyoqJkfUt1kQpRu6YgadQ
X-Gm-Gg: AZFdTZdPjuagm/rPQx4hA9/ERLpjZahg4o4aEe68T1v+xh8Qf4sHglGhpCrvhYz7EL/
	mrhNEwULpuQjcxAR49hkbiD4I5UB/MfYYSnyFzuWAwSsstMdZf9c5wzobJsH80yjZwXZraL5o15
	V48mFUh9GSVSGZoxqRP5eV+F6Ml0BVMCnRmHoRFkPlhg6nxsMSlfXR+pjtDuUr4f3HdIRbdBbbA
	01a2pQuUNI2bl8vSne4lI8BvN768F37esO2/yS0qIhZ0rv1EuPAsZe6pB/230VyB+ECHPI4NeTj
	N3RBFg4hjNUS2OjC/j9x8QS4iOBrrlzcdunQJdMDu+pNAJy5LSh4ivrXsXfQb+APmGdX0VW/prJ
	bTSbuLA+nlq2qvcPg70pe/Xr0o7bVd0Dw6Ln9AWhVp/NoxyVmkXiz79DOQ3A9sXcFv7oex4gLfI
	g31AsMsK7df5dovnrPW/wSn37SBfSFr/9t2g6GLZozTr3LwDinzUtXnbG54iJx1cOpaPMi+Kw+t
	U9cYhaDmpasDYDXWscUGYZA4GNvuGRx6apWTkk/qz7+nHxTtcwtCW4jD3EVrZJvxuZRm++/+wLf
	JfI2aKT5XF+TA6uRc/mPTL+ccTd+IGxQq1vlkTEPSRJ3fJnrGwo=
X-Received: by 2002:a17:90b:4ec5:b0:3ac:7e3a:1033 with SMTP id 98e67ed59e1d1-3b41c96182bmr1177968a91.59.1795139771651;
        Thu, 19 Nov 2026 17:56:11 -0800 (PST)
Received: from u.. (61-222-64-201.hinet-ip.hinet.net. [61.222.64.201])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d63728sm5355957a91.8.2026.11.19.17.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 17:56:11 -0800 (PST)
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
Subject: [PATCH net v7 1/6] net: wwan: t7xx: fix TX push kthread soft lockup on system suspend
Date: Fri, 20 Nov 2026 09:55:51 +0800
Message-ID: <20261120015556.131547-2-tim770802@gmail.com>
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

t7xx_dpmaif_suspend() stops the TX queues (que_started = false) but
leaves dpmaif_ctrl->state at DPMAIF_STATE_PWRON. The TX push kthread
only sleeps while the TX lists are empty or state != PWRON, so when
skbs are still queued at the time the suspend callback runs its wait
condition stays true and every iteration completes without doing
anything and without sleeping: pm_runtime_resume_and_get() returns 0
without resuming anything (the PCI core resumed the device before the
suspend callback, and once runtime PM is disabled in the late phase an
active device is reported as already resumed); t7xx_pci_disable_sleep()
completes at once because md_pm_state is no longer MTK_PM_RESUMED;
t7xx_do_tx_hw_push() returns immediately because no queue is started.
There is no scheduling point in that loop, so the kthread spins on its
CPU for the rest of the suspend/resume cycle.

With s2idle and ASPM L1 enabled this was seen as a soft lockup after
about a thousand suspend/resume cycles (the 981st in the capture below).
The lockup was reported at different points of the suspend: while the
device callbacks were still running, right after this driver's own
suspend callback had stopped the queues, and after the wakeup interrupt
but before any resume callback had run. Captured with kdump on an
unmodified 6.19 kernel:

  mtk_t7xx 0000:56:00.0: PM: pci_pm_suspend returned 0 after 39260 usecs
  ...
  watchdog: BUG: soft lockup - CPU#4 stuck for 26s! [dpmaif_tx_hw_pu:764]
  RIP: 0010:ktime_get_mono_fast_ns+0x2e/0xe0
  Call Trace:
   ? t7xx_pci_enable_sleep+0x44/0x90 [mtk_t7xx]
   t7xx_dpmaif_tx_hw_push_thread+0x1f9/0x490 [mtk_t7xx]
   kthread+0x10b/0x220
   ret_from_fork+0x159/0x1d0
   ret_from_fork_asm+0x1a/0x30

Other captures sample the same loop in t7xx_pci_disable_sleep() or in
the runtime PM put; all other CPUs are idle.

The same loop runs after a resume that does not restart the queues (a
modem exception found in the PM resume state, or shutdown) until the
FSM takes the DPMAIF out of DPMAIF_STATE_PWRON.

Once pm_runtime_resume_and_get() has returned, a runtime suspended
device has been resumed and its queues restarted, so a TX queue that is
still stopped at that point was stopped by a system suspend or by an
exception. Skip the push in that case and wait on tx_wq until the queue
is restarted or the thread is stopped; t7xx_dpmaif_resume() and
t7xx_dpmaif_start() already wake tx_wq after restarting the queues.

The check is not folded into the thread's main wait condition on
purpose: a runtime suspended device also has its queues stopped and
relies on this thread calling pm_runtime_resume_and_get() to be
resumed when skbs are queued.

Fixes: 46e8f49ed7b3 ("net: wwan: t7xx: Introduce power management")
Signed-off-by: Tim JH Chen <tim770802@gmail.com>
---
 drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c
index 236d632cf591..798e4e95004f 100644
--- a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c
+++ b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c
@@ -445,6 +445,7 @@ static void t7xx_do_tx_hw_push(struct dpmaif_ctrl *dpmaif_ctrl)
 static int t7xx_dpmaif_tx_hw_push_thread(void *arg)
 {
 	struct dpmaif_ctrl *dpmaif_ctrl = arg;
+	bool txq_stopped;
 	int ret;
 
 	while (!kthread_should_stop()) {
@@ -464,10 +465,23 @@ static int t7xx_dpmaif_tx_hw_push_thread(void *arg)
 		if (ret < 0 && ret != -EACCES)
 			return ret;
 
-		t7xx_pci_disable_sleep(dpmaif_ctrl->t7xx_dev);
-		t7xx_do_tx_hw_push(dpmaif_ctrl);
-		t7xx_pci_enable_sleep(dpmaif_ctrl->t7xx_dev);
+		/* A runtime suspended device was resumed above and had its queues
+		 * restarted, so a stopped queue here belongs to a system suspend
+		 * or an exception: wait for t7xx_dpmaif_resume() or
+		 * t7xx_dpmaif_start() to restart it instead of spinning.
+		 */
+		txq_stopped = !t7xx_select_tx_queue(dpmaif_ctrl);
+		if (!txq_stopped) {
+			t7xx_pci_disable_sleep(dpmaif_ctrl->t7xx_dev);
+			t7xx_do_tx_hw_push(dpmaif_ctrl);
+			t7xx_pci_enable_sleep(dpmaif_ctrl->t7xx_dev);
+		}
 		pm_runtime_put_autosuspend(dpmaif_ctrl->dev);
+
+		if (txq_stopped)
+			wait_event_interruptible(dpmaif_ctrl->tx_wq,
+						 t7xx_select_tx_queue(dpmaif_ctrl) ||
+						 kthread_should_stop());
 	}
 
 	return 0;
-- 
2.43.0

