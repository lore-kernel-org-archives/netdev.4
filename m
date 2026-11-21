Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795226818;
	b=U+zrPOxMtQV4DRfY+LKXJesXZORe2jP+dZI9kqpq2LIZhbKg4ItxexhACzC5czh3S9zQ
	 GXlE3oM8S1hKmbd9UME4FYxAqoMwbC1xipambiQ1vqXnm1RXTi2krWdcOYvqFGKtQsTFh
	 DaBshtGjUQnX6H7jZkRCqDxUo8ObvXcOUJtjER/n4MvwYvg7JwnQejqTdZ+7QE2YfPxHg
	 SmyVmGxvrPpnc5sEbubJRbhDCBsX1QkAbE93rzsvVh2506I9tWvi3lNwj9TX0vwePfPvV
	 23jEdiPMEjFF6y0IslLdCO+5emaWo0XeBpphG31Ks3iM71LJ+MD+nWKc6mBBTRf88cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795226818;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=vVLuUuI6K1ifz1GqKSYzHprCpYxeZl0+IrxVN2vu0Ng=;
	b=s7uuSU1tSByWZLB4XXGb6sKMMQuytuTfExLbxW1wKOUHJNBdJEDqQiOWXb+rWiyB8mNl
	 PK6Uq3VYck6bn6Vr5dW6z+5qvDG0xUExtHd+V/ZeU54Lww1InfG7mbNLqeaKuKjtK3wUz
	 0anPD6y7LSelfposUTmhWced7aMhtZ5ohczWnRaScpZjr4EY8gOZ+UwkAXRjsMD0GZkUv
	 dr/JlgmMeznq71noK8IcI7R5v2E7pZJfVHsdtYtUHlMbx6ENF95XNOklXvQRxE4xwbeJa
	 LYxIEp56LY4CHAhd58og/4s7Hf6I4V8F9iBT1D7nPgbOeljW6w/Q5DqpGEm805ehpdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IdnzAlce;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718A6606A6AA
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 02:06:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 718A6606A6AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IdnzAlce
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f02b9c1f6fso10422185ad.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 18:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795226815; x=1795831615; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vVLuUuI6K1ifz1GqKSYzHprCpYxeZl0+IrxVN2vu0Ng=;
        b=IdnzAlcejCgRfV1yTDlJ7JIXQKOF3i9fDJ+P+8gEkJZsOhEe4ALRElG8HRM6exjIny
         NopIK4jtjjEpBRi6NrLDXdlevi9shStO7+tGo8DRFcSB5vv1jJJkA5cquC0yRkXk2cQ4
         wJxXCGenDy89ljTPiX9F/HOX/pim1azvz5SwQ+TrLiNTS1MZlvqrtV+jk8rwb92LoklP
         f7Eq7UBwWYIPUezJ8AO9gyKpqjBLajm6oyv/pZVxcE6uSMpPrR4e0WIybPl/MQWhJ/kt
         O8xL4r5EHL0acB/ce4nPFbfXE7FBybhS0/4jnshnXsMcOimlXzKPzCvpXNp8VLXNQQDg
         8VUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795226815; x=1795831615;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vVLuUuI6K1ifz1GqKSYzHprCpYxeZl0+IrxVN2vu0Ng=;
        b=gSieXWTH9LjxCVQk9QMyc8ZMMh6xP6OFsFbn+VQV6Rx8BRERiWZVTs2FFiVgJpt1Zo
         fwlvwrTA2Y9Mp+w0zZyVYe0wz39BT6tN/YE0Cvk2RnyzAfiLQddcoXU6hiF9td4j7e+i
         EGOf0Map1XJ6iV2tzHUX/AkL5gn4VhLJHwVmndO38McVoPyYOvmX6WiaFPFyCnbp3M0K
         MLFe25gcScGs1BgR+6jE0mDEyVZKUq1f3nSzApoSnFLSdTdOs0TcvOX/D0t0qPmiSLcl
         rVTflPmatFyzg3h/+s9lmkKD4SgBmHJngBgPRW2x/gRicEb9tsE2ZshYxrpdsPnGvDIB
         p+sA==
X-Forwarded-Encrypted: i=1; AL+hErEPyvmsB8YcColXbOpDHmHxuMzrdGABHkJAPOIazWEsW5zSOGxoiKE3TgPr3s+gcNZzR9W+3Tc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9L92GU2MxRkwBfFFn/0C2uprkP8vo//ksEJPcadaCM5IzIFUKk
	Q6TRl5IkoA9/qYP1Yzci1Xkplnn8soyQa0RepmxuTRx50koG9w89cbq8
X-Gm-Gg: AZFdTZdJRvQrSX1LSh2hkALOIbR3XQtkcIQBPJw0njAAC7cou/p5Zv0YPCs7i429/Oz
	lrOgrfp7BvdhUZ57X0YaOcuLHPSzjzG6vAqQPP+xOBqw+a4ms+c0FJXmfS24S8X6TvPT08SkDlC
	1X9kmfaREU0aYa5LneLBaLll7cGau1tdGfokv2kVw/0TiE6BAivzNr65QtqqpXXeoiUzM2SoP5A
	JLhADMWDGYe41cEg4Qrr5a+eg1njwY0i5A/064rQYgoMrqa7ZosdqMe+ExfNqkl4WMsJl4YuRf5
	QaIrrTzJOqt0rWLaTFPbXcKWKjIjwY6xSIkFiyMPM2dL2JIeU42yJP7sW1i/LZ1Eez3q+fiDe0Q
	A5mA6+dkjt2L7k4Kg0qZqkA2ZLikuX31KP4q+kpcOCMObWq8nkClBfNw9lTaozWzeoajIcGmA5c
	9MbI3Bzx4krK3hqlP2EEdlwLXCc1x26ykYtyiHURNyPVW7xlrw2TcWUcHuFd4NvmYzB6rJTn20W
	4puibhgfR8XiYa0Rt+1E/RhhbsnFOKSQpAySW/iPuITOIt+HJps+Tq12engbDGTD5qLrEN5LfGM
	Jbs1vLBRctpv5+hc3UNk+bSJSCD0gN27VhAP2xmjzuVb6Q9QVwciIdQ8B8IpDLlHmhek8/qv1Ha
	LNGRtN7bkfusVCInz6ErIVtpQw6AedFJmMxP+Glx5LwcQbuoyWABREIUF
X-Received: by 2002:a17:903:1c9:b0:2e2:d3ef:125 with SMTP id d9443c01a7336-2f03efa3ce4mr35706575ad.5.1795226814533;
        Fri, 20 Nov 2026 18:06:54 -0800 (PST)
Received: from localhost ([153.61.198.253])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0dcbe3sm20984035ad.28.2026.11.20.18.06.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 18:06:54 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Nov 2026 02:06:53 +0000
Message-Id: <DN0ISKVFQRMA.2NQOCMINC8LDX@gmail.com>
Cc: "Maciej Fijalkowski" <maciej.fijalkowski@intel.com>,
 <netdev@vger.kernel.org>, <bpf@vger.kernel.org>, <daniel@iogearbox.net>,
 <pabeni@redhat.com>, <edumazet@kernel.org>, <horms@kernel.org>,
 <davem@davemloft.net>, <shuah@kernel.org>, <hawk@kernel.org>,
 <john.fastabend@gmail.com>, <sdf@fomichev.me>, <willemb@google.com>,
 <petrm@nvidia.com>, <bjorn@kernel.org>, <magnus.karlsson@intel.com>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH net-next] selftests: net: don't warn when bpftool is
 missing
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Jakub Kicinski" <kuba@kernel.org>
X-Mailer: aerc 0.20.1-355-gf870624f6c37
References: <20261118165338.1064930-1-maciej.fijalkowski@intel.com>
 <DMYSCT1OYI5F.2HSYP9MZ2BRJU@gmail.com> <20261120180307.363312fd@kernel.org>
In-Reply-To: <20261120180307.363312fd@kernel.org>

On Sat Nov 21, 2026 at 2:03 AM UTC, Jakub Kicinski wrote:
> On Thu, 19 Nov 2026 01:11:08 +0000 Alexei Starovoitov wrote:
>> On Wed, Nov 18, 2026 at 08:53 AM Maciej Fijalkowski <maciej.fijalkowski@=
intel.com> wrote:
>> > Based on the bpf-net-xsk-move tag so it can go to net-next and bpf-nex=
t
>> > through another shared branch, as Alexei asked: =20
>>=20
>> Acked-by: Alexei Starovoitov <ast@kernel.org>
>>=20
>> Thanks for the quick fix.
>>=20
>> Jakub,
>> could you make another stable branch to pull?
>
> Are you sure we need to fix this? Do we care about the bot?
> We have a similar warning for having latest version of liburing
> in drivers/net. I think it's useful to let the user know that
> they are not building all the tests.

the bot seems to yell every other day 'regression' in capital letters.
I suspect people will notice sooner or later.
If you think it's ok to just ignore it, then let's do that for now.

