Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795436989;
	b=Ij8WYgKJaUwERdEGQmJ2sEapefMsNQRZUsr53nlooJSQ/Xv0hl19/T49+Bd3oi1byfNR
	 IwH0PETylj8yOKdbXiPBcoEFfvYAnOZrHgu/wZEwbn8LRRHrZlXzlAAn0voaITmfGAp7r
	 T+4cb1w+ds1Lwu4Lr7Y1HBZfGj6kN4okR1hP1XH6RSMpdw+LlzbRf6pCVknKtmyF5khhE
	 2NXyYaf4nHmSUsXmVjHDvpDPINg86HfwZI1TqTohI+scKVfoWEAJCBm/nWrEe/6erjBZk
	 1OFUN8lnZ0k0YRR1KOhnnt5ISUxC0Uuo2VBCqQVcwNPsRm8lF9prKwvRMk0LGoDNoFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer;
	bh=Ta0/TAM8wqUJGQiRANFnJ+0sgPO3Li82M7b5slMPdiM=;
	b=tDeGSKJV9eSfvS2Ozu9de7kRo5Cho7vGonbJuOw7H1EZBVw0Z8wMlSzMOrsb4fzmR0F9
	 c+H/8MTe9M2LbpydW1hOe9geKnJcjPQ8s6LDYXFEeD5/KZ+zVj8cB3LG2PI5gBspu5Vo8
	 dtx1I6U57ovG4B5qNcaJzqcFpARBGQmL/+BscVdyQUQGs6QrpFneFnptAK9trMIf0QDfZ
	 h95usaiM1034ufQEJ7yCOQTgne6ZYAYs2riwf9/2BjJB+naQhbS9Zp6DMPi71Yctc/jQS
	 Z7lZ9AxPPkRNGdtv+ugPjYZMZi/D/GSePggng6v9ipXDmgF1nvE+pSOuk9/zf2x2KYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=S9mxk1Cf;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546E1606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 12:29:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 546E1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=S9mxk1Cf
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-38190551625so6707835eec.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 04:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795436987; x=1796041787; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ta0/TAM8wqUJGQiRANFnJ+0sgPO3Li82M7b5slMPdiM=;
        b=S9mxk1CffP850RXsElPIQgIWz13kTlptKeK08NsKnfDE2zzBu6X+eU9z7o2jeoF1sE
         jUr+08cJ7om3C4/Lz67uJcbckAHUW5UfpVVEcDv18q/mIHX5dy8Td/4+7XbkW5z8LcYh
         nEsY7cDdtFHl9dIS+uHpI1YOAa/23bPhXqgsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795436987; x=1796041787;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Ta0/TAM8wqUJGQiRANFnJ+0sgPO3Li82M7b5slMPdiM=;
        b=jtgoBRP5UPw2FAD8qbFwyJrrbch5aOdYL6n67GAKlSLJKC+D75uXei4P91QTxRgPfW
         yldEg8lDzY/ZpMa3UlviFNMe5HxI1LF5G5VKoOfLTrTMWN9rxk/jCnqq4lAIckIWWZaL
         ETWDdlPFz0ZqTZT86BGWICje6kxrbyTy2Hb8lABGuiPEg/3Gbi8ycem+DyV+SmFBqxQg
         02fT2wxFuXxoUkzR/POq1LggYYc7JQytrhN9zGS3Gb0baaMEJW3DW0St4y1v9TVYcQhI
         xJLEUfd8ZMZ/7AHhNX4kVov3TYnPBCh+Xdh4jtQU2233xDxLSnQfxSe1yjldf/jlIguN
         rsYw==
X-Forwarded-Encrypted: i=1; AL+hErHixu/1uy8Qr99PHED1+BxAUQIdUsjDsmKtKtaCft4qaBp+tJmT94erUe0V0QuInKm6pPTvf4g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VQf2RmmwpRqp7spepz1DjmnnaVT7QH/DQCU4yxB20NaRIMWd/
	H5hrasbnyY49L2xv+9nlzkpEWB4DNs45cGkVOrMRv60Z4YFCwUYN71yT0isnuJjtdQ==
X-Gm-Gg: AZFdTZfRGERT/fuvdSkB0UEhmoS7Evbc7yEwluXXuZkzmUh0TIkxhpoJTOFSiVe03W2
	nRFjFGVqxHNcrxPAmbAaI63V+jXtI3pDgOVdqt4mK8QFsRhwx7Z9bBPrdCIZhS7k58ZzqmIGYHt
	cb9LQj0oDI/ny+UtJCthTNyTn6SFUIZyBtrRFM/nl18qSCTW88tP8XjlwTMV+37ZmFg7yXQbh1x
	TWjm6mNsp8YVnvhQm0Q51HTe7HxO4v3/jGkOaDWkwaZFlk45Wb/8RHEk+6o1CL45d6VWuyVZFD7
	boZ1nWp7pobNukmrJFOVK087FAPZpvmAFaoaSPRMEleyug222GkuDDGZMJKMeaO0eFfK6Y7vQkG
	TravNyYdI5vA+BVL0p2H0gsp4iOx4ipCTmPdfJPNdSLVXn22EbcNk5leLblt3+6fXqvVCdEMraG
	MmdEH3zx4jXs6n8GX5EMz9wOKBqZZSE9cmpA+z7w15c9lZrH4KsRY9WQqrFHpQ3XEwulQRk1fAG
	6DwDvLjPnqV3ZOfJoB1yqyNtfd1eYB4RghBmP4BHtkhKlT1MrJoYGYBydM9daiEIPmJOAMpgVBt
	E3tp6VGFds5UzDWfZUJkvRVCsTFPBHs0D7ArXw1XkKBBUVE02NKofszyfxuCbpNVx5gCVHQnODl
	WLSmmQ+1fMuOXlmsnPlNBHGMSTOmvAG1QlQ==
X-Received: by 2002:a05:7300:bf10:b0:376:b957:bfb with SMTP id 5a478bee46e88-3856f7563b1mr14979380eec.17.1795436987509;
        Mon, 23 Nov 2026 04:29:47 -0800 (PST)
Received: from yuanhsinte.c.googlers.com (55.239.81.34.bc.googleusercontent.com. [34.81.239.55])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm32810950eec.13.2026.11.23.04.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:29:47 -0800 (PST)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Google-Original-From: Hsin-Te Yuan <yuanhsinte@google.com>
Date: Mon, 23 Nov 2026 12:29:39 +0000
Subject: [PATCH net] r8152: do not (un)register the PM notifier under RTNL
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-r8152-pm-notifier-rtnl-v1-1-31e011a2ee51@google.com>
X-B4-Tracking: v=1; b=H4sIALIxBGsC/x3MQQqEMAxA0atI1gZsxXb0KuJCNNWAEyUtIoh3t
 7h8i/9viKRMEbriBqWTI++SYcoCpnWUhZDnbLCVdcbYGvVnGovHH2VPHJgUNcmG3rW+Gcm74Gf
 I8aEU+PrGPQglGJ7nBbvO0q1tAAAA
X-Change-ID: 20261123-r8152-pm-notifier-rtnl-76975ae76f7d
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 hayeswang <hayeswang@realtek.com>
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org, 
 Hsin-Te Yuan <yuanhsinte@google.com>
X-Mailer: b4 0.14.3

If an r8152 Ethernet adapter is plugged or unplugged as a device goes to
sleep, the suspend attempt and every task waiting on RTNL can deadlock,
leaving the device unable to wake up.

In commit 5ee3c60c8d3b ("r8152: fix the wake event"),
register_pm_notifier() and unregister_pm_notifier() were added to
rtl8152_open() and rtl8152_close(), the .ndo_open and .ndo_stop handlers,
which run under RTNL and take the PM notifier chain rwsem
(pm_chain_head.rwsem) for writing. During suspend or hibernation, the PM
core holds that rwsem for reading while calling wg_pm_notification()
(registered in wg_device_init()), which takes rtnl_lock() unless
CONFIG_PM_AUTOSLEEP or CONFIG_PM_USERSPACE_AUTOSLEEP is enabled:

  Task A (open or close)            Task B (suspend or hibernate)
  rtnl_lock()                       down_read(&pm_chain_head.rwsem)
  rtl8152_open() / rtl8152_close()  wg_pm_notification()
    (un)register_pm_notifier()        rtnl_lock()
      down_write(&pm_chain_head.rwsem)

Register the notifier in rtl8152_probe_once(), and unregister it in
rtl8152_disconnect() and in the probe error path, outside RTNL.

Set PM_NOTIFIER_AUTOPM_HELD when rtl_notifier() acquires a runtime PM
reference, and drop the reference at the post event or right after
unregister_pm_notifier() only if that flag was set. Otherwise an adapter
probed or removed between the prepare and post events would drop a
reference it never took or never drop one it took. System suspend now
also resumes an autosuspended adapter whose interface is down, which
rtl8152_runtime_resume() handles.

Fixes: 5ee3c60c8d3b ("r8152: fix the wake event")
Signed-off-by: Hsin-Te Yuan <yuanhsinte@google.com>
---
 drivers/net/usb/r8152.c | 39 ++++++++++++++++++++++++++++++---------
 1 file changed, 30 insertions(+), 9 deletions(-)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index d3bb7ee9c9bf..fea47a892414 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -792,6 +792,7 @@ enum rtl8152_flags {
 	IN_PRE_RESET,
 	PROBED_WITH_NO_ERRORS,
 	PROBE_SHOULD_RETRY,
+	PM_NOTIFIER_AUTOPM_HELD,
 };
 
 #define DEVICE_ID_LENOVO_USB_C_TRAVEL_HUB		0x721e
@@ -7077,12 +7078,18 @@ static int rtl_notifier(struct notifier_block *nb, unsigned long action,
 	switch (action) {
 	case PM_HIBERNATION_PREPARE:
 	case PM_SUSPEND_PREPARE:
-		usb_autopm_get_interface(tp->intf);
+		/*
+		 * Remember that the reference was taken. The device may be
+		 * probed or removed before the matching PM_POST_* event.
+		 */
+		if (!usb_autopm_get_interface(tp->intf))
+			set_bit(PM_NOTIFIER_AUTOPM_HELD, &tp->flags);
 		break;
 
 	case PM_POST_HIBERNATION:
 	case PM_POST_SUSPEND:
-		usb_autopm_put_interface(tp->intf);
+		if (test_and_clear_bit(PM_NOTIFIER_AUTOPM_HELD, &tp->flags))
+			usb_autopm_put_interface(tp->intf);
 		break;
 
 	case PM_POST_RESTORE:
@@ -7135,10 +7142,6 @@ static int rtl8152_open(struct net_device *netdev)
 	mutex_unlock(&tp->control);
 
 	usb_autopm_put_interface(tp->intf);
-#ifdef CONFIG_PM_SLEEP
-	tp->pm_notifier.notifier_call = rtl_notifier;
-	register_pm_notifier(&tp->pm_notifier);
-#endif
 	return 0;
 
 out_unlock:
@@ -7155,9 +7158,6 @@ static int rtl8152_close(struct net_device *netdev)
 	struct r8152 *tp = netdev_priv(netdev);
 	int res = 0;
 
-#ifdef CONFIG_PM_SLEEP
-	unregister_pm_notifier(&tp->pm_notifier);
-#endif
 	tasklet_disable(&tp->tx_tl);
 	clear_bit(WORK_ENABLE, &tp->flags);
 	usb_kill_urb(tp->intr_urb);
@@ -10283,6 +10283,15 @@ static int rtl8152_probe_once(struct usb_interface *intf,
 
 	netif_napi_add(netdev, &tp->napi, r8152_poll);
 
+#ifdef CONFIG_PM_SLEEP
+	/*
+	 * Not in ndo_open(): this takes the PM notifier chain lock, which
+	 * must not be taken under RTNL.
+	 */
+	tp->pm_notifier.notifier_call = rtl_notifier;
+	register_pm_notifier(&tp->pm_notifier);
+#endif
+
 	ret = register_netdev(netdev);
 	if (ret != 0) {
 		dev_err(&intf->dev, "couldn't register the device\n");
@@ -10308,6 +10317,12 @@ static int rtl8152_probe_once(struct usb_interface *intf,
 	unregister_netdev(netdev);
 
 out1:
+#ifdef CONFIG_PM_SLEEP
+	unregister_pm_notifier(&tp->pm_notifier);
+	/* No PM_POST_* event is going to be delivered anymore. */
+	if (test_and_clear_bit(PM_NOTIFIER_AUTOPM_HELD, &tp->flags))
+		usb_autopm_put_interface(tp->intf);
+#endif
 	tasklet_kill(&tp->tx_tl);
 	cancel_delayed_work_sync(&tp->hw_phy_work);
 	if (tp->rtl_ops.unload)
@@ -10364,6 +10379,12 @@ static void rtl8152_disconnect(struct usb_interface *intf)
 		rtl_set_unplug(tp);
 
 		unregister_netdev(tp->netdev);
+#ifdef CONFIG_PM_SLEEP
+		unregister_pm_notifier(&tp->pm_notifier);
+		/* No PM_POST_* event is going to be delivered anymore. */
+		if (test_and_clear_bit(PM_NOTIFIER_AUTOPM_HELD, &tp->flags))
+			usb_autopm_put_interface(tp->intf);
+#endif
 		tasklet_kill(&tp->tx_tl);
 		cancel_delayed_work_sync(&tp->hw_phy_work);
 		if (tp->rtl_ops.unload)

---
base-commit: af6737b9066832a2017c281159950ba92385ce00
change-id: 20261123-r8152-pm-notifier-rtnl-76975ae76f7d

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@google.com>

