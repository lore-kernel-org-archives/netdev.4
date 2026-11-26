Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795715199;
	b=Kzr381IakinkYIvjBs0vy6Nn12VUlhZZNJeiAoL0T7MD6X9NgFmNwcP8tjRq57A+RM3B
	 qPJx+PcL3K++a8RdWsijYmRNLKxUOvCsdb9QTJjpyMbgBULGHJ5JlZzzpNkriCip8IN+P
	 QPgPlL3E0rrfq/Zts0hdbIzeDSL46RT13uZqiK5WKg4JCc5tNnae14CfiwRCspuKq1AEq
	 PgaGzW0h7V5k4q/ELNknVYa16NpMcosXjmtGa3vuJokTGQkfm1PVKAoG35MXEbB97kIkf
	 6EKSDK7hItEkwIQQIz8YvctSxIhQAD7y1Qt0SjsQTCoBfpjxLLp7jeACeQO9kOYnF0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795715199;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=EuvPYLumv/K3gPGwMhejNezfZIAIjYhwKqM2Diy+6FE=;
	b=Rk2dnRAiYuYT9XmlpMADm6bt/aQLAe4NUGqtyoxxSXFfZZnj11YmTERKmCwc7GHqFKNM
	 Gaw9JP2OYNUO5bVvvwmbFkSxysJBVkpUW/fsMwkeztV4HwtHotEr8sB3RnNWzqf4QT2DX
	 9l2jyn4u/31ZC/T7HlMdY0en+WtTIp9yovSnMoWlx8Xqdjf13A7/NuJX+UKhCNpN9Q6Mh
	 CF/dBausLH+2EL6LosRawHq5+G2x3EgDjoUOvB8HvlefBBbTvP3zqb7n1/0Xa4bzs+rNf
	 cLYMfQyrxcfLGsIeBu8pjVwam8NcGGb22PMnCxZa2q7C7S1333+yd5yPKHcusUiGYFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--willemb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TMt1QKwn;
	arc=none smtp.remote-ip=209.85.222.71
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228EA606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 17:46:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 228EA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willemb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TMt1QKwn
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99063f4065eso1796141241.3
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 09:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795715198; x=1796319998; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EuvPYLumv/K3gPGwMhejNezfZIAIjYhwKqM2Diy+6FE=;
        b=TMt1QKwn4ooOG0LrNqCBdG7iH6jAG+8oo2a/UGskym5ZGxvoSzepWTYvwwZ/Uc5IdL
         1OPO2zF2+cadqVH/6m6fU6DB7UFfDmVHL6EV9rmhR0NfNJAFWQLhRvsPfdxyRF7rP7f3
         R3zNBvYI5IZYjOgbU/BVV+iv/o56V3onl4iHQ6mmD+Y4zx/sLKRdmjYeUf1FHi+wguYH
         +MdfbitMQ8gkY7NS7aLCn07BBRBgy8PWEFmfnzyGjEudJNpne4FZq884UbneCa48sDX5
         Af7mYeUll/b4o9gvjJ4celtj9lqZlwssbu5IN9v+ZmSHjj+OECK7FrfL2rVGzifmdi8y
         EJTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795715198; x=1796319998;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EuvPYLumv/K3gPGwMhejNezfZIAIjYhwKqM2Diy+6FE=;
        b=y8qtkDQk6PW8eTYaKubyGCNMpG6HrhpzV+con4+fXsyY16TcM/QV0Ga2xmHy+3hlEz
         Dp4e6sXAGjcWjMzMnbGZM5wDlLBr9uvp3vi+S/VSFVpg9zLT7niuMUlBwF2jiqj2JBKf
         AD8NdtJ/zGwG1hAMrXcSRzhpofFxo26ewVhZKM4f5FWJbxVYpLr/VQd1NiBkW3xG9TeT
         R15JMFdsbKlVCmpxGDckrW3lzQ3iOKwkWoGisM/7EiqRQ+yVLMc3q5TTVaT5KeQYuEht
         QRYWhkEOUMBDZqsaeylyaFLOHu9mNuEJGcBL+57BZLIcYYdMeegPVkIfLG0h6Rw28Uwv
         3blw==
X-Forwarded-Encrypted: i=1; AL+hErFwul4PNKU4a00vgqycnPzPWZwu3V7RyVw1fFHA0s7QwwlsD8JmK5xoRzQ7WHNZsF/Piw71OuA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BWyDGeu5Ak8z+bm2iyN8VHu/7yFFz/9UdTFc3cw95nC/ItU29
	afKitC/uCA+TphTmsEbLfmKTqWCnibydW7ary8s0REzA0JjM0cnS5gpBALuq2Wfnxx3f2uWEdAp
	y/d7KOYFZxQ==
X-Received: from qvbkd28.prod.google.com ([2002:a05:6214:401c:b0:91c:c113:4812])
 (user=willemb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6102:5126:b0:7b5:4700:3a6a
 with SMTP id ada2fe7eead31-7d7397bfbe3mr11220876137.26.1795715197540; Thu, 26
 Nov 2026 09:46:37 -0800 (PST)
Date: Thu, 26 Nov 2026 12:46:36 -0500
In-Reply-To: <20261124170551.1874487-1-willemdebruijn.kernel@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261124170551.1874487-1-willemdebruijn.kernel@gmail.com>
Message-ID: <willemb.35265d9786238@google.com>
Subject: Re: [PATCH net-next 0/6] net: remove dev_validate_header() and net_device::min_header_len
From: willemb@google.com
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, elder@kernel.org, 
	Willem de Bruijn <willemb@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

Willem de Bruijn wrote:
> From: Willem de Bruijn <willemb@google.com>

> Remove unused link-layer header validation plumbing, clean up the
> remaining af_packet users, and drop net_device::min_header_len.

> Mostly cleanup, with two user-visible changes:

> - Patch 4: on devices that set hard_header_len but have no link layer
>    header (e.g., PPP), SOCK_RAW and TX_RING sends now always have
>    skb->network_header at the start of the packet, not only for short
>    packets.
> - Patch 5: on SOCK_DGRAM, the VLAN TCI of non-offloaded tags is now
>    reported on all Ethernet devices, including those with
>    hard_header_len > ETH_HLEN, and is 0 on non-Ethernet devices.

> 1. Drop stale Ethernet fields (including min_header_len) in IPA modem.
> 2. Remove header_ops->validate and dev_validate_header().
> 3. Move af_packet TX header length checks ahead of skb allocation.
> 4. Reset network header on all headerless devices via dev_has_header().
> 5. Use ARPHRD_ETHER / ARPHRD_LOOPBACK and ETH_HLEN in vlan_get_tci().
> 6. Remove unused net_device::min_header_len.

> Testing (under vng):
> - tools/testing/selftests/net: psock_snd.sh, psock_tpacket, and
>    txring_overwrite.
> - Custom tests for short/zero header validation (SOCK_RAW, SOCK_DGRAM,
>    SOCK_PACKET, TX_RING), non-offloaded outgoing VLAN TCI capture
>    (AUXDATA, TPACKET_V2, TPACKET_V3), and 48B/100B IPv6 TX over sit
>    (SOCK_RAW, SOCK_PACKET, TX_RING).

> Willem de Bruijn (6):
>    net: ipa: remove ethernet-specific artifacts from modem netdev setup
>    net: remove header_ops->validate and dev_validate_header()
>    packet: validate TX header length before skb allocation
>    packet: reset network header on all headerless devices
>    packet: use Ethernet header length in vlan_get_tci()
>    net: remove unused net_device::min_header_len

>   .../networking/net_cachelines/net_device.rst  |  1 -
>   drivers/net/ipa/ipa_modem.c                   |  4 -
>   drivers/net/loopback.c                        |  1 -
>   include/linux/netdevice.h                     | 18 -----
>   net/ethernet/eth.c                            |  1 -
>   net/packet/af_packet.c                        | 80 ++++++++-----------
>   6 files changed, 32 insertions(+), 73 deletions(-)

Sashiko reports are valid. I will respin

--

pw-bot: cr


