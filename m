Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795208174;
	b=EKh06VJYzdKUBWtoM/gefiGzeACmlcEz3OUyg4kRvGVU+0FsOwfkK/a1i1co+4vHUdKz
	 9QItwUlRP1sf647OU3k6Q4bhME7SKImeTh8TYJjLmRGivCIyan81BhAHjLHZnoF/FJ0G9
	 x7MFUS7xszv3Rd0Ft7jzwwlOnhB0czo/5wf8ESp9CPdW3EzJZkwiOAueJ19SI7vQxs4ss
	 3RkIW58+p0fsMag4IVI2MveKa1wGBYYJysZY06ludNd6YF/wb+e8DwTMzSOY0vDxd0Sxw
	 ecju6ai1TMwSfHcQwAnZYlBs3tJbItgU1sSrYN3ojV+6Mg6qAp/nhcpL+n9rCCrq2Yw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795208174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=nHm9hVHT8tsjIbOEfB0poGWscPr0Fu+olYBzenctJCQ=;
	b=5Y/FPXSkrlCmCg/pKnYxUYHdEpfxOHWo0KJ8r21gdgMlKNWKQzf6nUUqNeIydEXk8tHo
	 337F+gQKMrHCNb+Atd3rAtGWD+yeQwUGBSTQI24Ps5jR4a0t6Y2bBscfeVXD4lIU6cgzq
	 RQv80Ul89KSHU04YXZKok8L91iPCq/kpLs/1KRmKrc7tvcTdss8OGTUjNmLLU7Rkcsygu
	 JBWC1CF/E3bM+no3uFz3NBwMUEYGGeGjkIICHq1MHfCFgx7QwyhgJIfe3KFemYLDKqs+u
	 rvQBf1JkEFbRqrz0y6dNWGM5G/68EyHFSusezNT6r5aUD/0Bx+efiekXQdGwxbYPErA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fqnD+BCm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3CE606A6AE
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 20:56:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC3CE606A6AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fqnD+BCm
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67db1f6f50eso1565044d50.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 12:56:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795208172; cv=none;
        d=google.com; s=arc-20260327;
        b=TE1LbssFh8CF0aPg3HcVLvNpzl5qJ4UUFsREjVmscdlVsblCUDZQwdU48hzN+onZGq
         hrtbz4+HlkmbuJQFT0ZUsqPZeV4DckSouHKRyL4SNK1oLo4LvJ2kRGVFg5SQblVI7vGV
         qPykYrt+JsRt9xGT8ywn/ZcLDM8eDj0rnSqAzA7PRDRjeUItzASxAdMk44R2Su3IGnlH
         YDEYe74UpVOSfwHyij9/8jSQpqfT1WAkD/gWVXyZ7FJd6WxKgduqablYlQrjx55E2xXR
         om9RoHfBXGdGXZYsO7tVgwoIiB8C/WOxwW9LuHWqt5p/YhEn7CmkGa8TllYmmHVecZMd
         5nbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nHm9hVHT8tsjIbOEfB0poGWscPr0Fu+olYBzenctJCQ=;
        fh=Rf6dEdhysIkn4HTYMkv0BNKceoyhhPpAAjzBP/Lgog8=;
        b=m3kBFZ/bzQ20E7JFI6s9X7yn95O1OaHwXRQNNw4jnajqKyKbLXaQH4/BtTcFRJfJgC
         zpi+bUVysW9OmL4v/Gwqi+nVtB2sDE4X8o15JGBhdCqVN7YypmUA6qKRR125SbAb44QS
         CcbN7K10OcYGQi7H85FTcApcqv+s5gky48McInRey6MwUom2DQp5wwUHXiDVMtf89EZd
         evZ34GVmcYwt9tboB51fJagkq65Y8I7+VpMbI3ph0rqFWlDChY6E8ohmyW9QoHhDk3rJ
         tYa25XZ6yrR1gjF0Jk4DEEL5fIUY0Y0oBaD5Ub6KYp6D6i82QA3sEfqTX7oGNmShHKiB
         c63w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795208172; x=1795812972; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nHm9hVHT8tsjIbOEfB0poGWscPr0Fu+olYBzenctJCQ=;
        b=fqnD+BCmZMsSl6GiqWvGzvSz4CDUZNTSHvLmRkRE7ABZzqJO0KBxFvqwkYCxyzdmk+
         Iv7G6Pqj7onc/PUk2HxLn0H9/bpo/PZjyo4h7N4e/GWkh7QFngPaWCzlmRrfxtlMwBuZ
         GysFqWOmnkXYgJEpJkz1FI+lTMzgXMzoZOUJBHFtqeFG76N2UZTE66DIITKOzWu2vVYI
         rCjWmssCCTntC+x/KL+cDN6IW2IZmzj9S0NqNSQN9SMNeIh9Yrsv1LMOmzxnY/v3P9Mr
         pRlxbxuxmVufW+sS9ScnItwnmGagTvXWgpjuN4TVFrdZGBtUuvfLpY2OUKSphYnQkKnO
         PvHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795208172; x=1795812972;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nHm9hVHT8tsjIbOEfB0poGWscPr0Fu+olYBzenctJCQ=;
        b=Nx79Ij5MEir3WwsM2q42MK6ywcmMggM3C0oPKuJZ1/y6IV1mielaTEjppYkICSz0pt
         ssHNFyZghSeaqX6L2dPhFuMMWrXQ7R57tPH/PdOmVeSZc+XaOiaWssWun2ejq279sMif
         XLD8TiekUUpmA0uLnITyk9B+aXOtbzKXbMcSFyltsIiN/obsEZ0cSoGh5aRzQwkMNVoR
         zbHz4gbOLB4StG0ms+xRlQoKsk9zv0wMU6gDbwrbz459pRqXfb4ZygA4pqIiThOOXshM
         EIFYggXlisUAbyeW8mT+jr4oYVRP9au4LvRPdzCISTspd+76KsvPRnCnJidv8rLZluvE
         xceA==
X-Forwarded-Encrypted: i=1; AL+hErEBBb47StZCB0HngkfdBI4jPLBPGpqwy8cvcutX7g4Iogq0vehEjPjNdxaGV1bEdAnlans4QSw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MYN3M+l+otkZ7gCuRCjxEPRT21/QKBtNsu/yXZxWrsQ9OlG7b
	dZKyX6TFxniHqlct/hr8bF3vrQKa9M0IU0sL25MUcJWnay2eUgeEVyV2fsJsLNJBRFXcZTvlaUC
	D0P5iBafqgdyF6wtYQ5QnO1GUxN6L/iA=
X-Gm-Gg: AZFdTZcXbJ07hSMf6SDfyL45EA/0hE4ZPELoB76eerojpEUCZwqHAKK58ywEmd0VnFs
	+Fq03XynFkcnWXMcAVAJFk9GHxf2sXhlOSJO4kKABGrSHezQ8BmiV2+gPPmAdVPnkaMhnqxrGtA
	ozpu2RfXdWkMij64Fs9kLqE+q+AajiJJEwNLEPKhkiK/E7SKOe+K7+qwcgLIoon6oCmXOz/QcRG
	1BhK65LephzWHwkHfdheE5Y3S5CjEjIrFCErvOHy3aaDrV0gRYgvFDo+4ZcAT6vXC2Qp3aM5PGT
	sVMFXAP3DsUd9/P4TJP/SdGw7W+a93QzMIB90kXPYlC+kYfKIZTgdK4PCdU5gaOEBL9Nvg1ggyd
	a4R2xDRYN5AC8QxDnXmyB5q3KCEk8Ha82s4rSB5+RmNg7WNUX7AC3g4qixrCY9KcU5epi8mkl
X-Received: by 2002:a05:690e:400c:b0:67d:e6f2:bd03 with SMTP id
 956f58d0204a3-67df445191emr2111759d50.68.1795208171883; Fri, 20 Nov 2026
 12:56:11 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <bc42ae96-dc7e-4b6e-b9cc-64cde5dc51ce@yahoo.com> <729eeb67-d812-4f1d-81e2-4f4437181744@yahoo.com>
In-Reply-To: <729eeb67-d812-4f1d-81e2-4f4437181744@yahoo.com>
From: Gustavo Foletto Mora <gusfmora@gmail.com>
Date: Fri, 20 Nov 2026 17:56:00 -0300
X-Gm-Features: AclHuK-JVUrfgyiwI_LligE5LfOLOoWTobSTFnbiJh9-3VT0Gl2CvuUWo8aq-Us
Message-ID: <CAK+kzgzzcGPWVoXQ=VKFeojk+-=9S_mWBhMdcN44M9QXkihn-g@mail.gmail.com>
Subject: Re: [PATCH net-next v12 13/13] net: dsa: realtek: rtl8365mb: add
 support for RTL8367S-VB
To: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org, 
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	alvin.sipraga@analog.com, kuncy7@gmail.com, fabianotassotti@gmail.com, 
	gabonpivovich@gmail.com, contact@c127.dev, o.rempel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"

Hi Mieczyslaw, Oleksij,

On a TP-Link EX511 v2 (RTL8367S-VB, family D), with v12 on top of the
rtl8365mb DCB series, an untagged frame that the switch forwards to a
port where its VLAN is egress-tagged leaves with PCP 1. With v12's
family D code before the rebase (v12-pre3 in OpenWrt PR #19644),
without the DCB series, it leaves with PCP 0.

Test: a VLAN-aware bridge with lan2 and lan3 as untagged members of
VLAN 100 (PVID 100), then lan3 made a tagged member ("bridge vlan add
dev lan3 vid 100 pvid"). 100 frames per case sent into lan2 and counted
by PCP behind lan3, over loopback cables:

- untagged: all leave tagged with PCP 1 (without the DCB series: PCP 0)
- tagged with PCP 1 or 5: the PCP is kept
- lan3 untagged again: all leave untagged

CONFIG_DCB is not set, so only the baseline from rtl8365mb_setup()
runs. The untagged PCP register (0x0851-0x0852) reads 0 in both cases,
while the port priority (0x0877-0x0878) goes from 0 to 1 with the
series (IEEE8021Q_TT_BE, set by rtl83xx_qos_init_port()). So on this
chip the PCP added to an untagged frame seems to follow the frame's
internal priority (here the port priority), not 0x0851, and untagged
traffic leaves a trunk as Background (PCP 1) instead of Best Effort. I
could not change the port priority to confirm it (no CONFIG_DCB).

The Realtek API in the board's stock firmware points the same way: for
family C the PVID is set together with a priority, written at 0x0851;
for family D, dal_rtl8367d_vlan_portPvid_set() writes only the VID and
rejects any priority other than 0, and dal_rtl8367d_qos_init() sets
the port priority to 0.

The rest of our tests give the same results on v12 as on v12-pre3.
Tested on OpenWrt's 6.18.44 with both series backported (PR #19644).

Thanks,
Gustavo
