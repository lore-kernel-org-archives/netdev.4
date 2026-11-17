Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794952923;
	b=qkspPXfZCPqqmay9zWJFIKTZ+vBld4IONbBt5eu74DkWsHKPTjvVWZSYlwCJJ7gUCzxD
	 dRWOuO+GLFRzMKWXDDi+2qnT1XDaEpmBl56W8yEm1/Or20FpIHExgQpm+kZ7nGOxDsjpY
	 TOWBrf/4VMVp6YdQ9Xq+KD0dKZOibGuYREMHTPeAl0Gy1vGzyOAUW8yO+g5LVaNb+2mTH
	 EdXnW4qnSNAdsSq++qwi9qjPMehUL3CDwCZEICzpsHUk1dvoIjUWT2GY14Be6Jmt0aGjV
	 GEteqkv6B4SkX5BZZCM2mpOyXy9i2KLArof9RTt36FZE09LBp9aqNYLmFkidp3LpHjw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794952923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=jznk4QoQ/3IyGgwafbIsHJ9hErbDFxtImZL9oVI2PoY=;
	b=SEuwfkrJ1vbnWYT6CEfpp7kYuk0MetoCJUBvnyyrCSAkv/ALEiBA2jZVtkIYo7E77kma
	 1vrd30a3Drs6tqH4mJutJK6vF+iZnCR9oZED5Rvr/DjjL8CSJHrdPbqtPNVp9E8tlx4Gw
	 kqByg0QYjEU9pZzGHfOg1y/mHf+r9n+oX81MIjYPy/5e7aW0SN6hhcR0rCZ9ju5JQL3JO
	 5ZwccyLqmZj7KjhNomkSWcV85YcQ1SzFVtBF8Nz6kps122nAbmxOwvM+vTRkqe/iGV9/E
	 JdGDSmDdPVkmeTs8WmqzjWSiDs8hgmVOkVeGlVfsobPwNmydu8d3Quh8SOCqCMKhaCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="LDI/PRGa";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8578A606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 22:02:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8578A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LDI/PRGa
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e3b22e971so117041f8f.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 14:02:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794952921; cv=none;
        d=google.com; s=arc-20260327;
        b=n9Gw6Tb5ysLTARNTfhCjP6BeGCafa0egFsxeHd+EaIkH7xEPQ6UmD+c15SHqOHz31N
         4o+sjZUaBqZzr2RMZ2N8B1BMFgA7TwdONnmKe+z9xasNiRLpBa8hNhI90RlDGq9DYMBL
         Bpxg3NaI76E/1fNTyZO7Filye2GiuIVFiYPpxnQGBWzUBQH4EDfXVeQ9swv+OW/Kn6Cv
         6NNua0sjk0GjP5hvMPjdqtklUyrerHWrUAn93Pl2N4Xluo3br4K2hAwCN3z+nokA8KQz
         hOZ+qY2OBCMfUWawgxVVh2Gw7sOPaY7oKUDr4g7ZjJSVDo2ZaAVJNVlzZ5llwdAAQRq+
         0t7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jznk4QoQ/3IyGgwafbIsHJ9hErbDFxtImZL9oVI2PoY=;
        fh=sgMlnpPIkoatpKB1xJDHQICPZqesERPploa6LoXqXLk=;
        b=St403yGFwjS5wSDXOYuJCB3rySGR/g3j17X74a6sfhU2Ka1d5Xvnws3zzh3omJjKOY
         tJLy1gMBzjBP3aVAzlY0T7hOPM3saFXJhmYjYxOFmOOwl921T15Fsmr3Q61gnb2aScKc
         98kQY2i4pi4XRh+BOsqAKXfP9eLKfKP5P7XLFu8B+5FpE/KDStKofynntyC5W5XWe15G
         yg/zzzcpReAuNM02SHw5ODiVTYAzEcstSeNjz/0IXG/55N6wvm9apXwvjA4JI8fPeLrM
         ymZVvt0hdNqW+X6b6/4nWp7jE66qbsKnGZA5is564VPM7EOwzQlikDlo4+q0B2DCTvYz
         FMTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794952921; x=1795557721; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jznk4QoQ/3IyGgwafbIsHJ9hErbDFxtImZL9oVI2PoY=;
        b=LDI/PRGazjHL1/8S/qZsPvjTV+lu4v+6lIGKD0fOjTkTlFV/OG4sqmVl7LaWZ9xQkC
         SzcTcMCAPmHSy1E0JLdNrktf/eGz/xi2VdGMUHiJF8PiQ7hvc7RfZNDBjRgNh34eZ6lx
         50ZQjYYbGw5Q3IXpe2UVUuzH6lS15IQpvmgmDqlTIUgrMM8V7pP4Eiwg+uHyF/pz23Yi
         FqEl0m6k7IijjE2PONmTSsHeneTl9ltygcB4m8RPoA6w05CGhqJ3NPqrbJG7+N/Kf5aa
         pHZcaTsM/SQBtwmxfV8khJ+OibVAk3A73X31alJmPgHg12kgqPud8n5eFOYwRMXVSD9D
         /8sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794952921; x=1795557721;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jznk4QoQ/3IyGgwafbIsHJ9hErbDFxtImZL9oVI2PoY=;
        b=0HM+o7PAtjWfTzRShHY8XgDae7dbSbB1OPV8R5I6ZK6AZ1M0DbLCR/5IkQwdDMGJFK
         yMuWNkZm//QXWNOeYjeCmSEivyxX2nJOgxL5NXD5TDkAuA1Jqz/SzyvJuiF0SlAPdNb2
         VfJDHWrp0oZnfGr4JomqsW9EBVXXgt1L0a8jUSsczBufFXpJ7Zn6RQmfu0wwMq+py6UL
         haCz4TMeZLIlKjLRw+MnAcrXyUJCKXcSXBqbCSaHseUY6P4sSsbUPCMWMs1OuHggq/l8
         inlEJZzVQgpbeYOTITCgYIs0DcLRRFlbHs3uJqiB+Kg6cWYNuGw9MSUja4REutquXpfE
         QYVA==
X-Gm-Message-State: APuU4Z+jXHxXY6k63RWXPUCY/uyOWhEt+JCMw7XDIPWM3SiMDDi70XyM
	mdLus0NFAs6XFXDsjhu5dwE3uyWQbejnU7uAQxNPGTN2PZbcNb84GtWTkREbweBPjt6ODAhINr9
	d1kIbrzCDpnuUEPHxm5+LiTm/VetfP3HRxw==
X-Gm-Gg: AZFdTZdAbr4PIklmJEWvZMU96oPF/PPFsfsI2uKsud0U3kF+zd1RzaXd+osn1+SDcO3
	r8UUMjvYoTGx7lbiRTjsjPUmUciW7SzBVmy+E3qjZ66Ro9XmcSPGEMRkNSIkQoILpDHidV5N3A7
	hqW8z4tadxGK9yvCbTNEl2BAATdV2jYD4wRI3ZbuLT3ZbUKKpnDFP4DXx+LQkaQjjgDTNsyWOk9
	mw3X6UNpVSKel3Yy09tdPUkI/qczWLo1MqmMA/uzskjfP70q7OEe2vkRigoSNCvnA3nszrJVAbm
	/ASrOGPhVz1+710o2pF4uLr2xKCdVcMlyS3FmY4UXiHPkE6iVwMtgq2yZj1+aLnpE3/k9tVy4/9
	VLBhsVfTg7SYkmWRGK4vDIM3cer7xJkhOnux3TrtTzldX7VELhhsytLBPc34i4CizA9rUDcbm6K
	0S7Qm0bJlJwBgcDqDujhd4qW0uXixu/N6FealrdCJFO4fpFgyQr4GKpQ==
X-Received: by 2002:a05:6000:4556:b0:48e:4e3e:45fb with SMTP id
 ffacd0b85a97d-4a63a2d738bmr1073246f8f.22.1794952921508; Tue, 17 Nov 2026
 14:02:01 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179460250360.8819.2203630667210523871.stgit@ahduyck-xeon-server.home.arpa>
 <179495006109.3136.9222422977894063290@kernel.org>
In-Reply-To: <179495006109.3136.9222422977894063290@kernel.org>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Tue, 17 Nov 2026 14:01:24 -0800
X-Gm-Features: Aa3M54oalq48J65Z-UZg61aSu2Y15Q9LZeVokbImnl242edWHyn-lHSVPNKUXhU
Message-ID: <CAKgT0UfS=Uce2X-CC=sHifFr5aobbxnAk4pgdr+budvQR7abuw@mail.gmail.com>
Subject: Re: [net PATCH 3/6] fbnic: Cover all of the HW stats with the stats lock
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, horms@kernel.org, kernel-team@meta.com, kuba@kernel.org, 
	pabeni@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 1:14=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The commit message and Fixes: tag describe a race that cannot
>   happen at this commit.
>
> --
>
> fbnic: Cover all of the HW stats with the stats lock
>
> This patch puts the fbnic MAC stats under hw_stats.lock. The lock is now
> taken in the ethtool pause, eth-mac, eth-ctrl and rmon getters and in
> fbnic_reset_hw_stats(), and the ASSERT_RTNL() is gone. It also drops
> rtnl_lock() from the PCIe stats debugfs read.
>
> > That is no
> > longer the case. ethtool only takes RTNL on the Netlink path for the
> > operations a driver lists in op_needs_rtnl, and fbnic lists only the
> > pause getter among the stats ones, so the eth-mac, eth-ctrl and rmon
> > getters update the MAC stats with only the netdev instance lock held,
> > racing each other and the reset.
>
> [ ... ]
>
> > Fixes: 45079e00133e ("net: ethtool: optionally skip rtnl_lock on Netlin=
k path for GET ops")
>
> [Severity: Medium]
> Can the race described here actually happen at this commit?
>
> fbnic is ops-locked. fbnic_netdev_alloc() sets queue_mgmt_ops
> unconditionally:
>
>     netdev->queue_mgmt_ops =3D &fbnic_queue_mgmt_ops;
>
> That makes netdev_need_ops_lock() true, so netdev_lock_ops() really takes
> netdev->lock for this device.
>
> ethnl_default_doit() takes that lock around prepare_data() whether or not
> RTNL is needed:
>
>     if (need_rtnl)
>         rtnl_lock();
>     netdev_lock_ops(req_info->dev);
>     }
>     ret =3D ops->prepare_data(req_info, reply_data, info);
>
> The dump path does the same, and the notify path asserts the same lock.
> The only core callers of the fbnic get_eth_mac_stats, get_eth_ctrl_stats,
> get_rmon_stats and get_pause_stats callbacks are stats_prepare_data() and
> pause_prepare_data(). So the getters are already serialized against each
> other by the instance lock.
>
> fbnic_reset_hw_stats() has two callers. fbnic_init_hw_stats() runs from
> fbnic_probe() before the netdev is allocated or registered, so no ethtool
> request can reach the device yet. __fbnic_pm_attach() holds the same
> instance lock around the reset:
>
>     rtnl_lock();
>     netdev_lock(netdev);
>
>     fbnic_reset_hw_stats(fbd);
>
> Nothing else touches fbd->hw_stats.mac or calls the fbd->mac->get_*_stats
> callbacks.
>
> After 45079e00133e, the old comment and ASSERT_RTNL() in
> fbnic_reset_hw_stats() were out of date. But netdev->lock still seems to
> serialize every path that touches the MAC stats.
>
> The locking change itself looks fine as a consistency cleanup. Later in
> this series the reset moves into __fbnic_pm_resume() and runs under
> hw_stats.lock only, without netdev_lock. That later change is what makes
> the lock added here necessary.

This is the key piece here. The locking change is fine, however it
seems to be hung up on the commit message below.

> Could the commit message say that the instance lock already serializes
> these paths, and that this patch makes hw_stats.lock the single
> protection to prepare for the later reset move? Could the Fixes: tag
> also be dropped, or could the message name a path that actually reaches
> the race? As written, the tag may lead to this being backported to
> stable as a fix for a race that does not exist there.

Admittedly the MAC stats were not really the focus of the change. It
was more about the PCIe stats as we were stuck under the RTNL with it
and it didn't make sense to lock PCIe stats under a networking lock.

The whole point of the patch set was two fold. First was to
consolidate everything under one lock as we were dealing with RTNL,
netdev instance lock, and HW stats lock. Rather than have 3 locks we
could place it all under 1 and that is a significant cleanup and
enables the initialization/reset fixes as the AI agent correctly
pointed out.
