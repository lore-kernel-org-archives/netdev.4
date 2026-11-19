Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795077273;
	b=0o/98nck+m1mgFRedLvnKSeiB1xq3AVZf1qVvYmCo+pJ6fwHVTKniPOzS6kwUt3cCRdo
	 w3w0F+hLLzvvL791ODEqCmFG/CAvj5lLRJY57J58QtACoLeOr0ulHF9m1TxY8XM730wa8
	 XyVXx8AOPo9jKYlSDlTxOdjC5zWz4mD3sMjKDSpxxOl0Tr1qJqrhW4xecfZhgDWou9+AV
	 ku20X2dEOm8iREzoi1iZ5gYxsTBfFOm/iKbhPLa1qDDhIMTSCvy3+rJo4dlBRCDY0zaMP
	 jXBw350qq/buJ4LGN2aHR5Sjjx98fqaPtNM0FoAxXRH745rfR+JwQesQUY7sZskZTmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795077273;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MAh/NPyvhE/xnnX54f7TQx4Tan1jUpqqMxjFOT1elBg=;
	b=mj8kA9OOSuW1Ej2Gh9CONQ6kqyhO+yOkecHB8z7VNXBaSOqb8YecQGJx6HBLhX8CzCCh
	 EZUlx17rIWwmxV3NqOn0piypa2DsHMvi9t/RVQvWKp24L+fXuMXnu2T61XBmkIc8Si4rc
	 E6jnJM60I5wx1bHIQ8QPtwMTet1FolehHtVKh4PrTcs96AZl8ANG3zWhDLcqO2QbZPeES
	 VoIqNVuYJ+W0ldJ1ELUI/zFrROdlf9ZrwkGOWiGEOcF+dJM9dZzMo+jYrj6wkCad2YVcY
	 icwy1q9taXk40j8aAUqMt5/9wcAQ4Zpl2XkTIiarh1lEXofxN8RJprpfcNJW0ZM1H7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b3mq6bQ0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F50606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 08:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b3mq6bQ0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 239061F000CB
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 08:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795077273;
	bh=MAh/NPyvhE/xnnX54f7TQx4Tan1jUpqqMxjFOT1elBg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=b3mq6bQ0zs6mUmtYrWqGZFwhUhG68v4PHu/5bd4IERaOe/WL05uDvX386Bvk4h/rT
	 teMBtNhKtmXg0FFusF1raLDbt4HfdM9k5NA6eyIKO16dQ25moG/ZxhdmdsgcX8doz3
	 Xrrh0zlThrVr1W8TCkNbYjR5J2ujwvAdjWbMn+nCr6oqMib9jpyV1Bn5RTX22luJN2
	 IlyMUS597fVWaUL3gsGmjZs7zEZk2M6eZUui1ZNlmHu4NsgoqSrVh0xV6YVzNdWwAm
	 9r3QHW3wb8QHYshHKta5J+rsCueKRZz525XBs9tq72NKSlrdyVeETgwR06x4GCesRI
	 3H7Lzvu/jysPg==
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-71ad099391dso1080789eaf.3
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 00:34:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG+qgICx/5xAHCLYSqbdnGKpGtLnZQuV2outH092cqqLQBz+juzkDNqoUBClt6kmONN4/iofw0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AQva22E9VIqLfgkEfCR2OYHaXxDm3NQ6oUqb7AiHyDudqCvuo
	ZtPnK2RtYy4IIAt3bl1FIEY4r1NF8wlbqZ1t94ZKmBMn3tiCQGOzErkBGp3jc2dNTGxgUIr/5mO
	O7DFX+iVG8jHv6LVWsJOHzrHyp6V7e00=
X-Received: by 2002:a05:6820:5713:10b0:71a:f372:c160 with SMTP id
 006d021491bc7-71b184856c4mr2633020eaf.25.1795077272438; Thu, 19 Nov 2026
 00:34:32 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118125443.1137177-1-edumazet@kernel.org> <179500673097.3291.17329016243066243127@kernel.org>
In-Reply-To: <179500673097.3291.17329016243066243127@kernel.org>
From: Eric Dumazet <edumazet@kernel.org>
Date: Thu, 19 Nov 2026 09:34:20 +0100
X-Gmail-Original-Message-ID: <CAL4WiioH1G-S0hReaBJkFhGCVOj1PTxyuFG8SCYhuq1j5OOVmA@mail.gmail.com>
X-Gm-Features: AclHuK8qapYr-Rf-YT5io3Doo0ZIimyCxrSkJaNKktdogCGZy7oe4XXrvLL8bkA
Message-ID: <CAL4WiioH1G-S0hReaBJkFhGCVOj1PTxyuFG8SCYhuq1j5OOVmA@mail.gmail.com>
Subject: Re: [PATCH net] tun: flush uc and mc addresses in TUNSETLINK
To: netdev-bot+sinfo@kernel.org
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, Henry Martin <bsdhenrymartin@gmail.com>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Jason Wang <jasowangio@gmail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 18 nov. 2026 =C3=A0 13:58, <netdev-bot+sinfo@kernel.org> a =C3=A9cr=
it :
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

The issue was reported by Henry Martin, see the Link: tag:

https://lore.kernel.org/netdev/20261116024056.1274402-1-bsdhenrymartin@gmai=
l.com/

I wrote this patch after reviewing his, by code inspection:
TUNSETLINK is missing the dev_uc_flush()/dev_mc_flush() calls
that bonding and team perform when they change the device type.

>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel messages.
>

Henry reported triggering it on v7.4-rc3: after TUNSETLINK from
ARPHRD_NONE to ARPHRD_IP6GRE, RTM_GETMULTICAST and /proc/net/dev_mcast
exposed uninitialized bytes of netdev_hw_addr, including kernel heap
pointers. Details are in his v2:

https://lore.kernel.org/netdev/20261119040153.158372-1-bsdhenrymartin@gmail=
.com/

There is no splat, this is an information leak.

> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
>
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> --
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
