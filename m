Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618398;
	b=isxe34umB8bkBSeYLEV4b3YKSd9RdqJqg18bVwaeDRxZARaaC3abuKMnoZdOHkC0r+6M
	 OPPzT7NNtXfmBufjweNoEIySWSiQCUNh6yGTrvGMJDqhDu/ysRWfNfn999TLIOqS/pGxH
	 544YaXjLP8WLgzit/msvQUv8mCSYPmRmoey2cejurf2iSfJZiYV8LGfTzM5nwFLhaKffK
	 BG76KyrEOL8sUV9Cyu3ms0EsUMR7KvZxKTQ0qEcwgSobaL8mFDnyRjYY8jOCCSHLzyvJf
	 e+fmCcd1qFpOL3sNvEBwnvZq+KseYMc46uJfm/UawbXoJuaApy2xwQgX2J8tuDmpW2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618398;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-Spamd-Result:
	 X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=k+nTTROVDyKfp2rrDgrG0vU2JXaA7DZ47r2KczigsQc=;
	b=UsJWbDoW3x66O1G5kWzfma2w+ho4dg3sLtSAeUPWy/1hKkUgVWAAWCEt+0ZeWFhSw5IW
	 YpIS/HS9c64guVBCNXT3jucRrHNkNsAEs0SOs4//jW6SjIRJxYtXeqlgVBtR7G6v7G9zg
	 tI0gdHq+xuB36AVDZM9M5RKCZL+Sb70YzX5QvoyW/kmPcv5k4TkN5P2INPKc/iMH87T9K
	 3z8BFupJXT3r4EdDGymw11GuLeHJmCcPoBc7YgSHf/5IUhk1tHJAx6AW5H9O1a4iRGo2C
	 eYVThp0kDRl2Pjx5D5Skr4AEDFqu1E93P3DMLR1INjuaHDxhYdjBdpha9EFL5sT7VmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=eWeGsFZQ;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=BTmsiHZY;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BB3606A326
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:53:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9BB3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=eWeGsFZQ;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=BTmsiHZY
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E9B101F7EC;
	Wed, 25 Nov 2026 14:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1795618396; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k+nTTROVDyKfp2rrDgrG0vU2JXaA7DZ47r2KczigsQc=;
	b=eWeGsFZQ3HLkCureynnVrPCFkxkip1zZExe9U3KgHJPTY43nXFA/DZ3J0ukRuPnuRQ13d9
	FjRji5Tz5nX468C/IPcs2hqqmq8soOtmdJk4E7OznF6xUJSFy8VacUDkAPLkwTaj1xdRew
	uOvYi5k0ie1N8FD9jeOGpCGCKVZxxtQ=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1795618395; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k+nTTROVDyKfp2rrDgrG0vU2JXaA7DZ47r2KczigsQc=;
	b=BTmsiHZYrmtPhYeygNVIoeu/DZJ4g5MrWi2ciRD0F3sJ8HMJMMHUGkDZFYtaAYXk5DTR9o
	5wES7bbAR8asrEvL1kxZumMxweW9KfeGu/mk2ymPcrcw/y/0fZMG66S3qDjmeN2TsiabK2
	YJpJUYSz6bF/ecnB98BKa68rG75AEHw=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ABACC134E8;
	Wed, 25 Nov 2026 14:53:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2heAFVv2BmupfgAAD6G6ig:T2
	(envelope-from <oneukum@suse.com>); Wed, 25 Nov 2026 14:53:15 +0000
From: Oliver Neukum <oneukum@suse.com>
To: petkan@nucleusys.com,
	netdev@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [RFT 1/3] net: usb: rtl8150: break cycle between tasklet and URB
Date: Wed, 25 Nov 2026 15:43:07 +0100
Message-ID: <20261125145313.58434-2-oneukum@suse.com>
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
X-Spamd-Result: default: False [-15.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	URIBL_BLOCKED(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -15.80
X-Spam-Level: 
X-Spam-Flag: NO

The driver shows two different cycles that can result in
an URB or the tasklet or both to be in active use after
disconnect() or suspend() return, which will in turn
lead to a use after free.
Firstly, the tasklet will in its error handling reschedule
itself without checking the flag that indicates that the
device has been disconnected or suspended.
Secondly, the URB and the tasklet can reschedule
respectively resubmit each other in turn. To break
that cycle in addition to checking the flag the URB
has to be poisoned.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/net/usb/rtl8150.c | 33 +++++++++++++++++++++++++++------
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
index d51e43170e03..547a14beafb8 100644
--- a/drivers/net/usb/rtl8150.c
+++ b/drivers/net/usb/rtl8150.c
@@ -353,6 +353,13 @@ static void free_all_urbs(rtl8150_t * dev)
 	usb_free_urb(dev->intr_urb);
 }
 
+static void terminate_all_urbs(rtl8150_t *dev)
+{
+	usb_poison_urb(dev->rx_urb);
+	usb_poison_urb(dev->tx_urb);
+	usb_poison_urb(dev->intr_urb);
+}
+
 static void unlink_all_urbs(rtl8150_t * dev)
 {
 	usb_kill_urb(dev->rx_urb);
@@ -528,12 +535,15 @@ static int rtl8150_suspend(struct usb_interface *intf, pm_message_t message)
 {
 	rtl8150_t *dev = usb_get_intfdata(intf);
 
+	spin_lock_irq(&dev->rx_pool_lock);
+	set_bit(RTL8150_UNPLUG, &dev->flags);
+	spin_unlock_irq(&dev->rx_pool_lock);
+
 	netif_device_detach(dev->netdev);
 
-	if (netif_running(dev->netdev)) {
-		usb_kill_urb(dev->rx_urb);
-		usb_kill_urb(dev->intr_urb);
-	}
+	usb_poison_urb(dev->rx_urb);
+	usb_poison_urb(dev->intr_urb);
+
 	return 0;
 }
 
@@ -541,6 +551,13 @@ static int rtl8150_resume(struct usb_interface *intf)
 {
 	rtl8150_t *dev = usb_get_intfdata(intf);
 
+	spin_lock_irq(&dev->rx_pool_lock);
+	clear_bit(RTL8150_UNPLUG, &dev->flags);
+	spin_unlock_irq(&dev->rx_pool_lock);
+
+	usb_unpoison_urb(dev->rx_urb);
+	usb_unpoison_urb(dev->intr_urb);
+
 	netif_device_attach(dev->netdev);
 	if (netif_running(dev->netdev)) {
 		dev->rx_urb->status = 0;
@@ -618,7 +635,10 @@ static void rx_fixup(struct tasklet_struct *t)
 
 	return;
 tlsched:
-	tasklet_schedule(&dev->tl);
+	spin_lock_irq(&dev->rx_pool_lock);
+	if (!test_bit(RTL8150_UNPLUG, &dev->flags))
+		tasklet_schedule(&dev->tl);
+	spin_unlock_irq(&dev->rx_pool_lock);
 }
 
 static int enable_net_traffic(rtl8150_t * dev)
@@ -970,7 +990,8 @@ static void rtl8150_disconnect(struct usb_interface *intf)
 		set_bit(RTL8150_UNPLUG, &dev->flags);
 		tasklet_kill(&dev->tl);
 		unregister_netdev(dev->netdev);
-		unlink_all_urbs(dev);
+		terminate_all_urbs(dev);
+		tasklet_kill(&dev->tl);
 		free_all_urbs(dev);
 		free_skb_pool(dev);
 		dev_kfree_skb(dev->rx_skb);
-- 
2.56.1

