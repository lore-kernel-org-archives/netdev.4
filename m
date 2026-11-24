Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509731;
	b=GkgEvaQ4HoT4Y9vJCMudlo2JvOqlgsDzJaKz0tkDbVTCuXHhIjLMYNmY0yH+si12LJ+G
	 jvft8+zkxRMawQMywkdadZgAsmsQFdJkKNaraGx3c8rjoLeGAcTsIw1mipjjHfIZxKNYh
	 tmU4nBHyJyBdU0lVRRWXjyfAejvMsA8bUaI0O5vbRBDGN2EUNoyvxPoud9NWQ12clIwVw
	 zKHS8b27FmaMdSkcdNpP8gMHPD3ETmb0epPTV8u8q5gEFNzT2q2qDPnfVJtt0K3vGDKH1
	 dHGLZOF6OOElvfsRHfDeaEZyxHtElGY5y/QfTkWoCTd02BSbHy8X3SwmUqEsa3xC3Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=L2EgBNT48xGjvZX2/RhS0gWPDCHaepO1c5iBj7UXWkU=;
	b=vAc748RLnKu3Opu4XKOKmCE4dzDunqSsyFJRejbVLDXpFx+ASajc7OJVw/qCbfwo7UDQ
	 cp8VgzxEzRsd4c8Mbcj0vgMclcPRbBJnIp/osv1mflq1otItbT+FNZqpe1IJ6FaQdtoTu
	 gnq+fwF0UPx0caZzBQcbOQYCjAD9OthNGjCoJDNtRIt5bj+jLbC2GpPSjB8mWKneY8VzA
	 /Z5n8Q4lgcTZq30GUvBVgHO65qHfH7EN0jI/JEqaBGxbT7DmlK5xhEHaCcptwdAdQU+n8
	 vm4cEPlIzA4/w70zPwAVvyG+8C1ImxV/S4JhZb1Cuob0PMsi0IogBZdtEZcuHp/p9IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=Kpz9b0CG;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A00F606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 08:42:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A00F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=Kpz9b0CG
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4a42b34e930so3696005f8f.2
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 00:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1795509730; x=1796114530; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L2EgBNT48xGjvZX2/RhS0gWPDCHaepO1c5iBj7UXWkU=;
        b=Kpz9b0CGaR/tKGI+QLsZwJui5ZH0UGsl55OBqHSIyVbfwnp76QqFKUykB+3jXq97na
         fQfO4W/4Rqmbl6hCM66BWO+Gt2XKy+CK1wNhKIvvI37LkVE//ZPYb9R8nvW+4pS6vApu
         2XPS13L0+hiCIe/eNHxfklkS9k/Znqq8H4CNxxciFHl3YDNKvodHZXIjWl8jQjRpgcn4
         iqxmDkN4LWYyhpBzUr3SKqLjcjUu9vRiQtpJn3uETKS9eRE/i1kPTyj7Vdj9/+lDaOKF
         AVVudaiYgF+IYTHxEXU3dVZ44raI7pjRrEXJtgmx8QkIvF33E7x6OuWywSJrzFHxfDF4
         iDtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795509730; x=1796114530;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L2EgBNT48xGjvZX2/RhS0gWPDCHaepO1c5iBj7UXWkU=;
        b=ACHJuOVBKwVn6Z1j42fBlgu7/tMKQBI3t9Mv22SMedaGt4BTQYspMGrEfV5vpuIIch
         iSK6ySk0qnnqPw2rz+qEkIcTea9MGMmL1l7CN3cfp4Sre2HZgOEflD0352xHGAFiDPDW
         Pn2xKZR3xaUmeG3a6dxxBblCdoebiuUSbdU7GIEPOjVAF1XaJTz5YiXaacMDgYlpsdON
         djm1UUu0ZyfjMVGGDI0lAByoyE2Q4bJK40eEccMlucPCGHxPCOA2LtSvPmHk32U1GgUi
         sHyAkdkA8nZ7MX8kcCqC3ugYyb8AigTXFSzhgI4uf4ngCPofa/N71ACOCL1IEokMCgfr
         f2oA==
X-Forwarded-Encrypted: i=1; AL+hErFEJBsWPjFjqGWU328l+iB23CkESci3uDuT7OSqMABoN8NoNXyjZE/cum+jphdk0yI/gDyVtpE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VyNUWwWz/iS+Bw7eixPSHtq0LHvCVjPcXFTU1DYq0H6yIyFYa
	IwyzXJ6XNKhSI7l8Sp5NndwB0sByENgtizDql6+D7XYSBEp4sJr1jqD3HMdIuRwZrio=
X-Gm-Gg: AZFdTZcBnKiN7bHEYKeZm4BvXV8jPJjK2le/gpYBv71IXK+WPL4InguBZXN0sb/jnNo
	K5mlwHlaNnIFt3fMLLjco3PPmDXziZRr1hfvq2TKii+fpULSoA5m1+fL//yrkTP3RHIvWVRLM0k
	Hf5igzRdc9b7+HmnqYjJWcy5TkjHB6t9t3/Rt/jOpR8RueNOcYpeffPUxNpCPYyAzaE4jV6qa6b
	WnV+18+EVDQIworVIZMjXyTGGXUH7CFqPrif/QEUaSITAGeutvTeROqAAh8msYSzWKeMGP0O9W/
	6JzJBQLQ8UTC3OX4h0tQzVQIKf0vhUbMfxM7O4FH11zEdKHHrhFX0hEhmtB6cCXH50hUd9MjUDx
	pgIFZ47bELpTBq8+34LjkMLDFu/0To/dt1FEPfIk6ehEoC2Y9e56+bOzFKasSuxZNB7gb0clHjk
	YxVIeZZdM4mRME0XCaxPU6Zwdw3Gxzien/MXQmiTeIsnVDsXfRnuoNjKi0hgQC2lx+Q6/hJsQJd
	y2UjzgERVxKzZpKS+7kU+oQKgrSAIaBe34HR3wfYLSI8/8aBfSXISlnfieTd+F3TBL6VS26YzMs
	ky2OktLSdrsj6zDp1tY5Ou4ILN/kg2IvXx/S+1/xJEAczhdRMs5BWuMVG6E5
X-Received: by 2002:a5d:6f07:0:b0:4af:7577:65c0 with SMTP id ffacd0b85a97d-4af75776767mr17039494f8f.5.1795509729871;
        Tue, 24 Nov 2026 00:42:09 -0800 (PST)
Received: from [192.168.0.161] (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm27622547f8f.31.2026.11.24.00.42.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 00:42:09 -0800 (PST)
Message-ID: <90e0bb95-6751-4ebb-8ee1-f5e97e811621@blackwall.org>
Date: Tue, 24 Nov 2026 10:42:08 +0200
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 1/1] bonding: keep non-Ethernet slaves out of
 802.3ad bonds
Content-Language: en-US, bg
To: Kyuwon Cho <kyuwoncho18@gmail.com>, netdev@vger.kernel.org
Cc: Jay Vosburgh <jv@jvosburgh.net>, Hangbin Liu <hangbin.liu@linux.dev>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-kernel@vger.kernel.org
References: <179549697473.218888.8044828119056769556@gmail.com>
 <179549697473.218888.6814133305133689781@gmail.com>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <179549697473.218888.6814133305133689781@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/11/2026 07:13, Kyuwon Cho wrote:
> bond_open() adds the 8-byte lacpdu_mcast_addr to every slave of an
> 802.3ad bond with dev_mc_add(), which copies the slave's addr_len bytes.
> A slave with a 16-byte address, such as an ip6tnl device, makes it read
> past the array:
> 
>    BUG: KASAN: global-out-of-bounds in __hw_addr_add_ex (net/core/dev_addr_lists.c:102 net/core/dev_addr_lists.c:157)
>    Read of size 16 at addr ffffffff878a2940 by task test/114
>    Call Trace:
>     <TASK>
>     __hw_addr_add_ex (net/core/dev_addr_lists.c:102 net/core/dev_addr_lists.c:157)
>     dev_mc_add (net/core/dev_addr_lists.c:1036 net/core/dev_addr_lists.c:1054)
>     bond_open (drivers/net/bonding/bond_main.c:4405)
>     __dev_open (net/core/dev.c:1762)
>     __dev_change_flags (net/core/dev.c:10022)
>     netif_change_flags (net/core/dev.c:10087)
>     do_setlink.isra.0 (net/core/rtnetlink.c:3294)
>     rtnl_setlink (net/core/rtnetlink.c:3633)
> 
> Commit c84fcb79e5db ("bonding: limit BOND_MODE_8023AD to Ethernet
> devices") rejects such a slave only when enslaving it changes the
> bond's type. A bond keeps the type of its last slave after that slave
> is released, so a bond that once had an ARPHRD_TUNNEL6 slave can be set
> to 802.3ad and take another TUNNEL6 device. A slave that is itself a
> bond can also change its type after it was enslaved, when a
> non-Ethernet device is enslaved to it.
> 
> Check that an 802.3ad slave is an Ethernet device before the type
> handling, for every slave, and refuse NETDEV_PRE_TYPE_CHANGE for a
> slave of an 802.3ad bond, as team does for its ports. Other modes still
> allow the type change, as bond-eth-type-change.sh expects.
> 
> Fixes: c84fcb79e5db ("bonding: limit BOND_MODE_8023AD to Ethernet devices")
> Suggested-by: Jay Vosburgh <jv@jvosburgh.net>
> Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
> ---

LGTM,
Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>

