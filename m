Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437217;
	b=dW/u3TbZn+hsx/jsomHD2vxFiIqApXnypJks1NgF2aJJnsjZyPePt1u+qXhv2pewGX4N
	 spKbe76Nrk42lK7FmCmnIuefFvG+WGd3JV4Kdb2VgMtUIBg92zHiDQWvJU+EAzGgRNHgI
	 ygGPggCE0GZ2eRoGXpT5HH/j14eVwOz2P5XJTifyMPumslagBVzM6+zeoNRfEwQBg8Z7a
	 2KmFXomRC5JBRPYDTqaIfCh/BpNSY5la5+47lyPeoXiNyRIVRDXFDS/wGMhgtzuefInZv
	 +KNyqdtIQGbav0ltQ+ssLqH3LP2ueZksAsy5mnlXsozP6K0RoJUoYx+e1jH4zas0zpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437217;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:From:To:Cc:X-Mailer:References:In-Reply-To;
	bh=J0mlNUxeHiFvmURQfRnhNjQjYghLvFoxyIdXO0EVi9E=;
	b=o2VmzaEuNFBguIKg8WQgUBxihjrFobJj6pSlSbUkt1p06HVtAPEooY/r1I1MuDsszxzM
	 PPZJlaoTgs07yjD13SKah57gvwRm50SwCA0giGDkEoJUbNqVFrHyQC/LkPuBf8+xNiJAx
	 himoHqN2QyrL4FFApqZpeTghs5+AXP4wXP8jk2iB7mdSXTDi4mcxctuHeb1E15Po76EX+
	 U/t7b4rYWiHeuURJ+hBqbSCDgEtkwOl2RwyeA1YVJAm1a7xvMSAv00TWMGxuDha/V0Ths
	 D+EQC2uYIbMozfv9BspqdtA+eBXSFgRYLGfPMKL30Rwwnbi64URsy+YgiV6JiZivgaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b7usWCHz;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E4A606A321
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 12:33:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55E4A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b7usWCHz
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b503e2a87bso31211757b3.3
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 04:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795437215; x=1796042015; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J0mlNUxeHiFvmURQfRnhNjQjYghLvFoxyIdXO0EVi9E=;
        b=b7usWCHzIxH06fYfGotrQgPVLAmQ3sWKSBQiYFomKOR1WG9RrYxCgghN5xryJd8aa6
         I7QJq55FrNH2VuK5wByTae3ZvEPs8yxhLG5gaiAM+xYeoGoJNVqDsFy32aUK0AJtpTdq
         D78ot97LeUzcEUkhfyorOUMIj/esXbrJ/wjakWlzrJo0XjhHt4WkexbHjpNCTPX67slJ
         36CKmmhtVcOSioQ6cdNsixq8eqPWaI7iyBZsQOgqX+p4gsgXdWGgbWM/eQNhxwlEWeqn
         V1l6m/NP8B2sMsm759gCJ5b5kr5ikU8Zo0KzFfRJh2dp2rTjXrvw2lUmrdawOpHzwQ/F
         9XXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437215; x=1796042015;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J0mlNUxeHiFvmURQfRnhNjQjYghLvFoxyIdXO0EVi9E=;
        b=WMGt01fo2sfrvM82jQFOwugOxNJfCg/DdN7uvpHGU7MxCB0bvY8fBPMpEe5EAIbM9U
         XQg83v/ITIwigHYbLp+FKYzbRMkwWWYRK8Ar7+wpxTWig2tqea1u9uQvdDkXFtylZm5l
         El8yBaWpM8LY2Wj06G1Mzf58jzN3KgpwFnYWq9PA1loq5yYxx8FIrlkQ8wJnfKFPE//H
         XZBb+cmjm0gdME9V6e6GUjA46PTd0qGn8O7r9OM3+XtD8FdJWEPvw3td4Z+YhDr2FDcn
         tPt+Q6meNZCaWW6q0HQyX4WZJK3WoV6WlmfjteGWZgSPPXVPjuBCWWH5KZdEcY6Y88Zb
         Mmaw==
X-Forwarded-Encrypted: i=1; AL+hErFxPkJtT2vQwjJq8hFprCed4XPO1cBG77K9CpsrQbauwlRfXmdTVkwm7SjfqE+vI1rOlNS3hME=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2sXx8/QoVIMXYHtDwKAFblaJbsKX5pNXdB40y20Wsxa0C3PSW
	O3m0DU47Gujd93P6V28wtBnSZ29ZQW59s/GhaI1vqw4qZfaZb2Juk+El
X-Gm-Gg: AZFdTZf9qmqQZ065/Hc9IccPfaTBjz2Tt02Vt5hLPJiqXSKZ4eR8VfuSjaphOVe12Ud
	sshMEDL6uvBKlUD449tzWYyub0dbKDmygxhNUehei0NT5cCb0bIADZa1O9oQSHv3JG0ffXBUNoy
	LmsZmCzUeAArt92JfvB47kUtjbuUopiIrz6YNaIH9ve5cxwsRk+JCxa1eZ8/ydyjXM5xG2kfDWX
	FtllfoAYs+B7Abj9jwjQv/n3Ane/XfldOSc/506RVj5CCDH1v+ITw+QXZ8ued/sTjQxf4ssWrN5
	UdCkJWMKYYKJ2TAALPg01ZASBvjsYMQfwbHKJONoiMf4oIVP88D4jpLwiHtQ56t4xiCaBnJwSAl
	0DBxIPrmjLMSmGB9z00L1T1LpUN/BOIS5P0BD4vC5ZHAYKg4eSop3QMFIrp30RXaj1bgEsyA0hj
	vLowzD5de6sveAsOgWnRhrS/uFHTEVy8LVRZgVOPDBWIaqLUNUUeKYfHjEam8qhPduaGzYpen76
	dJel/rheYY3Hpt/itsu6HNmu20mWBALC/6Wl8j6vIH5ImEOsq8HaJei9/CivEfPd5VhqiFw9YiT
	mkj5+SeJdfJZWKDvfd95yJHaT0qgKPwxQKQ=
X-Received: by 2002:a05:690c:610d:b0:8b4:deb1:4b18 with SMTP id 00721157ae682-8b520442309mr48137067b3.18.1795437215079;
        Mon, 23 Nov 2026 04:33:35 -0800 (PST)
Received: from localhost ([2600:1700:4a51:2210::11])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b520ca0cf8sm41807657b3.29.2026.11.23.04.33.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 04:33:34 -0800 (PST)
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
Date: Mon, 23 Nov 2026 07:33:33 -0500
Message-Id: <DN2LDH2V24NL.13URJFKPGO0N@gmail.com>
Subject: Re: [PATCH net-next v5 6/6] selftests: drv-net: psp: add rekey
 tests
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: <netdev-bot+sashiko@kernel.org>, <daniel.zahka@gmail.com>
Cc: <kuba@kernel.org>, <willemdebruijn.kernel@gmail.com>,
 <davem@davemloft.net>, <edumazet@kernel.org>, <pabeni@redhat.com>,
 <horms@kernel.org>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
 <rdunlap@infradead.org>, <donald.hunter@gmail.com>,
 <andrew+netdev@lunn.ch>, <shuah@kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <willemb@google.com>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261118-psp-v5-6-b9ec840e0296@gmail.com>
 <179530218434.3135.4343666486290603431@kernel.org>
In-Reply-To: <179530218434.3135.4343666486290603431@kernel.org>

On Sat Nov 21, 2026 at 6:03 PM EST, netdev-bot+sashiko wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] selftests: drv-net: psp: stale length n in run_session() after
>   tx assoc
>
> --
>
>> diff --git a/tools/testing/selftests/drivers/net/psp_responder.c b/tools=
/testing/selftests/drivers/net/psp_responder.c
>> --- a/tools/testing/selftests/drivers/net/psp_responder.c
>> +++ b/tools/testing/selftests/drivers/net/psp_responder.c
>> @@ -247,6 +354,16 @@ run_session(struct ynl_sock *ys, struct opts *opts,
>>  						fprintf(stderr, "WARN: echo but no data sock\n");
>>  					send_ack(comm_sock);
>>  				}
>> +				if (cmd("rx assoc"))
>> +					handle_rx_assoc(ys, data_sock,
>> +							comm_sock);
>> +				if (cmd_w_msg("tx assoc", struct assoc_msg)) {
>> +					handle_tx_assoc(ys, buf, data_sock,
>> +							comm_sock);
>> +					__consume(sizeof(struct assoc_msg));
>> +				}
>> +				if (cmd("key rotate"))
>> +					handle_key_rotate(ys, opts, comm_sock);
>>  				if (cmd("data close")) {
>>  					if (data_sock >=3D 0) {
>>  						close(data_sock);
>
> [Severity: Medium]
> In run_session(), n is set from off once, before the do/while loop,
> and is never updated. cmd() still tests n >=3D sz and __consume() tests
> n =3D=3D sz. For a single tx assoc message n is 49.
>
> cmd("tx assoc") consumes the 9 byte string and moves the struct
> assoc_msg to buf[0]. __consume(sizeof(struct assoc_msg)) then takes
> the else branch. That leaves off =3D=3D 0, but the 40 byte assoc_msg is
> still in buf[0..39].
>
> The checks that follow in the same iteration (key rotate, data close,
> conn psp, conn clr, exit) still see n =3D=3D 49. They memcmp() buf agains=
t
> the SPI, version and key bytes of a message that was already handled.
> Suppose those bytes match a command string. For example, an SPI of
> 0x65786974 with version 0 reads as "exit\0". The matching __consume()
> then does off -=3D sz starting from zero, and memmove() gets a negative
> length converted to a huge size_t, which crashes the responder.
>
> The conn psp handler already has the same stale-n pattern, but it
> only leaves the two version bytes behind. tx assoc is the first
> command that leaves an arbitrary binary payload at the front of buf.
>
> Would it make sense to have cmd() and __consume() check off rather
> than n, perhaps as a small fix ahead of this patch? Then a command
> could only match bytes that have not been consumed yet.

that probably would make sense, but this is mostly a preexisting
hazard with the demux loop, so it would cost another setup patch, and
the issue is still not actually reachable during test execution. The 4B
SPI would need to alias the string "exit". That won't ever happen.

This would be the only reason to go to a v6 for the series here, so let
me know if you think this is worth it.
