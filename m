Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196733;
	b=5geLpu3g9A3Exs4BGp0ZxbmA2arUE0TCxBPHt8h2kruna3jeGcmmq5PzPCEGQM591dx7
	 mWkR7g2h8vvKKONlU6+9OoCEh/bSgiiHyuHRPC+EdZabpUM501x85GWQnyb2jMnSueMaV
	 mIYouHEfz9L5rsIpSqCMh+HnkbxvI+6WvDcYMRfxbkfUTt/2wJ3kchKmhQUGk6evwKHnH
	 EEXyl3WehMIaNUERhJP8fFFchQrdIvxhV/W0+6EYx0skRtTi3xI0gmaE3ClMrTcSEMMN6
	 omWRAYioDxXKsNrLQBy2NGYa47RzjIADP+WMyCHT+2t4+GyszyGUU6URyTMmM5pulOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196733;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=uq/o5iwtxXSQxTRJv8L5q8Xn0KTb+mT3qs/Sf++WNxM=;
	b=gKVdm3i7vP4DoloC6YQqTR6JjjJF+9EQOqhEm4X0fgBfJEnMgzvcskO6YKPmeDLyRRQr
	 ZCL+yiQo9bVujp24R9k/cZZIYLNylUmIzqCcTROc8c0RE8lcB0nZKKMMRakTI6GjDoD8W
	 4veNuGOv/d3zu16EFJcVg/lFW83jU52zuGHorCxR9A6oFJGH6uATdGj3RfoqmSz/Rly4b
	 ZLBzaklr1v2TmSoXuB0MVE4yiaUDzm5ps4VAU4HtbkiL3okjTsGmmHQ76PwYDnpMQ9XHo
	 mJ0GIrIVffVvF0Tymo/nuismWBE2UpWymvVTaIm575fqlS3NBpfrJBOjN1MJUDTZKHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ICgsiF3B;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qCoFda1J;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401D560A2627
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 17:45:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 401D560A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ICgsiF3B;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qCoFda1J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795196730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uq/o5iwtxXSQxTRJv8L5q8Xn0KTb+mT3qs/Sf++WNxM=;
	b=ICgsiF3BabQ7rZXv1dkZIqA5KJk+t294fUSswbkN2ARpa7K3/AQ1EDVKYWY7XLxn0+lc5y
	CWJbni5h8Uqt4weSC7Esxi2Q+lM3hCmVE4q3DzTD3eJUYP3bbCXHaSFYse7Dwpq6RWUT1d
	6SssDcJtDxJCTXoLeuRIIRgjJ9+Dbfw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-yfHqUc70NE2_9GG4jc-Z9Q-1; Fri, 20 Nov 2026 17:45:28 +0000
X-MC-Unique: yfHqUc70NE2_9GG4jc-Z9Q-1
X-Mimecast-MFC-AGG-ID: yfHqUc70NE2_9GG4jc-Z9Q_1795196727
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4bb66fc3aa6so11222335e9.2
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 09:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795196727; x=1795801527; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uq/o5iwtxXSQxTRJv8L5q8Xn0KTb+mT3qs/Sf++WNxM=;
        b=qCoFda1JL56MPjXo/zvjUxnJGw358dIj8avW1O2od8Ke9RJf5JMrzOsU5OaK/x6h/T
         qGXWg03sJ86MMOV32B3tt/7JYIQmvMidzhOCwjCgRctCaS+3a72VmLHzSMgEC1jeYMrw
         25Mf6FiPvIIiO/IQlOqzaWD6wpX0woliZ+5hWbVvgT30MP54Tn4uwwCEnQTae6DNskd5
         hUmF7aI/6ZIKIJMznHzbMpghuuQchRnjF1rA0Bzv57YLzNzzrbRDAeXNNvd64FSQ+452
         WhaBQd4qesdo23wZl5tx09ZUkBXJisu0efo+lMJNI8oaZiZg4eEtToRRaD3wMp4EL9Lh
         6Mdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196727; x=1795801527;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uq/o5iwtxXSQxTRJv8L5q8Xn0KTb+mT3qs/Sf++WNxM=;
        b=GYIf0vgXSiQ3yEVfXisuTYlFMyvLQdOQVHiyLQbsUActTWwCN0P2v9wlTbfmSKXYLG
         GetyzfhM1YcwHJ/WjPjD+zbbZMEzYcdxhCSSknbrtZttr22kERrI5j0cY6VpkoPNP0lI
         CYR2WWB2XHxNg8N9GaA1Ql+1EmphtCwSU/HLnzu8Hemr9q9dtrJA97HJtE9fDcqZZbvQ
         6z5XKGs9DkMLDgQTlrdmNi2YoGtr5u55CAh45SmuQEspAedj+UG2lD0/diZr3h8+RQ0Q
         3BzFMCkjBDv+3uZWc85j9SwM+T625MadAu/gUGRDUNKlL012srh6E/1Z5nsyRVivqoQx
         +1WA==
X-Forwarded-Encrypted: i=1; AL+hErE0dzlX/0+WcJlU3boZEdLpeXFa0u6kKFWL5aQw+ojKdiBXABFRCK5GlMiUJ1GR+g7ocINIC+A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SxkRIIrZHawUDIR44ZE4T1Q/0DNiUvGwwk/lg0hChd3ZyTWRL
	pi5+wmdJ8KQTD8oh6uL43YpIqb8e80GcKD4gd3Bk1ib4eh5ED5SjXTXCH4/sw7jjAeKHdQslszL
	pu+l9u5FCQPvG0L127zAGr7ieRuD5r3Oe1veH7Tjhk8nW3HnfvHFgaWtVMQ==
X-Gm-Gg: AYBFou1kg6PRBrr52akE25rzBtjwE5vNPe7nXxWJOe9xriNAeHETP5Fv4OCifqnoevN
	hREJIQT+zHd7dTxIBb7zW90MDDiFyJJZgHY4/O0KVbhfQDzlEfNTAYGkBvGMexan6jek3lm9zaX
	IINOceHHrH61tL9yLnXAzdFcSsUJlLlskssYPRbquzWlW7QAplWh1NnciC3uuDjx2roUomPlA73
	Y85MSTxbvZtiexGLk202zPh5L4Z6gNFQ2oV/0IiXwgdzBPf+/r5hCdmWdVTCAQf5PL65+OJCi3P
	4wfXbKeh65E6+8ty2Je5j5hb7DB7YKZGv5CjDnl1a45pocIFQEHDuaqmi3lK/l2WVL52U/HOW1p
	LLUtjfdpQOkODWhpk94+e+FoMwW/FNqTVOQjw9+YqsPpH
X-Received: by 2002:a05:600c:a15:b0:4b6:267a:dd6e with SMTP id 5b1f17b1804b1-4bb88938a62mr88569355e9.28.1795196726647;
        Fri, 20 Nov 2026 09:45:26 -0800 (PST)
X-Received: by 2002:a05:600c:a15:b0:4b6:267a:dd6e with SMTP id 5b1f17b1804b1-4bb88938a62mr88568535e9.28.1795196725990;
        Fri, 20 Nov 2026 09:45:25 -0800 (PST)
Received: from redhat.com ([2a06:c701:73c1:fd00:6c8e:5a61:f533:519d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm142927935e9.13.2026.11.20.09.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:45:25 -0800 (PST)
Date: Fri, 20 Nov 2026 12:45:22 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Longjun Tang <lange_tang@163.com>
Cc: kuba@kernel.org, eperezma@redhat.com, jasowangio@gmail.com,
	xuanzhuo@linux.alibaba.com, virtualization@lists.linux.dev,
	netdev@vger.kernel.org, tanglongjun@kylinos.cn
Subject: Re: [PATCH v2 0/3] virtio_net: introduce an RX queue watchdog for
 stuck detection
Message-ID: <20261120124403-mutt-send-email-mst@kernel.org>
References: <20261120071826.198604-1-lange_tang@163.com>
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
In-Reply-To: <20261120071826.198604-1-lange_tang@163.com>

On Fri, Nov 20, 2026 at 03:18:23PM +0800, Longjun Tang wrote:
> Hi Michael, Kuba,
> 
> I once ran into a problem where the virtio_net receive queue became
> permanently stuck.
> 
> The virtio_net RX path relies on backend interrupt notifications.
> The backend(vhost_net/vhost-user) appends buffers to the used ring
> and then notifies the guest, relying on the hypervisor(KVM) to inject
> the interrupt. On receiving it, virtio_net schedules NAPI, drains the
> used ring and refills descriptors.
> 
> If the hypervisor fails to inject the interrupt(e.g. a transient KVM
> failure), the guest never schedules NAPI, so it neither consumes buffers
> nor returns descriptors. The backend keeps appending until the ring is full,
> then stops and, with no free descriptors left, also stops sending
> notifications. Both sides now wait for the other, and the RX queue is
> permanently stuck.
> 
> The root cause is the lost interrupt in the hypervisor, and the proper
> fix belongs there. Nevertheless, I believe virtio_net needs a way to
> observe and diagnose it. Today, once a queue hangs, there is no signal
> to the operator that anything is wrong: the RX path has no equivalent of
> the TX watchdog (ndo_tx_timeout). This series lets virtio_net detect and
> recover a stuck RX queue.
> 

Why virtio net specifically?


> Implementation
> --------------
> 
> Patch 1 exposes last_used_idx through a new helper, which is used by both
> the split and the packed ring and denotes the position the driver has
> last consumed. Together with the existing virtqueue_poll(), it lets a
> driver ask whether the device has produced buffers that the driver has
> not consumed yet ("backlog").
> 
> Patch 2 adds a per-device RX watchdog that scans all RX queues once per
> second. A queue is considered stuck when, for 5 seconds, all of the
> following hold simultaneously:
>   - the queue has a non-zero backlog (unconsumed buffers);


what does unconsumed mean?

>   - the driver makes no consumption progress (last_used unchanged);
>   - no new interrupt arrives (rq->calls unchanged).
> On detection it logs a warning, rate-limited to once per timeout, and
> reschedules NAPI, which drains the ring and refills the descriptors,
> so the queue recovers.
> 
> Patch 3 adds a per-queue stalls statistic, exposed via ethtool -S, so
> the number of stuck events can be observed per queue.



> questions and comments are welcome.
> 
> Thanks!
> Lange
> 
> Changes in v2:
> - 1/3: fix the kdoc.
> - 2/3: drop the module parameter, use a fixed 5s timeout.
> - 3/3: rename rx_timeouts to stalls.
> 
> Longjun Tang (3):
>   virtio: add virtqueue_get_last_used_idx() helper
>   virtio_net: introduce an RX queue watchdog for stuck detection
>   virtio_net: add stalls per-queue statistic
> 
>  drivers/net/virtio_net.c     | 105 +++++++++++++++++++++++++++++++++++
>  drivers/virtio/virtio_ring.c |  18 +++++-
>  include/linux/virtio.h       |   2 +
>  3 files changed, 123 insertions(+), 2 deletions(-)
> 
> -- 
> 2.25.1

