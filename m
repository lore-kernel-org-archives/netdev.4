Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794829546;
	b=RTOAM4ryBjgLBMDbt2XMfJGMA/L0BtK0Ns2fRtH7vnRz4SUxHBbgPB67Jkd/eHuRRNNz
	 ATvUCfRwDqISMSKL5xGpBjkgpIO01va0BIICJI1ek07UP+3JxV+deGi2rm4lvGoOOl2O+
	 gl/cUIZtvsztJnclNhj9p2Isi7eMXZ+ZlUEnxJ4u++f2GG+70S9FDaUj+7gfRbXdVoDT4
	 BBlHv5YBkK6F21iy50pD5v8R2KwCDyq5TxzMs+uU5KqqhIkIZisvU+Bi8afRHTJtYZuOk
	 LUP+9TmlXxa3VxDCCdgejBDT6GPYKo9MHFi7yd9kC4w3oiOXucqeq+b5a74IhW3wr1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794829546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=YIMN9mWQsZ+dMlVxN3JD5I2xHAPa+pVvMLUHDOrDb8E=;
	b=o2zVCTrE+WvyASwHe3yF/irVr0564JryR39/MmVu6T1o7YdDV9/l4rLZZAU1JoAbNxt4
	 meT9/PamqAtywi5z1hyWBWecPVOUAjKg2XCdzJpu7dcrjov3jpT2/8WuP2DzKSuDqeoXn
	 jyLqkZslEHQYbv+WRFj7nkyoWbm25gUpqZNn0vgsw3xPFPgyJo+DucNREhPdKH94uMNfh
	 U0Psf7PZ5Xjhip6mTSdgPSVcxodgiBaSQnAvcvxmmMXpmybT7JQL+PzrPlZfNocnHU35r
	 y0o/Dfxn0XZRBmFrSJxYfc9FCMEzMCXdC2o7BELxKFDxToAOtcoN6oTnAaiRs7BNyKQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E1KnOifZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256B3606A323
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 11:45:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 256B3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E1KnOifZ
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5c17ef1e18cso1147046e87.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 03:45:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794829544; cv=none;
        d=google.com; s=arc-20260327;
        b=MzY5B1ZHZgJr5+yJ0uBSJr8bXTE3Z+fNwE7pLLlEBLukwKWJD5k0LZ7MWZxCfF/9Mh
         9M6VHgFOtNGIFrrBZ4f5Vl2O0iwSh+XfNG22TvnDviIiXwl0zhcv8WwpcvvMQSK9zwEb
         8gjKa3NfwFtGr3Yxrq6mP14aCYxDTaa0nz9rVoGWX5HIFJTQbYrWauJdAFtE80p0mS5I
         0cJnz94S3w+gnjAyXWhb6D+ke19Pn17AICOl6UsQO9IJelFeJ1Cq9Fd1TDpufPx1GjJX
         4fEqjJw1BhVtKHzduztIl1/QLEHCxrvgrokyKzarlVFaPXIS7sJzXuCotcmfRr+9OLSl
         EN8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YIMN9mWQsZ+dMlVxN3JD5I2xHAPa+pVvMLUHDOrDb8E=;
        fh=jMe+2OhXp/Io7+Q3hhm0KFnZvdmCa2paXTERHkJ7FRI=;
        b=iW9ttPJDRN1YvBiAtMQii4SBMSEaWtbwNL+lxqPtMFv6Is+ONaKxBlGtDF/Bng1rSS
         vqb+53xy1IzxRPUB946bkZ8ry6ywr0mhOmrq0Y2VPl7eLQtsLQ3aB0Ss/WxCDM4WrD2W
         1dWC3mHTj6RjOX/fgXbAtHk7Sp9dFCYMfUh8tZBbceHJz1vhWgzR5WIAu4YYa2k8ESgp
         4YOmg5TDXWiT/QPb3a2H5GX0apPd9aK357P4Zez9zhiUggKx2nbUDIkdC+J99gO29ESA
         KEhimdwE05Jt0mR6gTfgJ5NxXoosMtNXm1YoWGLWBMrQPimhP9PsvSZeotE0UOWAopon
         PSWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794829544; x=1795434344; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YIMN9mWQsZ+dMlVxN3JD5I2xHAPa+pVvMLUHDOrDb8E=;
        b=E1KnOifZMiGXdRdJR+6grYW1nIf8Tn7NOi+zV10z7X4F6Sn+s4Y8My67q3gxoUJFl4
         TOsomO7RCw6C2naChXGRHujNvpKF9QOnFMYepqDfygwq4YuzjrXSzJbz0wUvqG4XTg8S
         VbbLuaziN8H04DId/REnEQlJULfSHQWS0iDvIw1/o07UWW67Bz7ljc6/U1Y7vbEm7QQP
         YCAvVZ1TO9RbCw2M+J2u19zevUiRQo+JA08umQ6wfysVeQdyRo0No/dQemBqoxx8CVEB
         R/rjpGSaedqC9ozxi/aDFMTNeORbTKcXTFn24JmPnUG6Aa4oMiI6HU/1D/sUNrKPGJjf
         Pz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794829544; x=1795434344;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YIMN9mWQsZ+dMlVxN3JD5I2xHAPa+pVvMLUHDOrDb8E=;
        b=TGCXl8Py1ugPQ5XF78ZvoaZpbXmtCxAf+5k2fk3uWIpvVic7lisJkuYpboux6y2BuE
         Xcmijd+Dlj5ggZs9eEzXyZ65aSrWYeCLtSGrCl58e0RlhiP22tC1eP/8GcMmq15ALRtv
         l41cAIeRyKpbteVT06XGnivWdeLlVu/yily0uaEgXEJTuRz+ycXqzQ05IxeMTkD2a9JW
         JfSz5giTx+ykICn1EJsFaiCz2h5/Fe2H4K3uvLdQBI8T6nzN2AOTVM8yNkyl3HUWJEEl
         Wa2W2HM6WRwS8fZ2LmPfV6VS8RoNfQWsfTjq7ZlAKsL4nQBkSl4ODZV6wufEIP8rNUJm
         vsuA==
X-Gm-Message-State: APuU4Z/QxTd8cL9n12m7poleKY0VFgkzn5eQkLPkH0ZlMWPbNYJ7PwfH
	UISomUeHt4qoqIC2mBR2VAiAB0Y6f+5XGNWrH/ofpamqpHIfd/XW7J4dpQCZ/qSQPsed3cOgah+
	OzDevpn2Iy8h1yG5fTpNIIJukIOYkuSU=
X-Gm-Gg: AYBFou3giTCXK/PQbxR9x6t2LtsXX2nD/VuAlVmlIQAfoG3ROfi52B71R/yyiGAsitr
	CmoZhiMFQBOliS00czQcdYZhChGon5PEd+OFKYKcGxADWVizXgPAa2tHVSKkWJ2jQHjjJu278F/
	i7sIwYh0zBgrkOiK3mEG3hE3GBwCOn/WLwJwWb88t6DNr+VkWKBSwGgPa5Orjp5IJcZw+P6SlS2
	i78bB1YKRoDZnvrmoudKkuI0L1V16lM3n0sJMxQa1wboixyv48QCkg6EGrVC9pZ4D6NVO2t2wP1
	FkJ645v5rj8kx0N1Dk6TJueRdLDAltiZ1FEBM7ZAmx96+W4kFrNP1VagEeHq21uDnYmCq6B2EME
	k4GJX4sEaAbHGRi4uWLacLJTX2tcQ4U+zbsNB/DhZqvos51EQIpvpI5SASnNHa4P0sjo7ot8hmz
	8/Ky4bSQ5nwzPJvGEClhd982NokjVYcTi0XDg2QiSwhNlEEqo3vNY=
X-Received: by 2002:a05:6512:3e10:b0:5c0:91e:a95b with SMTP id
 2adb3069b0e04-5c17077e429mr3512633e87.14.1794829543963; Mon, 16 Nov 2026
 03:45:43 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116105159.1050557-1-maciej.fijalkowski@intel.com>
In-Reply-To: <20261116105159.1050557-1-maciej.fijalkowski@intel.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Mon, 16 Nov 2026 19:45:02 +0800
X-Gm-Features: AclHuK-u-QJKv7Pb7gr44erDNaNFmKXISEZpoomj8xEiu5PVBNPkvxBrukeloQo
Message-ID: <CAL+tcoA7ABAKAVoztBRqLQbVtU5tYTVF6LT9t-6bszrYUPFz-g@mail.gmail.com>
Subject: Re: [PATCH net-next] selftests: xsk: drop asm/barrier.h to fix the
 riscv build
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Cc: netdev@vger.kernel.org, magnus.karlsson@intel.com, stfomichev@gmail.com, 
	kuba@kernel.org, pabeni@redhat.com, tushar.vyavahare@intel.com, 
	bjorn@kernel.org, maxime.chevallier@bootlin.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 6:52=E2=80=AFPM Maciej Fijalkowski
<maciej.fijalkowski@intel.com> wrote:
>
> xsk.c includes <asm/barrier.h>, a leftover from libbpf's AF_XDP code;
> nothing in it uses a barrier, the ring helpers in xsk.h use C11
> atomics. On riscv, the tools asm/barrier.h includes <asm/fence.h> from
> tools/arch/riscv/include. selftests/bpf had that directory on the
> include path but selftests/net does not, so since the move both
> xskxceiver and xdp_hw_metadata fail to build on riscv:
>
>   asm/barrier.h:13:10: fatal error: asm/fence.h: No such file or director=
y
>
> Drop the redundant include.
>
> Fixes: e8f9d8237988 ("selftests: xsk: move the AF_XDP test suite to selft=
ests/net")
> Fixes: d01fb5c81130 ("selftests: net: move xdp_hw_metadata from selftests=
/bpf")
> Signed-off-by: Maciej Fijalkowski <maciej.fijalkowski@intel.com>

Reviewed-by: Jason Xing <kerneljasonxing@gmail.com>
