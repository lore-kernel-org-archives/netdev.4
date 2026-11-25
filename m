Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612455;
	b=GUJKy1o1izdQLwNO7LgIFr6tjSxIAr48TJWYH2cTjK0g9ujbukyNRiO8R4IPt/BabvP1
	 B6B4US9UcjRxO5gSo27kUE4Hsozzz7Q/7HZ4WDwDhCGr5c+Rgx2DuMpjmjjlJi6V3DdAX
	 CO4WEof79lRP6OeehsQu0E/jQrRiwgJToYa6whGUU1pbl+jgy/wJ5b9YGTZdT/kJAyeDl
	 4mQlWn0m5ygUru1aML+we+nmZ+H8jhS29HiEyuS/CZ4ywQBNj8M68sMrYAG4ev7MrhzWX
	 LV81rqhM3MC8QKcMRXHRnj0KhEWARXn7YWckbJRuM4C0fyo2Z7xQFxHqMvoz0D1VJbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612455;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5XfMe9sVBlH5h5dxZM8mrBTIhabGa5WtTp0Fjg5KM5g=;
	b=0OfNgK6vjlsIGB+EIEIhYN+A0VxrBBXgZIgSTmvvBHg8b1oRgZiMzhm1PRnuEuPGiUpz
	 HE5/D0adJSQk7qmgbZIeBkxGtLWcd4NW17C9FsMX4x1ciDOnduetzuONC0Tz7rujg0Ims
	 PJ9MrHksY4Cb+fcVvVY38K5wVELHrCPNMcQ41OuxpGOA/MPToqhUlmvOleLIETS/jaz0K
	 AeG9E3Rh2GHFybnZC1BIk/tFHWxmznrt52T8TY04Yx2ly11D23t4855SBsY61mS2NfLwh
	 hjXZceXdcX6pswhNkJVRQBV35h4kMQCdIrb5lPyMxF8dY8cOVrQMCMj6qUHeDF0jsRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jS1BkzYj;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13312606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 13:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13312606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jS1BkzYj
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4d28f75d62so950807266b.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 05:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795612453; x=1796217253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5XfMe9sVBlH5h5dxZM8mrBTIhabGa5WtTp0Fjg5KM5g=;
        b=jS1BkzYjBkjNz8jvYZNS9iB6slXYZALrhZnVKf+Z95tqj5yGKsMqgUVemegnV3fdNC
         91QdplPwR3M7J89n/zr2Jo3KW/DlD5wN7A4Waxp0PPcrPRMo+8ozM3e15KtQCO5YOxsh
         kueWy0tCqkXz+TW8VahihAT5wGBmcTWKPUDOJmCcYoYWIkkaAIh9kP19OrTIinz3CxSm
         eenhzxtNukOXTBGXp9+O1KzoztN3BBq0cr0yv8n7euFZxHrnJ1Cfm7xcrBCHUqirRCDX
         6KNMTtsLA02CIdaiLVJMUETNwZVjCE4SEVLey2QjDx+PopDKow0U5SZOlUxRQCE0LFnV
         hwHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612453; x=1796217253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5XfMe9sVBlH5h5dxZM8mrBTIhabGa5WtTp0Fjg5KM5g=;
        b=FWPMrrW7cKUZeqNM1RQIIlrqUaXK4rLcy1khawC1DRyIOvwisbVJ3f7ROfUCmt9fLX
         i1OOQFHut3KAob5/JSfTrDQXmbTuckNdc203rGcXDMOEYL63yCmhOnAaFvwKdS/WKEB5
         emK4vZDj7HQ1wP2qlub4rFP2sGTqliIMgQ2CWk6heXD8V37UVXhWE7yM8I4/Aov8lGAz
         L4VLn0znTQFOiYM1jnN2hJtReH9xPEEjMJ4lWahTukpV9N7ScKlmJ/+VanDe17/Tni5S
         RqIhODM5gts1UdwVznxnd++nBmSuKArLiYHKx9XsSbA5cAD0xVHXV5+j6j/M9GpzUJpe
         MWkA==
X-Gm-Message-State: APuU4Z8iO7Dy+hVcv1yBRe0jvqpV2orM4uv/wOiXBNU6kPkmzFwcHWBW
	brFSeCbnaddE97F3bD668pZCfmUZJRJPCOcL+lzaIzaHhLKMs1JWYiwY
X-Gm-Gg: AZFdTZcLTVwjtsfPOGSHCZ7gi/sglFPqEun01W+NKVh907RMFUXs7bCS7v9eIT2mPuX
	VcofolSa9Pq0xrBxXt7esGDxnJBYeG/4483kwbrduHZUpJ4bnyC4e1lGg1IROtcTkIwt+wG2iZm
	RYG0YQiMN9/Vp4tWc2uHCvu1oCzUWEL41OEcHQxH4PgECx7wqMBjcZyu1jRapx3gaf6/GK4cwKi
	+lzfUBsrK4IajnxNHlQuGTPkcRShiCqU0+JdoOy+sa0PnB/gyc8JRTvvf2Jz4a2XgbhHyc0x7VI
	5WXn81KV0OZLQxWiNgPjPkgDs0bwCJWf08JEd97RAO7LE6qQJJL/UpmqHlvVDtvIfdQ/gZn/QBm
	SmK1sb/hs1DXFKJFaYwU4EtYO8EiqT8bWdDYKb7kld5KnZ7MMwoBqBKFEHtqq7fXnq5JkQO5TMb
	G6wU2Ek+Syg3fsh4oQx1+ncU5oLVgKujEaxYo+CZWJeo08fOhJ9v4zWkLZgqvL/3GurxfPmbVcd
	B14NaI4F3V2f53W2Ltth4fVFBljb68QuSx3HDHiV18AwOltuYWjNkvosPceqvrMSK+oMSPL08c3
	ahE2GIDoDTXiwXdtV3RI7uLH3HItROAXGwyhgw9jezXkD3GyoZrO0caazmEsJMMR1zQG9KVMrdr
	06UQlqwHUUFS6C8qlxkkITJAkVL/hcBZBHkm0CGH3m5NHGIT/xAvyzdfvKQlXiRMhYS6U2GrB29
	v6JkT2bwNT3reGHn19mIk9yw==
X-Received: by 2002:a17:906:f8cf:b0:c50:bf14:8ec1 with SMTP id a640c23a62f3a-c513ab4d93emr1032726266b.33.1795612453112;
        Wed, 25 Nov 2026 05:14:13 -0800 (PST)
Received: from desktop.home.arpa (2a02-1810-1e16-ac80-898e-1938-27eb-b890.ip6.access.telenet.be. [2a02:1810:1e16:ac80:898e:1938:27eb:b890])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae698ccsm634079466b.26.2026.11.25.05.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:14:12 -0800 (PST)
From: Stijn Cleynhens <stijncleynhens@gmail.com>
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: netdev@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	=?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin.sipraga@analog.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Mieczyslaw Nalewaj <namiltd@yahoo.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 2/2] net: dsa: realtek: rtl8365mb: keep the neutral PVID in VLAN-unaware bridges
Date: Wed, 25 Nov 2026 14:14:07 +0100
Message-ID: <20261125131407.908739-1-stijncleynhens@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <CAJq09z7Jg1Y+R5xmLeE7CSUvp7dtFKi6vLifDxdL+nh8VL3FdQ@mail.gmail.com>
References: <CAJq09z7Jg1Y+R5xmLeE7CSUvp7dtFKi6vLifDxdL+nh8VL3FdQ@mail.gmail.com>
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

On Fri, 20 Nov 2026 16:29:35 -0300 Luiz Angelo Daros de Luca wrote:
> >  - The port-based FID alone changes nothing while the VLAN4k entry of
> >    the VLAN a frame is classified to has IVL set. The learned key
> >    stays {MAC, VID}.
>
> Wouldn't it be {EFID, MAC, VID}? Or, for standalone ports, {0, MAC, VID}?

Yes, for unicast it is {EFID, MAC, VID}, I left the EFID out. Multicast
entries have no EFID, so there it is {MAC, VID}.

> >  - give each VLAN-unaware bridge its own FID and enable it on the
> >    ports of the bridge while they do not filter,
>
> And how does EFID fit into this?

The FID of a port is kept equal to its EFID: 0 for a standalone port,
the bridge number for a bridge port. A unicast entry in SVL then has
the key {EFID, MAC, FID} with the same value twice, so for unicast the
FID adds nothing and the EFID keeps the bridges apart as today. For
multicast, which has no EFID, the FID does that. This also keeps the
number of bridges at what the EFID allows (7); the FID is 4 bits on
family C, so it does not lower it.

> Here I wonder how the EFID would interact with that FID. I believe
> each standalone port requires its own FID, as they share the same
> EFID=0.

They share FID 0 in v3, as they share EFID 0 today. I do not think
they need one each: a standalone port only forwards to the CPU port and
has learning disabled, so the entries in FID 0 are the host addresses
of the standalone ports, which all point at the CPU port. Two
standalone ports with the same host address get the same entry, which
is also the case with EFID 0 and VID 0 now.

> >  - A static unicast entry written as SVL with the port's FID replaces
> >    the learned one in place. The roaming case from the commit message
> >    passes, 10 of 10 pings, on both chips.
>
> Great. That's what I was expecting. And does that replacement happen
> even if different VLANs are involved?

Yes. In SVL the VID is not part of the key. In the tagged test the
station was learned from frames in VLAN 20, and the entry that
replaced it was the VID 0 one that DSA installs on the CPU port.

> >  - as a separate patch, write a VLAN4k entry as IVL only while one of
> >    its member ports filters, and as SVL otherwise, so that tagged
> >    frames in a VLAN-unaware bridge are looked up by MAC as well.
>
> I'm not sure about that. We might need to avoid enabling the VLAN
> filter if there is another VLAN-unaware bridge also using that same
> VLAN (as well as avoiding adding a VLAN-unaware port to an IVL VLAN4k
> entry).

I would rather not refuse it, as that configuration works today and
would start to fail. In v3 such a VLAN stays in IVL, so for that one
VLAN the VLAN-unaware bridge behaves as it does now: unicast is still
kept apart by the EFID, and only the roaming of a tagged station in
that VLAN is not fixed. The commit message says so. If you prefer it
visible, I can add an extack warning when a VLAN cannot go to SVL.

There is one more case I wrote down in v3: an FDB or MDB entry with a
VID, in a VLAN that is in SVL. It stays in IVL and matches no lookup.
That is what the bridge does as well, as it looks its FDB up with VID 0
only while it does not filter. Writing it in SVL would give it the key
of the VID 0 entry with the same MAC address, such as the one for the
address of the bridge, and deleting one would delete the other.

> The Fixes tag is appropriate since the code is broken in this specific
> situation. Let's fix it in net-next and backport it to net.

OK, v3 targets net-next and keeps the Fixes tag.

Family D has no EFID, which is where Mieczyslaw's series puts a
VLAN-unaware bridge in its own FID, with the same port-based FID
registers. As his series is further along, I will base v3 on it once it
is in net-next.

Stijn
