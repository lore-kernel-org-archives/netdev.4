Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794908102;
	b=bYH3X8+Mve/t3qCcdmdunMMGx3FMqxVv1bSV4HqJNxC3QVCZRfHMByvoo5qxV/vlpf6D
	 nxSzBhHnKmDy1YImAQS63L0XqA2wOnf3rH429NAIwa0eXkiNnKrC5Ot+wIzeZTX1AIPTF
	 MKgN4y6q0fwnbfNc4cQqjzqvRa8rpXIa/ZoRwto5S7kbCjehl2NjO0EcCVfXYbI/XT8Zw
	 IxKi3Ah6mFIqY+IuYLg1EQdIiWoeaAfuobyEaZqGbIlxssHYYQpT9bisg57hTHNgQHhKc
	 PaKORfuOtRsP879gYpwQEnOGIo3SQUOi9hCitL3mIFtbiaDEGW2GozkpJ5sis+ZD3qA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=k43+4NXoe93Lu6IXLeFrYJXGLcVxquToj/t7KJWYnQw=;
	b=p/1wKQnWI6o+v4GisWQN77QetZ/7y/LenVvHzam5QjWMNdsZcwXcB0Jy9wMG4s2ABUiT
	 10ihtwnnmmY3ZVBdSNyPazlVqXxxlUxmvdDPFnJeB20KCKz/8Y2fcQShGFozyqPkcUfTz
	 zsWodkaKkKyMpW08eomoy4o6VgYrNWZOxT80wmDzrMFs62XKWdLtj3RWDrtcZppcszfot
	 PJ5nZKw4E0Bnq5UcEpZkr2NlChdxgqxLUnXvJO5+UnxhDltzj2nU9p6fFf+p8F12/oefY
	 RfhB1OlmQDseOil+IaBFhBRnxjGn1DzJq6gqYxiTdX+A+Tu6h7b2aENSZGX33ohA83A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QOBf4hu+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142CC606A32F
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 09:35:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 142CC606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QOBf4hu+
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-170135e43c7so7057459c88.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 01:35:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794908101; cv=none;
        d=google.com; s=arc-20260327;
        b=CdzkCVh3inuoyFJ7GNa+GYIZtwdJh2JLvKjzC05g6zPqPBwEEVgO+FsnxzJhMDRujH
         237Egj92itZShllITpJNvrqSC1uqWptRI6fePoHX30UHXSDHIahWWpzZ2q34/w1EliK6
         zK2boHsCtV+8Maau7JiZ+7rC1GVxxaKXUU6/5kBhMIVOMYjcWtiiSOQwSxAwYdiWFKEP
         NcEuSZLu2nQTlDT3nz4uUJsontVl9ChzlfihlGXhtDHzQXWG1hj6u3kUNFAv/PlcAjnP
         w6Qu5TxmmJzboFANrJcRp8w6d0QMkbASw/enaMbzD+e5gNL3vj4GwRUbPWkOE4UmCgLk
         pCmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k43+4NXoe93Lu6IXLeFrYJXGLcVxquToj/t7KJWYnQw=;
        fh=KmYMDFh/KNkCVuDcKyuMIHA2dFjVQPp4JtPuO7R8Agg=;
        b=Fv3dVKqOm/t4bf8gFPTsLiCuWrQw7KrLInVef275EPUshus7AZepD+8TDnv4wv5ehu
         eyQPkzfUBYgk3QEcq3rFsNE2Ar7z70ecayv5P5/SkNEqmbx1twtWk645cEHTadHKGxA8
         3xUkSAO8yO6QXhnTnZLrc/Ptara2c7/6x7/43dFtywMsS+X7pX3rLE/Kh/lwGpHojQyV
         HM5+lAHWK4EZHbdgT8d42yRPdURGpzE/0rp3Yrg8Mvl4G633S88t1Z0w1JkYWT+GY773
         TsJRtZxqBmq8BEt+/DwCnYf13YRMQB8FlA5bUme1jYuURp4jTONNNEd4SJEKy1Hf6qki
         QXVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794908101; x=1795512901; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k43+4NXoe93Lu6IXLeFrYJXGLcVxquToj/t7KJWYnQw=;
        b=QOBf4hu+e9P7Tj0w9vSuBeMPpOphD6LpjtcGj1L/uNVodpZ/F5Y9N78nPLRRMAuCEH
         gkDJ2f3/TF3vY/4zLaT/jlJxAldC+6SH23dYTMfq/sv6IpCNB0jDR4vwz7QE3TYQHvg7
         sQsLEJ6da1vKC3PazmpxeXhFh/1q24M58jpc4DmCl8NNnAKDk2Hy5+e+mh9nwUjTFpca
         BusYl7ltL8rCRM79KoWi16IKedQ5KMVcrGXpkAFFNPt2+roB34rX5nD/x2Xes67LmwPP
         NOUwoGYdafEGrCj0KmT6hM8f29woMERR7R8gG3aYEjAoiUKpawViwgFZBqFMAVEDuojr
         EDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794908101; x=1795512901;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k43+4NXoe93Lu6IXLeFrYJXGLcVxquToj/t7KJWYnQw=;
        b=Kgw5or3NrSrM/pk4ZNfE+qca5o5qyC+KNrcVtrK0a3419w3/WKBAo/fwrItkEMc67C
         d8EcFPe+nZUG9L12wWqkDt29/GiGRmLpFU+cFbqe7pOTHi1APDCbrkkrIylOMpfuQ65f
         jxGHVjHGC3pSNkWWZYZ0IULwiTSG1d/4ppLCMh1RwFgL+70/n8v1TkUMpcr5U5K1snue
         IqtT1FAg2+31oQQ0ucESIwEXbelTOeuBSZTVTfoIsjJ1HlY5vBVR+z9pcc8JF+ce77XN
         naeQVeW1xy+8n4lZiVbk38+AySPCfnGlRv2qhlXJyuZoTdkc5eJTncBGvXQkatVJNvCI
         BJsQ==
X-Forwarded-Encrypted: i=1; AL+hErHw9ScbqYInAZ3nOjRk6aMnCQwcJTD7fxt1DxU+R3tkVaFPw1DXjKezZlBzkvfjtl+ammfq1K4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JBkCBh3uXNoMhqEI3usFZ8Twiu/PeT/Iea7Q2vgHr79HO4S7/
	D7zx+HjE8Oxz/KjDgz2W6ZhS+VAlVEKAU3KmIHgUdzqITvpWQ8ROtCY+aA1riYej2yYAEl7dC6X
	TX+mIGge2x5bzhhWkaNniKLUzFs7ytHg=
X-Gm-Gg: AYBFou0LgtxOeJfHfcQXJ/se/DCJEUDQZccqzsJvd/CaUDBs4/bd9c7U6hVjCSdL2OX
	b+Pxyydu1EIcK3PFX5oCdcS09W534wUY+LZPZqwK4iTlNuMRgoBE3g3ECWEZWQ5/wX/kVtX5Mau
	N87wkn63pUEFj6kKX/sMo4M8aSFkBp3T2qPtkB98JWIStU+7ctDG7VaFUkQcKGdmu9Xs/NPbGpZ
	uaTiAdvqNT4VgMCAZxyEXEdqTZzWKEDPZIiLnF1NPHuxhOl3DV25CpkbeOZ/H3EztA5DHWZEaGS
	7VgWxPoTEC68ZVjX73X+QE40//fvB74O0h7YVMf1UWwo20xNbajiFqKWoz/EtL6T76I7EYIpNjy
	Qq9YGoHIMOpsz3PNqmK/tNkXMERXJhu8BRxoGuLFt/G1KV100ngH7Oj5XEZpefi0mi0Cp
X-Received: by 2002:a05:7022:1583:b0:195:e4b9:d326 with SMTP id
 a92af1059eb24-1b503112a76mr12794044c88.12.1794908101016; Tue, 17 Nov 2026
 01:35:01 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117092157.85513-1-hj351016@gmail.com> <179490763326.3291.12558236650605974154@kernel.org>
In-Reply-To: <179490763326.3291.12558236650605974154@kernel.org>
From: khj <hj351016@gmail.com>
Date: Tue, 17 Nov 2026 18:34:49 +0900
X-Gm-Features: Aa3M54qHHMqn46yygTWkKBN9mkAPbQt_LCbx1KdUTLuCMqi04h-jEycpKTEF0pY
Message-ID: <CAGr5VtO-aiy-RpUsnw=dKVFP0wgvBnQ7uw-NWr-4391WHV7iHQ@mail.gmail.com>
Subject: Re: [PATCH net] l2tp: reject short IPv6 address attributes
To: netdev-bot+sinfo@kernel.org
Cc: James Chapman <jchapman@katalix.com>, Jakub Kicinski <kuba@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Chris Elston <celston@katalix.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The issue was found by a static analysis scan (pattern rules for
NLA_BINARY attributes that are read with a fixed size, LLM-assisted),
then confirmed by reading the code.

It was triggered at runtime on 7.4-rc1 in QEMU: an unprivileged user in
its own user+net namespace creates an L2TPv3 IPv6 tunnel with a 0 or
4 byte L2TP_ATTR_IP6_DADDR, and L2TP_CMD_TUNNEL_GET returns 16 bytes,
the missing ones being stale heap data:

  sent 0 byte(s):  41 41 41 41 41 41 41 41 41 41 41 41 41 41 41 41
  sent 4 byte(s):  20 20 20 20 41 41 41 41 41 41 41 41 41 41 41 41

There is no KASAN report, since the read stays inside the skb head
allocation. The leaked bytes are non-zero only with init_on_alloc=3D0.

2026=EB=85=84 11=EC=9B=94 17=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 6:27, =
<netdev-bot+sinfo@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel messages.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
>
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> --
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
