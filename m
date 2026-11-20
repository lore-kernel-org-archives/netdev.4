Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795192747;
	b=qaWTdbmqESUTmvBzL6pjuenYCmjRz2YEQdv1+IayCVE/a/hh8P7iSrXdC/daw7CEXlGj
	 ScuUEqTGg/odQaPQVfNnWx2kgAh5EATHPkLqnFLcP44/Y8p4woZWZw2T46q+hFOF/Fy+c
	 dnK1pJ4xXXn+NiYcSTuUkeO0oovBS1HPALeOO6eKvgIeWZ9oGmksVhoQ6le2L3s8AT3Vv
	 ISWQ/Jwo0acuNeaKjsRL+m4anA/d0r5ptgkw2jIr8bjeMVOoqOoaSF/D4LjoH+4bWjj4K
	 2tysY7YUQcIkI0pArxvSMmXDh/x6OXSiiK6bF+pgFrt7CQHKeF+OXP2SvYwWRa+n7hw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795192747;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=EhyQZs78XQFN3n2l0teC/H+aO7J33z3X0XEI3I1dEuk=;
	b=kzzOs/YSbaUb+NSZewWk3CrA1xUBIFSBCH5S/kFbPB8I6VxK8eimOK67/Pu0xE7zzQyY
	 ZtIT0xJbRM00Sa3GYsYkoSI6Y3iBb/UeL5g1xVCR3LEL0BMN4laigOHKWp/rgs0pqMdly
	 BHqSPwOLd1OfabKnPWwYa11CIFSdtNuci77AR5rtiG8OjoX1EIIozeAxQHpMMC8IQuT43
	 RLPuzfy3g/20PGyWg88u2wR8HP6sOJ6jZLMYVex4rtN5COqrcv6uawTXCgzXNtbM51DHK
	 B2KtKybdeEk235NFMnQtfSGywZ0Z6ReXAHZHLuHng58ph4rmoZ2+jXMZLkWMmlWXP8g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=exBV0BpG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEBB606A333
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 16:39:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABEBB606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=exBV0BpG
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6ba4ce91e21so6953a12.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 08:39:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795192745; cv=none;
        d=google.com; s=arc-20260327;
        b=Gj3S2Jtbm9+skpkcCSr19OQv3T3jD0vuIdHWegVBwJKveJNGJGT4xebKj+gOFw3YwG
         mPn1JICx/tU8vmy5NOLWDkTTLZhCV0gdlKYL69+m0onICh4UBtG1b1bTkowwAVpUwhaF
         /CvQdN0nIr4WEkRLTb6ACc4m7FajJoIjWxdwEvKrq/EwsssLy6S52Z4sOjWgv4eNDAb3
         beYYOl+kzmlgllYRiXsSgT0Kc2+W0jWIg/YeRlabSwl7+Nj44yq1RRJBUylYCCAe3jXw
         qb66NS5vjO1P8d2lGukJLm+fuUxubsoR/YCpB8KUKuFmKFsZchzrgGQBzWzp+1sZr57A
         5vbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EhyQZs78XQFN3n2l0teC/H+aO7J33z3X0XEI3I1dEuk=;
        fh=I7PylZpoII6z4CEhdXXm6vGHzwIhJG9Sh8/iBMdJBVQ=;
        b=I3FTXQ7Ktm2l3vTVFN40c4LrjeFotoBoRPrKPV0g/OoFXViKD27I0ta8DZMLyzVPg7
         QmyoOMMsuoISsbRTOb+6tK85nCJyopOLJnHJPP3DApd9Ui6gXlFyXwz1YfAySzEIqLqv
         VqRixmlvUbk2wtWRYWlQcBlMnaxisGMu6UFpV+yecHffWl65enr0s0dI/She62rogm1f
         zPBdVxI6El5MH6IuUe5q2+gEau5uytx5tPp6rh2RgTqoOSYCa6EDpKjH0lFI9ndCdj5K
         P7HFXyc2xEuEIQcwAipONfqdQeN9E8ATDobD8GFsoCiHHVMvNvETn3IL4d69pZIeV/Zf
         Y6Eg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795192745; x=1795797545; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EhyQZs78XQFN3n2l0teC/H+aO7J33z3X0XEI3I1dEuk=;
        b=exBV0BpGps5XdMiPxKLol86gpdtksfxwUBQOPNI/CX+Vjag7OL0AUTtUePEOEP8WrI
         RUlzfZV7tuY75+XXDgA2FE996IdeAwfOOQS71YLa3PVsYS5lYtvNykQXpLbu2IIk5Xo+
         a8hyM88U/z9KAR34tZG+Af7cXNA9wfKV2vvz43XNigXc3hnBJvtspPOn971ezY8WhRYk
         WGT7FhtNaw7YsBotMKoktHlPZY9bmmEaGf319WakY49a3oR3EgabQSfSpsLo6R3n4vGN
         xOyBFLseGL/E3NrU51a9p94L/ZXXx3Urm/HtJqUwhfNw4+eQb6KkyPFtmTNtcDHwyTsL
         BL7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795192745; x=1795797545;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EhyQZs78XQFN3n2l0teC/H+aO7J33z3X0XEI3I1dEuk=;
        b=UqBLukdZo3Lj+SN2kCRn51o9NRNa2/jEvpZnItSFTU/mL95KKxWGHSthkhOzYHiagj
         yE4EeST01nWUc/x0qlUe20Iqoi0GQojriOKxBXQX0ZmVCd2uv+Zk8NbgYaMlW8G9CnfB
         HONi313Cbn+rlCuyD2XZq6TUErByHvwN/bOz6f6Wpptuvr0H3biUOflNhN+Bh1JBvakj
         iYnlflo6zq3mToL7nvNPKxVOYIa0N/nbEyVlu1oEKhA20RMRs86muLMDINh6O6T6yUYK
         c373MosInHog75321QqcS4W1Oj/jxNNUcqLbUzvXuidii4mI6HsOhF+vAmy5hJmPS+kV
         EstQ==
X-Forwarded-Encrypted: i=1; AL+hErGAi1yJ6AyZS+IboeqyApePifnEOgZE1a0k6uYMHwyNy479134AGG14bKw2H0ooi6nuIVD4WEc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9aeRgpaz8/2t+Y+oX9hUI/+8v7HjEfamv111pXLEm0npJ4QPrk
	lsnz3Enpxbvz3B+Zu0adV3LQbfkHeg8v+x38iVptw8Y5eTzgkmWZ79uxFZ6t9YcJiWMc7qFHLwP
	ElCoqMXj1DyGkFQBmxAIknIPx+OZUpnFJWr4Vix+d
X-Gm-Gg: AZFdTZf9EGkYSELfcEsXMxX96PAtHmR+lT7spReVjbltETIYVQI1HeUzNFzHJvYpsvo
	vw3mLgv5UZIsWIZ9A4w4GdizCPAE43JoR/18Yt0CG0yg46FoAJzn2uEAofmPhzTIchg5bNFOGAO
	yWRjeBWWHNEpMlCIifzZbcFrHeA2mDzTZzMX/3Iy6Klpg2QCM2XKnM0OPkgfTLFU63GmSN0EVIQ
	f+CxjDrxgOKdGEd2M68/kfpxU5/cqsF1J7x7MxNRNfMSrrBPVkEcyaoAehkertPRrx1SMUzozBY
	NcAd6YCzCr9Ip+BVlo+SJUXxO7CWgjryyNuQjqQMUL7nyPT5WkZtX1+g2mchq+H4LCm0Eh+DaEN
	okG6eESTYQsvgk3CXaepXyeIXF6eazH8McCSbrw==
X-Received: by 2002:a05:6402:c4c6:10b0:6b5:77a4:e7c9 with SMTP id
 4fb4d7f45d1cf-6ba38153010mr103871a12.2.1795192744560; Fri, 20 Nov 2026
 08:39:04 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110183826.2927274-1-tariqt@nvidia.com> <b5305251-b758-45cf-a28d-406b04d8bccd@nvidia.com>
In-Reply-To: <b5305251-b758-45cf-a28d-406b04d8bccd@nvidia.com>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 20 Nov 2026 08:38:52 -0800
X-Gm-Features: Aa3M54qvoBN2Yfkw1kEqj7wTtv_eM2s0F8mqRYMDR_EgYh3FvB_9-0cl5hbrfvs
Message-ID: <CAHS8izMhSVabXgMmNbHHLm8cYqW_EVQbpXME2z_tUEJuN2BTnA@mail.gmail.com>
Subject: Re: [PATCH net-next V2 00/13] net/mlx5e: Add netdev support for data direct
To: Dragos Tatulea <dtatulea@nvidia.com>
Cc: Tariq Toukan <tariqt@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	Bobby Eshleman <bobbyeshleman@meta.com>, Carolina Jubran <cjubran@nvidia.com>, 
	Cosmin Ratiu <cratiu@nvidia.com>, Daniel Borkmann <daniel@iogearbox.net>, David Wei <dw@davidwei.uk>, 
	Erfan Sharafzadeh <erfansh@meta.com>, Gal Pressman <gal@nvidia.com>, 
	Jacob Keller <Jacob.e.keller@intel.com>, Kaifeng Wang <kaifengw@google.com>, 
	Leon Romanovsky <leon@kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	linux-rdma@vger.kernel.org, Mark Bloch <mbloch@nvidia.com>, 
	Matt Fleming <mfleming@cloudflare.com>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Simon Horman <horms@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Stanislav Fomichev <sdf.kernel@gmail.com>, William Tu <witu@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 6:39=E2=80=AFAM Dragos Tatulea <dtatulea@nvidia.com=
> wrote:
>
> Hi all,
>
> On 10.11.26 19:38, Tariq Toukan wrote:
> [...]
> >
> >  .../ethernet/mellanox/mlx5/core/data_direct.c |   9 +-
> >  drivers/net/ethernet/mellanox/mlx5/core/en.h  |  14 +
> >  .../ethernet/mellanox/mlx5/core/en/params.c   |  18 +-
> >  .../ethernet/mellanox/mlx5/core/en/params.h   |   2 +
> >  .../mellanox/mlx5/core/en/reporter_rx.c       |   1 +
> >  .../mellanox/mlx5/core/en/reporter_tx.c       |   1 +
> >  .../ethernet/mellanox/mlx5/core/en_common.c   |  38 ++-
> >  .../ethernet/mellanox/mlx5/core/en_ethtool.c  |  67 +++++
> >  .../net/ethernet/mellanox/mlx5/core/en_main.c | 253 +++++++++++++++++-
> >  .../net/ethernet/mellanox/mlx5/core/en_rx.c   |  33 +--
> >  .../net/ethernet/mellanox/mlx5/core/en_tx.c   |   4 +-
> >  .../net/ethernet/mellanox/mlx5/core/main.c    |   1 +
> >  include/linux/mlx5/driver.h                   |   1 +
> >  include/net/netdev_queues.h                   |   1 +
> >  include/net/netmem.h                          |  24 ++
> >  net/core/devmem.c                             |  85 ++++++
> >  net/core/devmem.h                             |   6 +
> >  net/core/netdev_queues.c                      |  51 ++++
> While working on V3 I realized that keeping the core part in
> this series is not the best approach. Initially it made sense
> because the change was small.
>
> I think I should re-spin it in a separate series with netdevsim
> based selftests for the new APIs. I would base it on Mina's devmem
> leased queues unregister [1].
>
> Any reason not to?
>

I honestly wanted to comment that you should base it on the leased
queues series from me but didn't want to be annoying, especially
because I made you wait for the previous series.

My series creates binding->bind_dev, and binding->map_dev, and core
will (should) handle things correctly across both devices. This seems
perfect for you, because you have a bind device and a separate map
device and their lifetime is different.


--=20
Thanks,
Mina
