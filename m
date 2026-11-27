Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795798008;
	b=I9wvWG/FIpcv4V9pGXhb6Wcf51RrNOsTUY6s3+ARHPRjs2ZZtqNbTlUVn5SrPn6o5YwR
	 qOfmAxFOrWBqo4M1XrAuLjLVZ7vt1V2TNyva1L0v3YXuuNacKEhlGAdvOnqWpNE3L6BhK
	 JGREouET2PTbOM1dkhTs5ZL9VqCIPpLkg9jy9puALZqFNohp0877JU2AmVAWIkgzxaQQB
	 zzW8JFy/OUqffU0eOWSXr/F9iZglTumDBhy2Vhsz0wgIrsKLufNrTFQbIY54N67PUad8z
	 K5g1n5NZOvPOSs2jzKKFWiWYqCNeWsGLQGpeGFcVOo0Rewp4jfDuCDOMTJNsT1/P4fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To;
	bh=cPGonPnJaKEtU6M0q6SAoZxL8EtzmXx+NTo0dKeF1j8=;
	b=wJDIvz45NgyiJgn5k0F/+PY/9LEa7vJVEJxq/UyCtQqVzwfGQAJ1iJUHua78qft7nN1x
	 wL2RSk2m4T+YjKYKKowNsg5tgas0CaH/W2z6zjrVINvFmarTxndaNhpz0hmrbsEpg8/zY
	 lPrbJICgiUj82LApMF93saDKD364ztMMiBwLbvS2J4bFh+NrWImMF2eiyA/xVgWSxZcvx
	 fdQduoOpq6dY9RahOaHI8nr1B2D0zw5oQBxGFqZV1bMQ3rihPtMpYPnRiTz76oJDpOtT0
	 eWiVo+H4fS2BKKCb8PagdEzLAzKe+s0Qqyg0PQDx45l4+TU8KxqB9ixE2KHaxGxf7+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zdDyJJsu;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2492E606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 16:46:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2492E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zdDyJJsu
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b612fd74e1so2897816b3a.0
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 08:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795798007; x=1796402807; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cPGonPnJaKEtU6M0q6SAoZxL8EtzmXx+NTo0dKeF1j8=;
        b=zdDyJJsuKWhdA2962ZWTNYhi8s5y5Nv0FWKguuVJinBVwrcS4zH4SEMbFEoKZVD/ct
         F96MGE4gdM2pJIXVkQyx4CXALNnj2RX3AR2wD4tLlX2ectfX17pjL1dm8fS/anXmFqEI
         Lp53bK9bU0W+wL603ygPeXGwnjC8P8cqwUFJLoLWMQu7uAL83a2/IL53PXH7evIK7xHI
         Q3wKCeDVaRCdmVwV0Acl+moZUo9NZipKdIabeQaPSlIKDbBdnDpHguTuKwIlCBQO46TG
         wMgFOmyfEzYvxB41sjeKfZIlPBV3ADbR0CqGg2uu9M4vRvyJmS2XN2wX4MOGOugO5kC4
         xwqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795798007; x=1796402807;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cPGonPnJaKEtU6M0q6SAoZxL8EtzmXx+NTo0dKeF1j8=;
        b=f81NYvrsXMLK/I2hlNjMAIzFiqt0yjyP6zz3h6t1z5ARgdCh0g8O+xkpBPvedWHW1p
         aHxXwoHYQy1yhcUz2/MJOyH6ByVw5gl8C28BpCC8qrfrWyPCmvp/ZuH2BCMeFS2xWgbK
         8JCOzTHXuK068Y+5hjGgW1aAwBI0wIsdbUcVNXQi1iEdv2wcFKp53Lt8rCjDU62WgjXw
         y3UoqBu22X/xmHRzEmKbtb63LGZ9D2u2ReJI0XMNBR9dNW9JUPG+YqZZrvwP2HdHzKzw
         3VXuqhoEzjOh4tMZcIilTmfaAjJz9gY5OVwmioeqyrTy68NkCfWtGamzxYbbbm/rxSSs
         R9zA==
X-Gm-Message-State: APuU4Z+57t5VLw3MLeyK5+yNEqNI33AlujlCj0qNxmBqECGLp0dAHn6B
	SVB/fcUMzq7eUZBqpAvCsQ/vkajcJgso55cKK5AQV2XVv06Wpq9nyG4w
X-Gm-Gg: AZFdTZerVOwPgdqW07hfG0DQzXqwBiiX+IcludDaqQu4P4QM9p4SfutgaP9q96IKzjY
	UHvBLWzu9QtnwE8PEQLmPHqRSnWT7PpowGXpXdY5gcG9jzN06HOwvMXTAvlyD9nIpiMdauQzge8
	DuUlXG44GRmglb8vHOT5Tr6nYreFptfRzGwdmQWyyIy8xR1hkNtjvlw52/GJGtkDDZXxi9uH9LJ
	rr8kX9XBeUP0nstgjCA4FywMWjrzL91ZNoX+qz+RX6GebqpXz1BqCf7PmAEDnuAIrBiwxQP7G1Q
	nQa1HJnvJMHoiC/D+zzxg8kymtz3KoUpjvKAPJCDP4N0vSa3g8h3Iaax5U4DQVRNHGQ6clQH7n9
	runLyFF6XM1y+XEaUsuGPUY3v5TlmWYFov/VmDfmBJOdVGRMt1jWMTkU7VgnZWWTJC0KTlA+JBE
	auM6JJeUaNe+gyUo5TclRBUchDzMcG+DXvQ8rQ5vf4lPRm2cQLey0TOdw6hUXM9qGpNzrWRjtPq
	R1G8Af/3pLHtwyd/6EWxBEeqUMT7mieHeTJ5f11BetYOZLA7MaQIV7KLcisaEPq/pUVQzy/2Hbd
	VOpwAhv4zv9ekQ==
X-Received: by 2002:a05:6a00:1808:b0:89c:1f2b:a73f with SMTP id d2e1a72fcca58-8c87bcbced8mr24029762b3a.17.1795798007317;
        Fri, 27 Nov 2026 08:46:47 -0800 (PST)
Received: from localhost ([2601:600:a482:7d70::5e59])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873b278f0sm12948345b3a.51.2026.11.27.08.46.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 08:46:46 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 08:46:46 -0800
Message-Id: <DN659J3QCZRL.2PU3PICXJW6K9@gmail.com>
Cc: <netdev@vger.kernel.org>, "Loic Poulain"
 <loic.poulain@oss.qualcomm.com>, "Sergey Ryazanov"
 <ryazanov.s.a@gmail.com>, "Johannes Berg" <johannes@sipsolutions.net>,
 "Andrew Lunn" <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>
Subject: Re: [PATCH net v3 2/2] net: wwan: iosm: re-bind the driver when the
 modem rebooted during S3
From: "David Westen" <davidlwesten@gmail.com>
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>, "David Westen"
 <davidlwesten@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261126194143.32283-1-davidlwesten@gmail.com>
 <20261126194143.32283-3-davidlwesten@gmail.com>
 <fd2a9a0a-106e-467b-acd0-7045410305e3@maciej.szmigiero.name>
In-Reply-To: <fd2a9a0a-106e-467b-acd0-7045410305e3@maciej.szmigiero.name>

Hi Maciej,

Thanks for taking the time to review this again!

On 27.11.2026 14:49, Maciej S. Szmigiero wrote:
> That's a much more intrusive change than simply re-binding the driver
> and to be honest, feels like a hack around various paths in the iosm
> driver that may be touching a modem that lost its power and then crashed.

Fair point about the size. The aim was to avoid behavioral changes
unless the modem rebooted, and, unlike v2, now also avoid possibly
re-binding on s2idle or opportunistic sleep.

On my laptop, the order is the other way around: the modem crashes
during suspend entry, from the FORCE_SLEEP doorbell (which my s2idle
series removes), and writes CD_READY to the shared memory. Then it
loses power and boots again during resume. So after resume the modem
is fine, and only that stale CD_READY says otherwise.

A plain re-bind of the unmodified driver after S3 worked in my tests,
but those had no port open and wwan0 down; with this patch I also
tested wwan0 up through the suspend. The checks are there because the
driver and the modem are out of sync until the re-bind, so the cleanup
shouldn't wait for replies or send commands the rebooted modem knows
nothing about. If you prefer the plain re-bind, I'll keep only the
detection and the re-bind, and test that with a port open and wwan0 up
before sending v4.

> Also, wouldn't the problematic things that you describe in your cover
> letter as happening at modem unbind during suspend also happen without
> any power transition if the iosm module is simply unloaded from the
> kernel (presumably with modem still connected)?

Yes, rmmod and hibernation run the same cleanup, and both problems
are already in mainline: unbinding with wwan0 up hits the
use-after-free that patch 1 fixes, and unbinding under traffic lets
the modem DMA into the freed MUX buffers. I reproduced them with my v2
patches applied, which leave that part of the cleanup unchanged.

> If yes, then this new approach is simply papering over bugs in the
> iosm module cleanup that really should be fixed at some point
> independently from any suspend/resume transition issues.

Agreed they need fixing, and I'd like to rework the teardown for
net-next. But the re-bind doesn't hide them: a modem that lost power
holds none of the driver's memory, and the remaining races are as
exposed as with rmmod today.

Thanks,
David
