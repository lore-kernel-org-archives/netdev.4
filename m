Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795644159;
	b=Q+dfqS8/1EIrkC1wmOCHM6lhzu4dBFpMUV2aM1vuGMdz1mjpi/azPg2T3fgSBrmmcNHL
	 PuhspnkZXZhmpX2htNOB2ZKj4+Fv2RZaeSLsU76h/t9L5BqRKBdWI91Z0Mn4QlVWocAWj
	 aBI+FKLibTvLJjl3wbAmPfHU8Rn8tdgVwu8CK7IDD3z/TDC5N66T0U4f5a/tC+FRPzupV
	 ILNaPM0frQHcE/q4hUe5N2cHNW30BSV5phGP5z7R4WirW9O2qI8U4S1vff7rd/pC/3N3L
	 9u6LwaXQqJWBx1C8h4qY/PGg0Qdrzl8kBBlxqphHYqtyVp2wahyKdDDujG2gtWx9aUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795644159;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=oHR1tBRCrTp4GdTSuulB2NpPvXunoIK0pVzcT18XLsE=;
	b=lAmkYl4fOaoF58FnhzPFYDF4zcZPZdjbQYgmDdFf519LhWiGaUDTTV7frQ6k7sucy+hI
	 +/aMuXCa46c08MxLsEYoNLCZkjJx6caLmMCsM8xUurg5uSV1eTw4yHa0EbFSV89W4Ogki
	 X95ZAn89SsoOCN9ew2cT84jRY0kf/abXZv1TxG7y7RBOthkLDxJfOdp1RxGCzyIqrh8DE
	 lYyQ9+TbPa50tCas26KmTIDjsFiDAAckvpYtHFBqcTePULlSBuu3AR3c08MsLQrcdple6
	 hVXIRQzDIm3Qtht2q1s0kDCDtIB8XDJIs5ZaRJ1OYrmbGvm/yVlKKOEdlbfQFlJ3MKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DUdMaKJu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D60606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 22:02:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3D60606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DUdMaKJu
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb606491faso33837245e9.3
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:02:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795644157; cv=none;
        d=google.com; s=arc-20260327;
        b=U7vAYm6tJVZY2QbA9sXn1tiXasmIylZGC4mZcFZXT3U79oaebegvvI/XWfcBNkf3z0
         al0CQY6HoQBSljJA8Hr8j0bFu3LDE6y3FhfBVwoR/9g9v53PIgb636OHONGo2cAWAYyW
         VV8ryxJ/+y+B1ylsdgUFheDmM+26wQvDJbpBLdJEp7Zc3pnfadwmdJakiAytZtWBFbdm
         tUCWZuSHUvoxVWo9fUf+2HD5km6gvoZZYQFS94M2W7xqU6HKzi4r0BilWyLjWN4e8tLj
         jM/D1tAj7iVzNlsXlRye6+15NwXouOZ/2/MGMV0x+Z9OByoUFNQhIoimnS90g52fJ+Ps
         8Vgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oHR1tBRCrTp4GdTSuulB2NpPvXunoIK0pVzcT18XLsE=;
        fh=typ5iytBFZNAKflRWwlC+FuI/ueGyaCfhJQ9YN1Vy3o=;
        b=ppCp4lehxQbExm5iWVYWpRv2YwrAG2mOx7LNdqMwdC3EUmxjsUx6eeskYfjBTtLWmZ
         BUAZCGQRfVowQm29bNJh9OSvZuOb5SfPt5M/GLUwwz61uUj374HwRQWzNodGrGY7Capu
         ZQDDAmQhPQvYa1zGBKIAbGxMQMddKS2ww/5cMk4s3u47CivaiB2cAxh7McWNwsbUnKIe
         z2ApdvDV4Khy5bGQMZ3SMWTGxBrcBq+kF2s6+fMUNNYSp0wShzQmYWgRc5Ijs6U2EB0O
         fcb7f1M+8kHelz8XSs7/da3JE87/aeotyOtEIvnAXXSKi3icApHwiR72JCevJvSBmflT
         ZHHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795644157; x=1796248957; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oHR1tBRCrTp4GdTSuulB2NpPvXunoIK0pVzcT18XLsE=;
        b=DUdMaKJuwUDdxlYTSZPt5gtur2Cj9hzVh8bPg61VMEQMGvBXDTBSV2l1KSbZUUd+3c
         pNloy/PZqJPvY0K+zoeDZdmMBMexEcq2qjE1sav+r/rQi3yKJzmSw4eLM3x73s7Po+7X
         MMuIyP0+MAD8ZWCE3NnngRYnJBd56qkXAhSgPhYogAX5E2swZ9yLF0/NRbY6Fmz8VsRQ
         EiZog8ujkcs7ujBC++CLtQYmXJTqeiVIBmnEzQNmJ0P16SnuENvK0HcckjXInSIFpeRf
         B6vKBy/0rgpzNVyfp3IDFFlZwFz4/z9k3E8nA8YGJWRZQ6n7DyGnN0Kv0UkU8HcRO4MG
         6oyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795644157; x=1796248957;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oHR1tBRCrTp4GdTSuulB2NpPvXunoIK0pVzcT18XLsE=;
        b=S/Qdy9mNytF1Rc22C5SVTuGagQUYvdalfuLDgG7MXx1wX+W71pE61yBiWgRf2FbJ3s
         qmUERcl9iedrFQLyaHKIP8QoYQkqgMHivnJTypSk+LnV3x6kOYVcW7ti7CNqBHTDJSsQ
         p9UsS/zOrmKVCwLsOSDluq6gJ8Q95f8haS9yyY9QZ4T3sqigalblRIqbbBY7FM/yr1/I
         SZmERYclP/NID1xtjp6X/4MIIgeBEX8gePNyiG7SI7pU89cEtNVst6m9YFlRD9GBNyhK
         panQIK/QLDRQZ2lT8Hz4DGjyGbGtsGXVUS6H3rF621776TaQ9usguBjXSZgQaf8JqGqk
         S98A==
X-Gm-Message-State: APuU4Z8/8uCJ1P9fdwrDyu0uRe42kcR7ZNDowMuKa1g5manfwV8LakDD
	eXokzreAh+11CP0a1Ap5EV3sEB2TsX6q92+WZC8HPGmEVNxTF0N72vWH3QNfPxBd97onj3udNMJ
	raZnP5jyqxwsL2fjJ2t9DwK2QcLX8sQk=
X-Gm-Gg: AZFdTZd2rspjUtcs5/ovwDaMIMFyo4k9pfsOvGp7NTXfKfnXgBtLul5iIglG0Ky0LzN
	3eOtCgzgvK7G/iPzKXBOcaA/qWJ+quUKdrevGZPmLupqbcsSUxvWbHKUkTfuDRnWcVrzL1cF4SJ
	ya5YvzVCS1epHGxNc4gBzZi6A5UpiyUGYdX2l3jnwuCXdZVLvrM0r2ebEUmNFarw8nnyE4HNUPX
	VP+peRFz+3TVdyTt/KPm43vRr2aWgSUb2f1d3HVcft7N5m2058/1QSfdhO/a4GHxs/Vu39wDn3k
	H4F9r21nJVRIWyWRBhQKKPmEz0V5vdOYKVlq6GGJJhhGG0fVIEfY7npgmThJQZewS/iIzT9JDRb
	ri7B2kINpRAGdGpYI8hkqnuArV20zJMGmWjr6trEWpDBllTqqzTkgxztwQ1ATHP1QIhBjF30UJb
	uEV5c+7idQJ30isznlcmI3Sc53FcNSEPDkFhpp+0DmA0lWs3wuKIwrGw==
X-Received: by 2002:a05:600c:4e0d:b0:4a5:e6fd:65e5 with SMTP id
 5b1f17b1804b1-4bb88922a67mr378017515e9.31.1795644156940; Wed, 25 Nov 2026
 14:02:36 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121012402.84848-1-tianyi@cloudflare.com> <3adef4b4d528780bae31f2fb02d0a08bf9c8ebd5.camel@gmail.com>
 <CAG4wq-f18SHytDb39SdJYzRPk-dzECjH_HCSiMGAQ721Zmfomg@mail.gmail.com>
 <CAKgT0UeWWherBt1MDcPF7R7jxt6E_3peo8VuxrgY3JdseM-0rg@mail.gmail.com>
 <CAG4wq-dizUz-6GB8Aj1wRTQBOzbHbT7pX9gom+AhR=5OWSyjzw@mail.gmail.com>
 <CAKgT0UffmbELMsGi8HRfu62MfC9VRYZ+TMNKFjZMWJyrV4t3jw@mail.gmail.com>
 <CAG4wq-cG1bseTFczZTjashN75J1Jsrv=u1ccuRsY-N1kZ=SXXg@mail.gmail.com>
 <CAKgT0UeNyyXKARjKR4nVVxNe3UB16WuXqxSz0cf4ZvCdb9A4_Q@mail.gmail.com>
 <20261125090732.69233-1-tianyi@cloudflare.com> <CAKgT0UcFnSvTO6ATw76qVHYxRusTYXpRVi0_GR5QnMhhoXwXsA@mail.gmail.com>
 <20261125183125.25801-1-tianyi@cloudflare.com>
In-Reply-To: <20261125183125.25801-1-tianyi@cloudflare.com>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Wed, 25 Nov 2026 14:02:00 -0800
X-Gm-Features: Aa3M54o80FY0kbVxOnhE-mBTpxSO-3Img4pRNLDvWi5ZvexKf5BGtRjI4tXLTnA
Message-ID: <CAKgT0Ueso=OQ7=GJp7m8nr90kBUp-+N6ko+Qy4e29MZv6tLQfQ@mail.gmail.com>
Subject: Re: [PATCH net] ice: do not report CHECKSUM_COMPLETE when an XDP
 program is attached
To: Tianyi Gao <tianyi@cloudflare.com>
Cc: netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Paul Greenwalt <paul.greenwalt@intel.com>, Alice Michael <alice.michael@intel.com>, 
	Eric Joyner <eric.joyner@intel.com>, Jesse Brandeburg <jbrandeb@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, bpf@vger.kernel.org, kernel-team@cloudflare.com, 
	tianyi.gao@linux.dev, Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 10:31=E2=80=AFAM Tianyi Gao <tianyi@cloudflare.com>=
 wrote:
>
> On Wed, 2026-11-25 at 08:32 -0800, Alexander Duyck wrote:
> > Realistically speaking there is an easy solution to this in the
> > program itself. It would be to look at using something like the
> > REDIRECT action instead of just stripping the tunnels and passing it
> > back to the original interface. It would then take the frame and stop
> > processing the remaining descriptor data. As it stands that would be
> > the more correct solution as you could then just redirect it to the
> > tunnel interface I assume you have stacked on top of it and have it
> > receive the frame instead of having received it at the interface that
> > just head the header stripped.
> >
> > It would also match up better with how the stack would actually expect
> > this to work if you didn't have the XDP program in place.
>
> That is exactly what we are trying to do. Our traffic will be
> redirected anyway, to a cpumap for load balancing. We tried to keep the
> RX metadata across the redirect autonomously in [2], but this has been
> strongly opposed so far [5][6].
>
> [2] https://lore.kernel.org/all/cover.1794281983.git.tianyi@cloudflare.co=
m/
> [5] https://lore.kernel.org/all/20261117161856.6f6c2ce9@kernel.org/
> [6] https://lore.kernel.org/all/20250716142015.0b309c71@kernel.org/

The thing is once you start making modifications to the frame all that
metadata should probably be thrown out anyway since none of it is
really valid. I would probably treat it like we would a namespace
leak. I get that you want things like the RSS hash to provide some
entropy but it is basically just snooping into fields that you
wouldn't want getting passed on anyway like details about the outer
headers. Same thing for CHECKSUM_UNNECESSARY. It was making
assumptions about the frame that you likely changed, as a result you
can't really trust the flag when it is provided.

If anything, the path you are taking now with disabling
CHECKSUM_COMPLETE is the opposite direction of how I would probably go
about this. If you are wanting something that is more universal
focusing more on CHECKSUM_COMPLETE would more than likely be the way
to go as it doesn't care about what the outer or inner protocols are
and the math is pretty lightweight as you only have to fold in the
header checksums as you modify them and don't have to mess with the
entire frame. Your modified frame could return whatever the value is
that you want to pass out to indicate that it is modified, and you
would then be able to just pass the checksum modification out as part
of the metadata in some expected format that the drivers could then
process.

By disabling it you are basically forcing yourself into a
vendor/protocol lock in as you can only get checksum info on the
packet types the hardware supports. The issue is that
CHECKSUM_UNNECESSARY doesn't convert well to anything once you strip
the header. That is why back in the day we had strongly encouraged
people to use non-zero UDP checksum on their tunnels and had added the
ability to convert the CHECKSUM_UNNECESSARY to CHECKSUM_COMPLETE when
decapsulating generic UDP tunnels. With that we could support most
NICs instead of the 2 or 3 that supported all the new tunnel types
that were coming out that then had to parse all the way to the inner
headers.
