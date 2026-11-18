Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794999914;
	b=peE6r2SPuHaZA+p4Y4ndjicY2DOn06vgO2F09mTOUPBJ0V5DI4w/p+cD2g8F4/RipX8O
	 07Tni/iuvqHnK2rNM7ckBe2I31aJhV9W+rnw7wkOcoRIgQLOHjRWDvi9+8SdDgTglBTnN
	 EkPBUcKfLEvRf9hQweIwh6Y4YjLPTnUOFyVQnDGHwjQUdRyYts3PYcpFvXWEbKH/cxrd6
	 LuiiSRF11NwzYm0EyGkI4DK1jRiXq153OfzzZG8H9Fk1aJBtRnkXHysSbwRN/rq1NuYCT
	 Xt8agC+sVNVOyHbiNR/dxZZBHPHkFC4l9X5fTPQDbW+x/EXvJPVtEuxpsMov8XGvfmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999914;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wkNqj/Ri/DMG3jz7yivagroyPuLoigFqxoANJ+MiNn8=;
	b=hdxIPaCJh17U/bxnycYDP+17J/6F7ESg1cHyhc72zdi/l0nk5OyIrzMXBqOmUIUW1UiP
	 7DSl2mKDzgGNO4UqDYLOhevEKCXlGKY3h0M51OCzZStDQTXN1gNhWFdsozEIhaN4nVBxw
	 1FaNAfEk/qkViyTojdgt0BEmSQBbPcnfsJ7UylGdjCCu106PxbS+wpIN2Q6gUnTm6KYLQ
	 jFWoeflisSr5sy8vvV665dJxPQtrs2ocdXJj0fSaCETbHcxq+MZ2lzJUcrVK2c8FHvpTs
	 TrIPLsaKvJa7zSBpy2W2oXrWBrH9gBKIH4lFd2AKxxW8GanXZH9EUMGBjkO55dMIUKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="A/0s5lGD";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3C6606A331
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 11:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A/0s5lGD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3819E1F000C9
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 11:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794999913;
	bh=wkNqj/Ri/DMG3jz7yivagroyPuLoigFqxoANJ+MiNn8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=A/0s5lGD3drPiYEQ+MclkPga66UkhVReitMXeEUP4eCvJDQvJb5tiOJA9IuXO8ZlE
	 zUWmyaAcuYrt3ZTcId5b3AgG2K4HB6RYJto+HbhBGOubpzVC9guNVB60kg7wnri7et
	 QuRfmWaLmZVovt8gMT82EWCC/nHevSfzB2FU+pgvgRFRa0tyPkTaSKrUbg/pRtQHHC
	 k+BYSR1q0aGPKz2JO86BuiIx820aALcgVCk5q2FgT8kqRRdjZuT72ZfPGSitzsw6WB
	 VpQm8SUjNDI6CheO0nweOT7qUph+tKyL/Wvsqyz0vYxsyuZBkO86iqOCAqty16ftwI
	 nkZJo4E6Ap48Q==
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-4b0348a4c79so539548fac.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 03:05:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFWlobpxr+s7vJLEAj4yZsLyZ87/STequJDXUSu5OR4PEGT+Uuozod4YYZ9Rt7QBc2nDIg9Lpw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sn1MA3OXHoEOPmo1VZiAAQCKkVJ4xjttCwrDqRSYZU857o01l
	lTOAPSLAw/tj/QpNPZh2lft/kzjnIYzUh6InXI7tMy7rm2l4k8I8UDksdW6ODjOMaWsbLpeeWzc
	hXi8OFl0dVM1qcQ/SZzvKrfByUXglxQc=
X-Received: by 2002:a05:6871:a1e3:b0:47b:7709:5568 with SMTP id
 586e51a60fabf-4b75fb23c32mr1749736fac.10.1794999912304; Wed, 18 Nov 2026
 03:05:12 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118083811.1721010-1-bsdhenrymartin@gmail.com>
In-Reply-To: <20261118083811.1721010-1-bsdhenrymartin@gmail.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Wed, 18 Nov 2026 12:05:01 +0100
X-Gmail-Original-Message-ID: <CAL4Wiir7GS+-0tSH6D49f+xZv6njk+sbc-_E45_qnqgHe6V4TQ@mail.gmail.com>
X-Gm-Features: AclHuK8EU7ooUYtzQK1pnm1__Qtfk6vzERe7RCmUjC-TOgvb6EadwPUWX31HIog
Message-ID: <CAL4Wiir7GS+-0tSH6D49f+xZv6njk+sbc-_E45_qnqgHe6V4TQ@mail.gmail.com>
Subject: Re: [PATCH] nfc: llcp: walk the accept queue under the socket lock
To: Henry Martin <bsdhenrymartin@gmail.com>
Cc: David Heidelberg <david@ixit.cz>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, oe-linux-nfc@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 18 nov. 2026 =C3=A0 09:38, Henry Martin <bsdhenrymartin@gmail.com> =
a =C3=A9crit :
>
> llcp_accept_poll() walks parent->accept_queue and reads each child's
> sk_state without holding the socket lock.  nfc_llcp_accept_dequeue()
> unlinks closed children and drops their creation reference under that
> lock, and the last sock_put() frees the child.
>
> A poll() racing with accept() therefore reads a freed child:
>
>   BUG: KASAN: slab-use-after-free in llcp_sock_poll+0x440/0x4e0
>   Read of size 1 at addr ffff888112387812 by task poc.bin/528
>   Allocated by task 198:
>    nfc_llcp_sock_alloc
>    nfc_llcp_rx_skb
>   Freed by task 529:
>    __sk_destruct
>    nfc_llcp_accept_dequeue
>
> Take the listener lock around the accept queue walk.
>
> This issue was discovered by Tencent CodeBuddy Security.
>
> Fixes: d646960f7986 ("NFC: Initial LLCP support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> ---
>  net/nfc/llcp_sock.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>

Next time, please specify the target tree in the subject ([PATCH net]).

Reviewed-by: Eric Dumazet <edumazet@kernel.org>

Also, make sure to wait a least 24 hours between versions (
Documentation/process/maintainer-netdev.rst )
