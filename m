Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903941;
	b=bk60V27kLyczjWUUGyvLMjLE4qzsiWkcX6mGvfPEVWVmqNdea505RPaeZjVk+92wclN7
	 SPJ6pewZZss4w6Xd0LgNs9zwMl/+m1MkUMtQjeW1c/v2WwIv1AHpAptI/seq9HxNkJQ9W
	 OF/AxcK1yc3BhAx8trxuC6c/Mz2f8lBlen6jDqwozjkUx3Y3kM3YNg2m94uuQvl7TUlpQ
	 vC/0OpCmQ3m+7r3HnGJd90szpSgHW54y8jTtERQhrR76YHopzsCujcPJ0hwvmVUUXXTN/
	 vvwZ6a+fyzeRsoj6YdN2WKnIfdsc1bUhsbqgH7N136+6whj02lk6mP0RBDMO20bzASw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=UGlayfD5Z/El6cdpm6ie0HDMH84kD107OWGXScU9uXE=;
	b=B4lU0jgLWsHmZ0B9nG5ir0Alfwgu8dPuCCRfEN9UUIdeGXfIi6Hd4IkNiK/Wsj4bqT6K
	 rbGlG+Di+Crpbg0e4Koc8I3hOL2c+lhkd/fp3DAeiJ+tt9f7+tSwfzdeUMYVqYhKsDalM
	 EDgj4Fw70FscaSk9UGHwReqApA8Xzc5+IV7qikqYVaIHG3Ce15qJZ6L91nucojvmr9PMg
	 ehsP9QOrIIpXr19X9JiF7oKAi0AhJZgR3GGn3OnIlYeutSydqcDUKF2iI7FKjkuMkrE0s
	 b3GduxCXJ5vy2NrSLUS3kJhJfLxeHYytrWCFd9sg8tmUxfrUn3e8AsvqU9Kkkq5BsBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="QoCmkI1/";
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA6C606A330
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:25:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDA6C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QoCmkI1/
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48dee593f18so4521678f8f.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 00:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794903939; x=1795508739; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UGlayfD5Z/El6cdpm6ie0HDMH84kD107OWGXScU9uXE=;
        b=QoCmkI1/XbLLMuB5pWQjj6w7lhYbbqiM96jQW+pj9RZ000aRRl9S7H2qSmbtORMNOo
         ePt1TXAWzVIR/TrMeI58Zu3n81XgIdPHavzyhyljr/3uEJYZwsW6Sg14gd450d308jE0
         RrvE2vSlthe4MhW9V05IsJzW8g0CM3u+nfQ1hkfntpYQW6a4z4zmXmxD0w/TiuzDbd7U
         U8xZ2FexNWbZhSQ3d3pA0tlH/f0MOfn4O69UeuIyRM8vQ/YXTKpGPDyGoQczoxEfoynP
         BDcwZppUf46pJGXZ+RH52kug0iZSl25eld2NGIqCa+XVs4XFwFr0CZI1pzljVyhbNHw0
         NmQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903939; x=1795508739;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UGlayfD5Z/El6cdpm6ie0HDMH84kD107OWGXScU9uXE=;
        b=O7oM1EzbLQTuiZIT8tveSbjhQQdABd5hiWuJTL5nC1Yl2yoaSZO+uc2kS81+mWxOm8
         jPIPvb/pZv1OIVpGSHvykhnDmPr8y4RGlegENEmHsyNpuIA0o13uoWmLWBB8T6yyPtep
         olSUSYo9StYKLPybOtamgsc58jPtwdOqWR2D8NAF7ZRO1WBbG4Tbx5rw99OWaqjbg48i
         q+RA2Mh611ruYNOUGlgOlnTok+G8dZWxLGkU6snwBAnAVOISCwDd6jYAmlRaNBHFvVDO
         R8Zqcd96s4vxxDryZjQfI9z0eE/ot58ET+tw3s4MeiQJChKF0L7/+kuYExsCJiklIFmM
         QfJA==
X-Forwarded-Encrypted: i=1; AL+hErEEMjmvZJ8quYb+RdQa0kZcPYEV8+o88OD9lOE8roSS15vi5aWJIA4PgEqYDqepwmRoJ6FbZYQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/b29siWocRJ22+bHoIiozCs6zp1+j5am8KLAh/i3BlI3/CFPf
	Cj+1qTMG6Mdv0a/c4zo+UZieP+Yg7b5uADR76X1DgttHeKupXPceRfIvrnUqONNMDIDg
X-Gm-Gg: AZFdTZcTfl1fazYPcOjqeFPdi6bk+SN+C6BbQr9R3BzG3McrRYtw1vNKpj7taLiXVfx
	Wawp/ul6lDa4XxtXzNd0yi6eXmQYG9KnTs3YXCC2BV9N/1XHuO96a1HSFhRZoU6qOSij84S5iI9
	HuTO/+ysEZUKeTV4FgGMAdGLj6qhTKLS/ivEv+fl4C/ocJ5Szwl/4icbqcNYHf2yOxpXBssNTZu
	8eKN0JXP7ksyfGXooiBYRkrFwQ1iyJl59+IJcksGHtaLBbF/e3MtodFoKaC6Nm9riSspeGvUDW1
	4ICRNhSjhg23bj0NLseE3QONKzIWKDLxPeNKcEJhkkTeI+9qqwN8fANRQbsB76ery8dsCww5GfT
	iGmOCTbEbB6uzBClOltKVybjf4O/7ovwO9VTSBB9StaLKq9W2mZ22tbKnjt/xqPvEqkmnBGqA+e
	fKzUAEGoZ324QKvExXtszZEZuCMoXaxBHZXmp9e2Z9SFA1huVLlf8yL8yhoEqc3w+CcWTAEgttA
	Wiqb6JlMnXSQYzrMtKoqKNGYu/CrzvPS/k4fRVJ6/AQ6xKiEeJ/zMHAvBjat+eVyfo1aZ/kwIcu
	2D1Rjf64ZOx7I9+XYbJJwNWZ19D8JHoeSiNwyp/w31Q25zJokS1svCOqcQw6Y1rf+Sy2hOgid3r
	HmcvldQDc1D9se4GPEy6PAW+51ggLLB9kQAc0F0KjUtbcggvsgdBdquzOiVvmiXemI/WAJSeTGe
	KGOQ==
X-Received: by 2002:a05:6000:2084:b0:492:46e:d4ce with SMTP id ffacd0b85a97d-49c6fd932c8mr25238543f8f.13.1794903938925;
        Tue, 17 Nov 2026 00:25:38 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2? (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de. [2003:cf:572c:2800:de4c:6789:33ce:97c2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5ff2be55sm26907832f8f.28.2026.11.17.00.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:25:38 -0800 (PST)
Message-ID: <a9124bf1c858cef3e8ac06b1b2396dcb0e19e2a5.camel@amutable.com>
Subject: Re: [PATCH RFC v3 02/44] nvmet: check that the file backend
 supports ->{read,write}_iter
From: Alexander Mikhalitsyn <alex@amutable.com>
To: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org
Cc: Jann Horn <jannh@google.com>, Chris Mason <mason@kernel.org>, Josef
 Bacik	 <josef@toxicpanda.com>, Christoph Hellwig <hch@lst.de>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, 	driver-core@lists.linux.dev,
 linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, 	fuse-devel@lists.linux.dev,
 linux-efi@vger.kernel.org, 	xen-devel@lists.xenproject.org,
 ocfs2-devel@lists.linux.dev, 	linux-s390@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, 	linux-usb@vger.kernel.org, Amir Goldstein
 <amir73il@gmail.com>, 	linux-erofs@lists.ozlabs.org,
 linux-kselftest@vger.kernel.org, Chris Down	 <chris@chrisdown.name>
Date: Tue, 17 Nov 2026 09:25:36 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-2-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-2-8cbbea1cf34f@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, 2026-11-16 at 12:04 +0100, Christian Brauner wrote:
> The file backend calls ->read_iter() and ->write_iter() of the
> backing
> file directly but never checks that they exist. Everything that isn't
> a
> block device ends up in the file backend. So a namespace pointing to
> a
> file without them calls a NULL pointer on its first I/O. Only
> buffered_io=3D1 gets that far as the O_DIRECT open fails for such
> files.
>=20
> Refuse them when the namespace is enabled the same way zloop does
> since
> commit 0c10f8a1a7ae ("zloop: check that the zone backing file support
> ->{read,write}_iter").
>=20
> Fixes: d5eff33ee6f8 ("nvmet: add simple file backed ns support")
> Reviewed-by: Jan Kara <jack@suse.cz>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Chris Down <chris@chrisdown.name>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0drivers/nvme/target/io-cmd-file.c | 5 +++++
> =C2=A01 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/nvme/target/io-cmd-file.c
> b/drivers/nvme/target/io-cmd-file.c
> index 695963dd932ee..dfa8aa46188c8 100644
> --- a/drivers/nvme/target/io-cmd-file.c
> +++ b/drivers/nvme/target/io-cmd-file.c
> @@ -47,6 +47,11 @@ int nvmet_file_ns_enable(struct nvmet_ns *ns)
> =C2=A0		return ret;
> =C2=A0	}
> =C2=A0
> +	if (!ns->file->f_op->read_iter || !ns->file->f_op-
> >write_iter) {
> +		ret =3D -EINVAL;
> +		goto err;
> +	}
> +
> =C2=A0	nvmet_file_ns_revalidate(ns);
> =C2=A0
> =C2=A0	/*
