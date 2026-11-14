Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794674958;
	b=O522t93bh074IEZEnEoJ46HBzgUIbibMmpSqK8WX7UXn7lhp+d5kFDekdZLe9CrxtKWM
	 ki97pJ9njfbTWKryXx9+SK771wCH02yS8/FkOUDFGwipo9EmmgS57jdJhV4E5fyElQXk3
	 y4lLT81dNqATfAJDgNW+YwF8tx5azzJ8w7+Y1r094R6MREiMwjswUi9ehHkzuuYBBX4So
	 50gRRoHYKeBCbLnCCwFm8uGKMpJVTtEXtFcvlyEqniixrT2j6q+aVRBTXdITjD8dMeZbF
	 lv9HyNOLqKlab6nLiFET6Wtw/JSlrPDYpjH46eMT247rR5cxHMikNFetxrglREhJVbg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794674958;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=RDeMhjQxfzuP8B5EhYm9rOTi4iwTVCUYu7flDTW4Khc=;
	b=4PTwua0mcBuwn69eZifWeJCUjEnQ+5/8I7GiZiCt9G08QjniXPcXOpCyUH9zRwLSWPrr
	 0ObHrtgO+wgn2ayaPCl90CIfDkibBmSB6BaAJeHNtg9zWxtuGwUhXu4f6hn45RIs5gck8
	 mIHB1PLzbo5nkFibtZDGhnWUueqni/YJu5nrTdoyjHRtMoikQQy/J9fNamsDEi4j1MQgd
	 qV6PL7JyIYUcS5p8L3V2Tg4ZeU/qzYzK/DPiD1EHBVYlWr2OMBQN1zgiYO0Z8cUvN7XrT
	 o2WaXeuU3yBkOkeS0UI0MD7tUZWamo9lBD/J1PN1Atc40eJlj9/9hzecG1CQ2lT0Wmw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HUBUaSDC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74596606A327
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 16:49:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74596606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HUBUaSDC
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-170135e43c7so3036675c88.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 08:49:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794674957; cv=none;
        d=google.com; s=arc-20260327;
        b=n+rZ3Rrzk7VP6sl9/zcotN3pX5MODFw3oOTukkN6ka0liHKdczMmRkEvex9JNfO4jh
         RUKOp/FWxfOgq93fC7QdciGhwUWJ1danvRd4tLt8N8alzp2Ibb3czNbban4qaGHwyB4U
         BPgRhZt1LaMefwDL94IDRPmtHyIQT+1oxTSuu0yeE1eDGwuiKoECx237h1cmatPt/IuL
         5vnu0BBwPhZzdWHrA27Kl97wmblgI8EBHtbEP/bQpEmpGTwEhDoUPGr+nn4LHHHmnR5M
         NQyA0jmWuA5fw32sZ/euu2QR7ZA1l/LowZfz722Jfe5eluQR8sGnBlir7OWIW3b3g8xH
         yHIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RDeMhjQxfzuP8B5EhYm9rOTi4iwTVCUYu7flDTW4Khc=;
        fh=li/fO+yceaWukgL8fZiiFASOyXkIfMyU7DpsV+i08XY=;
        b=BEd/imzQBhtDaZwDUMgqWf9FTwm7eoPbe4Rs+YU15rc8g+MPVEOXjGoOBXQ+ePg2Dz
         WEKYXA/aHfPenNo0axjhm91kaOUs0U8hOIVJbzpMZ1aMne6kt8cNTBbbMHRtY9IPI6dj
         6PvO6AoFtjzG2Tpih6ORE8xikwiQpJTJCsDCRzyHlDc5KTNpwsz9I2j0zTjpOHELD71+
         G8C7Y2/umvInkMIyyCSiuTBsuFebLpZeN2X4A6r//taaH9PCase//V0yuuLX7NsTLLYP
         wTeQXaKAtNJYy1YYqAxZPvqC3MXijUwFYiwqywWdjxt5ovfAssmj3SQHPRavOmKDwymp
         VK+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794674957; x=1795279757; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RDeMhjQxfzuP8B5EhYm9rOTi4iwTVCUYu7flDTW4Khc=;
        b=HUBUaSDCkX61HmVYW4uP02UUSxMC1xNtVpaPzklmnf2Q2Pu6lTjKaLrm6u7IGs71u7
         dCVYPEc9jKdcK5p3SrdDFjyu5KtKOUz4PYnEX/LrlE3omqnk9Ygff4ZHhk4WIcBhnxhM
         wjvM41uRLw2NKvebtQqWYfVtU9mYeULNSiC/MqJcDnbQsThaSzLFBlTPQ0Cx5T6vZoiV
         nE7gA9LOa/jIJp5tgr1/UP3IQUYl4bQHGwot0EXDSijfEhBpNViMZ5QqAG3HFi4ThWak
         7YOMGgTPCXvP6gqdpsCeXrLy5wSJRxSI6KKUu2T02PcIrPaBTZzpn519WZFYn+Fuxvj7
         NGug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794674957; x=1795279757;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RDeMhjQxfzuP8B5EhYm9rOTi4iwTVCUYu7flDTW4Khc=;
        b=M6dO4YrE3GrPYyW72vwp58cfQinBrpOPylCCwHbYKmaEY7MGejFS0+MZ59t/8C2DnU
         3GMmBvhU37JBQb2mK+GX/EFscvY61yPgVc8TaqTSUd84ASIFhDSZgFx3Zu8AevaADkAH
         Gt1EcIXBusl4xvKlqm4ix/ENv3LfMxq/i6Xg8khBRAuxHQw1qqBMzVtI5A/0/gh+xERk
         cAzv2QKJNg9FyR8fvzKnBHSidqxKunDKptdAlCq0P+52SJmyefEMy3E28JYuCuJJmNjs
         YUaK8f3FsKv642WmAE40MGblNA0Gh9tkhNx5jRGCIO5w4SVIQZNC3R7rRD352tDNdRKY
         Kp8Q==
X-Forwarded-Encrypted: i=1; AL+hErEcDZuk0bBAxej+LE4ilMYvaP9Uh/TYVx9qeJuSFBs4CxM6a+DMPeXB9VeF89A4t9LEsxbLxb8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8d2ZsLrB45dhKZxfTdBQ/hxN+wd+qEe3r/38Rn4ymfW0v3w7Xr
	pFPYyPZ4yJvM4r6O2YSAMd+Lnud8gdgfEXKoPzw4Cr3UZ6sFVBi7HvAE4Ji3wbck91hPeZWh4hY
	cfHStj1U+NUfBak9kLYJwwsdwlFKbAOuttW/I6UA6qvVYP83/XnL2ke2M2Mg=
X-Gm-Gg: AYBFou2LrR+WGKeWaR+hRmARhQ9MmduNRD0jPyJ/kHQBqCZ3OYHqckb7NkJXQ1/jJUX
	JMaUoJl/FVTWO6xEk5kivJCbWbxZ7xBssRYdXTw2191l8+8c4fr3T3CLfvfvMFJmFnxSOqn3PaO
	UP9FC1hFuGOC3W6T7IazByBvdjvlGmiXesBzY0x++qWkZDEbq7Z9KrKvbBbcb2gkam4H53ZZNnB
	ugdJgMr3tRiYEGrTIK8KilbQaIR7tydJQTLm3KhFHBz+ih32JMkhSezVqLlo1ZJqeh0VVUyz0bk
	MIcon2+dX5xZ3yraGQrvXxOirSlN/yyQkeVGsy8oTnJMAYBLfmlvipjI/Em7kzZ5qfWi2SsALq7
	3+z6BCYbS4UPCBsqUBnlIbqLTOzd+x2cT831IDYxC2aqM/RDJoPRw0YthznbNuanYje0ii2hiiA
	/7tN6yxIeXOg+TZ4fSn/ct1uObp1DVT+td76o5S34QGYLl7TIo1UzDVzK+MZYHgPqWYUiyWNc4Z
	cO9AQU/LB8=
X-Received: by 2002:a05:7022:7f0a:b0:196:aa86:fcf3 with SMTP id
 a92af1059eb24-1b503151b73mr6890040c88.26.1794674956583; Sat, 14 Nov 2026
 08:49:16 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114155150.235743-1-edumazet@kernel.org> <20261114155150.235743-6-edumazet@kernel.org>
In-Reply-To: <20261114155150.235743-6-edumazet@kernel.org>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Sat, 14 Nov 2026 08:49:04 -0800
X-Gm-Features: AclHuK-QU3Yxe1WKxb4qDMVbJXPN0AYI9YN86IRQIoEqA3NPi56ZkIL5O2floD4
Message-ID: <CAAVpQUApWZVqDbkt3dLyJ1bS0gA4+676tNPdchUrihXm9H_g7g@mail.gmail.com>
Subject: Re: [PATCH net-next 5/5] selftests/net: packetdrill: add tcp_rcv_collapse.pkt
To: Eric Dumazet <edumazet@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Neal Cardwell <ncardwell@google.com>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 7:52=E2=80=AFAM Eric Dumazet <edumazet@kernel.org> =
wrote:
>
> No packetdrill test was reaching the copy loop of tcp_collapse():
> TcpExtTCPRcvCollapsed stays at zero for the whole TCP suite.
>
> Add a test using a small locked SO_RCVBUF and out-of-order segments
> sent in decreasing sequence order, so that they can not be coalesced
> when they are queued. Their truesize exceeds sk_rcvbuf several times,
> thus all of them can only be queued if tcp_prune_queue() collapses
> them.
>
> The test covers:
>
> - A small out-of-order range made of two skbs.
>
> - A big out-of-order range, bigger than one page.
>
> - The receive queue, starting with a partially read skb.
>
> It checks that TcpExtTCPRcvCollapsed is not zero, that nothing had
> to be pruned, and that all the payload can be read.
>
> Signed-off-by: Eric Dumazet <edumazet@kernel.org>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
