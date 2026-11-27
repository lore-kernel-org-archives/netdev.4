Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795790480;
	b=mpdAU99kbcVIdABPCiOvZb/4WqMQ+CxmBxktQAmJfoBlxteSeDwxo5EIFB9QIR5/UDIn
	 QP/TWpN4epTuovFHxzMBWEiYeeyg534Op3ViCIKzGKZvZTCd4IfOJMAonC7sfXJmowPNa
	 Zfz09jL7p6kDtF6/TxdWM2n+uIP2ra9keOHBClzMjEdsFOcubpq0YXFadkOv6cWiqS1tD
	 iaUgfq6AhNCwedUX9Cl1nj+rrvRNt6Bkh9UHxgKL8H17L+481N0kFMcyhycCNjCdiIcvU
	 TR8PXB9AJJEhNArSGVPca+z6XnxtOo5avSGdqd8Qay2a0ek0FgF4BjS6tdbQjRBAvRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795790480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=1xAA2Goyp0+/R7QCDqIjCUY9e99g0trvUh4YZU4vu90=;
	b=oShObHt7pVaNCVTgRbosk/iKJytRe3z45GpnGeEtHcZD1XXZ91g40WQDqiaQc65IYkmB
	 rj4vBUH90pukytZOjbRz5AvVX407bw3mlenCCwhqEPAnydcXZH7RlyGEnm9tqMwTQ7YMa
	 E+A7YAi6fQrBTPGJE7eUMSrEwKIisORSb8E2FZLsa2qA/2Mm3uWwLdWctaqXmHNb0hpkp
	 Sb99Li/cZY2fDD09xuso+e2GV9jSpq9GRRQ66uEfExXCQmGcef4Y6s4OTanstj8k/MIcr
	 GTl+UnJM3BsPymx47Gq5hUvx4fIXKHfhnqd1rbI0/mmLwsgjkTH9L0IUFkCzQG97pqw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=MT2oHMum;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A8B606A335
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 14:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44A8B606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=MT2oHMum
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c5126505cb3so1069318066b.0
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 06:41:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795790478; cv=none;
        d=google.com; s=arc-20260327;
        b=JhAqWb2a5kqxyaszgxvySn3s1PHGZp3uDxhTjXGRIrgsN3YCZLGYUN/elg11dTEDwc
         hbXNEEbEADtr5Kz5JdfHDp7jSOp9qogP+SSTNG2pAaXmNPB0EOVOqsC7MOWKzZA1dpYO
         6uWribmiTVPa1Z0+OTGN1ou2Ev0knnuM8MIToIMzG0hKztMOoaQVxrzlmoNKm53FW16q
         aLlVRuhS/ek1QWzLjc1W9z6ERzBygmaKXC0MC6tp3GdGkBuhbGspG85sHqdVqmqh7TdT
         iMw/07RWgDsFnu7Xc6qKdXpkHP3+709pgrtAH8VvZMJAZGPPl76BC0SiFhjBFb5Vd149
         av9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1xAA2Goyp0+/R7QCDqIjCUY9e99g0trvUh4YZU4vu90=;
        fh=ZZxbElWGkLHPLDyBWw54ds2ZYzzfoTd4o6FYj0Mzxro=;
        b=NslWsXW4L/cZY/TiEQQCZrOY3UN4xg2OM75TWfxhbIxoDy5YQFJsCOKaCeijnsHVE5
         qpqUh61m85bdOgCCu+1rFAjRrThi9OiddKDHo8IYhMvOr+SvQ1ZRimk5GbCg8tW/jN4b
         jJaayUiArtbVbzamr0zfm5LwMV8Klwf2uY44go1rmhM6Iv5ufuU85Xtqbig7zFWaXV9J
         8rxBX7ZaOHKzFlBpmt86QiJua1c2h1H1IVprPmhw9RuQIi3SX0EX8pOWytTM7ydR7Xb8
         9yhEPJM5+pH8LjmFjdOA0k6CMvoXbhMa2r75oV2bqySp893QDjcNUBO5UbVmD8PK+Pnr
         Txow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1795790478; x=1796395278; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1xAA2Goyp0+/R7QCDqIjCUY9e99g0trvUh4YZU4vu90=;
        b=MT2oHMumUDYcT1kYlbQvosRHlNXx3xucpGVTGRPcLqH4jA0fgvtsQ/wf2Ps2Onzrwu
         oxz3MVdxxJinWMhO7BhAU6bP62OQnZE7FevaUCtiiPYGMWVJEyiD/ZoyE4eAdWCgy9X1
         QN+ULSdNYBbjlwiDwRZNFQa3AjBAzIdtUSZVOWr9aev3PtiAYRTo+GzVjQrJ6KzcjSRx
         F6kDPFTqq3q7XVG2lsqyo+GsgNCRvqV03JAl/M2fqtspCSgQr6XyZgr5RopoJwrjg1+q
         jwc97ZqwWBfgxWzCy27SlDP3CpAb+rgPAhWH0pz5SA3+kk2Aa3ou5rx8zLBqcSUM+Yna
         Rz/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795790478; x=1796395278;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1xAA2Goyp0+/R7QCDqIjCUY9e99g0trvUh4YZU4vu90=;
        b=hohbyZu97r3GAXCtJucIpVrK8FgGQhMS7peNKQ+HJvb5E8VBowzUbaGWhW4NR3ocWp
         AtbeY8U3+q2H/tG/bGooWqVisyF8zkhYUlyTyC24U7Ss2JK43UPks8xBEIBWa1KZ6yK/
         4LzmRzMDMw+vATUX11w05z5UyfOpJ4kK0mSto5p+3mzWZFz8R9vsiC+KY+zIRMPemkFY
         IbP2pmR7GpNOhp4Fb4q9jr1DtC/vRPl9CZYcjPoDGa3vGyPZ8hN7ocPu37Wt8HjLesM8
         cLGnLMogXzXJpaSC1cv/Lww43c3h4UBlT00ts1pHUOgRZnmqPkEC0phMqGTlC1kyesK1
         4ZYA==
X-Forwarded-Encrypted: i=1; AL+hErHyg2LmMqEUROPoZ+WW3u9fUrKbg/xdIbgJUlchKj9TQQ0dkp31HfgE8JT+6ykkKRWsaJP+dKA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2rW0faL76Ei3x0x7DMBPIw34EzFihqF87gw/sLNmp8A8DZsva
	fOiyvAna2UvUfipG703ZkkHYkc3p+/Xmxqc6VMtxvg/T2qpYGU2qTOxF35s6fJivs0sOWNm3ECw
	2eBxNMmbqdmvB1I2jRFFc+yQ61/nqp6uQK9KtKKRwuQ==
X-Gm-Gg: AZFdTZeOtwInEIcCcwP/TrXrzv8NHQ4vJDFoiu+99GEnwTSgy4nOErnTWfWe891Q5M5
	sVqKB43iU/aYgBKrze6sgv/qyxvIhWAt5EJ534XHHTTHsbxImAy5BlqSpMNQhEbnXDzzbUkAeF2
	jCC3K4qc//2k30g3BbNLgjtl4iJtuuwJdbM2+kUCozOxH7lXJkrtlUBBeARyJ6EDHXkRM0xK6WJ
	ttnHyOHodyFljCI8oRVKaTd76qQNa+ZIe8uYuNbsLZ0IdUrqs46sepUWALcju7chbaEln7+IwHc
	bTwMd/i4yLk5voWoNesQQBoRJblTLYXJwvTRqR1n3Bn0TMN1XHLrKrN6fGRntqcgxDLEZOER+kg
	Zqwe561m80R5o/7vqpm4jyR0qoWyQ3lZcECM=
X-Received: by 2002:a17:907:1b0b:b0:c51:e06a:4744 with SMTP id
 a640c23a62f3a-c51e06a478emr187991766b.7.1795790478468; Fri, 27 Nov 2026
 06:41:18 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123104236.4179425-1-rmustafin@cloudlinux.com> <179551712630.3135.52212996809224784@kernel.org>
In-Reply-To: <179551712630.3135.52212996809224784@kernel.org>
From: Rustam Mustafin <rmustafin@cloudlinux.com>
Date: Fri, 27 Nov 2026 21:41:07 +0700
X-Gm-Features: Aa3M54ridbYcbm90XHp9x2LSe6zmQntTNNJ5b4vHfgqbclmUtnKlfUB5zVS6gIA
Message-ID: <CAG6=z5vW4aPe9f5S_8m73oKvEkxSZySc7tJJo_hbK7F-bL3ZJA@mail.gmail.com>
Subject: Re: [PATCH ipsec v2] xfrm: use the frame's own socket in the too big checks
To: netdev-bot+sashiko@kernel.org
Cc: steffen.klassert@secunet.com, herbert@gondor.apana.org.au, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, netdev@vger.kernel.org, ipsec@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 24, 2026 at 5:45 PM <netdev-bot+sashiko@kernel.org> wrote:
> Does iptfs_is_too_big() in net/xfrm/xfrm_iptfs.c still have the same
> mismatch?

IP-TFS has its own output path, which this patch does not reach. It is
fixed in a separate patch:
https://lore.kernel.org/all/20261127142550.66326-1-rmustafin@cloudlinux.com/

> This isn't a bug introduced by this patch, but this branch leads into
> xfrm6_local_error(), which looks like it can leak kernel heap memory:

It is pre-existing and this patch does not change that path, so I have
left it for a separate fix.

Br,
Rustam
