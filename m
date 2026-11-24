Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795482959;
	b=qKAA+2h17GGBuTVL/Z2poV0LBfbnvvGkLQa52I3boHxuJTg7GIr6BJfqzDnvCT1cWA2A
	 ZVGkHCq54FBgNPTR9EAVW+68YWvmhLh7xzwIWtyCyvHJQy0AZtaRVHRXCtsiOKF2VP58f
	 rX1nbOJSp2IG6xtgEIX2QUJM97Qvg1U+qUgRl3FGylE9Ov4NVzaT4XHd/LvJdrA2BxDUL
	 MdVoNpuG/46xYtrmvVpCpklqwyHkxXEiGkbpn84dHPa4yjQilf/T/1fisnZHT7vlgkqsW
	 y3r801B7QD+SAKEEqIh0wIVqOdwcEF9BnbVMJQFPPRclAXxoJqkFS1Shd7zKobmKaqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795482959;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=C6hzf2s6hKShPf7oAcRuMB0755YohpVsSX/WLyG5XrU=;
	b=lbGVhqIs1HsiVqOuFdT0NVO2IYP0QoIjkzKMKKbx+xLYb3SGyaCVvkJNeUcyGbLP4TO8
	 6cLG/EpArQf7RyR5A0VLTZ58GMF0b9tmafaaTz4qch724EIhK7GT15PO2Kx0bQr8tocPi
	 atHammXlncMKcgYfYIHJziqTwoYSQYLQ1AFc2YO+Ve0SscOrYQqSNDjZkFZFaYD14lzE2
	 XOxG3rBeRXlPkUY+9yVnirRO+7ukU2tnn9eOJIoC+CVg7c7ZRXIRq7Y/ky/yzowdtlOA1
	 SCNTMSjtLEcwlQXCFelkTxHKDrZl939D6VqcwMGI0+v6tM+6qzqkAcLYp9Egz/55asA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NzfeTj7P;
	arc=none smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39046606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 01:15:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39046606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NzfeTj7P
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91c1f548f87so55960216d6.2
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 17:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795482958; x=1796087758; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C6hzf2s6hKShPf7oAcRuMB0755YohpVsSX/WLyG5XrU=;
        b=NzfeTj7Pj5s2+Md8UTM6BYvGoT1rx5OWIoiyb/ayCzfqk+1jTTgngERRL32/PWRykd
         J6FbS185f/6H/TH5yEkoW2ub9IFSiqeoWBVGdrn77H1z6Z+41uuBGle0uiEER1ROD3ak
         y+0pzrLyn70PwKY4GUeR7joNEiUx53tzEVSz1cGx6q0syMwc2ylmXMY2FZiHHZ7fVJN5
         hiqTjYpQ2IYIL99JhsrIgLj0bekrQkeeGweeh54CtsBdq7WiPVKgg23oBkWaGjD+JLoI
         e8E1yGBJhpIGoPWPMMfJzCZsx/lMoQGDEktqdJK8UlwcEnQ0g8F/qBU2lQnX3Pm1xI39
         g5jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795482958; x=1796087758;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C6hzf2s6hKShPf7oAcRuMB0755YohpVsSX/WLyG5XrU=;
        b=pb0LSa6nv3M6BjvnoVfx6m/2UCvqjKYs+fV+2cEdSMc6BdgFXU44r+T3V6nF2tsHCp
         c4ej5KAeSZu06gAkFou2kKPsprKW2YuDqYVqM+/5XrVxKG9TiAkA7e2LxSEE8w41Lx8I
         mNA6SKB4GkFZBopaVNYdutctplNmL+gXYZLCeumLQJiqlnmWGo551bRhkCEr98RIIblK
         Uq466besjZ11DesWJEcek8rWYvPWIbOmcPUXO6FzBDG2HyAndVqg63TlhOT560K973eG
         EKX+AJE0j86ZUhzhfDAIS87rk889mpyIxS4jilUnOO5cFGT45mwfNrNO3e2xA7zA0/xR
         F4XA==
X-Forwarded-Encrypted: i=1; AL+hErHCi8LBVHdNH00DLAaQPaDQaN6QrZ52CpblphTVljMwmR8dLEp9IC83i2/P8WXYWC91V4CFbH4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8B1dXp9mMOOFZBr6wX9bnjyyZChW0ka77l/Ma6lp5q53hxLkEp
	j/sCT0Pvi25nLJVamQkM/qXR6x5j/h+qV1JA7LaFOgNLjA8pYzpOTUYb
X-Gm-Gg: AZFdTZcECt7yi+diYFT/uI3GiMMoP5QIm6kunbbJDELDo0AEuOCUGBafMUK+tCpLklJ
	J6IY1rH9Gz5dZMzvlrwC3/Yu0XA4STWow8LDoNzQKXhCkx1dp/D+ZXgjBhvoNrV1Nc48PihwkOX
	1QPwXWsmeiXl8UjnVsrkUfyFWtesjHnBLR7p2ZMrmkkuWWybppbGykQW2FQoy77ZJQV9CHC/Wxw
	HHPk5LniRLBNx3MenQTREJHmyQp4A1kFT9S/lGGSvsWKtou/ONrKINrUYaWK1lSHuspmfUjwva9
	3O6X5SUt9LCl7GLusKfDoHICHChrfhfv2H1WGBIJcJ0oRsi9AFk2obtG6Ewg9UAM1dNLPFw8T6r
	03SJVDi81TMFZHQParaxsYPr46k8+p4GJWhptiiGmw/eb/lEVHUa0W5XkC8VELT7jUA2bVXQHSq
	XYQ3/5l9wZWBecONiPMZwqBENnH/yvhJtN/GFuewFRxiwrCXS8cU/w8Ui8b4qsdsrzS6hWNfzxx
	yMk+duzNv/SyPeYILQP0l8FldGEEbkE99jy8uNvwkmYJBfNRAhngDqkR0iNR41DMMS4UUyKNJHf
	C42afUZQFuuMBb/xy1KiisHP0do5aobAcaCxYNu/lgrWCUXBktZNwbRJ7HcuuB1f2tF3kUla6SI
	HWcs8tWmmsf1jGyVC4Jd4RhudM0cyx9qaLCyizvaggdmTtx4NV0BZI19c8qkwFQE=
X-Received: by 2002:a05:6214:8504:20b0:921:2245:73c2 with SMTP id 6a1803df08f44-92134abe315mr179048286d6.20.1795482958278;
        Mon, 23 Nov 2026 17:15:58 -0800 (PST)
Received: from gmail.com (15.60.86.34.bc.googleusercontent.com. [34.86.60.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349ee175sm123288296d6.26.2026.11.23.17.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 17:15:57 -0800 (PST)
Date: Mon, 23 Nov 2026 20:15:57 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Antonio Quartulli <antonio@mandelbit.com>, 
 netdev-bot+sashiko@kernel.org
Cc: willemdebruijn.kernel@gmail.com, 
 jasowangio@gmail.com, 
 andrew+netdev@lunn.ch, 
 davem@davemloft.net, 
 edumazet@kernel.org, 
 kuba@kernel.org, 
 pabeni@redhat.com, 
 horms@kernel.org, 
 mst@redhat.com, 
 eperezma@redhat.com, 
 ast@kernel.org, 
 daniel@iogearbox.net, 
 hawk@kernel.org, 
 john.fastabend@gmail.com, 
 sdf@fomichev.me, 
 maheshb@google.com, 
 peterpenkov96@gmail.com, 
 netdev@vger.kernel.org, 
 virtualization@lists.linux.dev, 
 bpf@vger.kernel.org
Message-ID: <willemdebruijn.kernel.19db5ff627b4e@gmail.com>
In-Reply-To: <c663141e-78bf-41cf-81d0-fdda6fcbca74@mandelbit.com>
References: <20261119153056.353156-1-antonio@mandelbit.com>
 <179530424233.3135.6226986969775563090@kernel.org>
 <c663141e-78bf-41cf-81d0-fdda6fcbca74@mandelbit.com>
Subject: Re: [PATCH net v7] tun: bound the NAPI receive queue
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Antonio Quartulli wrote:
> =

> =

> On 22/11/2026 00:37, netdev-bot+sashiko@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 2 potential
> > issue(s) to consider.
> > =

> > Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 1 =C2=B7 Low: 0
> > =

> > If you believe none of the issues are legitimate, please reply to eac=
h
> > issue of Medium severity or higher and explain why the AI is wrong.
> > If any of them are legitimate and you plan to respin, please let patc=
hwork
> > know by including "pw-bot: cr" as a separate line at the end of your =
reply
> > (one such reply per series is enough).
> > =

> > - [High] Bounding the IFF_NAPI queue by packet count only
> >    (net_hotdata.max_backlog skbs per tun_file, ignoring size) does no=
t=E2=80=A6
> =

> =

> Right, and the commit message says so under "Still open": this bounds
> each queue the way enqueue_to_backlog() bounds the per-CPU backlog, but=

> not the memory a user can queue. Closing that needs the queued skbs
> charged to the writer's memcg, which touches more allocation sites (one=

> in vhost-net) and every tun user, so it will be a separate change.
> =

> =

> > - [Medium] The patch silently changes behaviour for IFF_NAPI users wh=
o
> >    set a finite send buffer with TUNSETSNDBUF, and the commit message=
=E2=80=A6
> > =

> =

> True for a send buffer larger than about netdev_max_backlog packets:
> there the queue limit now drops before the writer would block on socket=

> memory. With a smaller send buffer the writer still blocks first. A ful=
l
> queue dropping instead of pushing back is also what netif_rx() does for=

> a full backlog, regardless of the send buffer, and blocking on the NAPI=

> queue would need a wait/wake mechanism tun does not have.
> I'd rather
> keep the fix minimal; netdev_max_backlog tunes the limit and be done =

> with it.
> =

> =

> Given the above, I am not going to respin.

Agreed.
