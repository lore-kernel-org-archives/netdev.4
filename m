Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795805814;
	b=kZbHwEUxFKwtC+HwD/k1qCgfvKInkcv0XKjnTXtOokQFMXeDGTrNmfFrNrSxc8fVbd8Q
	 uBQXIaPmPUy2PEAni+GSvX8UwDG0IrpHmreRzuzQYaIiLk3BwuYsOXFSIn3D7meBLEBHG
	 P5u5EXo7CSKxTG2S4TVRIdFIdzXJ9jlEOdQ8tua8yZvB/+YhxI8Wu517FPSSp/9ExLrI5
	 i6ntaYDRNulYcssEX3divxvySxctRnS6YE/r1wzyXOW2wKI6VAJToznj5jILvmopEGurO
	 +C7y/bdiGy0RKcF1nzUyoDKr/Cd/eQ17X5/xksA3Pk+sUAX1/VeC6PasGnZkcyuyWNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795805814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To;
	bh=F5Nr3iW4BqVQetm5Pe4Fx7V1QuIWu+0bYDS3Y41KKMg=;
	b=ij4eoY8y+Yg9Xrgj3Khoc5w5zxuid1LnAmiDAaZ4+uBH3If/iTAWP6LALf9Af46nA9w5
	 JpHnjcAZuzATQqzGUhG7T5j4/UzvnEW+ERYuuPvFX3Xp6ET6iUy1fALGELPTryYN3dP3U
	 rmDMvwtNqtS41kTapQm+6lKgxjdCg/b4pGHxQ1OBnkDE3/rsaaJB0puPKOH9BrNjS5WBK
	 UygTnBhGmVRwXqC3cB5kcB0Mom0hDhpR6Ull5MzynW4hhAvlakuwK9Ukm2s1JFxbGdoHz
	 61IqtHiNBjuV73XS1nujwA5nOn/aNiOFNYbzAnZRgtLpYREyhVjeqAx/EkGysFDrjgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aeqSMXMP;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D87D606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 18:56:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D87D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aeqSMXMP
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b49a6e8212so3568240a91.2
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 10:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795805813; x=1796410613; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F5Nr3iW4BqVQetm5Pe4Fx7V1QuIWu+0bYDS3Y41KKMg=;
        b=aeqSMXMPAYjCALUh7eZa/1ncFtf+1PfU7M8up8SCrZ39n2OmoAFN1Wen/orDjCzcv5
         XmnSvpfR+Fc2mdwA21bY/TJTAJUJDC6e7JqgpXLZ5wnfDqcquPMjoRQP/uuAX54wUX3j
         5zTiXtfnHdInzMhjOBZNLlWKJD7XG2yoV3Zc0eOWY8RmgFIdrOaQlEoSOqYdfpiMDxtD
         6PAx/8IrOLzOsQBfD37CqTozXl8/Ajcezgh5EBiBih3OS0c4WWJux4tSAQ0ZJFRgPZMS
         3Buur4yV9VjIpkShGucwbmJPyw3FDzpw3Zdv48rF6k+sBoOwXMw0GyIxya5g6dMO1a+U
         eZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795805813; x=1796410613;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F5Nr3iW4BqVQetm5Pe4Fx7V1QuIWu+0bYDS3Y41KKMg=;
        b=UI51sr5DUVoMrkeWjTfw2RVj5bzLQkgLfUNrJ3QerXe8Tjz+OYqppAPWRKOk5gWaUo
         3iU2U/38axMizTJH4sW7wB5bQUH7i/gwAZMVX7z1AT+KRZZ4WGQH0IAJGcOJX+gRrtgm
         V8cotXpCqOTlyQbEV+6CAF4MWByca9viEhB78ej01tHHF7ldpWAswmBHGmnfD834Jx4O
         XBwoV1bztHPlDrp5AdOPogBdBPRSoAIpNwhM+zYSP7qgYLi1FoTANarQjMrMH/IEDgXl
         daeZmJRombUdFtt71Ewz4l+mWsa+dDZQGvudG5J1wizRBETyc1kP7xniE7YpZ/kDUGvg
         WXGg==
X-Gm-Message-State: APuU4Z8FGUgOl97zHDFAnp8Na+tya/vqqQmlzA3NGKoM1e56ZKbF+DO3
	0iqE6j5PHQcj3JVaZvakdiuBq1ctTznT+jw8PHdEclQdzPvfz4KeIPEA
X-Gm-Gg: AZFdTZcI8vGugiFI9jQlw/7RmuAY7z+ztAZ15rcIWOAcshL2boMGFVFrjHn3e50RyUJ
	Z/lxE8YQjxBfloSZuBnKkwWEx63SswaABE46lx6a4ghRmbgW8RyNzJEWpgNme1NQYuBf8DTy8Xv
	zVDaQx7DqmsKfqY6EGyFQcfTWS680z49hEBuOK5f5M/FycUyUSX+MQEDfM9OCKrScy+ADVxLkVQ
	08zS2K+ZZWipgsP65BHrcsa8q5NLt5ZdNlGV55etwKv5vrFaNw9XL6ZCRXzjqS8bUYwJZ11BbvE
	zHWBs8cjrZFgSRyt8z7cec/vC7p+0Dig5pf73rmJ6US0ODP8+FHLyNMCj5x3lBzO8gTw6uaXoSi
	fJ67QlmvdRLk+zS7dbqlisjSxcj2WKdRRr1FlWqECC3VZU7sEy2Ax8shxjO0aUnclCJJwpad6k3
	NhmrDvQi/sR+cZDCyHnlximOM+CmCYKvXD3h/pwIh06VNQARN2j3RdNcCxIDsqo530SoTtVFrzt
	z/utUnVPGj0CvLon7D6qhfboHuFXRM74JQj70/GeYhltF8riGQ5f26NVhrg/kILblsh2svHtW11
	eJBt/vZRSff7B/kdOK0rsHA0hbmu0WNmGmQ=
X-Received: by 2002:a17:90b:39a3:b0:3a0:9c9d:eb18 with SMTP id 98e67ed59e1d1-3b41cb20e66mr27984760a91.54.1795805813227;
        Fri, 27 Nov 2026 10:56:53 -0800 (PST)
Received: from localhost ([2601:600:a482:7d70::5e59])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b53479b149sm5395556a91.6.2026.11.27.10.56.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 10:56:52 -0800 (PST)
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
Date: Fri, 27 Nov 2026 10:56:51 -0800
Message-Id: <DN6814XXB0ZC.MN5JW6XHOMHU@gmail.com>
Cc: <netdev@vger.kernel.org>, <mail@maciej.szmigiero.name>,
 <loic.poulain@oss.qualcomm.com>, <ryazanov.s.a@gmail.com>,
 <johannes@sipsolutions.net>, <andrew+netdev@lunn.ch>,
 <davem@davemloft.net>, <edumazet@kernel.org>, <kuba@kernel.org>,
 <pabeni@redhat.com>, <nihaal@cse.iitm.ac.in>, <m.chetan.kumar@intel.com>
Subject: Re: [PATCH net v2 1/3] net: wwan: iosm: reset the host PM state
 when the sleep handshake times out
From: "David Westen" <davidlwesten@gmail.com>
To: <netdev-bot+sashiko@kernel.org>, <davidlwesten@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261124172627.41847-2-davidlwesten@gmail.com>
 <179575732269.3135.16660281513861185989@kernel.org>
In-Reply-To: <179575732269.3135.16660281513861185989@kernel.org>

> [Severity: Medium]
> This is a pre-existing issue, but can an interrupted wait skip the new
> reset entirely?

Yes, and as you say, patch 2/3 fixes it by switching to
wait_for_completion_timeout().

> [Severity: Medium]
> Does restoring ACTIVE here let the next suspend consume a stale completio=
n
> count?

Yes, between this patch and 2/3, which adds reinit_completion() before
each wait. If there is a v3, I'll put the wait fix first so that the
series has no such gap.

> [Severity: Medium]
> Is a doorbell parked during SLEEP_WAIT_D3 ever replayed after this
> rollback?

Not until the next doorbell to the modem. The existing rollback when
sending ENTER_SLEEP fails, which this patch copies, has the same gap,
and either path needs the handshake to fail first. Replaying the update
on rollback would have to go through the task queue, as the store isn't
serialized with the tasklet. I'd rather do that as a separate change
than grow this fix.

> [Severity: Medium]
> This isn't a bug introduced by this patch, but the new comment says "we
> are still active" while the suspend still goes ahead. Is the false return
> from ipc_protocol_suspend() meant to abort the suspend?

The comment is about the driver's host PM state: the modem wasn't told
to sleep, so the driver must not behave as if it was. Whether a failed
handshake should abort system suspend is a separate question, and the
driver has never done that. Aborting would keep the whole system from
suspending whenever the modem stops answering, for example after it
has crashed, which seems worse than suspending without it. This patch
only gets the driver out of the state where every later suspend and
resume is refused.

Thanks,
David
