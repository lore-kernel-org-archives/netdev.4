Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795196030;
	b=GQLJFzoQPi/0VEduvOjl//gR4R8Ys78tgDGtzbQVqq8fb435uRL2TwT4eD/SGbmkIqrW
	 KVd5Gb+GRWAC8j7xgXk5Z8W77+I+autucls4IccE8TClyh61izeDspPCRUsBAEW6GpTr7
	 K2err9oIx73ncsL+UQzdNIbFn0zE4tntX4dq/EfvsKchD7UMlt36QkotYlUunCZrhqsCp
	 RefmUcdRJyDXptmPqhLlywtPTCZcTZIERHHeM62uTDBNKgzzmWPTmnh2Oj6ozWzFuezWO
	 Onb5rK7EugV+tw5HoXqCJ/bI9HKNpEapb65xQpL34aQpRh+zo6wSRL3rSkfYIDLKctw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196030;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=t7VqJxD8mYb5fVhIvZtGeBcvOXArpyTEScr8Bn60wj8=;
	b=hLygkfjhTULDR1nxnJkgApQZLiFscoMR4pVGi2EuGgLplG9Us1RF3wzpDUJLG9632o57
	 MYqjUSy47ti/Wy/OHBn7NNbMRnoJLM55rRnLIp1sAR5zaBrZxOFCyBmiCr249YjjeF2Ct
	 PVdTvcakJkQ6zdIWGfLvCVZdPWBLar6mj0dB7PMKiC8XJSZKZCsGkyWabwwxoDUoUyKfO
	 LiI0Lh6+RqlyZRW3EYy3t1RztMR6hVlyP9z6qxMXq18cLxfUrjqG3Om6RxPB1dnbA5PjO
	 FbpV4BWq0g1363Oobe8QBnrIocnt7cDZXjsLlj9mfutok9ICuEp1ZpaRRHn6SOvHLsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BNCh40ll;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.174
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB026606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 17:33:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB026606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BNCh40ll
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5eab93a9862so306209e0c.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 09:33:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795196028; cv=none;
        d=google.com; s=arc-20260327;
        b=EhMbxgnmivsC5Dd0PtD+u4X5vm3ZIIAtwEjB4/HiiNsRv7P19hQnywQjKylrH6Ntqs
         MZArfmMsus03FOP9ammS+AjNN0NlL0CErfxPMabP/XRM+z/CtSNrEIGfr4tk7OrtrGTM
         h+5ClHsHROhv4ET3qQUSx3pZXYbSZfAO/jEFJyorHLcqLInj0e89FbdRFwkHOHbkEXRm
         CBfsH+qWs+qrY7OvDdPZxSJRxzhqc4N3o23kHo2SHi7bILo4x7TjKwnIYyQQjlL2315b
         BE5oLQcjtDRDCAwaBa/5Gw2gBLeoIbU08qYfRc4oYihL7GfnUcXtBt9koDv9+iB61zht
         85PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t7VqJxD8mYb5fVhIvZtGeBcvOXArpyTEScr8Bn60wj8=;
        fh=Jnru1Gb72DcfmvZx2VqzsDEtr2uCZuWCx6FFwiya73M=;
        b=InRDSd0zcs5FSjH8Cot7FWwQEGuxIpDCahjY2isv+VYsLKZA5n8I/T0Ghtkeq9MZYM
         8uBD5BBS5jVTGRtEFktdN/IY7ZNwcHBoztKVXFmvk4vsYgj2sXVWgJ7YeYK6pL6+ZRzr
         avbmdkHy9ot7WFrr78PZ5Jdbm+ZgEA/uUhK4IyZfDglNQQ6qGd3pDVpL/4CDCQkYO0Gv
         Se1VhyagrO2jSbfiQXXbmsEQ/x2WeXZkQys0C8Li/rLsvDOuYQX3ffaCVFg/VM64GCew
         Skreptd0c45Td2GtxIJhmSq6ES0dY7k8bq8RgBIMFL/GYJw0pNlUZ7tOows/5I/ZbK9J
         aD3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795196028; x=1795800828; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t7VqJxD8mYb5fVhIvZtGeBcvOXArpyTEScr8Bn60wj8=;
        b=BNCh40llylyfMoEcn+JRi3qBUCD77xmyvT0e7q6aQlRavrNfLzUiUXvCF8T5R48B3z
         ginbpYCu8l+f+FG/sxK1aBbkDck7Fit3fvqUmSUmU/t7Ax8mBhK29Hv1+0a1zLq15NIz
         uviJKfV8CqclQCAk1dTfgpvO2QijP+mqfd90Xap7w5M2VObqUtBWVdNdqdrdNkruvY0/
         8N5DlZSuzBuTixLOt1XO8eIJNa+PtpSJp25D/EZzyndqz4ofZ5jvjTpaGjpM1ZpNCY4l
         UHJqFd0il/rL29r+82RC/eLc7QLJ2QmqHiZklFYLrcwqVXIw9F5oLqzmGGgOGVAXiPQf
         0v+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196028; x=1795800828;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t7VqJxD8mYb5fVhIvZtGeBcvOXArpyTEScr8Bn60wj8=;
        b=XOO/DtwLPi1Qvq2iUV9smC/5vOEgk1IHqzUiETwPAMAm1usXG923s8agTmQf3NfM3Q
         5y5mj4iqPCvoIH8UkaT9BIpTK/J7RDu5gOYJNJrhDlurGV6Ci9jNHsWtjE/u3lMnhVZi
         Tk6z87v6nEN8gjUWuwgh1sod8w+akGMQDhW5E4KfDiwABzTuVHXmDxExOiN3vngcMESc
         zyeDqCZSXGg0AJtbpS4FYOepqpD8pzxPYA2vEBUm7hu5HXD49Fwh1NDOpehtWC8Qp9KU
         Tc8F2Tbo0gNFN0diRgqcHg3FxUnEPIO5ANOZaiDr+qW7SFv+ML/oNhGkWq1YTH/f5A7Z
         iDBQ==
X-Gm-Message-State: APuU4Z8jBHuYaIYXRhrFJeoLAzTKQoxVzaI8VSjwG/INQMa/6PsUFwnP
	m/wL7Q2dFyM/UkJqfAz3k8CGU5QnvP3t/wAQLm3JDFUGKuEt/3tswuGeBiPIqIYJzw/HQX+HlbD
	NbL+prx7KGNWjp1eSkjR7KMelFsLsa8Q=
X-Gm-Gg: AZFdTZcJuvjZqqx3xLbCyztqF5dFkc3QkP080Q1d+uKumweUPhWRSOdZqiAedXBGjF7
	DBDDqBZrzhINxXxVCk17lYmMpjQi34IkHhBAsYS24O+EFpCLw/CqRJtrnOqt5dYWAO27KiTujaF
	MF+HIct6vQfDWk7LhGTZMC3iGlaQN6YQiAPQs/YX2W4ZMwCttw8/Fp/TmcLcWgJTpAgQW1/jutL
	sPhqSlNcY2Ii9vO53ntP3WlEjJBsyKNbP+chODY2agjGW3E2HTIU6UszwKyWb9USBvUm2cuE1wC
	Gj89e5GUoSVLOBuca8POJeD1Fvac4Lz267ohypzwkvtf0/8LM4ZBga9OZ9NVzmJpxMIlXq2StWw
	F1Kh30MmXmP5LoNm5tM3ROIQ1XbOIKp/m/o7D4c+w/jQjgI8rYXdNpwXvqvVQLq/ocps2moDnGT
	GJCa5dEWKcYiuKxtGNU9wU8gNRC8CJCDpaXVMI/KYmFUt7ENIOszL8te/LGwVeUrGmY9nHmx2ko
	0KwrSPsoscJ/+ncAQt8sCWY3pxbFg==
X-Received: by 2002:a05:6122:1d06:b0:5ea:9218:eac1 with SMTP id
 71dfb90a1353d-5ee8af5443bmr1845996e0c.20.1795196028572; Fri, 20 Nov 2026
 09:33:48 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f@gmail.com>
 <20261119144848.4ddd88cb@kernel.org> <CADvTj4oJ6HDR2k6qVgefUX-h0TGh2n+AO5gx_dcJFzzWML+2UQ@mail.gmail.com>
 <20261119161151.5251fc86@kernel.org>
In-Reply-To: <20261119161151.5251fc86@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 10:33:37 -0700
X-Gm-Features: Aa3M54rQjy3WuSYK7qM4qXKPc456YWlaTnH7_OIMqG9iK55grQSbT34CyqfskX4
Message-ID: <CADvTj4o_hBYRzpQVvAcyP6MfYjpjy84iGxwoeDN59eVTbKszAA@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Honor the RX checksum
 offload setting
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, LABBE Corentin <clabbe.montjoie@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 5:11=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Thu, 19 Nov 2026 16:32:58 -0700 James Hilliard wrote:
> > Would it make sense to address the `rx on` drops in a separate
> > follow-up along the lines of Oleksij's dwmac4 fix [0]? On sun8i that
> > would mean enabling error forwarding to DMA and passing packets whose
> > only error is an IP or transport checksum up as CHECKSUM_NONE, while
> > still discarding frames with a bad FCS or other fatal RX errors.
> >
> > If we leave the checker enabled in both modes, `rx off` would only
> > control whether the driver reports a checksum as verified. In that
> > form the follow-up would replace the conditional bit-27 write rather
> > than depend on this patch.
>
> I'm not very clear on the changes needed to get to "bad L4 csum packets
> still reach the stack" / correct behavior. Would you be willing to
> sketch the full series out already, and then we decide what gets
> applied where?

I posted the two-patch series [0]. The first patch fixes RX checksum
handling in both ethtool modes. The second adds rx-all support.

> What I would like to avoid is us applying this fix to net (which
> seems legitimate on the surface), but then following up with another
> fix which unconditionally clears EMAC_RX_DO_CRC since AFAIU we
> need to clear it for the correct behavior.

We don't need to clear EMAC_RX_DO_CRC. On H616 I verified that setting
RX_ERR_FRM lets packets with a bad UDP checksum reach DMA while
EMAC_RX_DO_CRC is still set. The descriptor flags the checksum error,
so the driver can pass the packet up as CHECKSUM_NONE while still
dropping frames with a bad FCS by default.

The new series keeps EMAC_RX_DO_CRC set in both modes. It replaces
the conditional write in this patch, so there's no need to apply this
patch to net first.

[0] https://lore.kernel.org/r/20261120-submit-sun8i-rx-features-v1-v1-0-505=
8fecba6b3@gmail.com/
