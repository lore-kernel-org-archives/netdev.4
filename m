Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794784065;
	b=hSb8pnQyfWIg5ijy+5ObiJMmoqwlOdKdReDicfLxs3HLr+TJTE43bV83qRa4zyWBBuWy
	 dGE5viKR9D5iFY+umkHvGGxTEGfG3AWsdYewHtGXYSuPoAWTnTiuvXBb7tDC8Z1XUM9LL
	 17YXIWlCzM/fXCAJgEaosmCX4MZ5lQagLo5/Z4R4bFwyA4pf42jwhGZWal/WaD/VwLdkm
	 4zSkFsC6Uu3xtaHPURfI3ue1mNs4cEamsai83HjUmOW21uylHkwgzYxp99oLWOjtr9qdV
	 YQz0hQOrBUQ4R+Gg1Ljwt73dUoxKMH1xrIS5dbOPgv4Jzs40I2Zb1/+rpmVh91azEpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794784065;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=qSuk1jbsdV+iZEtNlLpPi3t1jVjwwjZENkNYPa18BIE=;
	b=gEZ9a/O1CMtkW6P/Sb3sFE1i4czCHEWklAoiwkK9al5y7biC7hva1c/qqpzZPS2uHvYf
	 UAtveZfGJveHdRaEtf+j0geUEg7Juq4Fo5B96O6rDgDzVx4BEYQmvhLrz7oyB7F5gkqdq
	 7A2nlwM0aw+4G4/XShxX+KAs6PaOqLd7c8WW3zOHIZ/gWYTTp9g3C+GuYMU4BNhpvI9jU
	 dfPj15J5ageYb1YKIn6JORLh/hkdD/JNwZ2tDVXVR6iacYeB+Y1v+K1m9I1M/viPhFPU9
	 LM4d0NqLt927lxJQzAOVUR5SI37u3llL5SKIkMOS8rdNFATjn6qLkq4Y44b7O4z2xLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hk1x1wV9;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=JjVOT4V+;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069EF606A32C
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 23:07:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 069EF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hk1x1wV9;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=JjVOT4V+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794784064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qSuk1jbsdV+iZEtNlLpPi3t1jVjwwjZENkNYPa18BIE=;
	b=hk1x1wV9PY7+tEv7OxpQ7i325IjzCasykmQLW61Wj+HTl3sCUY9VtIuAHfw5XbLxsluhZR
	ULiSbRCrwQG6wIJmVvaLMmhsSXejPy9cvEJ+sAX+GSNJ3O80KjegQ/WOdAIZvgEk/Umyb2
	XzT/5YEiFGuOaJDmr34uPMbIiwyQ4/M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-522-q6-MguWJM1a3OrbJJM4jnQ-1; Sun, 15 Nov 2026 18:07:40 -0500
X-MC-Unique: q6-MguWJM1a3OrbJJM4jnQ-1
X-Mimecast-MFC-AGG-ID: q6-MguWJM1a3OrbJJM4jnQ_1794784059
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4ba078abd70so18078545e9.3
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 15:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794784059; x=1795388859; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qSuk1jbsdV+iZEtNlLpPi3t1jVjwwjZENkNYPa18BIE=;
        b=JjVOT4V+TGCb83VkIVmnJav2JUK96bzcgADChkjgU+4zOTuXmPfFS6k/KToTM6Ygz8
         z5T2fMjC53/kcIflVr18eAN90VW6bmNqg8DA3kftQDf6a5e1Wv4AuiC/s2tF/0B+Ojsr
         JBkwUDBMWd0kSH0LTMLUcqkitniPnUTsjhxSNZoiOGPFd+aErPF5k+HKhq2NL2yMtNCs
         qPudT2HkxtAkg112E3/K/43SwkyGlEbHYIOPSxE3H+PyYglTAnRteCfCfWrPvdC2UPwp
         xg/PnP1/W9jNnV8gX036w+/ujAaH7uKFOfGL/4oQVvMEvR01YJPzuViaZuFuyhTBoQxP
         hs0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794784059; x=1795388859;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qSuk1jbsdV+iZEtNlLpPi3t1jVjwwjZENkNYPa18BIE=;
        b=xkawi9FEDGCqjd0aMgxm5PhcaaNZzqminQowruYwTT4yCelPcDx2wIA4xDbYJNDACq
         NfRgBn+Ro+TVOVon+mPuF7rRD+EMqy50o/v5jMkIy2+RwVFIu05Gt4OKiObBX94QgVVj
         X0aijZiuoGCWd/qfubzX1HRGCUSGirGk1mASgM6aj9I84a5juPA4PNe3By8FQIy96Kqo
         CmuawIBOrCvmf27TX7Vt+oJ9DoX/kyh84uxIBUYzDgGyWo7mbAqk7YoTbcQKl1e5QARn
         dKniEEHIa2AWVdm+m151mqIg4lrwutcATmOb1ihcKMAZ6eqNsJL5rViic3qIQlqn3TC4
         qb+g==
X-Gm-Message-State: APuU4Z+L5dugQqkfe/jP0wOYSdZG9kLGu98J3SnJR2CqU3EPwyzrHsqi
	11W3uFeMIUUUt6wjE9DSZ7BnrwCnLg9VjfwUz1ebAvrx6tS+kYV7dSxMI3gifrotE2e5BokMGOl
	jmSmRCsH9pOSX4OqX4GfM8rp3i2un1Oq1bcbY0yQl4/dFkTcbEEsrgUjDotN1vzsSwQ==
X-Gm-Gg: AYBFou3KPtDJLt+9T67KUvmBEhB7Bv0Mz3YZqmNCv/5z4UJz2j7FGis4n2tZmFenAgk
	dSw+jDc64rIN7ZyJbEjthAK5CGgg+D9rhzzM59gBQ4AMOiEjB2SHWEICNMZqXzG9pIVULwbGX2g
	CYk/lshxYB78AVyvkDSg6syRy1sWyjEGoNXejFSFK+LUjLgihQkX+y0Wj0ReMJRH26GGomaq5lW
	Fgol0PXJxG33YC/47hGpuJXfNPXSM+TUmON4A3/MhoIKW7UdD2Tq7hCKNEZEObsufOWJZCoj5Pw
	PM39gnTmkIgHympuZPfMd14XlIPmQtxo55o9Yw8S8kEB6IavRMfuTyoER6L3ayXtHt2VITZb1L5
	jaMhEk0yLihAuSRI+UTDl5LLjx3TNDDuPmyqtg12IFw==
X-Received: by 2002:a05:600c:8b6c:b0:4a3:5a7b:6002 with SMTP id 5b1f17b1804b1-4bb649d4148mr97699815e9.28.1794784059313;
        Sun, 15 Nov 2026 15:07:39 -0800 (PST)
X-Received: by 2002:a05:600c:8b6c:b0:4a3:5a7b:6002 with SMTP id 5b1f17b1804b1-4bb649d4148mr97699295e9.28.1794784058388;
        Sun, 15 Nov 2026 15:07:38 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:151e:a200:7a96:1b15:81f:ebed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5b4a3fcdsm213451595e9.0.2026.11.15.15.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 15:07:37 -0800 (PST)
Date: Sun, 15 Nov 2026 18:07:33 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Congjie Zhou <zcjie0802@qq.com>
Cc: netdev@vger.kernel.org, jasowangio@gmail.com, eperezma@redhat.com,
	xuanzhuo@linux.alibaba.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] virtio_net: RX stall caused by masking callbacks after
 NAPI ownership release
Message-ID: <20261115175445-mutt-send-email-mst@kernel.org>
References: <tencent_AA4F39DA7ADE330C721C03AAA832B92DD608@qq.com>
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
In-Reply-To: <tencent_AA4F39DA7ADE330C721C03AAA832B92DD608@qq.com>

On Wed, Nov 11, 2026 at 09:36:10PM +0800, Congjie Zhou wrote:
> Hello,
> 
> I observed a persistent virtio-net RX stall on Linux 6.18.58 during a
> multi-threaded TCP receive workload. After the stall, the RX virtqueue
> contained unconsumed used entries, but its NAPI instance had no owner,
> the NAPI timer was inactive and virtqueue notifications were disabled.
> The receiving TCP threads remained blocked waiting for data.


Played with it a bit since. I think the below should do it?
Can you confirm?

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index dd2c41ef6fbe7..7bc7306231521 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -740,6 +740,8 @@ static bool virtqueue_napi_complete(struct napi_struct *napi,
 			return true;
 	} else {
 		virtqueue_disable_cb(vq);
+		if (!napi_is_deferred(napi) && !napi_is_scheduled(napi))
+			napi_schedule(napi);
 	}
 
 	return false;
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index c0ae442c4344b..2199750825d4f 100644
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
+ * napi_is_deferred - test if the NAPI timer is armed and will schedule NAPI
+ * @n: NAPI context
+ *
+ * A true answer guarantees NAPI will be polled again without driver
+ * action.  A false answer is "best-effort": the timer can be armed
+ * right after the check.
+ *
+ * Return: True if timer is armed, False otherwise.
+ */
+static inline bool napi_is_deferred(struct napi_struct *n)
+{
+	return hrtimer_active(&n->timer);
+}
+
 bool napi_schedule_prep(struct napi_struct *n);
 
 /**

