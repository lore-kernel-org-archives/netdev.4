Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.130
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795588326;
	b=VGkfMIOSsK8essN/WCJgEetcwbJSuc8dZofCYq/9N1QGiIGKtalAunCh9FtrtQv5Uh1t
	 kO0O//ctrSDSY2VzUO7QDBQd8IjULYk+6d67tN9JjhSCztV+6z8uI0juNyKat+sOBnOeX
	 5SrL1PdxftNLMm2rL2fc5ENXuNpMt2z1zTHmpvQriHtW95miyDMcaPfyQDDDewyXnv6Ky
	 iZyVo4W4208Vm1M+ZBflOcINpQrN0unFGi17k+Fk/Y6wlSOn7P1WFwZzPr7a7lYcVQ8aw
	 PxCcHCqI+VzNK2SvKJC9Kgd14OiFU5Et6Ak1Wl7QlHzcdR8ftT7DqhXjiV8kBXbYVCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795588326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=+mF1WcvHj8pRL5/pxPkCphpKhRYTEeKXsajqKsjUS0U=;
	b=n8opTENLWg5T7AcMt2cQn4F/5nMiFdruzJjyDcWsNTUkGkmSHsAbTbeSVoscd77S/MOa
	 TRhv00rj5P0ZeYdaf8TsSc4Rud1XqY6wYg/n4SdyhHhcl1EBkclx2tkMwPwUyfWd0AIQU
	 LMmxN7k/5wtN1uv0L4ik/EbcH0gQVbo80FzLtQbV26bJKiTIWEQStuXmrStfzH3q+xSK0
	 K8F8O/QAQSlU8Dnu2xEhdCnBxMGvNlZXozFPWinrFwXIeLbyeip2QQJO+4GSg1Yu/EU76
	 QUAY5LQVwdDQuoXVu0Mj/d3gyarqzIaciqIyyDMmqaIFDYmF78tXzwyrlAFiLcIg2cA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IIEfGxAp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.130
Received: from mail-oo2-f2.google.com (mail-oo2-f2.google.com [74.125.231.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD62606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 06:32:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DD62606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IIEfGxAp
Received: by mail-oo2-f2.google.com with SMTP id 46e09a7af769-862a5ac28e9so2531973a34.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 22:32:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795588325; cv=none;
        d=google.com; s=arc-20260327;
        b=e3P662Y3efHM2kwrdmPlkGit4tfmb43S5eCMG54Icb/4GOzehRvGll98L/jAUOExEb
         i1BAkabwPmqWHH5xG3DRv5cXuO0eFfknhZaWv4VDaDHWlBqllOVv7NEbl2DoiyAU1FYW
         xIeR4nkZRQZ6dWU23gcvp3G32vZSis92VpV4TYMp8IfKyJDI33tmpKMxN/vAqfLcciWw
         A1Q3PuG5fQ17j9mtrv1QkoQClpmil1MQH5+knVH27Uxvq4HG+0QzqEamC6XmJQx1BWQU
         /uRKB2bP5C3p/8m9XghNz7dBDEEyn4OzrGsmGDoseaAqQWtuFQpmwtgU0/fdt6qmDNq9
         wpxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+mF1WcvHj8pRL5/pxPkCphpKhRYTEeKXsajqKsjUS0U=;
        fh=RIbACd4ImY6XeeQoHCYx4elz0uJPphsZbBbT6csDAhE=;
        b=nqizZyBAoprvi15IWvSjxulioOGIQ3JvgrFs9Gj0jqASNbV7p7jw/gPwn1lBxqmtwP
         drIABO3byNNoaWwykqAE843eWAgsIiKmEPskAzFVd0+lik7y4njjxpWJmxsi0luhEJkM
         etVxwstk3Qkt5dnf9/2ygwY0DFNULcAZYGQewVaPtQfoB4IueeMuGBJ7GgI1qk2Tm0Ix
         durzZ4nz0DSBDV5BCQBbG9k7jcuQAmosEIvWZe7hr0PwtHro2YNKWYD3ShLpb1ZdvaOS
         7OvVOWGHtGIZs6nFTkA3i+WJVpPdUeWowdSTU4OBpCIysHSrhGj4/aW4jHWnXuIGDIzD
         B2BA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795588325; x=1796193125; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+mF1WcvHj8pRL5/pxPkCphpKhRYTEeKXsajqKsjUS0U=;
        b=IIEfGxApDoyLixoJfhMcsQd48vazhOSfD/9UWMXG0UFJp7iQ9IsDfq3bA9lXxNcxZP
         ie8cwIVS/0QKrjw5qVhziGD+mhhJ6EfKGaQ7RmNts/kJ2TUXb+e7jF7Gtd6LayMXE1Wq
         Yl5sBkAqHPmKLxWjvjLWiTtsLHc+9a2s1TFN70MO254+3Xc/i+K/qEHMUN1wGM3mFzbB
         NOqPgt/9pFUgfs8P/wYjmcIhOoDl61oWHMsaxDynZfRkR81n9grKuX+4Q0jip7CJHWOe
         PL1bmrThnYHxXkEtiav6RvZntpH2wi6ZZnoWKAMGM84ReZ3yCwQNlVuiAj1Pdur578/V
         PcaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795588325; x=1796193125;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+mF1WcvHj8pRL5/pxPkCphpKhRYTEeKXsajqKsjUS0U=;
        b=brdtN7UWUwZKsoLsUcDLqSRbrWIKRnzdSf0pfkzczJn43hQ+RjQs3gdQL79ZHCAFz9
         FvcsI7i0n+6CJiLp4uD6qpDSh9kfQp2vNxb6Y4v4CrMn//czXfrGEQL5pQpoW3tVqBCd
         gVftkqDHuQWlVTnhp9W6uEKBJ1ntQe1IM/lgpvTfTV42HeiYwOO++j+/aqqr0rbty2Ds
         6Hk/04/PkhbLtoYXrERjcKycKWSbJ0+RG7vBtfFl/aTVDVsTDbaPuhJDqXkjaBktdGN3
         CSRWjWhb1A8AtEgQn46KbQKYshjlYvEbh0xRgm/N+QGyiwwGlFmB2BUrGm4nUmvmlolu
         mypw==
X-Forwarded-Encrypted: i=1; AL+hErHngmxjkIh4LuVUAhH72+e/vY595u4pARkpT9eHWnm3tqcNM9ZHPCoywmxpPgOMtVmuohvsJnw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Rzp9+Np4g3jmqlyLiks0MMik88RHKnFFtB/Skkl7zpzrEiIXO
	rnfDTGVRyqtAF9qjuAwNOyLIBadLc2lgE4vk5e3LjWOMtnVFUY083Xe78kRuS1K9pcJh5SXBViF
	mE13+/zE3KoNVdwPvRyc1CxZ4Uv30zi8=
X-Gm-Gg: AZFdTZdxNXfiSGnxSx3mCpKQPvBTDWYvwqP1sbH/iG+IXnrw7GSOwVnLDbEor8TH1SZ
	dJ9GlIvKrRsvbIGlxgZ1Hw4kyz+VNVz1hntiA6ufHmg1gi3/zWqzXznyEGOnGiKE91sVtnwAp/g
	TkxDzQhVMuYP43nz9wgFACh8rN0k2z4rw2oOZ1ajBFcXXdRV68NLNDMrXXptQo4atMx8Fk0lXwK
	8SdPzE2OCGrQmhHdfDHZ+ubmhUF1Jzg3CmF8WE6erj5JjHYXg8EMtWajxpaps0UygzNojdgIhlg
	+MuRETidlX8vm+c35iBCy1uReqlFSBSMZegEntoJmGwbL52z9VApfoR2poD8prlHiih5YdwnLqG
	1tm/KDEj1rziJZkukxRcU8gkCP5v5YG9Zd2gReqfRhMZ+Zfk9nw1XfjPgMoCdELn42ghwmEWwXg
	oVVdCtl7MUGKNjhLZfAyW9tXWQZqsMWeb6VcReJ1beQaAeVvVYPrNl
X-Received: by 2002:a05:6808:13d5:b0:572:dc48:b773 with SMTP id
 5614622812f47-57a06b1d9bamr18970591b6e.1.1795588325204; Tue, 24 Nov 2026
 22:32:05 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123034047.56745-1-dennylin0707@gmail.com> <CAL4WiiovxhEi8G4W9F7faF9COPTaUcjo_1VF2ObJpbUB0i1ibw@mail.gmail.com>
In-Reply-To: <CAL4WiiovxhEi8G4W9F7faF9COPTaUcjo_1VF2ObJpbUB0i1ibw@mail.gmail.com>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Tue, 24 Nov 2026 22:31:53 -0800
X-Gm-Features: Aa3M54qpaRoclcSDak6tF-SiaBDwCmzc34LaOBMRn3UgbUwbQsTboEqvA2CXwgU
Message-ID: <CAGEkeHf51H+hrdzWLU=rJtjP-=3zs1vMf6pfZB6p3ww2a+N6HA@mail.gmail.com>
Subject: Re: [PATCH v2 net] net/tcp-ao: fix reset key lookup for IPv4 segments
 on IPv6 listeners
To: Eric Dumazet <edumazet@kernel.org>
Cc: ncardwell@google.com, kuniyu@google.com, davem@davemloft.net, 
	dsahern@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	0x7f454c46@gmail.com, fruggeri@arista.com, noureddine@arista.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 23, 2026 at 1:35 AM Eric Dumazet <edumazet@kernel.org> wrote:
> A follow-up for net-next adding a v4-mapped peer on a dual-stack
> listener case to tools/testing/selftests/net/tcp_ao/rst.c would be
> nice.

Will do. I will send it once this fix is in net-next.
