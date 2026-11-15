Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794773401;
	b=gCclwZqz7rJMh94p/l5UJ25PpfL9fmYe+mbkchf+7iLeRIH6ILtRJzL1AKoHoyh+82qG
	 +7rZTS/fDjr19Ppih1TVUSG/kldioXgGUYklWTfdF+AioM3zCh24H3ENFQTgnuW+m5oan
	 GtupxvkbMosDyPE6/SX/t68W7KJnWg501/knSJbZpCH50FWwa2buN4SfVD7Z0X9YxvWIA
	 OqceanzbMdTFldV3P633Jauo3gqPOAo1XZMc687ceqhbu172UCmcoAigr6d/APwDsfY8V
	 QMC3EjTgojNH1XeHqHakK4Kq63KoMf2+qV95/75XHP0XlESQPFTphmZNF4C4RsMDIAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794773401;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=6LdHhyQ4qYGaeUAtkR2L4ANZJ6ir0QFdHTHjhQDfZlk=;
	b=STGed/1EAezeemS8lw5zD4o19ur3COR1zTOSyacnr/uLQAci5rV3B4LcC3hrY+bdyfOa
	 k8sIWDsFt4kskDvHhHE1WiHh+9zKFguHBAXu5qtp5Dtad6BjhucZFTvzCTM/hESddkXA8
	 jdbXaEEem2+8Uxn/sA1EIjI5PeJDP4GDwRTJcT0/9EwhCvExhhRDe3ORoh8QOQ5T2PdIN
	 cj8pPtkgtkDtF4j33QhjrtKeLlxe32+fFlLzQnuTUJPDtMmfELIbolmDUqiDbAjbo8CoQ
	 y537JP4mO18RzFuSwiSy5SibWWtZLzWJ9rGV8ri7/5BzTfjFJPduX85Jx4I8MiosthA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cPsH9iVU;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=W9xTKvsb;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E755F606A32C
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 20:10:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E755F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cPsH9iVU;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=W9xTKvsb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794773400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6LdHhyQ4qYGaeUAtkR2L4ANZJ6ir0QFdHTHjhQDfZlk=;
	b=cPsH9iVUbHSe3eeKQ7bJAA4p3sxZKK2HWOFoQp5eLevLmtR0OZLYojsrAsjeK6n/WE5FYt
	Gx7kf/8n3oDOVX3JwKIMiFXc0B6Opdk7jszoZ6buw6w2bW5tTziZ0cmg45oNZhmObKX8BD
	h4SHyXAEkfHU170dFpkV0mX+NnVhexo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-153-bduiaRNTMw-KHuNpJzxAwQ-1; Sun, 15 Nov 2026 15:09:58 -0500
X-MC-Unique: bduiaRNTMw-KHuNpJzxAwQ-1
X-Mimecast-MFC-AGG-ID: bduiaRNTMw-KHuNpJzxAwQ_1794773397
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4b9fde3044dso18052505e9.0
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 12:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794773397; x=1795378197; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6LdHhyQ4qYGaeUAtkR2L4ANZJ6ir0QFdHTHjhQDfZlk=;
        b=W9xTKvsbmIpBLnpVpr9eqXDZsFlLCgrJLf+gAYKY8n+oN8arOqjCTrG1T1/PsU186v
         PookBUfAnsc2Xqioz3+XxBpifY2Y1NENJZCmlGBVRLR4hA8Aphsy4B4DysrDP22HD4mn
         PVFthURuZx6RheT8vLYXTry9Luh18p6BJsqNJ+dc0H09oJjMiHWCEcVKX6reCbafoeA/
         m7R1hWpb9qbQklLpBPgxOvfcQEaWMOm7Mgy7gmHqZNJ7SJcBzDUi47PK/+DUcekLFiHD
         QAPpK2OTVf0vjhXLwJPf9IqSjboV26NS3hnmfvfy4MQ6bIE5SgEAdEsUgijEr6LFns/9
         8ydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794773397; x=1795378197;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6LdHhyQ4qYGaeUAtkR2L4ANZJ6ir0QFdHTHjhQDfZlk=;
        b=Wp5SYz6xRBZs0RmuS28A3bqTmLWr5ukmq3ut08d+AU57dBJRrv5n3zpCA31xnm3O/6
         6c8KMksU7KZBBC0qdEukG5JPbt4zuUYJaxmrYVQfWvbh9xrHhGPv/RyGUWCzzoiGgEz5
         yQ0XQjlxj9IB8vSQTM1vAwsRNTL1GnPaWlH04PZzK+Fxv3ioFOw4dYueJwF5xuNLH1h5
         pK9XRcTJ9jvH9kVH7HFx14YdIWAMdZGXBpMuzUs5FcokwADdKbHyjERusbXoazZw2fRQ
         l/olSwgtM33DwOGdlHuKt1u2RGZ62lxvxfid8qcFNjax1pDjWkIv/+RSp+6GIZcYT0+s
         5OGg==
X-Gm-Message-State: APuU4Z8HHM5YgDPLDbnLRk7h5Yc8TrwoCS4mFvSm7Ff2X2YNPRf0InZv
	NjzpZY6WGY7kAgzLeTvEUGmD8AYjoMDgXCZ8UaDZ4w9RIGwLXTPUVKjdyp4AjSG31ad3HlX86CK
	hrI4RDv0UWKiWWzwf4v48oNGL8C9Gz4r9yl0sVLlBprQ6ERE/xPJOUww9vw==
X-Gm-Gg: AYBFou0y8KvJm99Kdo6gRJwMwVuTaVvvkK/OQFCgGgdTXh2Wj3oeZlwmORz+9chTvUo
	RMsOtpqb7U9cjzll2pGUu7OkChQRZEZMgtT03QZhvcpFQYVc3QpLbeZKWWsrGP3V/Gk+skePc9Q
	ecKsdiih9zIy1xVcw/80pt3zZS6r7rGdGvKD4gHpusm0QtIqUH0p6Sh/fFLHFPybftzXu23KC6h
	ANdrsyjTKVnisxAKq4D1QmjLvOK+lP2uZ01gkvJESq/ch3sqYZs+q7WAuF43JuBoIGrJYjN0Ukp
	UmMAxJee+uqF7oi/Bwg5TuiCMpAAi6kniDkdbNlnwnr/NWcuiwy2rzL29EW0FJY+PhrLTgdILBc
	p9FNH3CMFcmpZqhfHkWaulCMcITBgNfDZKtWgDAizyg==
X-Received: by 2002:a05:600c:3551:b0:4a1:992f:d0e7 with SMTP id 5b1f17b1804b1-4bb55a99d21mr192253055e9.16.1794773397188;
        Sun, 15 Nov 2026 12:09:57 -0800 (PST)
X-Received: by 2002:a05:600c:3551:b0:4a1:992f:d0e7 with SMTP id 5b1f17b1804b1-4bb55a99d21mr192252645e9.16.1794773396626;
        Sun, 15 Nov 2026 12:09:56 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:151e:a200:7a96:1b15:81f:ebed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm514095655e9.1.2026.11.15.12.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 12:09:55 -0800 (PST)
Date: Sun, 15 Nov 2026 15:09:52 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Congjie Zhou <zcjie0802@qq.com>
Cc: netdev@vger.kernel.org, jasowangio@gmail.com, eperezma@redhat.com,
	xuanzhuo@linux.alibaba.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] virtio_net: RX stall caused by masking callbacks after
 NAPI ownership release
Message-ID: <20261115145652-mutt-send-email-mst@kernel.org>
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
> 
> Completion sequence
> ------------------------
> 
> The completion sequence can produce this interleaving:
> 
>   old poll                         successor poll
>   enable_cb_prepare()
>   napi_complete_done()
>     clear SCHED
>     arm watchdog; result=false
>                                    acquire NAPI
>                                    poll, enable callbacks, complete
>   return false to driver
>   disable_cb()                     callbacks are now masked again
> 
> Root cause
> -----------
> 
> virtqueue_napi_complete() calls virtqueue_enable_cb_prepare() before
> napi_complete_done(), then calls virtqueue_disable_cb() if completion
> returns false.
> 
> A false return does not guarantee that the old caller still owns NAPI.
> The hard IRQ deferral path can clear SCHED, arm the watchdog and return
> false. Another CPU can acquire NAPI, poll, rearm callbacks and complete
> before the old caller reaches its final virtqueue_disable_cb(). That
> stale mask overwrites the notification state established by the new
> poll.
> 
> The watchdog is one-shot. If it has already run, there need not be any
> remaining owner or timer to recover after the old caller masks the
> queue. This leaves later used entries without a notification-driven
> poll.
> 
> Current source inspection and local validation
> ----------------------------------------------
> 
> We reproduced the notification-loss condition using a deterministic
> KUnit fault-injection test on the latest mainline snapshot fetched on
> November 10, 2026 (7.4-rc2, commit b3dfbde62cf1). The candidate fix
> passes the same test.
> 
> Candidate fix
> --------------
> 
> I have prepared a candidate change that masks notifications on the
> relevant completion paths before NAPI ownership can be handed off,
> rather than masking after a false return. It adds an ordered,
> non-sleeping, idempotent mask callback to a new completion entry point
> and uses it in virtio-net. Existing completion callers retain the old
> API. virtqueue_enable_cb_prepare() remains before ownership release,
> preserving the ordering required by the earlier RX virtqueue race fix.

so... can we just check for this case? Like this?

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index dd2c41ef6fbe7..41778d727a89a 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -740,6 +740,8 @@ static bool virtqueue_napi_complete(struct napi_struct *napi,
 			return true;
 	} else {
 		virtqueue_disable_cb(vq);
+		if (!hrtimer_active(&napi->timer))
+			napi_schedule(napi);
 	}
 
 	return false;

