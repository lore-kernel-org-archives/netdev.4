Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795200384;
	b=O1spXhHNqlQLnAGvGtcn7NhypggnXH+KJDlIHBDdBj36Ygyo6e3ncmwhCQh877SiY05H
	 WV9qKdrHJ6qWhP/qTR1Rjgxn6JZsMU2d/LaW9OiM3huLdZH5NXly/nd7q8MsNdR/pbTKc
	 RQCkeAGySPJdW7gYvmKoY4iOHIgLENjv6QKr1KE3QoLmxuUGGo1htF3MSTJfIvDaJc7/Z
	 AYl5MzvJ3iFDafFHIvzABZvxKU4gHRSJ5iv5g5DfAzP8FjAw6q0ZaVvkksrZbJzr3TBGI
	 MBr0SvT379hFnlDhN8I9gwmpc6bKt5apFoV4c3J2nulqFxJeSz6thsY2li6QZbTPNwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795200384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=yh+8+SwLk5Q55HtZNGGsREJIH5CMKWnk0ZRZ1TLMdIU=;
	b=k5ie2ZqqiVaHlMDsEs5cH3Zk05e50ZEYLvDi16ywBWyDCgb1LmVpVUr07tQt9qcBghgR
	 TdWcLuAIeyQqeHr76fmXP1wxLXsUH0dF4hLlL3DMym90S+GFAQ5AB8u0awnZ29wRuulVp
	 Gs/GZsNsB3jf4pTsyBqDul9cHYxT/R8giJkv7yn7mTr68pNQbidq+/I5BMhTOz2+5mmUQ
	 i8CLyuPk1GoGRFKSQqTi/4plkCg0FQ9XsdRImyTiTGzxSViL2dOsSkZvwKr7wNxZq4c79
	 gkEP5k9ERYYKvdwNmKsiDEhYvAL8PILw7t6DSX6ZV4WUtbog4UV3HBc9ksM2xi5v/2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kzMqSCZa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.170
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715E560A2624
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 18:46:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 715E560A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kzMqSCZa
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5ea969fafeeso425598e0c.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 10:46:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795200383; cv=none;
        d=google.com; s=arc-20260327;
        b=eQ+wAitk6mlp9DlhZHrhnN7MfS8EPsewHhK3wI5E/5ySki4YSFVJFpUHQE5yUoKA5u
         ahv+hTordOgMTxJ480Xaca2Bglxmq5RyUOO/kf1iF1axQ23SWeTXLGbipkXUVF2MADgy
         jp8upXotc8RX/IoqH2a5VvF2kM9Tmqr7lU8yTJbnPyMQG6fvpYXxQORLR+TJLo5ZrYFg
         Uza+ng/mbJ4m7CiY3guafgp3rlRhLwALa0maP+Jw+2R5OmfovS5nAxJH+tlxv+GkarSz
         w9FfB8gfFJVGzJ9BZ7C650pCpftJFYyJxgt80ucE34wQJf2jVjt7kGrv3sZ9fGTQ93Ty
         8ciA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yh+8+SwLk5Q55HtZNGGsREJIH5CMKWnk0ZRZ1TLMdIU=;
        fh=zaT8OzikDmvO1odGPiTEH9Y1KRv5r+HpB50KwRnxoUk=;
        b=A4D6tZLSWD2gPE9THxkG79bo1A2x4lWxoXb5b/DGBn4pcAbrwXUBo1E0TpxNGx7bty
         wefl4vyvyTbkzPPoS4Xq0js/7glGixuehr64YjCOowymfQljHtxUSFw12QrKcjAhGpxr
         LAm9mhbZb36nbzPQP4NJWBUp6KVe7HywILsW1UWLlu+tAKhLWLrpHHSb2cEJFR3gvr5t
         lFAodpr1xrU8O3Vp3VSaNTTS6qpUO1eJmH3tf8VWX2xPV9Pz+RezwX23Fha1dvA/Le7k
         5wc40+nUaZhagB4o01oZFGGNycAa+r7n+c7d8eC4++LLS1XhT5+kf1awXlXz2Szp/5YS
         3/9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795200383; x=1795805183; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yh+8+SwLk5Q55HtZNGGsREJIH5CMKWnk0ZRZ1TLMdIU=;
        b=kzMqSCZalN99lMjRdkq871N00qLQeMMU4WccrXndbw8v3zYrlkCzZ7pTsP8Ydnc9nM
         gad/uIRtr3tWSRnp8BWFDkuG+4mSh4Z6ZnliT6OQ67gpUFhfLqOaxGBXIeww0w9OgGxA
         HnegU0qjbrUSvTjekhjV8oYhKb5y5m6Eap6dX+XD3XBDqmPyXYBdzNkTNqY47EWWQHcO
         4wbJp612EMBvKP7ct9BxAlKErtCGrePsTcHNHPAP006AR5v6e0gsNkz3bNrxOV6MF5nH
         Q1u+B6FpzG9WLnlJNWRKhzhGoR9MB00j8tHT1TZWjrAcCpBA/V8Oh+TFxUCqOFTjhckc
         9+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795200383; x=1795805183;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yh+8+SwLk5Q55HtZNGGsREJIH5CMKWnk0ZRZ1TLMdIU=;
        b=2vmbArkDYx7pCEChEpcGXAIx85lhdhPDZj3Pzv4LFQxh+u/DQtxVN09GvSeHjQ63fq
         wNuvKFG0e/LtU6cpkDe4nseasBn5JhhTmrk5CTlnNEZfZjKLfPgI8zJzWqjuXudVqTcp
         oCpwr8GYqOCyb9jdq3F0YDVl+dTzYALfrpXqNtgYHr0YCMdvNhDil/eKWOD4npBTWn+f
         ceZMNhxaz1kxVQYiocgdOCMOY2p8EIkewgEz3Nrtjuonhr6R5pVBgzM8M+P7fPhRlCce
         sodMBMYqvO0xvXk6bTEwUajR2hcAfoZ0C5rUsttFZ9WEOHPXXi+/8TbYu3WTVFxqIUc6
         4CdA==
X-Gm-Message-State: APuU4Z+rwDmJpALM/sq+LSJ6mQ6J842IUYjhLJl5h00UgdgAaUDJlqi3
	GdoeJAUghMvtJLbZPKxuicU/QCXzR3cjEIXRHfOXm+WXoEwJBlyoyInDldspmDfY9sW7bwzlrXc
	7YYkJgAdNw/C8ha5t8odIacmKeIu81RM=
X-Gm-Gg: AZFdTZd8TnEyOexh6nMJuctjv+ymhKWV8kpD4E3QlEMlrwWfUA2IZ8vxMyx8vYxwAa1
	4n3lBX01/YD1audN2ENUlmx3mSPMB56ml4LRB1W+Q578ivBxq9a5R8oLG5vz5q/P1aYfDLKWjEI
	U+wfxaQER+EHKYlXKU1Slilefw4J1n8DKxyNBel6YyIZc9rpD3xJnCIh9pUDZo6rAj8roB4l0qp
	Pjv7BqwwdXKnSkKVeUfYwef7IXxxBNADJ3Z39AU4W0ol9Z8OxOv7UkIT58qvF0RBAAlYQnVbWfG
	jlalNZL7QtHwTE18HSKeAn8JM6CFvIcvRU/cy7lQVWsoM2waVogPbNCVmL8tRaSXofxXRhXbSUk
	I/nWAuG6cAx/kEUdmgEQcjjmfkJcADs7Q3cU4lMEIzGi7n/8OOglHEFMRczLCbcCeT3ziri3vVw
	quDL/lgT0ASX2cz9Ta4QQkhr3oa8EzF33vJTcwLErz/MY7HjxXlhsnRAWhCNFt2tBi2U0vy23ZA
	5czck0Rv8Gx+B2Lq8FGc19Cp3CcuQ==
X-Received: by 2002:a05:6122:9003:b0:5ec:41df:f110 with SMTP id
 71dfb90a1353d-5ee8af6c74amr2016084e0c.23.1795200382307; Fri, 20 Nov 2026
 10:46:22 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-submit-sun8i-rx-features-v1-v1-0-5058fecba6b3@gmail.com>
 <20261120-submit-sun8i-rx-features-v1-v1-2-5058fecba6b3@gmail.com> <a91278be-9c14-4769-81f1-38497c38c47b@bootlin.com>
In-Reply-To: <a91278be-9c14-4769-81f1-38497c38c47b@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 11:46:10 -0700
X-Gm-Features: Aa3M54rJ5Y8qFUvIsWTDnCsT7oGEaCdkKyaPFOPkJ_ACUKYfdbfqerO9yZONmfs
Message-ID: <CADvTj4r-KPM6GB7UyDK=XF-D9mvOy9m7EvC3qzznz9VKvFLw6A@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] net: stmmac: dwmac-sun8i: support ethtool rx-all
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Ong Boon Leong <boon.leong.ong@intel.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, LABBE Corentin <clabbe.montjoie@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, Oleksij Rempel <o.rempel@pengutronix.de>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 11:30=E2=80=AFAM Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
>
> Hi,
>
> On 11/20/26 16:32, James Hilliard wrote:
> > Packet captures on sun8i cannot currently inspect frames the driver
> > discards for Ethernet errors. Add opt-in rx-all support for complete
> > frames with a reported wire error and for runts the MAC can forward.
> >
> > Set the runt-forwarding bit at hardware initialization and when rx-all
> > changes. Serialize live updates with the DMA controls in the same
> > register. Deliver these frames without claiming a verified checksum or
> > including them in the good-packet and good-byte totals. Keep counting
> > the wire errors even when the frames are delivered.
>
> This deserves a series on its own. it's not only about sun8i, it add the
> whole plumbing to stmmac itself. Is it something you've used and needed ?

I used the hardware error-forwarding controls on H616 while comparing
the AC200 PHY's CRC error counter with what the MAC delivered to DMA.
For example, the PHY counted both 63-byte and 64-byte frames with a bad
FCS, but only the 64-byte frames reached DMA. The use case for rx-all
is to inspect the frames the MAC can forward with a normal packet
capture. It isn't needed for normal reception.

> This feels a bit strange as you answer to the series info bot that this
> comes from Jakub's comment on the previous series, but I don't really
> see the connection except that Jakub mentions RX_ALL.

My reply to the bot was about the checksum fix in patch 1. Jakub's point
was that a bad transport checksum alone shouldn't cause a packet to be
dropped. On sun8i the same hardware bit forwards both checksum and
Ethernet errors to DMA, so patch 1 enables forwarding and lets the
driver discard bad-FCS frames. That addresses his comment without
needing rx-all.

> If you want and need this feature, you can submit that separately.

I'll send the checksum fix on its own and keep the rx-all support for a
separate net-next series.

>
> Maxime
>
