Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794876103;
	b=xv29XW0Z3F9/XTWzSmdxinCSD4k50b5RGMmrYuC2zLtAWFjUBKGaCuLw/dRfrHxqfcmI
	 wBTQhcJ9J+bOa5BIciZHtpd3FUDzKFo3FKSEttrhvSYzu6tO+kKlDs6WBck0IQ9VKSebE
	 VtSfj60/Dop7+hcTjs4hSMfj8VlVvyjBmHE/1StqMneItbjcTr2w+MFeX41DDZUsDcDqQ
	 XgpI4I3MuxHlP4oSCpODM/Z/LPnK0F//UIVd/BeqOpT+f09glC2PV9kPIsC7AWQU78kUQ
	 zkbgSIw7ImAmKZXNuKXI0toXl/a0w9VsHQOLyHMzmHDLGQ+QngsUwBqhDwywhwCKWBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794876103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JJxaAqU/N4mLE/X/C5f40TDVe8Y+8SNJEnAV6SKgDMo=;
	b=j0uxUSZMr3LhHgYdBpEm0SJgcrvKBUcIwgXs2xDd+P1sgSw3pZ9ez8Ng2Qn38PCsPJJ7
	 WzwM4G0rNoagXf666E2kmhbN4WvVGoMLjplVD3vQ0Y7MnQeUekuf/IdTNgsdd06Fg9ZrC
	 lU1a13DQoUUdUsSM4+eeyEVrINPRV+0RldgoVlryEjCDPADVSz8/zXhTyYBAlBLSroEzG
	 jEScN7ztWolbN5hORP8C9Gi0SSZPp/GTURZFAm5Stp4r/U6ktqYp61FeTvls27CZpTATj
	 P/V4uGDQiyJEb7q3TI80xn9lsBUX/hkwSfoz6JwIZlUnA2vB3k23spMHVbcDxCnrCaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=tv56jH1i;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2FD606A32A
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 00:41:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC2FD606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=tv56jH1i
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ee1b65fdbcso13169375ad.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 16:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1794876102; x=1795480902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JJxaAqU/N4mLE/X/C5f40TDVe8Y+8SNJEnAV6SKgDMo=;
        b=tv56jH1iv1IBTN63TvObbpX1zCNmAWOojKFikkh4lz/ckuHRpNc3A8s4Wryq2PWq0i
         LtA94VGruH7jzQKfcsrqeWhdsJVHAnXwTOv7zpqnCOG831yI2rV/SpdgWC5AFDzybxJU
         muzGdYZLf/fK9sbG68xDH224hPDrCNrvTCLZEjWiw1ndULtPpBEjZ62iT1BQY4qXtNcL
         GvlOnWa0MaMEwbdK1xo290mqxB7muv9v2JMjTnNcbsG67fbqbBurN3zeLK1I+uwrFtQw
         W10qGCYWFVRN5CBSXbZXT4ls0DX57Lf3fHPNg9PJUbvcF11FjOsBLJ86YpHn4un0Yk4k
         nLjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794876102; x=1795480902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JJxaAqU/N4mLE/X/C5f40TDVe8Y+8SNJEnAV6SKgDMo=;
        b=mWxLq+Xb2FZlyQ478cviSMIkH2BInF+tHRS7VND/FuNaEyyD/Etk16FD4m9DhmTHmx
         +FiC3M1hZRMevNepwrObEpUBkw+AZptoKgVkpi9exfuCgyqLKfLOd7TvIqOwnHHKl51h
         L3Z+lfa4eitLyFIoXEFVtf8l72NYk7L/21JVNOyB2k251b9thSJ98aqCRB2N+5Pc31dJ
         Uf2J7QseVL39CAD3nY5p8zV3O8jz7FlQiJ+35vJ2MqM63xD9ZCf04ZJmi9RLOGI/RS6Q
         EjK3fjQz7K7ySa/XwFdTA5cYq1PYDGHIwTZOpwfc+9IAwtvCi1mnIVN5uKC5Y+lvkrR1
         8mxg==
X-Forwarded-Encrypted: i=1; AL+hErHPLnLhE1y2obLSQnipxjFeLoLHBEynD5E4WHNHBkqPcc3JYnVwNZrOpYd45WIxbvLCaK6unJ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Y4Uo459Bqgrdum2oyaYQlakzNsk1f/cP/4B/Dz4VhquffeosU
	/3LEk3+j7vcxgv9OWtxEGAP23JcF47actHWzh9b0SBj2PT0CR97bdTdQgBPm7cWHRA==
X-Gm-Gg: AZFdTZesTi2iDiWeZlFLsmybNt9XZPVMzg+igB2Uv4PD2daPT0hV+0DOuWnkIpsQWwE
	u/9JCBHQ6JRLQXhetPEM7KdiamYZOKbxsxp9hhXCIgK35myOUjdg2WeekU8qGHW9++yVBiOq0iB
	5O9xdTCr0R8GXCvXtDqIeGI2WqKk1t9adQAfkIsH7AESSu0UtcIHymqHjlz7jRTIhCqtle3PvRE
	uZ+hNiPaIUy87xI1/9xWEVK7Iqz199uHu+Wv/gw6lkAEb4h7p6FmYlGK1g/rsxmv/WsAzmUsDs6
	82AZiLi0jHtWmkeoT8kPVyYGPrkLvbYgkvdzM39eEwDDBDSkO1V8yupRbHIt8TxwHULfiLJhv6h
	3v+fHOHqzRlbEXCzL9YvfEyaAqBecEDAvfSvwo6hq6p2M80nzvkSqPCfX+vI1pdIk0QCYpQlUfd
	/fuLeX1/Oik5b8dCLWWAgjxYNruco2gP/Lax5c/LLW+VBr6nqyt0oolWYxQ0IG01aZ90m6RDGaH
	xydhosQU2TUA3ibu6p4tUf6a2IqoTIk26KUOzghOI9oJopyafgCeoKegJL2EgbxRVX2s3WuFvSi
	2/RiLqPpGv0/H827pINJszKmGHcYHPkAJV1y//eorF5WceOXJcB0c+u2oUk9kt7Y3TetOd5Zgan
	E4oZlwbUNNGrYvujnCQ==
X-Received: by 2002:a17:902:f687:b0:2ed:3c11:67e with SMTP id d9443c01a7336-2ee0dad0688mr134037395ad.24.1794876101909;
        Mon, 16 Nov 2026 16:41:41 -0800 (PST)
Received: from cantal.lan ([58.136.72.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd76d8f08sm5594825ad.4.2026.11.16.16.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 16:41:41 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org,
	s-vadapalli@ti.com,
	rogerq@kernel.org,
	bigeasy@linutronix.de,
	martin.kaistra@linutronix.de,
	vadim.fedorenko@linux.dev,
	r-sharma3@ti.com,
	robertcnelson@gmail.com,
	nm@ti.com,
	vigneshr@ti.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next 3/3] net: ethernet: ti: am65-cpts: implement PTP_SYS_OFFSET_PRECISE
Date: Tue, 17 Nov 2026 07:41:33 +0700
Message-ID: <20261117004133.1594972-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <179446830443.2199510.10552580927894870264@kernel.org>
References: <fd826c118aec02c06bde92ff9c20f1958c214b3d.1794284248.git.jjc@jclark.com> <179446830443.2199510.10552580927894870264@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> [Severity: Medium]
> Is it safe for this driver to own the EXPBIT_SEL field of GTC_CFG0_PUSHEVT?
>
> The register belongs to the SoC-wide GTC, not to the CPTS.
> am65_cpts_ptp_getcrosststamp() rewrites it on every PTP_SYS_OFFSET_PRECISE
> request. The previous value is never saved or restored, on success or on
> error.
[ ... ]
> Suppose one of those consumers expects a different exported bit.

There is no other user in the tree currently. If in the future something
else in the kernel wants to use it, then the solution would be a small
driver to mediate this. If there is a user outside the kernel, I am not
sure what you would have me do about it.

> [Severity: Medium]
> Should val be checked here, to confirm that EXPBIT_SEL now reads back as
> AM65_CPTS_GTC_PUSH_BIT?

I agree this would be an improvement and I will do this in v2.

> [Severity: Medium]
> Should a failed syscon lookup be fatal here? A bad index just below only
> logs an error and leaves the feature disabled.

A ti,gtc-push phandle that doesn't resolve to a syscon is a broken
device tree, so failing the probe is right, and it lets -EPROBE_DEFER
through.

[ ... ]
> With CONFIG_MFD_SYSCON=n, the syscon stub returns ERR_PTR(-ENOTSUPP). Any
> DT with ti,gtc-push would then stop Ethernet from probing.

MFD_SYSCON cannot be off here: TI_K3_AM65_CPTS depends on ARCH_K3,
which selects TI_K3_SOCINFO, which selects MFD_SYSCON.

James
