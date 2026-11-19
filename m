Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795060982;
	b=IrnZwKRMKchlzWTmmfX4Rle3+muW3Hkh+Snn9tATAOz3fE0Ioy9bWaksGKXgGYhhT6Wn
	 W/lwFzkVaU4eNULz/4bVRYEwvONpBqvVrojP9Gf0dmjrApzhd8iLDuvTpO9F/8mn4r2Hc
	 cdlvCJoXL3LjmSYWao3pnpQNdS+JovfnI6/9qzCUm9lsf3PgX1DNm4gBjDULjym7paHxt
	 2gyuYdZcUl6nRyOp1u68cQ0/CwzZwmCx8v8qpt7PBBS7Wey80yeuLj4WKhyTPJy+5B5Zi
	 ORueiTM30VVfzovg21OuPInHZLi73X10nmcMt3I7lO4zKbUv6K7F3TLgbmvgwJwpQUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795060982;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GYpUG/4g2oe0G/OzeEYSahUAGOc96FHszgU8k7b/KAU=;
	b=wmxeVVkOpEUza0UIUNpP9iB4oTqdF/D5q6Zu7IaVwVQVP1PHXXnvg0P018xXYRGrmWC2
	 dFMRR2ZB/DUYdqwdSIyx6nYye4/QMN9xHlI/okWJjee4mPMqr88UvQ5W1Rv/5nIWFaaVQ
	 ObHdpbinozjp/6WKOKZ9vS//OYBaXMwCLfN8F5Ieir1HgJf/HyCtVI/FZ4cJFFv25RLoI
	 Sf7IAuaDQ1OGNdLjmTKCwwHIf8j1EtehibP9PwIJeyv9O3Sf20ZqeFd/9TVzZFjxpM1IF
	 EVNwnWZZUI725uPwRx+mOTuTt41NnD316Vyq0Zwq72vJPpSVqIEYu5bMUuvWlh/6WFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=octane.security;
	spf=pass smtp.mailfrom=octane.security;
	dkim=pass header.d=octane.security header.i=@octane.security header.a=rsa-sha256 header.s=google header.b=mmd45kPt;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6349606A326
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 04:03:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6349606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=octane.security
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=octane.security
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=octane.security header.i=@octane.security header.a=rsa-sha256 header.s=google header.b=mmd45kPt
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cd8ba7c2694so998989a12.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 20:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=octane.security; s=google; t=1795060981; x=1795665781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GYpUG/4g2oe0G/OzeEYSahUAGOc96FHszgU8k7b/KAU=;
        b=mmd45kPtoIRGImh9SP/fp7f6s4Q9UO3R2Hgfq5v/iBF0ngtBPnTYdofPhp3VGS6cry
         hyd6TPeSxZoRtJ9qLQU4TiXo7I0KZjivuhVONeun5vLzIa0w07u05CsYc6ftpV1xyEpy
         plI5Woj6oWCZTr76qTa2hOcKDST+jbG/Oa6nqEYKtFsYHgflUgrc5sCR8oyUJ4pKH/Vh
         xZYMfRn0Sawftvl6yvvTdQ3liLC3YQ0ZBW1mVwLzll//vG0VIIlrBB5mpTFsEIFO2mVT
         1wU4dRvskwy/6/oSwixiBU3dD2oZREeFqBmDwlLsPf6LzqeFM+FROu5VIRX54/sRDQNg
         0wJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795060981; x=1795665781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GYpUG/4g2oe0G/OzeEYSahUAGOc96FHszgU8k7b/KAU=;
        b=RI5EVN3+2jyNLU3Y5jSgizAbRkUumkNA3bFRFqYJ55IjHeLu4SlxPOYz6v1KPRNMOz
         EMmOTYNUT3rKuVeeFZTrsYmBh7C+YU31d59glRlPZwluj/2zyzd4REAiPoVZFHlLfN9P
         CFGu0rm0VIgroVTLX43D6BODnP1MdDGJ0+GXLnzDJyFzzXOuFUeK0vrCejADzhfPHC99
         82NZZVTi5llSbILGsTIaZaVumNqvbil10kMBA3zMt2aXZUzaCoVoXDgUzf906o0a9cJz
         kD2tiBOeZsJpKtcT327c1YCGvBR1yBnU3/XLyiJMkdVoS+YBise9+PxeRj3owJXf8vQH
         Oh/A==
X-Gm-Message-State: APuU4Z8Laew4To2aAchec23BxP7Q10GhMm87wpGXMnim6qireLVUXtmg
	GgO+CIv58Tx6Ths1CkKDwTid0hHHD54wXnonz3wTG3PvEsJCtQetszyc9iiEt32YOSlmneTv3+F
	5sQcT
X-Gm-Gg: AZFdTZfXKS4AiUgrASYdUh7oRnng6FkgIipuE1HmM0pfg2ToBHjPZCm1E4n4ZMpfskB
	2RUv7P7wgBLRSlvgk3FdpOHoBGz7B+Ck7hIlQe9DmRAGoZ3koND2MUJp61OFzO3a1Y2sjEvjtLU
	pTOKHxcTeQw4OxumuMNvYH4Skej5kE5SA6NTLEWgMShCP7VkMpyWPjjG2JSHc3fJFqI+X3n+S2h
	iOa8qGDtX/dkkb04XaQnp1vEbqzr9/t3C5yWK+GBugJQpnbOqqoC0LS+aOZwWp4maq4Nl/e5YLf
	bc0p86Z6KF/XYWEmcgUOpUY0qpNCYaNA9aVwBHr7ZKNRfeaPy5ZJapCPT1podLMzZTkfH/S65EY
	mKNDSG9ipMJM01KL61Ev159wnnmcJ8dnf3yF0uqsHKiAVIkwHGAieKt9o0bUq+Ou5QfmBXdje8O
	Npe4cVXfq0/Q/f6ri3YxwUKofqfSMzpHAYXMPnEdr/uei+PAWoHeI/fD2Y8q9eYcyunTJJwqouD
	mUKimaw1P8EKBDizIZd/5rHvRYI1Rp1PX0NZu0xxwZhts2h8w9kyuRpCQY+YtSNor1paGq/GmdO
	jo7o5Jo0BsU7pmUZF+os47ummOTkLtQh2M1lu/jbF0cTsNCCcooqkLPzKJ/rUgBZpQxjUvjpswI
	fXmBhV3Y048IhrPb7vRZ+INFwYLJUKB066+OyXNizXvdKa5fqYgCH
X-Received: by 2002:a17:90b:2ccf:b0:3b3:cb22:72d0 with SMTP id 98e67ed59e1d1-3b3d07656e8mr5132243a91.29.1795060981035;
        Wed, 18 Nov 2026 20:03:01 -0800 (PST)
Received: from localhost.localdomain ([103.207.175.108])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4057af4e2sm406863a91.7.2026.11.18.20.02.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 20:03:00 -0800 (PST)
From: Shubham Antil <shubham@octane.security>
To: netdev@vger.kernel.org
Cc: oe-linux-nfc@lists.linux.dev,
	david@ixit.cz,
	horms@kernel.org,
	gio@octane.security
Subject: [PATCH net v8 1/4] nfc: nci: uart: serialize driver selection
Date: Thu, 19 Nov 2026 09:32:50 +0530
Message-ID: <20261119040253.15986-2-shubham@octane.security>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261119040253.15986-1-shubham@octane.security>
References: <20261119040253.15986-1-shubham@octane.security>
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

NCIUARTSETDRIVER assumes that tty->disc_data remains NULL until a
transport has been selected.  Two concurrent callers can therefore both
allocate and register an NCI device for the same line discipline.

The transport registry can also be changed while a caller is copying a
template from it, before the transport module has been pinned.

Allocate one UART context when the line discipline is opened and claim it
atomically during driver selection.  Protect the transport registry with a
mutex, take the module reference while holding that mutex, and copy only
the immutable template fields.  Keep TTY callbacks disabled until the
transport has finished opening, and unwind the context so a failed
selection can be retried.  Use acquire/release bit operations for the
selection claim so a retry observes the completed unwind.  Treat the driver
number as unsigned before using it to index the registry.

Discovered during an AI-assisted source audit using OpenAI Codex,
gpt-5.6-sol.  Patch development and test planning used the same assistant.
Confirmed using an unmodified kernel, a pty-backed user-space NCI
controller, and two concurrent NCIUARTSETDRIVER ioctls; no error injection
was used.

With the fix applied, the final v8 reproducer passed 20 cycles under KASAN,
UBSAN, and lockdep, and 20 cycles under strict-mode KCSAN.  No in-tree
selftest covers the NCI UART line-discipline path.

Fixes: 9961127d4bce ("NFC: nci: add generic uart support")
Signed-off-by: Shubham Antil <shubham@octane.security>
---
 include/net/nfc/nci_core.h |   1 +
 net/nfc/nci/uart.c         | 142 ++++++++++++++++++++++++++-----------
 2 files changed, 100 insertions(+), 43 deletions(-)

diff --git a/include/net/nfc/nci_core.h b/include/net/nfc/nci_core.h
index 664d5058e..2f542f5c9 100644
--- a/include/net/nfc/nci_core.h
+++ b/include/net/nfc/nci_core.h
@@ -454,6 +454,7 @@ struct nci_uart {
 	spinlock_t		rx_lock;
 	struct work_struct	write_work;
 	struct tty_struct	*tty;
+	unsigned long		flags;
 	unsigned long		tx_state;
 	struct sk_buff_head	tx_q;
 	struct sk_buff		*tx_skb;
diff --git a/net/nfc/nci/uart.c b/net/nfc/nci/uart.c
index aa20e8603..529c8cf88 100644
--- a/net/nfc/nci/uart.c
+++ b/net/nfc/nci/uart.c
@@ -13,6 +13,7 @@
 
 #include <linux/kernel.h>
 #include <linux/init.h>
+#include <linux/mutex.h>
 #include <linux/types.h>
 #include <linux/fcntl.h>
 #include <linux/interrupt.h>
@@ -34,7 +35,12 @@
 #define NCI_UART_SENDING	1
 #define NCI_UART_TX_WAKEUP	2
 
+/* UART flags */
+#define NCI_UART_DRIVER_SET	0
+#define NCI_UART_READY		1
+
 static struct nci_uart *nci_uart_drivers[NCI_UART_DRIVER_MAX];
+static DEFINE_MUTEX(nci_uart_drivers_lock);
 
 static inline struct sk_buff *nci_uart_dequeue(struct nci_uart *nu)
 {
@@ -102,43 +108,82 @@ static void nci_uart_write_work(struct work_struct *work)
 	clear_bit(NCI_UART_SENDING, &nu->tx_state);
 }
 
-static int nci_uart_set_driver(struct tty_struct *tty, unsigned int driver)
+static int nci_uart_set_driver(struct nci_uart *nu, unsigned int driver)
 {
-	struct nci_uart *nu = NULL;
+	struct nci_uart *template;
 	int ret;
 
 	if (driver >= NCI_UART_DRIVER_MAX)
 		return -EINVAL;
 
-	if (!nci_uart_drivers[driver])
-		return -ENOENT;
+	if (test_and_set_bit_lock(NCI_UART_DRIVER_SET, &nu->flags))
+		return -EBUSY;
+
+	mutex_lock(&nci_uart_drivers_lock);
+	template = nci_uart_drivers[driver];
+	if (!template || !try_module_get(template->owner)) {
+		ret = -ENOENT;
+		goto err_unlock;
+	}
+
+	nu->owner = template->owner;
+	nu->ops = template->ops;
+	nu->name = template->name;
+	nu->driver = template->driver;
+	mutex_unlock(&nci_uart_drivers_lock);
+
+	ret = nu->ops.open(nu);
+	if (ret)
+		goto err_module;
+
+	/* Publish transport fields before callbacks observe READY. */
+	smp_mb__before_atomic();
+	set_bit(NCI_UART_READY, &nu->flags);
+
+	return 0;
+
+err_module:
+	cancel_work_sync(&nu->write_work);
+	kfree_skb(nu->tx_skb);
+	nu->tx_skb = NULL;
+	kfree_skb(nu->rx_skb);
+	nu->rx_skb = NULL;
+	skb_queue_purge(&nu->tx_q);
+	clear_bit(NCI_UART_SENDING, &nu->tx_state);
+	clear_bit(NCI_UART_TX_WAKEUP, &nu->tx_state);
+	module_put(nu->owner);
+	nu->owner = NULL;
+	goto err_clear;
+err_unlock:
+	mutex_unlock(&nci_uart_drivers_lock);
+err_clear:
+	clear_bit_unlock(NCI_UART_DRIVER_SET, &nu->flags);
+	return ret;
+}
+
+/* ------ LDISC part ------ */
+
+static int nci_uart_tty_alloc(struct tty_struct *tty)
+{
+	struct nci_uart *nu = kzalloc_obj(*nu);
 
-	nu = kzalloc_obj(*nu);
 	if (!nu)
 		return -ENOMEM;
 
-	memcpy(nu, nci_uart_drivers[driver], sizeof(struct nci_uart));
 	nu->tty = tty;
 	skb_queue_head_init(&nu->tx_q);
 	INIT_WORK(&nu->write_work, nci_uart_write_work);
 	spin_lock_init(&nu->rx_lock);
 
-	ret = nu->ops.open(nu);
-	if (ret) {
-		kfree(nu);
-		return ret;
-	} else if (!try_module_get(nu->owner)) {
-		nu->ops.close(nu);
-		kfree(nu);
-		return -ENOENT;
-	}
 	tty->disc_data = nu;
+	tty->receive_room = 65536;
+
+	/* Flush any pending characters in the driver */
+	tty_driver_flush_buffer(tty);
 
 	return 0;
 }
 
-/* ------ LDISC part ------ */
-
 /* nci_uart_tty_open
  *
  *     Called when line discipline changed to NCI_UART.
@@ -156,13 +201,7 @@ static int nci_uart_tty_open(struct tty_struct *tty)
 	if (!tty->ops->write)
 		return -EOPNOTSUPP;
 
-	tty->disc_data = NULL;
-	tty->receive_room = 65536;
-
-	/* Flush any pending characters in the driver */
-	tty_driver_flush_buffer(tty);
-
-	return 0;
+	return nci_uart_tty_alloc(tty);
 }
 
 /* nci_uart_tty_close()
@@ -180,14 +219,17 @@ static void nci_uart_tty_close(struct tty_struct *tty)
 	if (!nu)
 		return;
 
-	kfree_skb(nu->tx_skb);
-	kfree_skb(nu->rx_skb);
+	if (test_bit(NCI_UART_DRIVER_SET, &nu->flags)) {
+		kfree_skb(nu->tx_skb);
+		kfree_skb(nu->rx_skb);
 
-	skb_queue_purge(&nu->tx_q);
+		skb_queue_purge(&nu->tx_q);
+
+		nu->ops.close(nu);
+		module_put(nu->owner);
+	}
 
-	nu->ops.close(nu);
 	nu->tty = NULL;
-	module_put(nu->owner);
 
 	cancel_work_sync(&nu->write_work);
 
@@ -211,7 +253,8 @@ static void nci_uart_tty_wakeup(struct tty_struct *tty)
 
 	clear_bit(TTY_DO_WRITE_WAKEUP, &tty->flags);
 
-	if (tty != nu->tty)
+	if (tty != nu->tty ||
+	    !test_bit_acquire(NCI_UART_READY, &nu->flags))
 		return;
 
 	nci_uart_tx_wakeup(nu);
@@ -300,7 +343,8 @@ static void nci_uart_tty_receive(struct tty_struct *tty, const u8 *data,
 {
 	struct nci_uart *nu = tty->disc_data;
 
-	if (!nu || tty != nu->tty)
+	if (!nu || tty != nu->tty ||
+	    !test_bit_acquire(NCI_UART_READY, &nu->flags))
 		return;
 
 	spin_lock(&nu->rx_lock);
@@ -328,13 +372,12 @@ static int nci_uart_tty_ioctl(struct tty_struct *tty, unsigned int cmd,
 	struct nci_uart *nu = tty->disc_data;
 	int err = 0;
 
+	if (!nu)
+		return -EBADF;
+
 	switch (cmd) {
 	case NCIUARTSETDRIVER:
-		if (!nu)
-			return nci_uart_set_driver(tty, (unsigned int)arg);
-		else
-			return -EBUSY;
-		break;
+		return nci_uart_set_driver(nu, (unsigned int)arg);
 	default:
 		err = n_tty_ioctl_helper(tty, cmd, arg);
 		break;
@@ -370,33 +413,46 @@ static int nci_uart_send(struct nci_uart *nu, struct sk_buff *skb)
 
 int nci_uart_register(struct nci_uart *nu)
 {
+	int ret = 0;
+
 	if (!nu || !nu->ops.open ||
-	    !nu->ops.recv || !nu->ops.close)
+	    !nu->ops.recv || !nu->ops.close ||
+	    (unsigned int)nu->driver >= NCI_UART_DRIVER_MAX)
 		return -EINVAL;
 
-	/* Set the send callback */
-	nu->ops.send = nci_uart_send;
-
 	/* Add this driver in the driver list */
+	mutex_lock(&nci_uart_drivers_lock);
 	if (nci_uart_drivers[nu->driver]) {
 		pr_err("driver %d is already registered\n", nu->driver);
-		return -EBUSY;
+		ret = -EBUSY;
+		goto unlock;
 	}
+
+	/* Set the send callback */
+	nu->ops.send = nci_uart_send;
 	nci_uart_drivers[nu->driver] = nu;
 
 	pr_info("NCI uart driver '%s [%d]' registered\n", nu->name, nu->driver);
 
-	return 0;
+unlock:
+	mutex_unlock(&nci_uart_drivers_lock);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(nci_uart_register);
 
 void nci_uart_unregister(struct nci_uart *nu)
 {
+	mutex_lock(&nci_uart_drivers_lock);
+
 	pr_info("NCI uart driver '%s [%d]' unregistered\n", nu->name,
 		nu->driver);
 
 	/* Remove this driver from the driver list */
-	nci_uart_drivers[nu->driver] = NULL;
+	if ((unsigned int)nu->driver < NCI_UART_DRIVER_MAX &&
+	    nci_uart_drivers[nu->driver] == nu)
+		nci_uart_drivers[nu->driver] = NULL;
+
+	mutex_unlock(&nci_uart_drivers_lock);
 }
 EXPORT_SYMBOL_GPL(nci_uart_unregister);
 
-- 
2.54.0

