Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=67.231.145.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795463215;
	b=evWW84vI81DMmRTsFL/hc9OwVd+7VmBSqcRmq2zmANSsPCN0GgWrPSiYIPHSlGBm6wXi
	 J6mKQ1kBBpGDrl/1symydsigi7o4Lc38CL7qHlYSOEKLM0b8zQ6dmypSRIZLpgXXqc2r1
	 gkHE/bN37yvMRE+LVd79sn8Nycx7GAexwQXN0DenIFwC2jgSBTlCJpXOlrsFUM/FzV+oH
	 jE52BirNaEiHJsxiMZLX++GVFRRZVFf/EHnPi8jO7UpU/P6ylPTjExh3qaYxCNLxpbTS4
	 YKA0eBiTJ9GSH6ISYKox+mdIIVcnZ5ABhGVOOC7SmEiqX+J5B+buC43efihx8KT3sqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463215;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version;
	bh=68msumE9ER+DmiSRosq40jxym27XxyiCjqWMWovmiXU=;
	b=tIPhtDJp75rHscsPf5b2U2S0wqewk74D1PEkwVbuggJyNBtAQOjVwsO9ydzblR2gH+aA
	 3bNCCKgFPxXJTqOYwM7BMxEtzQroT3vdOfkavyDqvDUyfhYZIeq391UuxUMOJj/V2gh3+
	 Lp8DOjeqbYQluT5Ta1bcvlSFKgDBRvwYTR5VapyzTTZbL+TFZS+mXcK0DyrQatRc7uV4S
	 CSV7CxsNSGvD6kO+EIW/3/b6/ltnRy6XpGlohioXQ3fD8FgrBj+eQmfCRdSGA0u26OC7f
	 Ixlmdk5nSXAfo/GFQGlyVDROKmjeiK+e6dZJEQoZLmiInzwZKhUQaYqfh9tqcsSA01w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=NxH5C50a;
	arc=fail smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C1A606A321
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 19:46:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55C1A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=NxH5C50a
Received: from pps.filterd (m0528008.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGJKh21437472
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 11:46:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=68msumE9ER+
	DmiSRosq40jxym27XxyiCjqWMWovmiXU=; b=NxH5C50am/nw4X0MHjqFCQfQQj4
	A2bOT7e7cLabU4X+Sd7THNtQ0jl6lvyPzgQ8aOft1isWuisGo+XJ7aIXM51vLROc
	qpPpnDmrvZlB8yc0yB5YrixgG5RHYMlIFX3nTm0V5JBI7PU/MIOOByEkhJAKUVFE
	xX1gXF3waa+WEhGm7iKHLHJZFkp1lLYYn9mdCJt0+YUM1GX8VUH5jmf31nNw7S/w
	SpQlGDrlIaO9LC8fxFlZXyX7bNpQpgNXsQ+ra+V5OEhX0O0WIXkynG53BtDhqIBb
	CzlqPIM8Xakrj0S2g1MP02M7rJZAtx5Csz52FYEb/yWEZbOe7LdyHCAJxCw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j40spft4j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 11:46:54 -0800 (PST)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so3502256a91.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 11:46:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795463214; cv=none;
        d=google.com; s=arc-20260327;
        b=VjY4cwIUMB1ri1wjRqs76xoNXCJdu++KsXes57jmbxdTj2jURJTEOCXXIDuAhTfq2g
         Qsd4P1HyaHVTI+FWWuJsQjw1jWCjMBaI5V7awFNlCl73TSmOcKy8ID+Z0ndqzEDlynWQ
         AA1i78NQAgikK7ZAdUfvJJE4Wp22n6QM48tI2WsLgKgIRrFIsN6dgRnWAnnIp0mFfh/H
         zohVbNmaGCq6RcPmQmnpTpS/N68zMpvDwQRjj2qnQZ3UoMxbTm3MU5nVG8rDwNdHSR1K
         /A8eza3cSamlzuuG9FNoHd+pgS2/EH3R259Y/VlWhLvkQhLJ4etfJbTsRkrQncsazfGz
         ibIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=68msumE9ER+DmiSRosq40jxym27XxyiCjqWMWovmiXU=;
        fh=VvL5dL+mgEvjkUmom1tJuMINqMVCIECPyPse3ZLuWR8=;
        b=C9QwnaYxc2qETjOh403BjfG8Y9S4P2+tzKy3E//47FTK52MvsxqTs0eVKfGrIUjuUs
         dmJeksQm6f0EM2A70K6XVHjGBflORLMa6pzUoNEwhLiFcHKF5yGOLdhcToPT/QpHrI/c
         SEIXerN/zxNNkYmgU3IsW4s/txpmCkZCS0gP9Tbs56GeVps7gYXRhVuJuHIX4gSLda+S
         HY6Uis5UNnezQjHiGo1Q/PszTVi9A4JOnEQwvQ21/cEk4CR4vtl8vw/hDhq+ldrAsjaQ
         kCFvlvIlHDMScJw5AKecMQFMaI3KsaA8koEZEVmIqH3k1K9qd3B7ZhdCTIlF2/JHLjPF
         VcQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463214; x=1796068014;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=68msumE9ER+DmiSRosq40jxym27XxyiCjqWMWovmiXU=;
        b=t7sTsWAL3Jze7/FUeJidCoukBJvjnsvtjVY870AA24FZMozANr65wakdK/34eC2fbk
         MZgEgBGOykYuTyqh+lS6zd0h0IQxP+8LJHHnwDDIda4EeqrRzJ8BKkumCbzFlYOGoWPi
         J9cTZ8XSU9hR0WVBm1Gd4Salg+0S9vWLqT3R8oVXXLzHmD1Spa/ukoSvsie8IIEHASjs
         C9yMRiNJIc+Y0liv6hmDR2E5C3No5qRZ9aQW+LZfRf0+4xVgRKnVnY5fv9c8IQmRiSsa
         6Cstmn3MHBvX9XkjgQldPYhcy/aRaSiTrYUi4j2PJa9ZIMscGidVhrtSGZqjiHTJR6+2
         VRiA==
X-Gm-Message-State: APuU4Z8yTUOU3XmUZZxpDzVosGxKzM3NJbj0ho5Roz0er1eL2ApxAQAI
	VTx7cyfRw1UWAklRwz8lHyVxgEP0eQOpBaOg1ppP8uTy0Y3NeTT8AmBBs2KKeqmh2XRHAN6WYQE
	dSDqlQrK8urnoiEfOXtONTmJY/R30xoT1aqKu7dK4mYS5OdoVG2gZ8Ki4z4DkOq77FD2WvlfVea
	2lX95BA1+sQKEShjL9de6b+v254qAKQZI=
X-Gm-Gg: AZFdTZfqRmNtAqexcMcnecAdmz1/0Oz+r9KY8tRBBHk2Y5CItWuNkmOBUES4JETYE8z
	lFnQDsapHx5vi5Av8jCsqWKaGGmmWmXvLa3ovIc1wJ+v3LTQKsKoCsQN/lkTW+ZmT6lDTW0OJ5+
	SM+FzuRBl5OKcPQbwQ7xlZxdMvc+uGdQmK13TM9h+A8cWdn2hatgoehdOGI0GDdNJwb5i1oXGPN
	UtV/b24RdHnPg50j0kCe2TPVvUCjEyjB8VOnHreyoBXp9hnjyc=
X-Received: by 2002:a17:90b:4483:b0:3a4:b509:88bd with SMTP id 98e67ed59e1d1-3b41c7bc7ccmr7276189a91.2.1795463213793;
        Mon, 23 Nov 2026 11:46:53 -0800 (PST)
X-Received: by 2002:a17:90b:4483:b0:3a4:b509:88bd with SMTP id
 98e67ed59e1d1-3b41c7bc7ccmr7276167a91.2.1795463213335; Mon, 23 Nov 2026
 11:46:53 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117203137.804424-6-toddfreed@meta.com> <179529586258.3135.12190616828136497053@kernel.org>
In-Reply-To: <179529586258.3135.12190616828136497053@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Mon, 23 Nov 2026 11:46:40 -0800
X-Gm-Features: Aa3M54qNBs9m9dMGH-6cVdsrK_G87ANBZo0TyGs0hmoTzNiwaEmGoS1Z8U9eLXY
Message-ID: <CADh2yMys__9M11pgtxkMQHuhjvM8DzZr20t7W0aEVNqEmABEnQ@mail.gmail.com>
Subject: Re: [PATCH net v6 5/8] ipv6: icmpv6: don't quote decrypted payload in
 icmpv6 errors
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch,
        bjorn@kernel.org, borisp@nvidia.com, cratiu@nvidia.com,
        daniel.zahka@gmail.com, dsahern@kernel.org, dtatulea@nvidia.com,
        edumazet@kernel.org, idosch@nvidia.com, kuba@kernel.org,
        john.fastabend@gmail.com, leon@kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-rdma@vger.kernel.org, mbloch@nvidia.com, pabeni@redhat.com,
        raeds@nvidia.com, rrameshbabu@nvidia.com, sd@queasysnail.net,
        saeedm@nvidia.com, shuah@kernel.org, horms@kernel.org,
        tariqt@nvidia.com, weiwan@google.com, willemdebruijn.kernel@gmail.com,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: 7w8LrHGFU_OdtvqX-7Y5R9kpW482mZyn
X-Proofpoint-ORIG-GUID: 7w8LrHGFU_OdtvqX-7Y5R9kpW482mZyn
X-Authority-Analysis: v=2.4 cv=UbrE26SN c=1 sm=1 tr=0 ts=6b04982e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=_1IyUuN4QrATX339ibzo:22
 a=-7il3XB7buBOucKm-QsA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX3aXk+S3+NuzP
 uRSkmO1MjYeuShu/E1dbnPI88++imkn8HsmJH+vNUD0hxbN7loUJ5+C+NSu9rj3PxQu0QL4jeTC
 7MH5TDIbRN8ycE5oEckt0sITgLz+7xU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX3Lt6NN3+/3XC
 OqyLtGQneblTutHcZ4b/QLyxwe1AfISlv8VRndxTCgbKm1d/mQZS+MawIWSHWjNpWdUyJ+EOP/8
 m8o2gLRKciYP0/eJz3lFSkMi7A6MVRPVYL0Pvrl0nyoNTBizM5saTpSi/hwGjACMV795vDz35St
 7ysDw++OoUHC5Ub4C+cIrXKGOF9LItKGluSYnxApUIXXce9/2DUhiSaM9fxL76BP0JqOdQcWUc0
 R3vtJmh6kahRXy56kqhN1UbjCeaJWjCCW41FcvPKt1r8OGZ0HuqqdcXELSpC5jyBxdfJhtIRBpy
 PsSdZgA1gYm9GlBjlfYRclrFcaYSVsoeFD3UOtYYhcdRe4hSzQL6Gwf/xAajQOHCsFrn7DIXBDp
 4wbSIu/FHW8Jy5DnkA2pXNhbUxbsaDKuYvpZIWQMjMt5k4ZxOadxI8EHfY220fJmGerZiAL2HcV
 RMIbntKF40zMh0y24WQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01

> [Severity: High]
> Does this cover the NDISC Redirect sent from ip6_forward()? That path also
> quotes the invoking packet, but it never goes through icmp6_send():
>
> None of these conditions look at skb->decrypted.
>
> With
> forwarding enabled, a PSP packet sent to a non-local IPv6 address would be
> decrypted and then forwarded.
>
> kTLS RX offload can also produce a decrypted skb whose destination is no
> longer local. One example is when the local address is removed while the
> offload is still active.
>
> The !skb_sec_path() condition already keeps redirects from quoting frames
> decapsulated by IPsec.

I reproduced this on CX7, with both psp and ktls offload sockets. It
only affects
ipv6 (or rather, this path is already addressed by patch 4, the icmp fix).

* server enables forwarding (force_forwarding=1)
* client connects to an on-link address using the server as gateway, so
  the server forwards the packet back out and sends a redirect
* the forwarded packet itself is dropped because of skb->decrypted
* the redirect quotes the invoking packet which had been decrypted and
  goes out

I will post a v7 with one additional patch that addresses this.

-Todd

pw-bot: cr
