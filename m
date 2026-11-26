Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688641;
	b=UUtKzeqqK/+BZlbFmUumb+Lkr503WPZ4GmMkg41QB3b7sO3jetvK2LksKrYK/hC+JJ2f
	 cVzZmMRmeV77B8ORSqGHuYYpqesBDY4TN+pqI28y5+wzf7O4gcXKNj+VLuR5ImGSVeaao
	 4WLlLvPTlLZUo4LgfH+phaEp10+juJFbKQ7xlk3p8K8ILcFJRfeyGVhxm3TiWJI2K4Ban
	 lmOssC3Mw3S1cs6TrJA4HiYYsrqwmnS7DKMQCMe5OrRNMwbbhLtHdpvCiJQm4hLeZpaen
	 1cR9sSOkV34dFZH+q90huG9E8+EFCana6vIluv8R8gK4FQ20s2nWQn1n5nd5R1tflKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=2mKmxH++E4qor1mQxu0ggKku3S8sooA/5pfD3qywnr0=;
	b=hLVM0FNea4AOutxpV8qfyXnR1T9JM4LrUAciddfABLgI5xpHJe7xvbqIchsYQBoMbCRp
	 syVTwJHfQUZ4QeHF4CWyKW8fM0X8bsi9UHIG3HZE/i4EcEzZet5DFQX9+tOnLs2L13MdT
	 hvv0JNS4omtphdAn3ZRFYXfhVuCFy7DmbcYh4CZ6zfT1Dwi4u6ijLPOz/mTLb313SQ422
	 iAc36VWKmo9zbSWDoJz/uqqQezmBV8cfaEJT0yzBLEJZmAFuGIRiMKn0150qS7iQEg8eV
	 JQpJ381IZwZnbx2+c8PiRTOJjhRvTppRv7hqhwWkbEBTz4DnhLoytAu+YT8ifuEOUsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XychGD3m;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCA9606A31E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 10:24:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CCA9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XychGD3m
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb67b3a18aso6701105e9.3
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 02:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795688639; x=1796293439; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2mKmxH++E4qor1mQxu0ggKku3S8sooA/5pfD3qywnr0=;
        b=XychGD3mLVv+sSXHwiFhe8627rxB2/OsJFz2pDdDHsArTyoNG/s/rrMMJiboEejZjP
         loRS5fe/771OytzFDkOPFnFdfrDsRvr3Md1iJQJb0cLO4QCLeKx2FI9Ny62l6zJv9RS5
         X/xH8FQ+bkHiSH3yRfC2wZsv8B7PqUH9dxH98NcpUJEHeQVQhKtX2IUUwEtOOG8zEbmK
         xeoY1dMzWq/IQLTNYEEpUz4Qcb+3AZG4x6LNVbNYlb8PcwKQ4X4PPV+ucAm59xXF6M1c
         mCuRKe+nGXUKefxs3rsgQGETx6GZFxAIGvUzenAFmft3wRSc9Q5ie4xQjhp5py6HruoT
         zhVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688639; x=1796293439;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2mKmxH++E4qor1mQxu0ggKku3S8sooA/5pfD3qywnr0=;
        b=FEnxZBFdf4FgGAQP79aFJ0rBGtwW5xyA/dsPT8W8v4aWM045ZmEa7uUTcqD+D3+GVf
         GI51MXZU+suxzOELs/h7G8dMMgLZGZRea/ODKjuf0g64XqSU/7xr0SMG7U4gWaeLZViT
         /wHV1/5Od7vSUM3f63fDEiidgGuqP4Y6MtG+Xcg3izJHD3k89zaNrN6R9WK5r6x3SuNn
         cjDVrz4+Q++aW0nrgbdUEfH+TcisBZt3sX0yYxuZETQ26azGz4XtDB3tQx/7ZRFj+0NV
         szHZPtVBc3oYXXvx8mYNl4rZHiJQNg+IZDdvjk4+thsBFTeE6O1de4SDXlNX+8ebqmi9
         tfcA==
X-Forwarded-Encrypted: i=1; AL+hErFCt5FQT6i/ZEX3FdmMpGPbT4Ym7Epxi+HRryNFEL0Mknz7LtR3z2CI70kQZBKFFHbS4wbv8SQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6BoWQYfcI6ZHWxrnBN+6tWmxYt6UGAjeRzvGjANCqRlFgXRsA
	fWIuPsTHGI3S+1hoQw5Ji2zLVL1ho8bTcXph4WeYy+OhM53IFvgZLjWW
X-Gm-Gg: AZFdTZfKPs/lWP+ArQI/kxN97qrDZYoq6J1JRe2zuhaUpkDtJodjOxpEuxvCSp9o25J
	8FyHmrc1R9b8AaJJgQmT3BLvk4Jt2313NENCK1Z/r71NhbKHzPPot9s/xsm+PioaMRDsLa4obQD
	mr2rKQWVRP1fY+6AF478d5xVr9H8CQ1xw7jNq+KJ+oG2zLf6Lmx09GlmNAeqNZ9SF5uVEplbsuM
	rquiYw643Co1FFJC4b/znjQcXoH36Pu8Bp4PiQ4XHeTN7gMcLrdOJBMKRfOvTY3U3pa9xRM3ZNR
	O/Qvcsmd9txRPmovXory+VvzGgPe2SmPxI1Urpj8eJgf5HsKnVkrDIQCy941ngTTNNXnt5RHkqF
	0rTjlvTnqmvdl4A6yMRYr3pAaZbPG4mVAIXaKzr4iRxZQr0Iu5DNvMdHP9TnqNaqBqZ3Cm1UiTi
	t19uP462A24sjrqKwF0fg9pkuE7TUE/C4VsrHOnDb3vGQ7dQ93zjr08osFuPDvkPXEVaj9b67cn
	DsT/rNhQVTzhu2zBEfLwWXISNF4W/qyy6RW0tG74YOacNlRZ6QGUrR82N6xZ3nQNt/wBzyPDGBb
	q39JgniiteC5uwCb8FNEbw==
X-Received: by 2002:a05:600c:217:b0:4bb:6a02:d42e with SMTP id 5b1f17b1804b1-4bb887f3fb8mr287364035e9.1.1795688638583;
        Thu, 26 Nov 2026 02:23:58 -0800 (PST)
Received: from skbuf ([2a02:2f04:d401:2601:c96e:548d:4428:1f72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm581525025e9.5.2026.11.26.02.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:23:57 -0800 (PST)
Date: Thu, 26 Nov 2026 12:23:55 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com, 
	Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Florian Fainelli <f.fainelli@gmail.com>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Ido Schimmel <idosch@nvidia.com>, netdev@vger.kernel.org, bridge@lists.linux.dev, 
	kernel@pengutronix.de
Subject: Re: [PATCH net-next 0/5] net: dsa: microchip: let the bridge decide
 about link-local frames
Message-ID: <awgHiY9mcEAD1C34@skbuf>
References: <20261126-ksz-stp-link-local-v1-0-39aed15f6271@pengutronix.de>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261126-ksz-stp-link-local-v1-0-39aed15f6271@pengutronix.de>

Hi Oleksij,

On Thu, Nov 26, 2026 at 09:07:47AM +0100, Oleksij Rempel wrote:
> Let the bridge decide about the link-local frames that the KSZ9477
> family and LAN937x trap to the CPU. These switches trap most link-local
> groups (01:80:C2:00:00:0X, for example STP BPDUs and LLDP), but the
> tagger marks the frames as forwarded in hardware. So the bridge never
> forwards them to the other ports of the switch, whatever group_fwd_mask
> says. An FDB or MDB entry for such a group can also make the switch
> forward these frames on its own.
> 
> The tagger now leaves these frames unmarked, and the driver keeps FDB
> and MDB entries for them out of the hardware. As the bridge then sends
> some link-local frames back out through the CPU port, the switch no
> longer learns addresses there; DSA adds the addresses that the bridge
> learns on its other ports, such as Wi-Fi, as static entries instead. An
> old FDB bug hits these entries often, so one patch fixes it; without the
> series it needs a static entry added over a learned one, so that patch
> goes to net-next with the series. The series goes to net-next as it
> changes how the bridge handles link-local frames.
> 
> To reproduce on a KSZ9893, with link partners on lan1 and lan2:
> 
>   ip link add br0 type bridge
>   ip link set lan1 master br0 up; ip link set lan2 master br0 up
>   ip link set br0 up
>   # 0x4000: forward 01:80:C2:00:00:0E
>   ip link set br0 type bridge group_fwd_mask 0x4000
>   # Send frames to 01:80:C2:00:00:0E into lan1. Without the series
>   # none reach lan2; with it, all do.
> 
> With STP off, the bridge now also forwards BPDUs between the ports of
> the switch. IEEE 802.1Q says a bridge filters frames to the reserved
> addresses, including the BPDU address 01:80:C2:00:00:00. The Linux
> bridge forwards BPDUs when STP is off, so that other bridges can still
> detect a loop through it; see commit a598f6aebea2 ("bridge: relay
> bridge multicast pkgs if !STP"). DSA switches whose tagger leaves
> trapped or link-local frames unmarked, such as mv88e6xxx and b53,
> already behave this way.
> 
> The switches driven by ksz8.c (KSZ8463, KSZ87xx, KSZ88x3, KSZ8864,
> KSZ8895, KSZ8995XA) keep their behaviour; KSZ8563 and KSZ8567 use the
> KSZ9477 code and are covered. The ksz8.c switches have one static MAC
> table. It holds the trap entries, the FDB and MDB entries and the local
> addresses of the bridge, and on the KSZ88x3 it has only 8 entries, so a
> change on the KSZ88x3 can run out of space. Of these switches I can test
> only a KSZ8873, so I left them unchanged. Their taggers still mark all
> frames as forwarded.
> 
> Tested on a KSZ9893.
> 
> ---
> Oleksij Rempel (5):
>       net: dsa: tag_ksz: do not mark trapped link-local frames as forwarded
>       net: dsa: microchip: ksz9477: do not keep the learned port in FDB entries
>       net: dsa: microchip: ksz9477: do not learn addresses on the CPU port
>       net: dsa: microchip: ksz9477: refuse FDB/MDB entries for trapped groups
>       net: dsa: microchip: ksz9477: report the trapped link-local groups
> 
>  drivers/net/dsa/microchip/ksz9477.c      | 81 +++++++++++++++++++++++++++++---
>  drivers/net/dsa/microchip/ksz_common.h   | 14 ++++++
>  drivers/net/dsa/microchip/lan937x_main.c | 16 ++++---
>  include/linux/dsa/ksz_common.h           |  8 ++++
>  net/dsa/tag_ksz.c                        | 42 ++++++++++++++++-
>  5 files changed, 145 insertions(+), 16 deletions(-)
> ---
> base-commit: c2621b518b38ed38e280e008aa33e6c2d302f8cc
> change-id: 20261125-ksz-stp-link-local-5c53396cc960
> 
> Best regards,
> -- 
> Oleksij Rempel <o.rempel@pengutronix.de>
> 

I didn't go into any sort of detail in these patches yet, but they
reminded me of this thread:
https://lore.kernel.org/netdev/20250127125426.3b7cdkb75o5dbcr5@skbuf/

IIRC Tim's problem there still wasn't resolved (he tried to use the
reserved multicast address tables). Does your series address his issue
too?
