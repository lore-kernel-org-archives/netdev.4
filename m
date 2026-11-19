Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795079435;
	b=TwjDuD/INRx+Jt/BoB0XthDWd6AAoDNLwoELk2BzAuIBKqLO1hS7/4944Joz/sclOTWV
	 0s8selESYTcvZGbO4mpddOr7/9W7L2dogDxnu1++pw8B8q/0qyAWskXeY+rG+L1blL69C
	 7/FwXebYEJ9q4OV03WfyZ1Ax58nb4ow5O7DXA3qeLzIsbXcMeI21UiVqrIlE4k/wAbXms
	 87uvMR/Fshvt/pvaLIlSSbvh6axryUDGOAwomH4xHAn2Y+z9a5gk5gPmiTVH3oviOCw/r
	 b62m+7ZaOu912xkGBZbU2WuPldfAOzqeBu4WCAvcYyTR8ecexLCQmgyRU1ccQli8hGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079435;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=tuBOCCiH6AYUcrUIRQklRkNbz1Dojigm78BR7t4qnhM=;
	b=G99YJGXOEekLpbRVzOW6ZMW5UYoVQ10VMwS2WZZBycbbEx1NkJFsJkGZ3pk6D8iqxdP4
	 rvmJjBYiuZ1Lsn3fbcS3XxkwnMYHlyK2xhP+hXx72oM3fYLhjmQolDgj7v3wqUXtYhGyd
	 xhUiix4jS+zAhi7srzAy+4RPNQvke0/2Sc+gz21PwimixTj13CBYRbQcTErgb3VJ3mD23
	 FPjMkHUgcZuBwIQ0rL+vTuwzjM9gwBmWDCBwaW9G0H6g6k0D9jm2G6NLcrgodONapdVxK
	 YxLr+GiegMIDjGg1dMjpkuYfifXvb/dWdvIzOvQiq398BO6AJawSMUUd8QUiDC/Ft7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P64Dlkd0;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=S2tpJH4W;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3DA606A335
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 09:10:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC3DA606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P64Dlkd0;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=S2tpJH4W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795079433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tuBOCCiH6AYUcrUIRQklRkNbz1Dojigm78BR7t4qnhM=;
	b=P64Dlkd0H+Yr1orC347Gfysn/DDU7S0PFINxC2C3+7Rwnok16CvZL61foZ0ZYEbwueBMRQ
	J6fQHZ28HiJcrjr4NPe9AQ+hGOuL70REvlNSS58lUl/wZpKxfJHqLpmXL3ZTTMVqLF+iYF
	RsYNyrOVdPHLmXle+ASKAnLzlrBhd94=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-349-kH5tPdnWNdqf14VJIMPQYQ-1; Thu, 19 Nov 2026 04:10:30 -0500
X-MC-Unique: kH5tPdnWNdqf14VJIMPQYQ-1
X-Mimecast-MFC-AGG-ID: kH5tPdnWNdqf14VJIMPQYQ_1795079429
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4a3052225cbso1787010f8f.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 01:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795079429; x=1795684229; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tuBOCCiH6AYUcrUIRQklRkNbz1Dojigm78BR7t4qnhM=;
        b=S2tpJH4Wj6jciNhL/J4DjTGLFb3gFzo/LgkP9ow8OTPov7qEGZJckh5wjM75Xa3QHp
         8wXSJRthuAGTzqs+NHkEp9uOE2/ayyCcyx1feo5KuZTHAv89ydrHab6WETnQ2gNZHeC/
         QPe9Z0XuEaZLj5Gd/ozaNEV1BvoJO2aDBu1Zj6wXCALmqGv1E3f6guEJIAzy0/cfXOay
         c/fzvbbUszZZROATz2kQZML2KwVQ8l+GlL1gNGaCUpfCnmvFQ/NlMUTj6Nm2rgQSEJM8
         /YPpo7sOoeR64D/4g64N9wUNvR0XtN3/Yb5gSaCsPKnoJtnLC1Iw8KMwk0v9NXp7alcs
         DaWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795079429; x=1795684229;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tuBOCCiH6AYUcrUIRQklRkNbz1Dojigm78BR7t4qnhM=;
        b=oC/ir+udM/8Q6lV6CXsORjHgqvjHL2BGKwLo8R4zQjQ3Y5ktAkL1KW0WIn5JaJpgWa
         xdzOzWeN7wGYRrIlhO8M3VDzQluhG2Z8MXOSfTqyR5JNnwfpCku0GAhgT4pOeZIyIn7R
         aVG/mW6+cUH7e3lUXemurrTbHy7X2LxSOFzREoGgR6QiWAVpZUnwbgPlpFKZfeNsEySk
         fCpYSuR6EtcsmsLqkxp35G/KhveGksRbGbdJVOIgd2INTgpeu+rULxXW/o25gpS5YEC0
         AmoPKWfLhzq6h2QFr65QcbURI9FdRgfGgrUeosUSDnxxcR/hyufMd1uNwD92eKqkIP9q
         lNCw==
X-Forwarded-Encrypted: i=1; AL+hErGw/jYThZ+Jx/TzNkXNA2YZ7y7EB4QYmk/jcgCg1L4xg5NT06Hh/hhGS/fOwCJtftAPlciNTCc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bEbrlrWJFSMIezIDbDRoQd9o5hJ+RPJWtdn35H2VhNNL/ypnf
	5YvfA+XRzktFTuLpMnSgphqMKSfAoTT2Ug1dw1jsMiI3EMnhx+KAON/57wzUf0qZ2KE5Ze/LxqZ
	am3yZwZo5FX5xiCNk2JI+WxP40bQBhjCyy/Fk2iCsgBDrKC77a+TRpuMgAg==
X-Gm-Gg: AZFdTZe+jnekl+Jbk5tgGuRuocbBo6l21twbZs3z+D5wlLvC5w3jcQ8wkPUhCmWMFY2
	ZZKJfiuRyDFHpvO/hSnsI21kip8gqU5Pks/tDjMQue/IqDggJr5b/WJM79ZiKY/eP/D9Qa1b+Pm
	K6D6746w26WwSSKiv/Wtlk7LAw1a/azD4siAxbsCOVv5pZ1CXWeqepD3551Nh4vIK2BNgkBp59d
	eE8w3kCVTH0koHThKhWPLOWic/DAGVjMcW9+crjr8zjOFj9wquSreKFvCMqlSnjlIqD/4hf0FXH
	seK3djla8fs+3aQWhFT8cOCo6q0OQhagSGIixJlLT25pMskHG9xQKx/SKJm32dkYiJp3NagGfiX
	c41GmtlscTu6hEXKAKiUqpDW953G3m/k5fSYFpITfNx7m3WHIz0a6MA==
X-Received: by 2002:a05:6000:4812:b0:490:50c1:f359 with SMTP id ffacd0b85a97d-4a63bea9888mr10985194f8f.39.1795079429126;
        Thu, 19 Nov 2026 01:10:29 -0800 (PST)
X-Received: by 2002:a05:6000:4812:b0:490:50c1:f359 with SMTP id ffacd0b85a97d-4a63bea9888mr10985146f8f.39.1795079428655;
        Thu, 19 Nov 2026 01:10:28 -0800 (PST)
Received: from sgarzare-redhat ([80.116.143.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a655db6d45sm9145491f8f.33.2026.11.19.01.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:10:28 -0800 (PST)
Date: Thu, 19 Nov 2026 10:10:21 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Cc: Bryan Tan <bryan-bt.tan@broadcom.com>, 
	Vishnu Dasa <vishnu.dasa@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, 
	netdev@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] vsock/vmci: reject datagram binds in local network
 namespaces
Message-ID: <av682hncPM1ksJtf@sgarzare-redhat>
References: <20261117-vsock-vmci-netns-isolation-v2-1-d6f35e86416a@redhat.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261117-vsock-vmci-netns-isolation-v2-1-d6f35e86416a@redhat.com>

On Tue, Nov 17, 2026 at 08:01:52PM +0100, Sergio Lopez wrote:
>VMCI already rejects datagram sends from local network namespaces, but a
>datagram bind still creates a receive handle in VMCI's global port space.
>A VMCI sender outside the namespace can therefore deliver to the local
>socket. Its handle also prevents a global-namespace socket from binding
>the same port.
>
>Reject VMCI datagram binds in local namespaces. No namespace-local
>datagram transport exists, so EOPNOTSUPP reflects the available receive
>paths. Unbound datagram connect() and sendmsg() also return EOPNOTSUPP
>because both call vsock_auto_bind(). The receive callback rejects any
>local-mode socket as a defensive check.
>
>In a KASAN/lockdep QEMU guest, a reproducer observed cross-namespace
>delivery and the global port collision before the fix. After the fix,
>local bind returns EOPNOTSUPP, the global bind succeeds, and a global
>VMCI datagram still reaches the global socket.
>
>Fixes: eafb64f40ca4 ("vsock: add netns to vsock core")
>Cc: stable@vger.kernel.org
>Link: https://lore.kernel.org/all/sashiko-outbox-212907@kernel.org/
>Acked-by: Bobby Eshleman <bobbyeshleman@meta.com>
>Signed-off-by: Sergio Lopez <slp@redhat.com>
>---
>Changes in v2:
>- Combine the VMCI receive checks and clarify the auto-bind effects on
>  datagram connect() and sendmsg() (thanks to Stefano Garzarella).
>- Carry Bobby Eshleman's Acked-by.
>- Link to v1: https://lore.kernel.org/r/20261113-vsock-vmci-netns-isolation-v1-1-ced02054ea61@redhat.com
>---
> net/vmw_vsock/vmci_transport.c | 7 ++++++-
> 1 file changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

