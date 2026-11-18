Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794968106;
	b=S8brC6wpO2Y+IHdOYMnOBE8zxXtm5lASJTMOLz0VQdnU5l1dGcPXrFHLXndXoZzyjhMU
	 NyQuVFwDoRVTDCS5HyRZ8gCyP4ewZN2rObtqizGvfGFK6GikcqoY2eLj2mP3uprFPus/4
	 ZErQFX7jepl2IgbFWo5HW/rPr1JkYt5gRWxUGtdHkACJPmmGJbh6944yr0KqgZF2zPcuk
	 e7zlyeqAtmeh9zG9ba6PMOABx2gA/PdV5LVWKusbU8gWt9eq4/SD4uO1vRIxbh3TL9T1k
	 fkJF0YMzBMSUj7p9wckHbS0/UgDItxHrA3rAhfNNU/WX+hHh7MQzzQ/F/xaZurpO9Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794968106;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Hek+ZE9sdaq9Ge80vFXi/7LSVSangUgBYjZCzNy2wbw=;
	b=4MQ7p+K5+j7/5l0a4ghYd23e8Crwgc2eVNu07P2f4AwmM6/7GZAHbgLmAurt4O6OnVqk
	 RIwJe6hr5ExWWLR48tLbMnh8tbCePH/QgwVPZ8CsAMWDD6PX9lP9FO6S4I5qDoldEWtVk
	 7FuhKBLoAWBsWOmyUJ2bszsMi/ROClWsFjM0ZhHVdfDLFoRIojV8McaqvhZMDbNFduBcc
	 emyONV6sZBW8Kp3kGE2cU9xRmWAgD31Q8u1ZZZ2Oc+I6CXoPlOkq9y8InVycNt3Qm5qZ7
	 4iqbvdI+CxkecZolY6zawfA4en75JpHCO0xcMuTqr9YUwFzctOt6MInQDs+H5o6S2iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hcNs234f;
	arc=none smtp.remote-ip=209.85.215.200
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B859606A32A
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:15:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B859606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hcNs234f
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso506112a12.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 18:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794968105; x=1795572905; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hek+ZE9sdaq9Ge80vFXi/7LSVSangUgBYjZCzNy2wbw=;
        b=hcNs234fv2gBaZqCmj9VF5K0kL1XLIKNqqfa9Ib7n00vrxU4xjZB89GqYUPwRoKKPR
         HQZiz/q+uS/wdr9I4W56QJaECk5u/vHYslwah52MEuCs+Feoq/mLB8AknBzRQQxDKsvj
         LdTEIlPJ+YCz6rvXc+WGq3Bqt/lgn0RFe7LNZl9RecSftLv/8AtzOPEMo1JPSB1vzdw/
         y0iabgq2OoPSmtNqEOqU8n0XEcAykRFq7aEmPU0YVgKvYOIXKKfOj4PEJ7/TivNFqVdF
         L54ZIBHKMZHi9Y6jlofa+en7kQzLsCNXgGfDGyW3raz0HrVuhhEvsEACUu4JNU60TyzA
         COGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794968105; x=1795572905;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hek+ZE9sdaq9Ge80vFXi/7LSVSangUgBYjZCzNy2wbw=;
        b=We+HGzkZHPZEHUlkN+TKXOP6wjUOmfLeoVn+8R2kKQbtaavc2pavICmnTxH9HUOyyE
         xJBcFc+0GYg81bxH5CbY/F2WU4K58uUJ3XzNGiavsLBvWH3tAqtertcq94/faeWHaA/l
         eBTl0h0NnQFAHey1CvDp3k19RgfkoL/7nWlQgb+sNw1u1v7bQBGuGZUDFqUcCKWg6o3U
         361w7t+LPTj39m8moDzXpWzMCo+lVOeCvod8kMmxEV+U6gwm/7+eDrVHz3tM79UMPdVH
         FhmjvfUrKZt9Xt2a2WaP7qXUrmlMQq75TKx19sl8953pInzfBo51zHs1I5XF5j8BqM4a
         bDHw==
X-Forwarded-Encrypted: i=1; AL+hErGSVbirqLqsAp+UDNEslUeKmrd80dyHiDAZDOhbsOqIdy5xbAyhAUsUFskVHqSHYbedauzqQKI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mN7sqAS0GIRX6qGKzkT07Kiw+ROpZAgqC1kibMXdJ985yhF+g
	okBjuwwD5exLoc4cQLAAh1IBHCHwzki4wlnXsTkbsOXbby7CXcoksRDJxY4NX3X0qhaRszWO+vy
	PZZEhQw==
X-Received: from plhq17.prod.google.com ([2002:a17:903:11d1:b0:2eb:4a7:306e])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:90f:b0:2e9:8202:509c
 with SMTP id d9443c01a7336-2eff70fd303mr11865625ad.7.1794968104719; Tue, 17
 Nov 2026 18:15:04 -0800 (PST)
Date: Wed, 18 Nov 2026 02:15:04 +0000
In-Reply-To: <20261117-work-net-peerpidfd_short_optlen-v1-1-a93f56288501@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117-work-net-peerpidfd_short_optlen-v1-0-a93f56288501@kernel.org>
 <20261117-work-net-peerpidfd_short_optlen-v1-1-a93f56288501@kernel.org>
Message-ID: <av0KF1liMktF5Hg-@google.com>
Subject: Re: [PATCH net 1/2] net: don't leak pidfds through a short
 SO_PEERPIDFD optlen
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Christian Brauner <brauner@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Alexander Mikhalitsyn <alexander@mihalicyn.com>, netdev@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, stable@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Tue, 17 Nov 2026 16:25:30 +0100, Christian Brauner wrote:
> sk_getsockopt_peerpidfd() caps the caller's optlen at sizeof(int) but
> never checks that it is at least that large. sk_getsockopt() only
> rejects a negative optlen. So with an optlen of 0 to 3 we still
> allocate a pidfd via pidfd_prepare(), copy zero to three bytes of the
> fd number to userspace, write the short optlen back and then
> fd_install() the pidfd anyway.
> 
> getsockopt() reports success but the caller only got part of the fd
> number or none of it at all. It has no sane way to find out which fd it
> has to close and the pidfd stays in its file descriptor table until the
> process exits. Calling it in a loop fills up the table.
> 
> scm_pidfd_recv() deals with the same problem for SCM_PIDFD. Since
> put_cmsg() doesn't fail on truncation it checks the size of the control
> buffer itself and sets MSG_CTRUNC before it allocates a pidfd.
> 
> There's no point in handing out part of a file descriptor number. So
> fail with EINVAL if optlen is smaller than sizeof(int) before we
> prepare a pidfd. Since commit e10899b2a098 ("net: add
> SO_PEERPIDFD_THREAD to get a thread-specific pidfd") SO_PEERPIDFD and
> SO_PEERPIDFD_THREAD share the helper and the latter inherited the bug,
> so this fixes both.
> 
> Fixes: 7b26952a91cf ("net: core: add getsockopt SO_PEERPIDFD")
> Cc: stable@vger.kernel.org
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/sashiko-outbox-205984@kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
