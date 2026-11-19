Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795089031;
	b=2TNURdXhEpFZE8xtn6DYs189Zh+RLTyVf4Pxo5ECPc0IjIxl2FOAxzUZw2UNg/Wa+vJe
	 D+SKeIwoYmGtMYSuCi9OhwIKE/L+irK8DKRUZykmfoQRREVSSd9BRqhrKBsv+oT3j2FRh
	 iKGtlqBgnCzXu697UprqERUAnYMMlIp80GHFmGfox0DXroMaE1oDi5hwxo/ihQaUfjZiI
	 +qeo5sxDD8Wt/CXkm2kll8cedJSx7Wya5429e2CX+Nl9FNseQumA10Zw0ZU2+JEBkFXSN
	 oRwqLSDN45rnSuX83DPD9q6u+UHDDAeVYLxQjVx+A10RmcrIlTbpFTUcET0+Ov4yAbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795089031;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=0W+qwjoYXMK+Wkr2hnHwTmEZq17Go6E3zq5Ot2mWL14=;
	b=KrDSAYQm/ipcj6GyeVLHTkvmxzNSaIxdRIdpXqITx18CVMuBWyxeFQu/by3ROzPWQeJ6
	 CW7StGJM/BmawA3DIPabdU89zj/C/OuDgepmV9w5JYRLSIzouijajdnGKbzFx7+KZL/Kg
	 P2G6rqQj6HJyhsi6Y7oZIShPFY/VESyap2mLRX0+w4EiRtxEk6fVRc7w18OJ2pROC42Fq
	 bZfZJF0Na8gXdF8jpDXp0fJoZpbOhMzW8b3yip9NDcFsEb1J6ZQH6akKe3ay19gXJfIyh
	 gv80pedyUdZo/seKLzn/b14cYLqj0hWOeNm9U2fztO6golJFePNW1M4muGyRFBF9KrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ciokceeh;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="YTA/3Jqw";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA9C606A32A
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 11:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAA9C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ciokceeh;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=YTA/3Jqw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795089030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0W+qwjoYXMK+Wkr2hnHwTmEZq17Go6E3zq5Ot2mWL14=;
	b=ciokceehEJ8R0fzb0Mwg+2Yb/K2SU62EXYexoXWPcpbuOawtwtqQ2+kZBwzoUQtLthpE9v
	XM3ELkUAvea7o2t5YvqqbRz9KoNzi8bRS56KLWq1xRg+ejC9vZZXuK+YOnrSDbgOPWUhC9
	wT3GywWORD2ZKedcGi+4HcuTomr1n84=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-296-4181QT37N0-xv3g3idujTA-1; Thu, 19 Nov 2026 06:50:27 -0500
X-MC-Unique: 4181QT37N0-xv3g3idujTA-1
X-Mimecast-MFC-AGG-ID: 4181QT37N0-xv3g3idujTA_1795089027
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a0284121c6so14019305e9.3
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 03:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795089026; x=1795693826; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0W+qwjoYXMK+Wkr2hnHwTmEZq17Go6E3zq5Ot2mWL14=;
        b=YTA/3JqwhWfJmuX1HP8xO0N6p5sDBFZ8lzrn6HEzj5d+eC49vpcPt5Wb6buNfEttrN
         iy2s9UhlySlbz5Vr2MkuCQv+kiQpPpHuNj1IgRXwSkZhR+wpv48MsCsWmMOxSwxvVJL6
         mliBJDNhWgEX75KWTJ2khsJKa4OnrSE6uwNa0SVQrQ8zA4w2SQhsnAvmTN3uksDk8u2K
         ZoD4u7Z82HP5Ay+1x0GB/4VYKw88AdU11kDtQ367WzHbd5YPKQr3FpFI8NTJ8VOTiJIO
         3/3KeN4bwi8s+bFrYFnqiUHMPdcpKumUW3Zw7ae3aPFFIuZxXBgHG5ATCdgViYrPYtru
         lGpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795089026; x=1795693826;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0W+qwjoYXMK+Wkr2hnHwTmEZq17Go6E3zq5Ot2mWL14=;
        b=nrp/p3MUE6qWTD76ZGfsEwZV13rslshlVyR4NEvllkztczmHh6iC4ec7gF0kSrEytm
         2AQAeSN9G/ga3dHo3EreN5NiQx5xn5eJvaija/X7t/vhVK3T77hKeMDO7pvuEtj7UEQY
         pY8yAHAULEBilvbaOeVhLJYYtXeEzSDFcL8BD78nIGJipRLYP3gGmSjXEyo+hAoaVxHo
         VM+WbRN2Lfem+w1kUrRsosicAGOGAdKIftXgYxdQ5+ia1n+lkSD8QW4c5P5SRw5W/vX7
         ACIRhi1AjvhZ6ugT5YXcAc8JfwoIDGMSO6hD3Z9LkhsrpN1BBbDJMeJVMnlPA2P5KHpP
         Qsng==
X-Gm-Message-State: APuU4Z/KqPPHZDy0YpOspGvlmx4GCIiJXRS0TF0SpeMv1nUOwrun0tNG
	tf0CImNIV9VovGoSOwY52OsF8LEvfv5cnS4STyPZNH8T+B5+AACpejMNhi2eeiQu+RHGh/55/9H
	2tK9LbzwQz2rRPAWfhfHHdc8ARBFi9hWZOeo1qdNV37JNS0ZkQPpH1ll/5w==
X-Gm-Gg: AYBFou296CXnKxTlIvmEBqme3tXIs9e+xAJfoeuFTH+ELkwbTNyXRRJFCkloURnF8MY
	QAROaZUuXc2F2GYuxebK/UdzF4PZPNhX/04slz/a4kiEGOZqzbV5kkuhzr0XKZYULC0SxRRc7Do
	ZozmWLmz8p+NU/e/FtTNWC+xVeMUe0Xekb9bjWkMMOKAa+tUsw3mY1E2hzLfodSQQ5bVQSFvxPy
	MCbPQ3ns+c0/RYFZ7yrsYmuVrBmcHB5toF90/1rLmoRfL69kiuHnLB6dnakJJ4hiO3cxiL8YN0A
	U1+BK7VslBtJjMsf86IefkxyXYmYwZqkRVZUBPhASMBiOD5Qn4WtCtnzImX35P1S1RHmREnguOW
	XhG2M5yeW5UwL5yRs3HZOfXqaqp02X2YRTCZiVrO11Mk=
X-Received: by 2002:a05:600c:3494:b0:4a2:267:25b3 with SMTP id 5b1f17b1804b1-4bb7da4efd4mr109616845e9.35.1795089026431;
        Thu, 19 Nov 2026 03:50:26 -0800 (PST)
X-Received: by 2002:a05:600c:3494:b0:4a2:267:25b3 with SMTP id 5b1f17b1804b1-4bb7da4efd4mr109616265e9.35.1795089025921;
        Thu, 19 Nov 2026 03:50:25 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1520:4400:d78d:7b2d:2f5d:e08f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654b807fesm9172572f8f.10.2026.11.19.03.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 03:50:25 -0800 (PST)
Date: Thu, 19 Nov 2026 06:50:21 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Congjie Zhou <zcjie0802@qq.com>
Cc: netdev <netdev@vger.kernel.org>, jasowangio <jasowangio@gmail.com>,
	eperezma <eperezma@redhat.com>,
	xuanzhuo <xuanzhuo@linux.alibaba.com>,
	andrew+netdev <andrew+netdev@lunn.ch>, davem <davem@davemloft.net>,
	edumazet <edumazet@kernel.org>, kuba <kuba@kernel.org>,
	pabeni <pabeni@redhat.com>, horms <horms@kernel.org>,
	virtualization <virtualization@lists.linux.dev>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [BUG] virtio_net: RX stall caused by masking callbacks after
 NAPI ownership release
Message-ID: <20261119064843-mutt-send-email-mst@kernel.org>
References: <tencent_AA4F39DA7ADE330C721C03AAA832B92DD608@qq.com>
 <20261115175445-mutt-send-email-mst@kernel.org>
 <tencent_94953697D2BA27275BEF7A26404E69800605@qq.com>
 <20261116044750-mutt-send-email-mst@kernel.org>
 <tencent_D0650F8CA2AAE4C258BFE5BCE805CDB4CA0A@qq.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tencent_D0650F8CA2AAE4C258BFE5BCE805CDB4CA0A@qq.com>

On Tue, Nov 17, 2026 at 12:05:24AM +0800, Congjie Zhou wrote:
> > Maybe let's just check the poll list.
> 
> Checking the poll list fixes the earlier race where the watchdog has
> already finished. However, the timer can still be consumed without
> triggering another poll if it fires after the old caller's check:
> 
>   old poll / watchdog                successor busy-poll
>   -------------------                -------------------
>   napi_complete_done():
>     clear SCHED, arm timer,
>     return false
>                                      acquire NAPI
>                                      enable callbacks,
>                                      then pause before completion
>   disable callbacks
>   napi_has_pending_poll():
>     timer is still queued,
>     so skip napi_schedule()
>   old poll exits
>   watchdog expires, sees SCHED=1:
>     no scheduling, no MISSED
>   watchdog returns
>                                      napi_complete_done(..., 0):
>                                        clear SCHED, return true
>                                      queue is empty, exit
> 
> At that point, the next used entry ends up with neither notifications
> enabled nor a pending timer or scheduled poll to process it.
> 
> Stepping back, the fundamental ordering issue here is:
> 
>   old releases SCHED
>     -> successor rearms callbacks
>     -> old masks callbacks
> 
> Right now, nothing guarantees that the old mask happens before the
> successor's rearm. Even if the successor still holds SCHED, it might
> have already done its final rearm. Similarly, having a queued timer
> doesn't guarantee another poll—the watchdog will simply bail out without
> scheduling because SCHED is already set. So all these state checks can
> look completely valid at the time, yet still fail to guarantee recovery.
> 
> The root cause is that with the timer introduced by NAPI defer,
> napi_complete_done() can return false while still giving up SCHED
> ownership, leaving us with nothing else to synchronize the callback
> state. Before NAPI defer, returning false meant we still held onto
> SCHED, so everything worked as expected.
> 
> To fix this properly, I think we either need to call
> virtqueue_disable_cb() before giving up SCHED ownership, or introduce a
> separate synchronization mechanism (like a lock) to ensure we can always
> recover NAPI execution. Simple flag checks alone don't seem enough to
> close this race completely.

Right. So I came up with this then. Pls note i could not repro the
problem so I am merely reasoning based on theoretical understanding
of it.

--->

virtio_net: mask callbacks before handing off NAPI ownership

Virtio is special in that enabling or disabling callbacks (interrupts)
accesses shared virtqueue state and must be serialized with polling. It
therefore enables callbacks before completing NAPI, and disables them
again if completion returns false.

With napi_complete_done(), that false return can come after ownership has
passed to another poll. The first poll can then disable callbacks after
its successor has enabled them, leaving RX stalled. Virtio therefore
needs to disable callbacks before handing off NAPI ownership.

Add a prepare/finish NAPI completion API so virtio-net can mask interrupts
before handing ownership off.

This preserves interrupt suppression without a callback or an additional
data-path barrier. Ordinary napi_complete_done() compiles identically in
the tested configuration.

Tested on x86-64 KVM with lock debugging, including IRQ deferral, concurrent
scheduling, busy polling, netpoll, and threaded NAPI. Split and packed
virtqueue TCP RX tests with IRQ deferral and busy polling also passed.

Reported-by: Congjie Zhou <zcjie0802@qq.com>
Closes: https://lore.kernel.org/netdev/tencent_D0650F8CA2AAE4C258BFE5BCE805CDB4CA0A@qq.com/
Fixes: 6f8b12d661d0 ("net: napi: add hard irqs deferral feature")
Assisted-by: LLM

---

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index dd2c41ef6fbe7..de370a39bc8fa 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -730,16 +730,18 @@ static void virtqueue_napi_schedule(struct napi_struct *napi,
 static bool virtqueue_napi_complete(struct napi_struct *napi,
 				    struct virtqueue *vq, int processed)
 {
+	struct napi_completion completion;
 	int opaque;
 
 	opaque = virtqueue_enable_cb_prepare(vq);
-	if (napi_complete_done(napi, processed)) {
+	if (napi_complete_done_prepare(napi, processed, &completion)) {
 		if (unlikely(virtqueue_poll(vq, opaque)))
 			virtqueue_napi_schedule(napi, vq);
 		else
 			return true;
 	} else {
 		virtqueue_disable_cb(vq);
+		napi_complete_done_finish(napi, &completion);
 	}
 
 	return false;
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index c0ae442c4344b..a182882624d6a 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -599,6 +599,15 @@ static inline void napi_schedule_irqoff(struct napi_struct *n)
  */
 bool napi_complete_done(struct napi_struct *n, int work_done);
 
+struct napi_completion {
+	unsigned long timeout;
+};
+
+bool napi_complete_done_prepare(struct napi_struct *n, int work_done,
+				struct napi_completion *completion);
+void napi_complete_done_finish(struct napi_struct *n,
+			       struct napi_completion *completion);
+
 static inline bool napi_complete(struct napi_struct *n)
 {
 	return napi_complete_done(n, 0);
diff --git a/net/core/dev.c b/net/core/dev.c
index 3ac700d37e596..fa9baa70e9d72 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -6999,9 +6999,17 @@ void __napi_schedule_irqoff(struct napi_struct *n)
 }
 EXPORT_SYMBOL(__napi_schedule_irqoff);
 
-bool napi_complete_done(struct napi_struct *n, int work_done)
+static __always_inline bool
+__napi_complete_done_finish(struct napi_struct *n, unsigned long timeout,
+			    bool ret, bool allow_pending,
+			    struct napi_completion *completion);
+
+static __always_inline bool
+__napi_complete_done_prepare(struct napi_struct *n, int work_done,
+			     bool allow_pending,
+			     struct napi_completion *completion)
 {
-	unsigned long flags, val, new, timeout = 0;
+	unsigned long flags, timeout = 0;
 	bool ret = true;
 
 	/*
@@ -7041,10 +7049,25 @@ bool napi_complete_done(struct napi_struct *n, int work_done)
 	}
 	WRITE_ONCE(n->list_owner, -1);
 
-	val = READ_ONCE(n->state);
+	return __napi_complete_done_finish(n, timeout, ret, allow_pending,
+					   completion);
+}
+
+static __always_inline bool
+__napi_complete_done_finish(struct napi_struct *n, unsigned long timeout,
+			    bool ret, bool allow_pending,
+			    struct napi_completion *completion)
+{
+	unsigned long val = READ_ONCE(n->state), new;
+
 	do {
 		WARN_ON_ONCE(!(val & NAPIF_STATE_SCHED));
 
+		if (allow_pending && (!ret || (val & NAPIF_STATE_MISSED))) {
+			completion->timeout = timeout;
+			return false;
+		}
+
 		new = val & ~(NAPIF_STATE_MISSED | NAPIF_STATE_SCHED |
 			      NAPIF_STATE_SCHED_THREADED |
 			      NAPIF_STATE_PREFER_BUSY_POLL);
@@ -7067,8 +7090,48 @@ bool napi_complete_done(struct napi_struct *n, int work_done)
 			      HRTIMER_MODE_REL_PINNED);
 	return ret;
 }
+
+bool napi_complete_done(struct napi_struct *n, int work_done)
+{
+	return __napi_complete_done_prepare(n, work_done, false, NULL);
+}
 EXPORT_SYMBOL(napi_complete_done);
 
+/**
+ * napi_complete_done_prepare - prepare NAPI completion
+ * @n: NAPI context
+ * @work_done: number of packets processed
+ * @completion: opaque completion token
+ *
+ * Return: true if NAPI is complete and interrupts may remain enabled;
+ * false if ownership is retained. On false, mask interrupts and call
+ * napi_complete_done_finish().
+ */
+bool napi_complete_done_prepare(struct napi_struct *n, int work_done,
+				struct napi_completion *completion)
+{
+	return __napi_complete_done_prepare(n, work_done, true, completion);
+}
+EXPORT_SYMBOL_GPL(napi_complete_done_prepare);
+
+/**
+ * napi_complete_done_finish - finish NAPI completion after masking interrupts
+ * @n: NAPI context
+ * @completion: token passed to napi_complete_done_prepare()
+ *
+ * The caller must provide any device-specific interrupt ordering.
+ */
+void napi_complete_done_finish(struct napi_struct *n,
+			       struct napi_completion *completion)
+{
+	if (unlikely(n->state & (NAPIF_STATE_NPSVC |
+				 NAPIF_STATE_IN_BUSY_POLL)))
+		return;
+
+	__napi_complete_done_finish(n, completion->timeout, false, false, NULL);
+}
+EXPORT_SYMBOL_GPL(napi_complete_done_finish);
+
 static void __skb_defer_free_flush(struct skb_defer_node *sdn, int budget)
 {
 	struct llist_node *free_list;

