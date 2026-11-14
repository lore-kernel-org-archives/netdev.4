Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794640702;
	b=BaF2idepIw0C99UYqUcoWlX8ZzFjZ8b2BWtgvYdeevV8HCJFaYavBfHrPIYoI6SbU0Th
	 JV5enWm54xi61tbuSCM3f7wATjsYsipqN5tkfeoHwG/F7YJC85JK4y1+zxpq/GJlRI+Am
	 czuJs8XVRc/aMuLqSVG2Zxi4soX58viDSfO22g7Mfk5vqgDry/2YVYAFtjgkxLAnQ06hl
	 sSMlFdGzJLM6DwdtXN6zr7vs1Bs+dsuLkn+hOuBsrJ5CKEbbiVtzere6Bh86ZbIY0LX5J
	 AgXV5aXq6B4SW/JIoaOrUC9bjxAtVhQ881eNeNm2StUswVj5OddUP6zuTOMRDLeZPkw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640702;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=x/Pi17jOeYlQgxoGSW7NgC6esxcVBzi0Pl1SIAFuCuE=;
	b=i2Ws8VzGA7W2FOQeDLggmGtonC9gGYYHfrH1xfot5uV+m0d3Y8CG6NO/IOJdXCoDxCU5
	 MT0j2+9U5sDtTXh8Pa+af1WCIGqtQQjq0RMSOr5u5ySHtFi2fingcyWI+z/+snx0V8b0i
	 wzN+7i4dXGh1V+R2f4qnKG+IVsb1fPJtCdH4usbdNgC6durFVw+94RwUjo18pFSQ2vsGY
	 P+PbYuxgawrJl3lW5Zmalfi96b0JnygwvszREmsOa3IF1qLX/HxrmtOrKNSESI4kkqmdd
	 EcoOaX/9TyHz/Ah7Ak2VYwlNKhh7OH2zrim7EnppRhRKZ5ApXWwU77dQkNPnm3W96WA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RwxJcI4o;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131B4606A330
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 07:18:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 131B4606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RwxJcI4o
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b094e649d3so1851670a91.0
        for <netdev@vger.kernel.org>; Fri, 13 Nov 2026 23:18:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794640701; cv=none;
        d=google.com; s=arc-20260327;
        b=alEZ0sl91rqKbothjBT420pDysrsuoLGLL7PqqG13SsAyyUZI/uPdh4w56MoASobUB
         H8QZt/ZQTDLR6PT65VGcQNsVAwA1WrmGszqJml4ZeRKwaFH+DGfCSnfSaLP+oD9+8ps+
         AKPWrDKdrZR4rWT5XuzjRPOrh5U1usFvYiDXjsFvJ2u1Eugp3kGCqgI+u+J2XKMBA0vv
         bFzLWDzidEtN56rKt+6V+GT6d09JNoDNo6VuwTVI+ssCdw7Q/Q10rJzsv+74SXg4IoH3
         RX+Eiu3mqiKTlLXiAPcgHAA40/2E6mZjJ+ppo9SG2sviN9WbU+F66+whq3Rb2WEfxSMi
         aEkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x/Pi17jOeYlQgxoGSW7NgC6esxcVBzi0Pl1SIAFuCuE=;
        fh=ekUPd6DScBEnHUO6jTtgDlb+s79km0W0DH/Z5Of57xM=;
        b=YRO02CegoUeEJeoFnM92/8F8fnBTd54pe+GEMIdHTMeoyNj8QbnxhBHQBAzXsoSU3S
         Sjlk4QmxYFtVqpPtAX46yPUH6dJ9uxbY3mM9mz+/bVLYdRQhGs62PsAE7e8eYnmmMbp2
         ON33OCj76lKItGnKdUeS+dRiPwAOqyBCCigA0ty5K49Wv0CCQJ4gI6AGHPna+TM7qtlS
         TModhdqpbjzosXIaSxTyxpf415VGDp3N2FbN5Zi3QJo2+9EhXs43MNIcMl4ePZKxqs9H
         SNSskoj2GRPB8Oyh7Um/rINJ3sq5e1FImkWVb0yfGXOquDhhIBhrcQwKz+Af7JjcKAIa
         iY0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794640701; x=1795245501; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x/Pi17jOeYlQgxoGSW7NgC6esxcVBzi0Pl1SIAFuCuE=;
        b=RwxJcI4o5k4txShP1ACyIu2E3HSVbFXc/DavqXi5iM2Nx+c1HmXr5bZ1djK36fDlqp
         OxFJondbxtCAKlN8o3/OWNKPZ6VUwc4Grd1hw9EHAWwG3e/zh2YbzMxLwomCPQ0WBDev
         yNDeQ+SunL8l30yurKTQ+3hPqn6zr9Us5zYsW6m4gxNmHG8IUw3OSMqRmUCa/CQQIQKt
         apo68HElI3KFO2WPJ2zow7y9mMQ0In36lpUJiLjz/q7VWlLk7+ecpXeZLkYNc7AeqblN
         uVZuZ999V1FmK+Fq1YqFccnILkvPCqxgrjmvVzyZcE1lfSlwzNQxT9pDa0hQ6I1bPIKL
         YjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640701; x=1795245501;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x/Pi17jOeYlQgxoGSW7NgC6esxcVBzi0Pl1SIAFuCuE=;
        b=v1qyHSuq52c41cWbzhOVBUvRvjiUmHo1xPDYgpAD3vxArY84trArHN7j11WfK9TO/V
         /ywX5tvf+V483+petwzqsA5slmR3NYfRBFiYatxrdCksjMzib25az6XDSlCNPpX27QF/
         wJPGprd44o6PgK7Ca+U7BrbkhJsjWHHWc51fZZUP1iW+WPuyFkRuxQpUKrjX77RIdp+K
         OMplsnFNlfwOu/UJ2GNzyg9Ceg0iw4ikhaJay6J9J7UGMOQpuLfKcdF6VVlXy/EDeRtL
         ou2rMQTzYlhDWSW5iwM6rQp3tG6jdQOWpmxRRKIvX+kDBJupK+dLvqS/Mwv0i0kR3tGv
         DDeA==
X-Forwarded-Encrypted: i=1; AL+hErFalSqeCCPsEkmNcMPLjzu29aALyTy4qumwRRn1x7NYiQ0y7bqBvXXKmeDC1vlD+nV82vC+N/4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OciNJb9X27HzPaEs/1UEvXWcGoMucgOX2CClACecw0iuImsIw
	ZQ1fvTd5SH0KO4csP/wihYtOkkyagCLPaCzHbLOuLACVGdUEEelZgUoz57nWV6rjy5nUR8x9ROV
	2o6idHTlojakGQMkJkO66nxzA6QBG6kY=
X-Gm-Gg: AYBFou1+1PRSgItF86pjw+WQbKygmSbibYdx19XNiflmGYqcNg6An6ROGpXGYKqUcg5
	0JkOaZA0sx0pj6k4OwRY8RrcG4wEeBZQk7iNyBQ7YBhKWxJ40XTZMqSnmce4sJnWljeuWGGp7s6
	LAftEls+0zX4jTY6E+zSMtU4XKSqxq5S6/zvMWkKKeR8fccqEVjMkDm7eomI0vAdElATTaePGhr
	VdZ+vSkBtRD75+ikvgyvZ9KpB8tRW0B/z+ZdmLJKdFxT18LhGSHOZzA1Dl7gryfvZ04qAC5gy48
	fEQ6iYIj4qwlp1SUncUm0EmAq8/058JdX5dgQNGSD1SwZeFspfyQ/MMepzTRACx1MY74yfK1adE
	ApRwwVyqtgIM7/NaC8eR8HE4qceZ3MYjRoksylcVRc/N6+LaqcEe/vC1SBtPfMqBbNrcZgrRQLS
	ZsxJZrhmnqM+H/tbOF5vsj
X-Received: by 2002:a17:90b:4e8c:b0:3ac:9d14:fe9f with SMTP id
 98e67ed59e1d1-3b1b0ba3320mr4593791a91.31.1794640701364; Fri, 13 Nov 2026
 23:18:21 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111013454.34542-1-law.wei.jie@gt.tech.gov.sg> <20261113163219.16603c83@kernel.org>
In-Reply-To: <20261113163219.16603c83@kernel.org>
From: Wei Jie Law <98lawweijie@gmail.com>
Date: Sat, 14 Nov 2026 15:18:09 +0800
X-Gm-Features: AclHuK9uXk6vP5W88YBE9Yv3ZhCaOZI4ovsQnoN4ClZqfcPMhl_ARhhXFj-lIZc
Message-ID: <CAH049wmDwzb+zwQBzuw9+PA7-+My+r0QgbCpOi_snr=+oFpgnQ@mail.gmail.com>
Subject: Re: [PATCH net-next v5 0/2] net: usb: lan78xx: do not use
 uninitialized data after short reads
To: Jakub Kicinski <kuba@kernel.org>
Cc: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>, 
	Thangaraj Samynathan <Thangaraj.S@microchip.com>, UNGLinuxDriver@microchip.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Woojung Huh <woojung.huh@microchip.com>, netdev@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 8:32=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
> Why are you testing this on 6.12 if you're just using a gadget and not
> a real device?

I have noted that the patch was applied but to clarify, the reason for
the tests being on a 6.12 kernel is that I am mirroring my Linux laptop's
kernel version as part of bug hunting and testing (against real hardware)
with a malicious USB device.
