Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795641432;
	b=4tvI7Pn1GbnYMOxtvn/MhnaanLa/BgL8VVF5b62L2AeC2ETBSoLXZ8AmmxVguld2NPDT
	 ZmfJJrS0HypQXJNKEAWTncoKRk+96/GlJ96ILeR493CVqmgCwBGFVd6Tnj0yJQdVT97iW
	 XW7UBAPbI3TelWn6AM/PMcaz3GdWChzR10iztkPcSnHMKKOmfSRVJrpRPPxyMh1erHTNM
	 cep14lAnbWNUi4Bec1j01Hbp2Fc40Iy3n/5TgaPJvcUsCdUPQv6cww7ukxrIebnDrZVG+
	 hzPWoGrWTtd8u/+8xcHXbM1bExYH+5qoK+oQOTUXUy+dyuNMniuNfv674EgNvEO6yFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795641432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Xpq+0pwaGJzipp07jmvO3ANvw3Qwr0iR1BtMYGqpL5Y=;
	b=IVBGNhYYrGGFSu6gpBDhfnUX/5ITefhL3NCuyaca6EMLkV+IPIwd5mGRCru7osr5T/v1
	 JKGFxx2xCnd9GiTs15xzd0Y3Mxcpo0cff7i2Vgv0lPewbxgjT3H1Rh47tfS5/ElR7iJyn
	 WnTixhta8/hL3b5QonAbm9VZHcC3crDzhqYot0tzWlFfYvKr2FrVL+0zBQp8Rt1ivZukE
	 XTrRNgoWqWv+8tVH+EvVrfuJ53pIykfiNsF/VnsgPx7Q/Lwr11ZXNnEGac4wI3oJPc5SJ
	 iiVqOFMow0abtc3ugC7ybtf//jrOPyAWNcqYJlKlqNdp0SIyXbwg9GvJ/ulkkc1DJ5A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b="ikCqdo/J";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B0C606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 21:17:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7B0C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=ikCqdo/J
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b4d07494b0so72957547b3.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 13:17:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795641430; cv=none;
        d=google.com; s=arc-20260327;
        b=CNKzi01+ru4ejjrCdRumgdglLb0ae8qn/Ii3xnB2+afd5Q65C/HFySt9y6Pi/RMcZC
         Idasyuq+go9xnP87WAqRMSZ3dFl6kFf8r+O5ElhISWjWKaGEklbKRD/uOkOkCrJRW9gI
         R8LcD+tZX8qFUFLofDUvcvwGhgo7B5RuzdrWUmHEsqTY9+qa/s7g06Ghan3NzCJlaXuc
         c4VGDzNZab6ytplucqW/MjqsdhEZ9ZCDbq8jH29C7MLWrEzRF1auSeBeoUFr+DoprXbr
         B+8zZB0yU4+vBv2b3I9SiATIGzzs0CJVjUFAscW1BLyL0lnG3zbCUVfz0jVCW2pudPv0
         s6ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xpq+0pwaGJzipp07jmvO3ANvw3Qwr0iR1BtMYGqpL5Y=;
        fh=2bfAKzd5fmjbhTIdcItRAxRKdd65ZVyxNrYvfBbnq1k=;
        b=oOl09unWqOYBzG8jbhbmXvgWlM+Zs2vqJlv82Nu8ZVmaUyB6eXHWpdScbxFmakpQgY
         K2ujmJ1OCnkruDJLPA2cUOVHPqonk+pDFpQhVELCPYIMdxluyPYJ3GkRkTVjWdr+YTPV
         ITjBeP9LOnG+oHOXV2nk36hk9EHG9aSUid6H8eoxpYzDn3qnVQkmFdVKAtLFSnxlPPPE
         N1z5xSebQrOx6HIqzqPId7yoZO8R8qJULAd4c3o+1fPrT8MYfjUgRpoQjhAy2Bowy21T
         hfsrihx137WXMwqjNHKAvAQ65oJQ+6OpgLA/CQE18LNPgHrOxRoDDJF0K9gyDKyE7pat
         jkuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1795641430; x=1796246230; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xpq+0pwaGJzipp07jmvO3ANvw3Qwr0iR1BtMYGqpL5Y=;
        b=ikCqdo/Js06OZnjno0W+kIv1CiD0oR8ObGMHXOscIUzGqP28wgQViOHE7omuITw0BX
         0k6cs0KjS+RXzmw6xE3ijiInaPQr2YTNUkoruz+Xsr5SXXKxLYZsAHzv/bm/il9q5gD7
         hd+2fQw+XlkJZL1mT+6udr4PlowS0oxRoTFtBpOFHp5ZCTuFSxpI9tH1kYrhjWRUC+Op
         LsBmuYcllItowU4p2kLnw+34e7kDcgDwdlGhTL+r2AIPOoNm25DfC5QaHYR6/00Dke38
         oh3XTh0v2gEbor9gNFvPrq4rZGrpFqfZH+KDVveZM2Mj4dQB27ephNT789CrGGk0cooX
         LjnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795641430; x=1796246230;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xpq+0pwaGJzipp07jmvO3ANvw3Qwr0iR1BtMYGqpL5Y=;
        b=ItqwExJqH+ERM7JqdAhIrB0kump3HWIBedor2N6WZny2K7u6FXMej6KmFMVcJvTnJE
         ee+5LLHutAh+xC/D+QXZZlAtOhLG0kk1eDJJ6SY5QQQtUg9CEogjO2itbxsRNvhajE9y
         AQa0c+YNDP0RaR6GbKTbYTJLLZpYPNeSrxbvr2/E5W/oUttYIeLSqKf9v1oaeDftaRUz
         TOZoo1kCnVmX8kk/KEA7Wi4iKr9VU27BnwdQvv/u6fzWpVdSNg7vynGdjXG7NY+sJ+RO
         HMAyNzUND51EafxPJfDEmL9op9hPN108b/VydMOHH05/SkvFtZgNE0WP4pVz0HPJrdOm
         riJg==
X-Forwarded-Encrypted: i=1; AL+hErHPuUCnfKGABnvpmfbtSamzR8+kYX/wjJ0qO3+JEhNsSfkLhIwKehyHDwMwzgAyo0NLw4NWfzE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9eiWs8fwd3RjpWEex+k5hUKh9VEj45UxjReN1cqnRHeOhM5Uq+
	wc26PRhbQ1zL71oHXvLzguF+WIrgsAQPI9nNy5dTjM0RJ+5KSuC7hOBnFbd/sjg5I+rYovXYMri
	Ypun7O/08KCzq4LTFMm5D3jsdLmQwiCj/AJuv8KT56Q==
X-Gm-Gg: AZFdTZeD6HJHOWkrU9s0i7p/m4wWA3F3MXD8uAV5R+c1P3ItY+bO1J7ARmhep/yLhyK
	vsWP7N/A4nzimBDLVe4y0ntRoXm2TV2E6m//3t+JTxbNVrMiot57clWc4kcKS+Mpxekpes3CDUH
	sbT1mwlsiws81iURQ+rl1BwPOI4OoyD+lW3EgPVkqkxj9TCktJwB6I6t7Xx5WiJv0xo3FMRdTgV
	QvFm6ToE+K7YobHrXAuk8G3F9j5AT9dhP+DVWef1pw3ro4/Z4ZdrkCr/LAdN4f/SRt1NGaYdhpK
	D9GERDyiwivYhB4HjJIUCRs7CKBSPV66IebQoxcA4VaFtmxJvhAHxBKaTFikRRhlzDdfNr38OiO
	ykRohN8+CHWPX3MrAn5XTZXjyYJmId9qa8OcnIlWIXnhk+6AJLvmM/+/B1SNYW+YtRbxX
X-Received: by 2002:a05:690c:6e8b:b0:8b4:c69d:17e3 with SMTP id
 00721157ae682-8b520501322mr76798817b3.32.1795641430719; Wed, 25 Nov 2026
 13:17:10 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-tcp-l3mdev-exempt-ports-v1-2-ccc2a3a6cd09@nexthop.ai> <179556272812.3135.6671930746959900620@kernel.org>
In-Reply-To: <179556272812.3135.6671930746959900620@kernel.org>
From: Kalash Nainwal <kalash@nexthop.ai>
Date: Wed, 25 Nov 2026 14:17:00 -0700
X-Gm-Features: Aa3M54qAjb6VOUA_FXJBwfwYAI4hdIT50Z_FnPsv-oL5ve_wAb0briVt4LVCUPY
Message-ID: <CAAv61uR_cfj-tcqjf2q1KYDVxENmwJmjfR0M08Jk65iiQaj2Mw@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] selftests: net: add tcp_l3mdev_exempt_ports test
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, dsahern@kernel.org, 
	idosch@nvidia.com, ncardwell@google.com, kuniyu@google.com, 
	netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 4:25=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 5 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 2 =C2=B7 Low: 3
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] vrf_and_unbound_listeners() in
>   tools/testing/selftests/net/tcp_l3mdev_exempt_ports.sh waits for the=E2=
=80=A6
> - [Medium] selftests: net: missing VRF and l3mdev prerequisite checks in
>   setup()
> - [Low] The negative checks treat any non-zero exit from nettest as the
>   expected 'did not get the connection' result.
> - [Low] In unbound_listener()'s 'exempt, VRF conn to unbound listener
>   rejected' subtest (lines 117-125), the server is started in the=E2=80=
=A6
> - [Low] selftests: net: tcp_l3mdev_exempt_ports.sh bypasses lib.sh
>   helpers
>

Thanks. All of these are fixed in v2: the test waits for the listeners
with ss, skips when VRF is not supported, fails if setup fails, requires
a timeout from the listener that must not get the connection, and uses
ALL_TESTS and check_gen_prog.
