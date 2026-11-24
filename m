Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541196;
	b=dpZc+OOZD8Hyw9/IX39mCSjTCRoAUHjIcf6E3Mv3sCoBQ6I6RCP9X4dBPnCoIbY9V7XI
	 S8x/FmX7t2YdbINpR/DDDhU5mYi8A3kQLkot6iXPUynj5ibgrH9E8gtDVXoQ0tfAGWeXW
	 uyrUaTNzPoy55AajCjHAFI/buo7p4NHWmEkAbJq8f57g0ouFEKi3YfzuC08Ab4QR+d1mP
	 n2cpaeY2ALLc7YvhncdIvHDPi438ACPn6kAN5BV8SYnu6at10SEW3QCgwl/CUqHCDgBL+
	 XJ+h8ucUm2QaCUvlB37w1N/ZlxMTMkS+N78d3SVfSB1+MCnd2KDv6N+z/C8rcCVSFrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FpWUGjcPMl9tABfpkKC4qXoGZbOjyu2JY/vXM9uQYgU=;
	b=ROBBAc+OoyDLEzkJkz1xMmmMN+BGtoFEw4P3/iDXh8Db5pwH7lZXiWnJtfpcCvji0Pef
	 85Nvfbg34pzg9GGsFCjD33rLGqxjqmzGxKW7WqiEEirOorY3TnOjLP+wmhvqXVb0duhDI
	 Q12i6l5VH+ikE+Y6UC9MF2IFG1dMu5sC5lHQ2k6wupBDS+Myf1v5sIGxt5Sa1IRtq/SMp
	 mr0uA/W05F9/huXB6iTCox81W9Xon6zSxyJm/8W9QO92f92pEFl2oLRfIS1JgfZ2vvwq9
	 As709yrjSHiZnFdv1USn+ZhDOg9vsJe167q4IAQutTS1PLIoL+VL6pGdJY1YSrHyLiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hjQo36Vm;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7492606A330
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 17:26:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7492606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hjQo36Vm
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f04ad2c46dso28539375ad.2
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 09:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795541195; x=1796145995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FpWUGjcPMl9tABfpkKC4qXoGZbOjyu2JY/vXM9uQYgU=;
        b=hjQo36Vmposs2on1n6HQ97KnO55dvR2Pepn+qh301mQXFpC/BppNqNm8HdTmIjjg2j
         bkjx9N5oPrsgnq2qyckPqSsXgIun0w1J9UQVkBitJULo54QN1V1zq0zbZMJBD80aWfnQ
         d9/gu8wWJLbpYf4Nd1qsOhOOzStekEJ8CK0joA8HpmMsKVhQycfutV/04VPLUW/31Qxt
         WoldKUwz53rycmknKLP4Xs1l5LHcRddIrKgXsAMAbGMQYLkdpB37a2IdsLa2lqi4TfzR
         z+Zc3xWCpPEBTiorA+F5vimSGq7+k/8kwPL/7bzAzgyof8EWV93OTjKFYo/yYvF7JqCO
         mDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541195; x=1796145995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FpWUGjcPMl9tABfpkKC4qXoGZbOjyu2JY/vXM9uQYgU=;
        b=UmEqoszuhM/bVVxNO5CJ+g73DZoX4lwFPYClkN9+SbwfggbVbdGq/Wr1rxa0qfc4jz
         0om4MfaENDWw9UHQgAPSFtTb5W0W8swFxHRyfRnYdQ/8K2DLqLicc3BRlX0ERTw2jcPM
         UHD+FX7sYHLdDuQvYIvJu3Gff2pL7yvpTfjK/hil7e1CzutBPwXDlSqk2xGe4UIzXv22
         OB82pGUmWiToLrAdCF8FooGL3l+OO42Q8Y6k/sAtltLAIOR4DKVdh1dEAki1kMs8U9aU
         dLPFoS1/hB9QnlcUunV/Wga3d7kE4Lbs5dbtXIQp4nZq84RqOm7PkYXJmu5fCE9D6RHE
         bWzw==
X-Gm-Message-State: APuU4Z/ba279tdOf390ZefLLWeNmCvgXGn6wtZxsBupmoF2n+ClPQL6j
	Tuy/99EFJ7yhPrpakNVsLGIlw6in4fmd7Q8WxErs0IrTeHhlBtVUT3PS1XgInaMKDr8=
X-Gm-Gg: AZFdTZfYinYl3VHUslkA+gE+fiLmf3AMxTsG71rJ4vQQwLbnREKzTpt/ycoqVhiHi/0
	aX5jec8IzE+1xPVj2EhSBKCIXUUXIQZRMaF2/o5HGzgiEPIezNrHmMMvA7+SxLH6ujA+XOxrHJu
	lTVoeSvpVoi8MEuOyfRgclqMOzCWz80UP9v2za9aUo/3b8pRD+DC2MjLxBetmZ5ZBHCbUyNu7wz
	47xkirQDpV7FtFScGfx7IztopM4KICnRuW7JnDNqXRb+56BMNpe2iasB0uCg1DgUZsgccGG5ysQ
	R2ZWhNQhwCgMvTxwwQm2YTZyOLehZusR5jJjKUyIYT1mMs+tD0rfCXBB4biaQBQYv3FbhXej1mW
	Jj5iRV2Pi63Ft9zv8J/oqsxQ5VfS8qeQpTjilNlzdVqJdCtf8E1pOt8V6ljFzLF7qAAIOU81mjC
	GBBrLctCScyXUPKLqw9WBHfO1X7BKFIF+XPOzPZgEzQ3ryySlqxfVWG5bLkYZAASgbjs1XCAGnA
	W1v3VPfh5bAL1RSwcuJygH5LpPX6bQTFCHq5ag7VPpskwZ10FNqek0BQBAAOUIEndhvrvZqyIYv
	jo4ma4YD1vMWQjBVfyQ2uLZi8rj2639NdSsgVCdLkvs6HXxfn8Eg+g==
X-Received: by 2002:a17:903:b0e:b0:2df:35f1:8771 with SMTP id d9443c01a7336-2f03f1e0d4amr151002195ad.54.1795541195221;
        Tue, 24 Nov 2026 09:26:35 -0800 (PST)
Received: from x1.hsd1.wa.comcast.net ([2601:600:a482:7d70::b4f9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f04f8aca00sm63052795ad.38.2026.11.24.09.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:26:34 -0800 (PST)
From: David Westen <davidlwesten@gmail.com>
To: netdev@vger.kernel.org
Cc: mail@maciej.szmigiero.name,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Abdun Nihaal <nihaal@cse.iitm.ac.in>,
	M Chetan Kumar <m.chetan.kumar@intel.com>,
	David Westen <davidlwesten@gmail.com>
Subject: [PATCH net v2 2/3] net: wwan: iosm: fix the wait for the modem in the host sleep handshake
Date: Tue, 24 Nov 2026 09:26:26 -0800
Message-ID: <20261124172627.41847-3-davidlwesten@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261124172627.41847-1-davidlwesten@gmail.com>
References: <20261124172627.41847-1-davidlwesten@gmail.com>
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

Before the ENTER_SLEEP message is sent, ipc_pm_wait_for_device_active()
waits for the modem to report itself active, but:

- it tests ap_state before it sets the bit that asks the tasklet for a
  wake-up, so a wake-up in between is lost and the wait times out
- a wake-up that arrives after a timeout leaves the completion done, so
  a later wait returns at once
- an -ERESTARTSYS return from the interruptible wait counts as success

Set the bit first, paired with a barrier in the tasklet, reinitialize
the completion before each wait, and wait uninterruptibly, like the
wait for the ENTER_SLEEP reply does.

Found by an AI code review agent, not reproduced. Tested on an XMM7360
with suspend-to-idle.

Fixes: be8c936e540f ("net: iosm: power management")
Signed-off-by: David Westen <davidlwesten@gmail.com>
---
 drivers/net/wwan/iosm/iosm_ipc_pm.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wwan/iosm/iosm_ipc_pm.c b/drivers/net/wwan/iosm/iosm_ipc_pm.c
index 413601c72dcd..c76cb9663039 100644
--- a/drivers/net/wwan/iosm/iosm_ipc_pm.c
+++ b/drivers/net/wwan/iosm/iosm_ipc_pm.c
@@ -72,19 +72,25 @@ bool ipc_pm_wait_for_device_active(struct iosm_pm *ipc_pm)
 {
 	bool ret_val = false;
 
-	if (ipc_pm->ap_state != IPC_MEM_DEV_PM_ACTIVE) {
-		/* Complete all memory stores before setting bit */
-		smp_mb__before_atomic();
+	/* Drop a completion left over from an earlier timeout */
+	reinit_completion(&ipc_pm->host_sleep_complete);
 
+	/* Complete all memory stores before setting bit */
+	smp_mb__before_atomic();
+
+	set_bit(0, &ipc_pm->host_sleep_pend);
+
+	/* Set the bit before testing ap_state, so that a wake-up after the
+	 * test completes host_sleep_complete. Pairs with the barrier in
+	 * ipc_pm_on_link_wake().
+	 */
+	smp_mb__after_atomic();
+
+	if (ipc_pm->ap_state != IPC_MEM_DEV_PM_ACTIVE) {
 		/* Wait for IPC_PM_ACTIVE_TIMEOUT_MS for Device sleep state
 		 * machine to enter ACTIVE state.
 		 */
-		set_bit(0, &ipc_pm->host_sleep_pend);
-
-		/* Complete all memory stores after setting bit */
-		smp_mb__after_atomic();
-
-		if (!wait_for_completion_interruptible_timeout
+		if (!wait_for_completion_timeout
 		   (&ipc_pm->host_sleep_complete,
 		    msecs_to_jiffies(IPC_PM_ACTIVE_TIMEOUT_MS))) {
 			dev_err(ipc_pm->dev,
@@ -130,6 +136,11 @@ static void ipc_pm_on_link_wake(struct iosm_pm *ipc_pm, bool ack)
 
 		ipc_cp_irq_sleep_control(ipc_pm->pcie, IPC_MEM_DEV_PM_ACTIVE);
 
+		/* Order the ap_state store before the bit test, pairs with
+		 * ipc_pm_wait_for_device_active().
+		 */
+		smp_mb();
+
 		/* check the consume state !!! */
 		if (test_bit(CONSUME_STATE, &ipc_pm->host_sleep_pend))
 			complete(&ipc_pm->host_sleep_complete);
-- 
2.56.0

