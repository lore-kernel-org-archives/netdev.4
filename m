Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795637054;
	b=CDuPLUU6FTLCgWHKtVtv7sJAIj1aZR/XrOMZPMDLhP5pkltBA/OfWwCE8x0gQlESNLYD
	 56gJZR/gPo7/3r5c+D45j/dr4oRUoNIptyTmtrxbHYmf/u6Zt+Du9xbMqaNmMAr45RZvm
	 jIsH7TFri308eIn7WWaEziIwbIN61Ef9iqRtv3T9Ja4ZwRlzoNnJjvJDT8wcOHW74RTgz
	 ObNmZaK9MXPyjrYbwcKCBTDrMxzusFYqhjQp6wjiuIRIUI+UmfiX2AbS6cudvgeVBwEoQ
	 Oc3LNlMdnO4aSbaFLza/HgaUE70DvugZy+OZXx2dPw7u14PjIyT8TfRbQd9+c6loKOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795637054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=XbA8xSo/0EvP3bC+6uqk9zXWFfD3XB7Srs6wgP7XMNE=;
	b=O4lM43DM8Kxsn5weU9+jWgdW4ELWpaTUsk74DxUDo4mqSNC5bPxjuw5fF6+QgrDmY66X
	 cZHhsTUfivbsmxl5kgnwdIUwEITPrT5JN8QvwXBwOVtnLPNUzLFOcWJJ2YSf55FAp5RU4
	 7VHCflvOI87Sph72w9M9AFKWfgntz29Ut7W4vtaWONi0hxYblyf80I95l5dz2/FnMgzmw
	 4zLjYErmSg5+TlPcEILqZVCn8vbjlTXLR+M6cdZwXwDaLJ06HCreqQ6NjjdO2AaW8p4Aa
	 ijHXf0V2xsdJENtFpa42l3KPAhikI/AGddNEoWvD+DAG08E9dHs9yeU7Ji0in1XyEAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andrii.net;
	spf=pass smtp.mailfrom=andrii.net;
	dkim=pass header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=X+Nmy3Pu;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602F6606A33F
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 20:04:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 602F6606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andrii.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andrii.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=X+Nmy3Pu
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cde84cb8803so1624345a12.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 12:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=andrii.net; s=gmail-2025; t=1795637052; x=1796241852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XbA8xSo/0EvP3bC+6uqk9zXWFfD3XB7Srs6wgP7XMNE=;
        b=X+Nmy3Puuqqf4o7Iiigbk6Dm4/3tNwm0vWiP/LoJitR3bDbsnNlDSx9ypWR+9O6MId
         fnSShOI5dopdTEH/ymJtP9TVOqdvMM24XjAyeDmO4CJEZYSKVCvFYZLYdBpFeE3AmSFo
         3azayYBE6wB2qIalrb0xKeV9A2iEtr972pbUQSvZdUKNkvLHC2UstIlNn2xYXqmg4ame
         1zT6VAGwTcc9cUih4Z+Eck8hYh5qSbmkH9X934A7R8U5i1wGydFOuqkyURx37kRvJLrB
         UvYiGu7SFNI9G7Fcqy+K16g9gdMFDn+iYFDe+TnMQGVlnBjAJvhqEnEOL7wAYnCucHLM
         arXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795637052; x=1796241852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XbA8xSo/0EvP3bC+6uqk9zXWFfD3XB7Srs6wgP7XMNE=;
        b=lSESybup0SaA3z+Jp1U//hxXw2csknW/42Zbn5ET6AY3HrDH/vVF1I1hanOyPkMT52
         SRvky8kRhBjoxUBDWRIvwcA7NYawotzoBmz+CkrZauX2A1Avg6GGXkd6LVhmxYBZp6ft
         0dDnwPmLyCpxaLUW1DBUmQ56q6jd/mH1MESwurh8lyEqnqK6ITaAATt7kqPi/EAe0rmU
         Ej0QUIxd02bZ1Ba7WUskFv0LyUeS2KuM/VZabJ8x6P+EUWL8V/5cstZWmVUescsHE7tS
         2GXKFZKI/3fayI0nwcucmGJIPX0F4a5IROzdSQP54U5jBe/tySxyZdTopIWzi3m9VQ3n
         yeFw==
X-Forwarded-Encrypted: i=1; AL+hErGzoM768ETIFXUZArb3OpvDi/BhqDdBKJPyIt5o9qbDuMotT7Tg1Rt2bOzvVo/zSkWdynTf/Ts=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aJizeR1d1gSCaFKR1gUxKvNbhtq0ACCm/CwfE+AfGAfzHgI43
	pIyXXD2FaxwIZorlfTGa9C9crkmsGLaic0EZ5aj7/UoAyAlQrcQGrwMF15uetGdalcp21nitI9p
	KFFX6nREkuIjeP9T8pRua4CrHGj0k+SBmscxJ6cPPieu/lXSGsY8l
X-Gm-Gg: AZFdTZfkRTXZNjTsWpFPMhr926V0CVQvXJUyxn6NMmPCQGmIicpk3PfnBvOBT4PeieM
	qCLf5RFGKiONuT/UQXYzu7iA09kosM9qwXTIN5uVQT/gBezhlT9hq9+917O/cdkc3PotlUzEeZT
	3I6X5oaG4NAEyGjKZDrrD7o5r7vt18RpFs0SXzwUoLomZNfC696kzoxdDmEOIL55z8ROKlvDM9c
	1cxUcEluVQMT/KW+R6+AfeAodsvGJ9C99DelA3ZYLKdQE2ByfX7zqxFhswnPmcn1872jc7B6ioA
	WZ2+Jri/ccVrbBzXJGWrHW0D9Xfkwsrb5V6JWobiYeZ7b+j/BGrz0SIsg39I8qFL/H2IFy1hllr
	w5rMkYx9kHc+mjZVVA4dYfo5P7kI=
X-Received: by 2002:a17:90b:4e83:b0:3a8:32f2:f4a5 with SMTP id 98e67ed59e1d1-3b41c956a0cmr18014294a91.53.1795637052486;
        Wed, 25 Nov 2026 12:04:12 -0800 (PST)
Received: from andrii.ai (mac.hestia.andrii.net. [2602:f337:ed:4865:7374:6961:204d:6163])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41d224ba3sm7118846a91.1.2026.11.25.12.04.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 12:04:12 -0800 (PST)
X-Relaying-Domain: andrii.net
From: Andrii Tereshchenko <opensource@andrii.net>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Dmitry Safonov <0x7f454c46@gmail.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH ipsec] xfrm/compat: pass on the translated length of a socket policy
Date: Wed, 25 Nov 2026 12:04:09 -0800
Message-ID: <76b0ddfc-33ff-48a0-8113-db94076f2473@mid.andrii.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <5249741d-fa84-4d54-bf77-45f48dbbb169@mid.andrii.net>
References: <5249741d-fa84-4d54-bf77-45f48dbbb169@mid.andrii.net>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The netdev AI review [1] raised two older issues, outside this patch.
Adding Willem de Bruijn, whom I missed in the Cc.

Sashiko (netdev AI review) wrote:
> This is a pre-existing issue and was not introduced by this patch. Does
> this translation also run for x32 tasks, whose layout already matches the
> 64-bit one?
[...]
> Would compat_need_64bit_alignment_fixup() be the better gate here? On x86
> it is in_ia32_syscall, and net/ethtool/ioctl.c already uses it.

Yes, confirmed on ipsec master with X86_X32_ABI=y: x32 requests are
translated as i386 ones, so their SA and socket policy requests are
refused and a NEWPOLICY loses its template, leaving its traffic in
clear text. Gating on compat_need_64bit_alignment_fixup() fixes it; the
fix will come with the other xfrm compat fixes. x32 readers of dumps
and notifications still get the i386 layout, which needs a separate
af_netlink change.

Sashiko (netdev AI review) wrote:
> This is a pre-existing issue, but should this translation be limited to
> IP_XFRM_POLICY and IPV6_XFRM_POLICY?
[...]
> As a result, a compat task's PF_KEY socket policy shorter than 164 bytes
> is refused before any key manager sees it:
[...]
> The gap came in with 96392ee5a13b. That commit replaced the
> in_compat_syscall() -EOPNOTSUPP refusal for all optnames with the
> xfrm-format translator. Could an optname check be added to this fix?

Yes, it should. I have that fix ready as a separate patch, which runs
the translator only for IP_XFRM_POLICY and IPV6_XFRM_POLICY, and will
post it with the other xfrm compat fixes rather than fold it in here,
as it is a different bug.

[1] https://netdev-ai.bots.linux.dev/sashiko/#/patchset/5249741d-fa84-4d54-bf77-45f48dbbb169%40mid.andrii.net

Andrii Tereshchenko
