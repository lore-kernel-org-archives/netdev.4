Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795449294;
	b=xICDLIlmMkYt594ENUND45/NPcbHn4GFwhfW8Qie+vDIZ+t0Gu0sWnnCX5CelgRb07zX
	 n/MTaVWlr/NFE4KNCQmQxVygnuAr8fy3yoROhjeW8mdphFxs7cpktFl7Tw2NUr2D+kw83
	 kiyeTx8tRRdHzyPwI5LQhYe+GSDfpzysVoZVJtRvnAD9rJ9wX0WuBz+tQIPi9K8/OAq2q
	 3WrieJVRwTBFGa83yRGoj+DvsMp2H0WNfXn85ja8yS/jIIsC+RNw8ZQWAkl2hHRS027kV
	 y0khzUSWz1i38VRzpTiEYARc8X8eNkpGwR9cmmSWXYoKuQ5D89MsTolKsgaCLld4n7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449294;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=t9IX7jhAHia6k2tyI4R6gmuYZ7v1vx6KEiWEsxkHMt8=;
	b=RzmASxYVv1EdaNV3F0etupjN2+bD5wPKFlae5/e5tEZ50MN2DjiGUKkDeeM5ALRvnGsC
	 bc+L6JOOAKK2c91t8ue/WJBrGwgr3S/wxKO12cahFLcHmf8gj2XUiRbCRONtwFW0cEZGx
	 OnVER19Uf08QFGNamMacz11EOhEfhGxZRaSmHcvCJ4X+aa2kE4JGSZ7T/8DB8VI8rTozr
	 vVo79PXDL4o3z0wVl5VqRze6cFOfSIchCT52s35hYKs0eU4S4FKhXUiEJ7wZ2cN0RFTOU
	 zckHPaLqSlisifl9lqpnZmD3K8hlla1sjxIL1knE7f7ef48tqD2YGl6Rp/85lhLym9g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB8E606A32A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 15:54:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BB8E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1a3c08d6928so4793633c88.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 07:54:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795449288; cv=none;
        d=google.com; s=arc-20260327;
        b=bjfBMv2tepuXS41Lw708YCEDr0XsDoh4o22+CVk2pLdInG7dowV9M5cAb+gKDyMm0/
         E3bwd9ZfWsMuPDVZN34hCdA25CVa031TJTpJNNhKpJVzjjFH3OrevEJgZTSFob4SakY3
         5CNtuveAi4Zrwjg27+j9L+cf6xuMeDySy0NJoJDK5vglWw5XvGg1bh21iont/DqjreK6
         3BuVVl4Is6l7qQ0lK1Wa93mFS8yohC3HDbdH91eSHS7MRSeMIG3eyRPy8VGr1cZxxWV4
         h/yhLdlwuJ8lPtmU/Wc/o/W/kscw1twG+1NP+VCFU/wPdrocFTd+M5i7oZ8xetT9jS9U
         nbag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t9IX7jhAHia6k2tyI4R6gmuYZ7v1vx6KEiWEsxkHMt8=;
        fh=QoEkWyt4YM2ZzsFp6DeiYign1OTt5F5Jm4SmVe/7vt8=;
        b=Ru4hWqhibyP6YESpwxNQ9FTVoIadGjxfkk3RcUZVKBQbaBBrGrmSQAog35As++myn8
         lipWsrZwJJjVAU40E84xMoezP3VrQyvWXIkqoY1ddGhJ+IUjkRmOkRT0oNO/cemSkZvB
         aNfBqDNhdgVPeiph676KjOTsB60Q0XKRcdIfY+z3JHtLO3jDc9xVY3drFsR0NdcX1AUp
         I/C4r971T6adJavfmoddX27FtaWu0UqWxZS2WbkZi2PHTRGtnKE6MeoN23VGVQTCkrm+
         egm34tTrp9eDkgWJ3EoKA3OvBbj+x0UYDFkxDtlIudmd0EwGY2lXfyYyI6dVq6tUbrSf
         PFgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795449288; x=1796054088; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t9IX7jhAHia6k2tyI4R6gmuYZ7v1vx6KEiWEsxkHMt8=;
        b=K31mtXdKcF83FLFamHn4mu2c1WFux/XDEszEG14A98Jt2rLyW5vAa6g0aQrAW3bjzC
         gllAzO506OvE/rfpZOcYCxMRUDQNB4VXopntsohEOrakiet5wYn7sGPPxwfV/CfChisN
         uYXj8HFMNtuEZ+ou9t21iBeUUC7Pic5yoPJ+xhHP/+72mh5EZsszVIGPCdywgkhiTEHT
         PWSHOr4kNaUQ3YX2g4wkBHhAis3nwdahz8TPq6MFehDLcsSCT1djEzG7g4OFRye28hLN
         CCekPYk30csF+W8hqwpRnXEm3DGytgokuK/dlh+xzWCckuPUC6BXDNd7W44jN2cXrX68
         uVQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795449288; x=1796054088;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t9IX7jhAHia6k2tyI4R6gmuYZ7v1vx6KEiWEsxkHMt8=;
        b=gutaMbuBt6aFzaJzWDah1U3OlultJI+3/eh0Yq4MT03Q1sbPEQUXivlTDHlrG2zox3
         atn0bvNoe3z+d1/zUAEQGz4zeYw4R9b9LWdK21hgCu3iLLOAkMotnG46sgXF+3u8c9GB
         Flkc3B8H4BI68TPYhhz6vnxkLZQLVe9LYGyoCNH/Of7OPyt5o871IHWzGNl71bG4nDjB
         PYs5j78wnPRZKFGBaEYU6nC2inHD8hlS0sVcaeH8IN9NNI6I2BQPKyJOzaxCYVzbOT+G
         PC8+HzVRwdyMqp4QZVbNzignugWnRdzzfI/h49KWdD+Kzi/jgPegTEIP9rWc7Aqi9LnC
         buTw==
X-Forwarded-Encrypted: i=1; AL+hErG/bPDg1sQEzAzZBaaKoojto3PJdX/IGWeaV+fNilscXcyArzVGPpoA/BAHWBIc54ScN+vj37c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eCw3fsmTHo6glln39P/3dqmEsbbCUPcQAsPQRaJ+iwZDQ2vl6
	RJ5Nq8Nhh5E9GELb9yBEGevoCBSAG5Tw9JhdiwiDoFKh3tViKrg/E6FqVQ5ySyZc1V8NuP4fE0N
	Go8/V88H7tdh5IiWc/7/SLmwi0ZQ8Si3RqyP7AWOogg==
X-Gm-Gg: AZFdTZdOLS95vd9C4+lzOQYoOqnE377pr8/NqYfN0fz3s1pRkmMEulSw5fNVWAT1BVW
	qN4XM3YBxq1cdLcz/OMmpWkTtcryvDen6o7m1mX9j/uXOJkp8/hNZ/b6m1vNzdPZfcTHpkc5Wyp
	XuIWFpAcWAJuWv7orpndgFYGW6wgh20eGZHDVrE+WhOPhF0gqDmVib9va3EZwHdzMq6gYUB/qiB
	nNuo6zhE9At1FhGsp36Aark9bTaGHqQB4DmWyVKCNZcojKV0VlNVcxA08r2uJR1lAnMbyt1rikm
	y4oQc9g/FYIMiOkOldTFphEmxTBp0ZhF+Wc9EZ5N8xe4SBGG56APZBoVLSRhrPNYUJub6Ssl6Ac
	iYR2KOvfKRwz23W4iE7ZV/1dooGSnTpebPTtHYkLMS1s+g16tv+QG1xgWrNDqqfOPVISiZpCs6z
	tkBONqpg7Ho/Beu8jHK/HC4oAvgLifaUolUcJOfts7QCAxE3ilD4pqFYkZFMWv3XlnfNFzLgs9h
	N4=
X-Received: by 2002:a05:7301:e103:b0:385:496e:80ac with SMTP id
 5a478bee46e88-3856fe59334mr13784647eec.8.1795449288031; Mon, 23 Nov 2026
 07:54:48 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-rzn1-miic-resets-v1-0-feee2bb28bb4@reliablecontrols.com>
 <20261119-rzn1-miic-resets-v1-1-feee2bb28bb4@reliablecontrols.com>
 <awARmkCuelD_fdX6@shikoro> <5d8530485716d129be2efa0518254e3322cecdb0.camel@pengutronix.de>
 <awAq7vxcY8CGjhNl@ninjato> <awGV8BU_AfaXQyBv@maple.netwinder.org> <awIMBj_7OLrlM5G-@shikoro>
In-Reply-To: <awIMBj_7OLrlM5G-@shikoro>
From: Ralph Siemsen <ralph.siemsen@linaro.org>
Date: Mon, 23 Nov 2026 10:54:36 -0500
X-Gm-Features: Aa3M54odzMyo7xKMWSU836vO5_C9zRbLplW5YRgzXWccrFx6zqrBud8_l_A46R0
Message-ID: <CANp-EDbNxWnpjXDshVhPEwppGu1cf2V2UBO+hk2NtFDFeqCAdg@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: clock: r9a06g032-sysctrl: Document reset cells
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, khendry@reliablecontrols.com, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 21, 2026 at 4:24=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> > Thinking about it some more, perhaps instead of using 0 as the special =
case
> > for "no parent", we could set .source to match .index. In other words a
> > clock pointing to itself means "no parent". Worth changing?
>
> What would be the gain? As you said before we can't update the values
> because they are already in DTBs.

It could remove some potential confusion about whether 0 is allowed.
And perhaps more importantly, it would make consistent the .index and
.source fields. Having one of them shifted by 1 can be confusing, and
could lead to bugs.

Ralph
