Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618398;
	b=GAM/1p4lYhJYeBNmCVMD0grwUSF/qlms8FOVItLczEtlBF5q7yXBFF77sHgCrP8Dgj00
	 RIg5g0r2n5GjY93wrEz/fPcj5b7HkyUSdnFx2Ddw+UTqaA1XqqI2JJQgaBan06qsx3Cf2
	 eEUxqewftQMlQo/U2lKw6iM8cThfF0g89ZLEr7BYj6WvrNovWc3m7MxIjUuzgHIPNbwIu
	 JWY3xDWKU3Em+BhmjBahz+7keN4bW+sy4m518ZgQ0lr7lVtjr0ZTHhCjGUx+ximMBSKc/
	 HxsAkZrZzodQI3chtOOIR21v9GD8Ip2XXEDM9FBIGFSnj24xqC2l7dqYcboNJ8DUAbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618398;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Pre-Result:X-Rspamd-Server:
	 X-Spamd-Result:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Rspamd-Queue-Id:X-Rspamd-Pre-Result:X-Rspamd-Action;
	bh=GADvwiQFUpkbk1X/NvzSOsSUOWhl3N+f4zr6ofpRQPU=;
	b=U89c+4TYaxwMKS7idGuDyOkaL882HVrbyCUrHo8HgjbtG4XGqxlmBHvSfrGa0+Z/Q+rl
	 SZShTX7oSNYHa8DqbGt/Cz48DQb73U4u/ffU6+j/Rgo7pnRj5FBopqxnWkNGuTUT3i8/1
	 ikqV8CL6xbw5H31UcIxjthSrRpsGN+FrXRGXGfvL4GG1u0aYqLGqqv/2Xd4TB4i8uUQxH
	 C6vCfB8ZEI0ygvXR1OmAsMs5NikVwtXvnxp6sEGLMUTN2FXxMpiqF/zayBDtaCaBVZ56r
	 zo5gK4vooVZyIUN9ZZTGMXXkF0iB03R88dQxTIzDb6E4pvC52LwdzJUdgiHEMvu/YPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8778606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:53:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8778606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 344E722348;
	Wed, 25 Nov 2026 14:53:16 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F08C3134CA;
	Wed, 25 Nov 2026 14:53:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2heAFVv2BmupfgAAD6G6ig:T4
	(envelope-from <oneukum@suse.com>); Wed, 25 Nov 2026 14:53:15 +0000
From: Oliver Neukum <oneukum@suse.com>
To: petkan@nucleusys.com,
	netdev@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [RFT 3/3] net: usb: rtl8150: cease all IO upon close
Date: Wed, 25 Nov 2026 15:43:09 +0100
Message-ID: <20261125145313.58434-4-oneukum@suse.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125145313.58434-1-oneukum@suse.com>
References: <20261125145313.58434-1-oneukum@suse.com>
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
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Queue-Id: 344E722348
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action

close() suffers from the same cyle of resubmission
and rescheduling as disconnect. It can be broken
by cancelling the tasklet while the URBs are poisoned.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/net/usb/rtl8150.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
index 5de917ce250f..f09792c4c680 100644
--- a/drivers/net/usb/rtl8150.c
+++ b/drivers/net/usb/rtl8150.c
@@ -97,6 +97,7 @@ enum rtl8150_usb_ep {
 #define	RX_REG_SET		1
 #define	RTL8150_UNPLUG		2
 #define	RX_URB_FAIL		3
+#define RTL8150_QUIET		4
 
 /* Define these values to match your device */
 #define	VENDOR_ID_REALTEK		0x0bda
@@ -360,11 +361,11 @@ static void terminate_all_urbs(rtl8150_t *dev)
 	usb_poison_urb(dev->intr_urb);
 }
 
-static void unlink_all_urbs(rtl8150_t * dev)
+static void enable_all_urbs(rtl8150_t *dev)
 {
-	usb_kill_urb(dev->rx_urb);
-	usb_kill_urb(dev->tx_urb);
-	usb_kill_urb(dev->intr_urb);
+	usb_unpoison_urb(dev->rx_urb);
+	usb_unpoison_urb(dev->tx_urb);
+	usb_unpoison_urb(dev->intr_urb);
 }
 
 static inline struct sk_buff *pull_skb(rtl8150_t *dev)
@@ -453,7 +454,8 @@ static void read_bulk_callback(struct urb *urb)
 
 	return;
 resched:
-	tasklet_schedule(&dev->tl);
+	if (!test_bit(RTL8150_QUIET, &dev->flags))
+		tasklet_schedule(&dev->tl);
 }
 
 static void write_bulk_callback(struct urb *urb)
@@ -536,7 +538,7 @@ static int rtl8150_suspend(struct usb_interface *intf, pm_message_t message)
 	rtl8150_t *dev = usb_get_intfdata(intf);
 
 	spin_lock_irq(&dev->rx_pool_lock);
-	set_bit(RTL8150_UNPLUG, &dev->flags);
+	set_bit(RTL8150_QUIET, &dev->flags);
 	spin_unlock_irq(&dev->rx_pool_lock);
 
 	netif_device_detach(dev->netdev);
@@ -552,7 +554,7 @@ static int rtl8150_resume(struct usb_interface *intf)
 	rtl8150_t *dev = usb_get_intfdata(intf);
 
 	spin_lock_irq(&dev->rx_pool_lock);
-	clear_bit(RTL8150_UNPLUG, &dev->flags);
+	clear_bit(RTL8150_QUIET, &dev->flags);
 	spin_unlock_irq(&dev->rx_pool_lock);
 
 	usb_unpoison_urb(dev->rx_urb);
@@ -636,7 +638,8 @@ static void rx_fixup(struct tasklet_struct *t)
 	return;
 tlsched:
 	spin_lock_irq(&dev->rx_pool_lock);
-	if (!test_bit(RTL8150_UNPLUG, &dev->flags))
+	if (!test_bit(RTL8150_UNPLUG, &dev->flags) &&
+			!test_bit(RTL8150_QUIET, &dev->flags))
 		tasklet_schedule(&dev->tl);
 	spin_unlock_irq(&dev->rx_pool_lock);
 }
@@ -805,9 +808,12 @@ static int rtl8150_close(struct net_device *netdev)
 	rtl8150_t *dev = netdev_priv(netdev);
 
 	netif_stop_queue(netdev);
+	set_bit(RTL8150_QUIET, &dev->flags);
 	if (!test_bit(RTL8150_UNPLUG, &dev->flags))
 		disable_net_traffic(dev);
-	unlink_all_urbs(dev);
+	terminate_all_urbs(dev);
+	tasklet_kill(&dev->tl);
+	enable_all_urbs(dev);
 
 	return 0;
 }
-- 
2.56.1

