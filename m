Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076973;
	b=cTWesm661mqV6DPkcSNrw+3XZzyL7CEHPY/DAlO61yOpOc8OVN6h/g9dKpI7nmRgAzQ/
	 efgBF9Th7tFF+v+bTUaZL5apf84K8DlLtARvdpki06Rhxp0v7Yx7WM2cLR3Qw3CD5WrZb
	 UI9egmtN6DThcHxOSiodtXcdbY5Q1C/EjteinL61oy1ygvt7ME8ryMI3CDOHkLyID34FO
	 qG/I6Ve9M12WA70y94X6Za92ebBr3EejhDTh+xVLX/hyxafO4ZlRO+K0g/n7AiRfVbWlb
	 GEmH0QqukaGdWutQyh6VkIfh81GGRVk7+mZ/A7KVrBXvnsNMWkAZv/zUSTiuZMn96Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076973;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ltKoCevNzk3FQ+NjynhcPjvbgAc/XUm4ljr3zeAskEU=;
	b=xwLPrWXS5zsrroen6mqBQvnuNCgSC4+39hBgERzEv3sP8FD/SpdIekTJtrnKgN0jaO3L
	 e24Hnt7oM3gXqxFiAGV0yHmb6GtoUc6dcROmvWRuLDjrhRHvBQQH8wlN0xF3z9w1UhudW
	 SHrYn2dRKwT31AyOxOxUjkHXK1XQbk4q4leQs5UGTP7bBr0oneRnHHXDZBA8LWuMrnbmM
	 GLDQLrfcJzBUB35tyxyStzZMmSFO+ghn3OjLb1HL58yRyPKezAJoAKtCBhl+bLXLkMMDh
	 lhCHXiEASoVrTeJ4ThRucwRAdAwcMQdO0dGE5aQGobHu1UVk3Dv4oq9XZEEpvzMeAJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cE0qn7b9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A74606A324
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 08:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cE0qn7b9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 803541F000C6
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 08:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795076972;
	bh=ltKoCevNzk3FQ+NjynhcPjvbgAc/XUm4ljr3zeAskEU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cE0qn7b9wjUJjl+EeF9dlxo3NQSyDGash4L89R/ZGfLdsdB03qEXaB5qLGcQb3NYH
	 bUNrOfHP7sVJYmJY0fvcpQLzPW3DNrJ7pojElaKXpHS7ZYp5PWJMpZd4bHXckLPCZz
	 VIFa0EHWJW2yv611yslNN5OUEOPgpTOfspQTJzyZJtDUnlP0prx+6B+IrJXckI5oox
	 p6omQV15yufCvtraQDjnfroUchVPFYPmh5s0vMPTAh+A3eLo6LmWx1IQPLf3GJoWPQ
	 RsQtfqomDCZT5oPDlDl3ltLFSVS3T7QjaIfnZkSBkfT4AFW3HQDQnqDy73FlUFvAHG
	 80eslyIBvThNQ==
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-71aed54d4c5so1285559eaf.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 00:29:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGF/agtqyycUxR/W1gj7InVE2dODBFLqMwBNUsjfa3TKfWJPiQwFcEwCI/ez31K5KGGIIGHIoA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dbscOo85gyMPr+b2w4/aCvMPSmhleScxUsyUF5tdlcqHxFA7Q
	VMrHQGzybSutOXgCmkMNpm03OR8lZ51bIFNz7Cj4SUZdsb1DxRlu6a1zHXlNdA8VQKJqc6oBXsy
	GZdQ1DqS0kyVOphgjpM54ZQDqSydg8rU=
X-Received: by 2002:a05:6820:408e:b0:715:2400:9579 with SMTP id
 006d021491bc7-71b18501de0mr3454655eaf.56.1795076971851; Thu, 19 Nov 2026
 00:29:31 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119040153.158372-1-bsdhenrymartin@gmail.com>
In-Reply-To: <20261119040153.158372-1-bsdhenrymartin@gmail.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Thu, 19 Nov 2026 09:29:21 +0100
X-Gmail-Original-Message-ID: <CAL4WiirJ-YBRoDxuPZDf3vD2_RP1GwfJ8EJVFN7nJAGVyiRZgA@mail.gmail.com>
X-Gm-Features: Aa3M54oko1lYgZfiLlbyzAkE1l6l_7xxTDvABHcKBL2k1QYHaSbaMu8NxDpMhGU
Message-ID: <CAL4WiirJ-YBRoDxuPZDf3vD2_RP1GwfJ8EJVFN7nJAGVyiRZgA@mail.gmail.com>
Subject: Re: [PATCH net v2] net: zero the tail of ha->addr when allocating
 address list entries
To: Henry Martin <bsdhenrymartin@gmail.com>
Cc: Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Nicolas Dichtel <nicolas.dichtel@6wind.com>, 
	Yuyang Huang <sigefriedhyy@gmail.com>, 
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Daniel Machon <daniel.machon@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 19 nov. 2026 =C3=A0 05:02, Henry Martin <bsdhenrymartin@gmail.com> =
a =C3=A9crit :
>
> __hw_addr_create() allocates entries with kmalloc() and initializes only
> addr_len bytes of ha->addr.  The dump paths emit each entry using the
> current dev->addr_len, so an entry that was created with a smaller
> addr_len is dumped with uninitialized tail bytes.
>
> dev->addr_len can grow after the entry was created: tun's TUNSETLINK
> changes a device from ARPHRD_NONE (addr_len 0) to ARPHRD_IP6GRE
> (addr_len 16).  On v7.4-rc3, with 64 entries armed on a down tun device
> and the link type then set to ARPHRD_IP6GRE, RTM_GETMULTICAST returned
> 16 bytes per entry of which 37 were non-zero and 21 started with a
> kernel heap pointer (e.g. 0xffff8188_04857ee0); /proc/net/dev_mcast
> exposed the same bytes.  This discloses stale heap contents to readers
> of those interfaces.

How did you get 64 entries on one device while addr_len was 0 ?

__hw_addr_add_ex() does memcmp(addr, ha->addr, 0), so every add of the
same type finds the existing node and only bumps its refcount.

Please describe what was really run (64 devices ? another starting
link type ?)

>
> Allocate with kzalloc(), so the tail is always zeroed and a dump can
> only emit bytes that were written or zeroed at creation.  This also
> makes the explicit ha->sync_cnt =3D 0 initialization redundant.
>
> Cc: stable@vger.kernel.org
> Fixes: a748ee242681 ("net: move address list functions to a separate file=
")

This commit only moved code around.

For tun, the issue became reachable with
cca8ea3b05c9 ("net: tun: set tun->dev->addr_len during TUNSETLINK processin=
g")

> Link: https://lists.openwall.net/linux-kernel/2026/09/10/320

Please point to your v1 instead:

https://lore.kernel.org/netdev/20261116024056.1274402-1-bsdhenrymartin@gmai=
l.com/

Also please mention the companion patch, which flushes dev->uc and
dev->mc in TUNSETLINK when addr_len changes:

https://lore.kernel.org/netdev/20261118125443.1137177-1-edumazet@kernel.org=
/

Your patch is still useful with it: tun is not the only driver
changing dev->addr_len without flushing these lists (qmi_wwan raw_ip,
hdlc protocol attach/detach), so the changelog should not present tun
as the only case.

Also, the bot asked how the issue was discovered, please include this
in the changelog.

The code change itself looks good to me, please send a v3 with
the changelog fixed (after the usual 24 hours).

Thanks.

pw-bot: cr

> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
> ---
> v1 -> v2:
>  - allocate with kzalloc() and drop the manual ha->sync_cnt =3D 0, as
>    suggested by Eric Dumazet and Daniel Machon
>  - add the runtime observation to the changelog
>
>  net/core/dev_addr_lists.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/net/core/dev_addr_lists.c b/net/core/dev_addr_lists.c
> index d827cc21867b..9613c8a9ed7f 100644
> --- a/net/core/dev_addr_lists.c
> +++ b/net/core/dev_addr_lists.c
> @@ -96,7 +96,7 @@ __hw_addr_create(const unsigned char *addr, int addr_le=
n,
>         alloc_size =3D sizeof(*ha);
>         if (alloc_size < L1_CACHE_BYTES)
>                 alloc_size =3D L1_CACHE_BYTES;
> -       ha =3D kmalloc(alloc_size, GFP_ATOMIC);
> +       ha =3D kzalloc(alloc_size, GFP_ATOMIC);
>         if (!ha)
>                 return NULL;
>         memcpy(ha->addr, addr, addr_len);
> @@ -104,7 +104,6 @@ __hw_addr_create(const unsigned char *addr, int addr_=
len,
>         ha->refcount =3D 1;
>         ha->global_use =3D global;
>         ha->synced =3D sync ? 1 : 0;
> -       ha->sync_cnt =3D 0;
>
>         return ha;
>  }
> --
> 2.43.7
>
