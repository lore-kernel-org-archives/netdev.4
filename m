Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795596706;
	b=5AB3MzQ6ti/DQ9Tjcvs5JqoTFjOZ/8phrK6PeYYTni56QEcBcYi/Uey2P5VEhBZwPBBv
	 rMtLfxl9ewe2q+cBPk1iP2aIdnCgtWnxJ8OqjVLsXfsEQmVpI776uyeaz/57Tz1A9KCAC
	 mw7pA6zrushGqGqQh4RdzAcVqGPk6LJL+XlEmLbQuFwGoiwkQCMnCl9io8dgaGvISLram
	 CBIRudQ4+UeI9rn4j/njPmc4ETyW+D9PBY+4yzrYeAgFVIPiGUOnL2qtqCT99kNdDkNg8
	 TZcY2cj/jbqvU8eEW8Qlbixrak4zP9wuB6oCmske90VAK4J30UrvO1Jsn/lxJ1ZtSAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596706;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JVZec+P0ncDLVtLUbU8V9WfHdjX3mnAfmKUvh9J6NzY=;
	b=qq16Z8tgaFesv62lGApTZZbBWqxiJXurq7qkd2t2cUnHpU/gtFPv8FjBDi2fCY9r6i8m
	 WS4CtQMpb3aAcO15slCx47HHF/b5SOmgbZVPWqEw+xPfXLmkGfs7mOrkobgM9tysYtoTX
	 cJokT8qx8Oo6vV2gOuULxwyCXaUcACUrUpzGbXig8MP+OdvVoYF0ZQ7wgQ7F9tmlHJwso
	 m5g/IcGDdYcu+izmpUMOfDaqC5yD2PX1JpyW30AOtTL4fax4+aV+O5v15zM7XrdapexZU
	 6HLnEWj+NbAdY15JIKsuI58a62zpcTOGhPkm6QArFvZtiQnCB2Ujz4ijyS1uvqfYECw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c6Tgw5+8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7035B606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 08:51:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7035B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c6Tgw5+8
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-9214b9e4d74so25509216d6.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 00:51:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795596705; cv=none;
        d=google.com; s=arc-20260327;
        b=jN0AqoYCwyyplFT2urT+/NclmFPnTbEufu81PlqQcVI+EO734cfc2T4nGCV2yjH9+M
         lmQ75H93yNLXI25T4giUUU15BTvHx01Apmm5LZViupd59B9LWU/oLtfpP/pEwe8vlz33
         fuXKFiLfqEjJgIW1AoZUUM1cBGZL05+TJ5Rwm/SDyNn/EMgDeK3FnqpQPiU5nG2alMDM
         sw0tbI/nJaMKsYfgkIQZU3e2bof67FjCkrIwpfb8IS0Tz5fV0e1lifIiYwlPyo9+e0wk
         17QNbsfefg01enH8ZakwDEkkTOCSQ8CzZoj/9+aH95dQd2ynVEEabNcc+gk/AAFtnpFZ
         hZNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JVZec+P0ncDLVtLUbU8V9WfHdjX3mnAfmKUvh9J6NzY=;
        fh=NuOHHo36OluIZ6F87aKnxqfdSZclvXuQzxB+32OsI6M=;
        b=BDveDFt6M2LYzk00SKQjmhzfwBvD81buzzyf5z7HirBC1iNyz/xND2aOwbR9XfJRg2
         kHry8xqTX88Z0imExMbfyuKNDSbteKOWhzp55YAxm2+aKhRmD/XlPs01IKmD93ah04Fj
         5autIjsxBT3+1GuhMOaMMUoFzvPmsQ2b+Tw2h0V98eFkspuiiqyq+znuCZ4+9g6nxuwY
         4fJ4wMDxdM3YWSJ+0xIT2YMzHhbn5p7VISSom3SzflSIt2LXFxjmOfwY+2UbghLpmGb4
         2d1M6S1OE/j27PSJSJVz4WVrjqae3UmubRqacqgiV3M7APBF9sahKB/8Y4bk5L04KcmV
         zPNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795596705; x=1796201505; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JVZec+P0ncDLVtLUbU8V9WfHdjX3mnAfmKUvh9J6NzY=;
        b=c6Tgw5+8AuhyvQ0O6xvbT7EaPvrBiCZs++KPav58cWh0q/9O7wSlGgalTS79GBte9w
         UQyCelSL66O3J+8Zbc+xeDLxLWs1F8uNdF5C4gfMD111hq3k+esDXnPx/JwFVlIFanBR
         MjuU8dbZuzYEaRhRBsxOspW+sYtZsLnDql907g19QuOJIvtdfn1amv3CnX2rGJoJCFM+
         icZkeYuXn+xz63AAWz+ceZB1w7pdX1EEJ4ZIpWLoCN6w//6gJ5zCx9+3Hw4Dt9VdNI7k
         y4ZLr8S0Ho+S0P826cpMHmG+IA7JFPo7Vi/ePqtVmq+gOIOAyynNL5qvIoFWQOMG4O7H
         ukCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596705; x=1796201505;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JVZec+P0ncDLVtLUbU8V9WfHdjX3mnAfmKUvh9J6NzY=;
        b=y5I0F1fKaXgAxq4r5j8R/YljF2EnLAK3cA9qc3ocT8VqmKIOC2RJudFYAg/5v8OLYg
         mRYqpAhfeVyOsVHafnD8CVeqIKRu+m9eSUorYZ3bSlmA48KzonNpPSXfujNdh5e2oqsp
         p+ew5q0+BpwcgD5LHykq650tqICXHLsHMl3nY83aH3sOJKD1hP2pFhV8TS0cKCelCauf
         4wdp/GV7oaHlaJTGAM2OGHZEzzW6AyRZK+bLTLy2WCxt6HBUS911bxiD0U9SytI41wx4
         dj3NHKISI0pOQxjIa25X5WDCiUEq4VnAJz4OkHfWfCRIx8UqmplzWUtP9keBt9aX7N9i
         Z82Q==
X-Forwarded-Encrypted: i=1; AL+hErFTsqIRTjYo45iAIrKgCRJq1unc4W+Q+if5oi+sOfVt87DWn0SjKS9zl6qNkn+SekrzwLP/8Zs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MJyI4qr/K3TyjevexaiQnJ7kYpnVBS+BGN0TVIneLqcZ+zCpz
	wrIUooKPIhRV3iWx4+H65T7LfcscaExrqRDY2m2DVeZWA15lvfvuWhCLYS98Bb2KU6FcAmLoznz
	rLOflZBHRvehQhmBneJjEN/8CfD6ty7g=
X-Gm-Gg: AZFdTZd/owl42VThV+OrAvELYNfyx6IOogN8LcHJhdpWfVxZiTAAB6ayRfrg06sM9Al
	tiAYjoYJTkjzaPmsOIefRFP6DRP2l6a+87Wprk51y7CaPV7GYC6MkJPy8dqdhVOubECNpw3Htsa
	vzNO3xhbd1Y5or53Gaj9WqdG9CqnAym/QJ7MmiB4YfgZD7vwG6YLE3cqF3e+znEzb3wLBzWeeQM
	yTvFxfFQW8bP9ppO+uvM+2KV54FuFStZtV/IDiKj3S4jduab21xIOHN50mHha+leeiu0gkTy7C0
	uDosxzSNki7971agyxymIgdV8KAs7YpRdcHOJBDzU+ZfGNzDw+4+8oYGzLPzIh+blHrkYUbIwzZ
	U79lX201OCIMqvxmrkn6AyMqHhriBRvNRt5w/CQ==
X-Received: by 2002:a05:6214:c2b:b0:921:1e3c:efeb with SMTP id
 6a1803df08f44-9212e0d16a1mr304088126d6.18.1795596705319; Wed, 25 Nov 2026
 00:51:45 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118025528.2703790-1-zxyan0222@gmail.com> <179520945915.3135.14304625182301747705@kernel.org>
 <500079e9-e626-4e4b-9880-adeea0724338@bootlin.com> <CAP7veT+EjJabWrvczNwcZQ16P_SyH_rAQkTz+nf1G+FjxMvgNw@mail.gmail.com>
 <e44876ec-4f91-4120-bbf3-3a1eb330a2dc@bootlin.com>
In-Reply-To: <e44876ec-4f91-4120-bbf3-3a1eb330a2dc@bootlin.com>
From: zhu xin <zxyan0222@gmail.com>
Date: Wed, 25 Nov 2026 16:51:34 +0800
X-Gm-Features: Aa3M54oVZ8QH8baEESvpsl4u2Q4IYlXKuxY1eSxFeiZgwZmn4Zh87ziubRwHQe8
Message-ID: <CAP7veTLioytfJYQ-BDc4+CrRMrMMjprR32f0CzN_uL0TschNbw@mail.gmail.com>
Subject: Re: [PATCH net-next v4] net: stmmac: program the FSM timeout timer
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: netdev-bot+sashiko@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	netdev@vger.kernel.org, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rmk+kernel@armlinux.org.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

On Wed, Nov 25, 2026 at 4:28=E2=80=AFPM Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
>
>
>
> On 11/25/26 09:22, zhu xin wrote:
> > Hi Maxime,
>
> > Separately, I'd like your take on the hardcoded 1s timeout. At 10 Mb/s =
a
> > PAUSE frame with the maximum 0xffff quanta stalls the transmitter for
> > about 3.36s, longer than the ~1.048s NTMRMD programmed here. If the Tx
> > FSM is still timed during a flow-control stall, that would raise a
> > spurious FSM timeout and reset the interface. I don't have a 10 Mb/s
> > link locally to verify it, and the databook only hints at a large-mode
> > (LTMRMD) without being explicit. Would you prefer bumping the default t=
o
> > 4s to be safe, or is 1s acceptable?
> >
>
> Yup, this should do the trick. If I'm not mistaken, you'll add some
> better controls once you start upstreaming the glue for your XGMAC
> device, right ?

Right, I'll use a 4s timeout for now, and add a per-platform timeout
config along with the glue once that goes upstream.

Thanks,
Zxyan

>
> Maxime
>
