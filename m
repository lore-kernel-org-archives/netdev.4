Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618398;
	b=2s6vBjgCPiCkqQIE+VSVZYdfhP58iVzU8Z572wREZVVbjCNMeY9tHzwSo360Qe2dOl84
	 5ySnTrP5N0edfsAnlgBKeIt1i3dgSOe7zUPIXrbPrEtulRdEsDTH0mVQ9YKbm97rPhrEh
	 7nbenVOoPl0v6OFprZz3m5qzTxqcJS1MSATJd28JVhpMz6FMKbOUXx1EBeYlA/ZOeVXwq
	 haaSd9D9bCfMb5X3+s3i7SdBXmCevowr19j68906dfjiwFdvPx/F3xrHNQwx7h/yDvm8a
	 /pbzYPN/XGUk2wynWbHc5YzCqNUMElnsorL8I9ZquQvJiqDePWZo3eCmfuJyvylv5OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618398;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Pre-Result:X-Rspamd-Queue-Id:
	 X-Rspamd-Pre-Result:X-Rspamd-Action:X-Rspamd-Server:X-Spam-Level:
	 X-Spamd-Result:X-Spam-Flag:X-Spam-Score;
	bh=zDIOlglNc63SdCdi8MwqfU6OHyHZVrPRTRAWA2JKjOM=;
	b=2nxa3OcU4B4cnnzKHXurURlvAbPmbjReCLI5eftPxvb6CgPPz4SeEZVXHGC6B32j3Onm
	 iWJLFbugXrt3HYpcoHOmt00NCro8ey2X/wlVcq9H5dWZN7LwgdpRNMtHD+4zlwUBgzgn6
	 iDpeI90jXvSzWN5l4e7xfk9bM9n7qmiJU/fQUgQO9MoAd0O82Lqmmf+zWkzzv5vxw4GAj
	 1Q7288ykJIIaSx2kvf+5thM5Fo9wkXJ6T9QUt5nWALjQVxOsU7uZws4PMHO2oRBq//JFo
	 Fw83HLYU9OfKVv6Xv8W6pxOG3zRFM56kKdP6tV4/kU7Ggubxe0fhmoUY3jqv5h0R2ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872C6606A323
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:53:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 872C6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 17F4C2201F;
	Wed, 25 Nov 2026 14:53:16 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CD1E313505;
	Wed, 25 Nov 2026 14:53:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2heAFVv2BmupfgAAD6G6ig:T3
	(envelope-from <oneukum@suse.com>); Wed, 25 Nov 2026 14:53:15 +0000
From: Oliver Neukum <oneukum@suse.com>
To: petkan@nucleusys.com,
	netdev@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [RFT 2/3] net: usb: rtl8150: fix race in open() error handling
Date: Wed, 25 Nov 2026 15:43:08 +0100
Message-ID: <20261125145313.58434-3-oneukum@suse.com>
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
X-Rspamd-Queue-Id: 17F4C2201F
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00

In case open fails the URB already submitted must be killed.
Because rx_urb can schedule a tasklet, which would have to
be killed as well, it is better to submit intr_urb first
in order to get correct error handling.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/net/usb/rtl8150.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
index 547a14beafb8..5de917ce250f 100644
--- a/drivers/net/usb/rtl8150.c
+++ b/drivers/net/usb/rtl8150.c
@@ -525,7 +525,7 @@ static void intr_callback(struct urb *urb)
 	res = usb_submit_urb (urb, GFP_ATOMIC);
 	if (res == -ENODEV)
 		netif_device_detach(dev->netdev);
-	else if (res)
+	else if (res && res != -EPERM)
 		dev_err(&dev->udev->dev,
 			"can't resubmit intr, %s-%s/input0, status %d\n",
 			dev->udev->bus->bus_name, dev->udev->devpath, res);
@@ -775,20 +775,22 @@ static int rtl8150_open(struct net_device *netdev)
 
 	usb_fill_bulk_urb(dev->rx_urb, dev->udev, usb_rcvbulkpipe(dev->udev, 1),
 		      dev->rx_skb->data, RTL8150_MTU, read_bulk_callback, dev);
-	if ((res = usb_submit_urb(dev->rx_urb, GFP_KERNEL))) {
+	usb_fill_int_urb(dev->intr_urb, dev->udev, usb_rcvintpipe(dev->udev, 3),
+			dev->intr_buff, INTBUFSIZE, intr_callback,
+			dev, dev->intr_interval);
+	res = usb_submit_urb(dev->intr_urb, GFP_KERNEL);
+	if (res) {
 		if (res == -ENODEV)
 			netif_device_detach(dev->netdev);
-		dev_warn(&netdev->dev, "rx_urb submit failed: %d\n", res);
+		dev_warn(&netdev->dev, "intr_urb submit failed: %d\n", res);
 		return res;
 	}
-	usb_fill_int_urb(dev->intr_urb, dev->udev, usb_rcvintpipe(dev->udev, 3),
-		     dev->intr_buff, INTBUFSIZE, intr_callback,
-		     dev, dev->intr_interval);
-	if ((res = usb_submit_urb(dev->intr_urb, GFP_KERNEL))) {
+	res = usb_submit_urb(dev->rx_urb, GFP_KERNEL);
+	if (res) {
 		if (res == -ENODEV)
 			netif_device_detach(dev->netdev);
-		dev_warn(&netdev->dev, "intr_urb submit failed: %d\n", res);
-		usb_kill_urb(dev->rx_urb);
+		usb_kill_urb(dev->intr_urb);
+		dev_warn(&netdev->dev, "rx_urb submit failed: %d\n", res);
 		return res;
 	}
 	enable_net_traffic(dev);
-- 
2.56.1

