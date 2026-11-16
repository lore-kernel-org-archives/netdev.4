Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794822788;
	b=1h36S0uAbw1It2QbeT9IDm/qrM0/QgGZxoMrt/4fpJbXRr310N82siRhu5GxvvuH9Z/a
	 eGXz+O4BWE7wlijLbCoJjULFNM2z/LIHFuJgmIHrCTtvJcpPZVnUs1LBT0tUGM7GXIHPY
	 U6Lj5jXQNPUpmqB/IfIu2UR96dmYQDxueppPsgw0phPh6S0Vrdiq5kzLuqSQXAJMq3Toe
	 mMPl9yhA1d3043GGeHlbgMAf+phcA8eTpn5CKGtwILZTuLtLVIa7JcKC+152RUFpKn50K
	 0P0IgejE32mc8QpJEidSaZYpcunAj61IgULK3i135tLwuH7AuLIievrobMQ4fnaKv2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794822788;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=SgMJefBKejfBBWtoRWd6v8uWkLAJ3E6A5yIR7lhjHIg=;
	b=HGzc+xMrt+yZuLFFGHYXk+Ac9rt/47Wm/uwjBaxZX3ktOo+21VhIDOvxkmsIaaOnDA1x
	 /6qsGnjlJKeaVy3H2ph8EUzIcK6IW4MwzetMNVlo9ICWw/4TyMuF+gw+zjpuYCd/evGbf
	 JMw8Bi2dGS+jEnZXJIZ4XXmjMQK6l0ZNCTne6cOgmQWgDjWe2L7u5eRXnhIPZxseqtkAd
	 LzV8/CayfWA0zTclINwId+wqRt0jdoNJjsit2hwo9IferR2NgLrMv/ssi80JFo95WGcyF
	 paZw3yh6uHVK82C9Pie9+vWlrKxihg8tIwfH6FcvVzEnMVQs7j9+sjStLuk5oKTFL2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Slsq3ar2;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=PVzHjUQM;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E729B606A323
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 09:53:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E729B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Slsq3ar2;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=PVzHjUQM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794822787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SgMJefBKejfBBWtoRWd6v8uWkLAJ3E6A5yIR7lhjHIg=;
	b=Slsq3ar2chBKeeKWE/wSZdTt2+FHZ39DCJQCcqRusdB5a31309o7RLlU9Cgdn+FaJ0dXlq
	5T9CWlc5+5wXVYsqeN5nN2Y+nTdhGOhOQnIBA+rpRjiMLJhQzHa4Y81Z/B7OMtaUMR4g4r
	1uTm36Ve0SmX0Pncc+rHQciwn9SkHqI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-261-HIa5Oq5bN4iV4TiPNSnODg-1; Mon, 16 Nov 2026 04:53:04 -0500
X-MC-Unique: HIa5Oq5bN4iV4TiPNSnODg-1
X-Mimecast-MFC-AGG-ID: HIa5Oq5bN4iV4TiPNSnODg_1794822783
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-492b5408dedso1761339f8f.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 01:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794822783; x=1795427583; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SgMJefBKejfBBWtoRWd6v8uWkLAJ3E6A5yIR7lhjHIg=;
        b=PVzHjUQM49dhCS8Jnfv8i/P0buidgGFeSeUY/F+OE34JnJEXY24RWF1Pb2rYMg0F9o
         Zi6H+uytTJpfvJSG0qeqsoGs/sJ977LGIazJbJr2+GWlOOjQtvPslm/j+8gYScMlM5BY
         WxJCWQ38Lvt4UmASjyEc93LvHN7dLpqZvl0QvduIBKsVzuTdEOrnBJboftsckhvRACHz
         bm6LFSTlL3OFCqAy9lkwJLkw4umJaiCEPkk0J77wfFYPeWL8D46Zkqa8x87oFQO4ShV6
         sE9UuJdNsHoTj0k2fM+slJx3oiVSqsGreDGbdvMUShode9OHYDAg93NMFOswYNkRFAfp
         pfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794822783; x=1795427583;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SgMJefBKejfBBWtoRWd6v8uWkLAJ3E6A5yIR7lhjHIg=;
        b=zfxCfaW4f7RoQdjkFSQJoo9xpFkN+ZHu3gtFSlJTsjl9bkLzRqk2sjdfYRExzu3uWs
         PMAxqqa3mk/0EGfdBAGDKlf8FbaBTl7BWO8iIusN2x9Fmux02W3sZ5h3NCI9sHxJqISy
         mN2GNBbc0gYW5enFQ7G6iuzG6VAQ/DNprI4R4/nhka0nNkHYNVNC/Yt6KysoX1qGvAgq
         Fs2mkyqQwzfk3IfHs8ACPXmAqTwjH60xGwQODFtk3bVOd73M0qNVkZYi8QIWsPVg+oiq
         yWwH/OG6PIdY6Jch+YYEtV5Nlym68AT97OL4CgkBqyhqr/M1DQ4MEMiLEIZoidM5qqXV
         2JMw==
X-Gm-Message-State: APuU4Z83kGe5n7gIkv4hAnvOmU6dVcQ6ChkDwkhuWcDDHrLzs53MXcAI
	gu3L7Jn71+rDlvC+dxcOKnjEEb97puqLxL0LtVOIwWMmLei8KI/BG0ChXvWatBbCfb070AvkXq5
	7QqexayiqAVq5RhR4/a53cFQemQJ75bQeGA0KYNUORt4JauBfO268G32Kwg==
X-Gm-Gg: AYBFou3XqeoEuxQTdt0DpVa/vLaN1zF7fPhCwbMRzHvI8XQcaVyyMTAMjaKH8TSjibT
	D65GlyhyoVd9evEb0Of41Z1zesEiW9ZEoXYLYPEv7bXc8R3y6C/BBb35kSEBYucNTmyzKsKAaVr
	DMII8llQIy6bdkLwNlw6gpZ7eytW3MmKIbluu+9cHZpoj5VrsvKkpOUMpTd2rc6rLuKRTAzoN+d
	Ml8B/2Lz8Sct84Gwl2DzfJa29Zvzrf3eixW2RnOkE3ZCU71BzJDg6zCsaQEYeUXioLYbgoADybQ
	fz07gC1bqJCBGqdnJ/j7ZcKmKrSUgb2SFeQQ+CbBAl2yBS1VFqKbdHzOSkv9fs5TSXoo907ejsd
	i99jVktdg52ajVu/Yg5DKkF8EGu3OWlrscN9x3efc8w==
X-Received: by 2002:a05:600c:524a:b0:4bb:6cef:d14b with SMTP id 5b1f17b1804b1-4bb6cefd40dmr73286145e9.2.1794822783086;
        Mon, 16 Nov 2026 01:53:03 -0800 (PST)
X-Received: by 2002:a05:600c:524a:b0:4bb:6cef:d14b with SMTP id 5b1f17b1804b1-4bb6cefd40dmr73285555e9.2.1794822782478;
        Mon, 16 Nov 2026 01:53:02 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:151e:a200:7a96:1b15:81f:ebed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2842e6sm384663765e9.4.2026.11.16.01.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:53:01 -0800 (PST)
Date: Mon, 16 Nov 2026 04:52:58 -0500
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
Message-ID: <20261116044750-mutt-send-email-mst@kernel.org>
References: <tencent_AA4F39DA7ADE330C721C03AAA832B92DD608@qq.com>
 <20261115175445-mutt-send-email-mst@kernel.org>
 <tencent_94953697D2BA27275BEF7A26404E69800605@qq.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_94953697D2BA27275BEF7A26404E69800605@qq.com>

On Mon, Nov 16, 2026 at 04:47:17PM +0800, Congjie Zhou wrote:
> Tried your patch with my earlier TCP test. No more complete NAPI
> stalls so far, thanks!
> 
> But LLM found another possible interleaving, though. I reproduced it
> in an instrumented KUnit test with injected delays, but haven't hit
> it in the TCP test.
> 
> With defer_hard_irqs=1, it goes like this:
> 
> CPU1 / old poll                  CPU2 / busy-poll
> -----------------------------    -----------------------------
> Complete: clear SCHED,
> arm timer, return false.
>                                  Take NAPI ownership.
>                                  Enter busy_poll_stop(), clear
>                                  IN_BUSY_POLL. The final poll
>                                  enables callbacks, then pauses
>                                  before completion.
> Watchdog expires, sees
> SCHED=1, exits without
> scheduling or setting MISSED.
> Disable callbacks.
> Timer=0, SCHED=1, so skip
> napi_schedule() and exit.
>                                  napi_complete_done(..., 0):
>                                  defer count=0, no MISSED.
>                                  Clear SCHED, return true.
>                                  Queue is empty, exit.
> 
> Then the device adds a used entry, but callbacks are still disabled,
> with no timer or poll pending.
> 
> So SCHED=1 at the check, but that poll has already enabled callbacks
> and won't enable them again after the old poll masks them.
> 


Oh good point.  Maybe let's just check the poll list.  And I guess it's
cleaner to add a helper in net core than poke at low level fields like
this.


diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index dd2c41ef6fbe7..0984f81848174 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -740,6 +740,8 @@ static bool virtqueue_napi_complete(struct napi_struct *napi,
 			return true;
 	} else {
 		virtqueue_disable_cb(vq);
+		if (!napi_has_pending_poll(napi))
+			napi_schedule(napi);
 	}
 
 	return false;
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index c0ae442c4344b..f728499872e8d 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -22,6 +22,7 @@
 #define _LINUX_NETDEVICE_H
 
 #include <linux/timer.h>
+#include <linux/hrtimer.h>
 #include <linux/bug.h>
 #include <linux/delay.h>
 #include <linux/atomic.h>
@@ -553,6 +554,21 @@ static inline bool napi_is_scheduled(struct napi_struct *n)
 	return test_bit(NAPI_STATE_SCHED, &n->state);
 }
 
+/**
+ * napi_has_pending_poll - test if NAPI will be polled again
+ * @n: NAPI context
+ *
+ * True if the deferral watchdog is armed or a poll is queued.  A
+ * false answer is "best-effort": a poll can be queued right after
+ * the check.
+ *
+ * Return: True if NAPI will be polled again, False otherwise.
+ */
+static inline bool napi_has_pending_poll(struct napi_struct *n)
+{
+	return hrtimer_active(&n->timer) || !list_empty(&n->poll_list);
+}
+
 bool napi_schedule_prep(struct napi_struct *n);
 
 /**

