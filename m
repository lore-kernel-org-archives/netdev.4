Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795748421;
	b=msGSr9FRmHfCA9DML1OXHmbS8oglLSHXY348CLN0yyv+64QNKCiOc+bbY6F7qPio2LWn
	 s80eeRKmUyKkQp7qR8PS+ZMdzv0JptqbMrLrwAx6D+W90w27KY8gA1r7RD4MQ3DNzERP/
	 gPEhsjIJ4awFUmnaZRCQHTE02vumqpbyF2HzWeEN/y8AgMs/O0fm9icJ6OJJgqbeRBdtH
	 2x5GrXFakHn9pyTJR6CttQXJxf3Oe8PiOvcQi1MgKAPGlmDqQYkkShbvPemlf53bR518l
	 SXxTCUwvPMvbtIDBhJmEIxek50lDNWrwvqt2BH5tjS7JnDvFRiEkDb/dkkZ4VHkQNaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795748421;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=hMApwIg4ccUL/UyqPXsHiMrSMPM8gjtRIzIDGfh+Ylw=;
	b=G14OD9E1Gsi99XHmptPWygEo9hQO2fNIbMrfny1DGttyQAuQtFJsMw+03/fpgq5CUecN
	 vG0uMysqeItUNopg5aaDgtB62UVskBf27GB1t+5KJ49tzm4rE2hH5joyTq9IrdOaZ8S0V
	 r85ZcfM0PeZHi98elk/7nClUIMoNrjah9bBUeJ+GX757dtKFMU0OyAWEQZJY2pgoiA19a
	 ne/0SsGKWpML7pVSmueh8oQloBWnG6LWNWqu33r0IH/w5xO22JzEhySOwwjOdAQrbOmvH
	 QlWMATm3v8qp0JHL3Ce84vP754iNCnUJQ6fkc9XXRVcnxgTXs0fN2im9rHzimleZFsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OSBOBqUn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533CC606A326;
	Fri, 27 Nov 2026 03:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OSBOBqUn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D96591F00923;
	Fri, 27 Nov 2026 03:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795748420;
	bh=hMApwIg4ccUL/UyqPXsHiMrSMPM8gjtRIzIDGfh+Ylw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=OSBOBqUnHLedRCtaXJ4p+M5VYiukJ1PwKjgjrRm27IPZRLuHkbhyfPhbzJLkqw+gJ
	 Hx0e0zAc1sjObOQZdnmfR6NTkQd0z5woiyo2OC6FCRlkxC8n4xrcZsDi/F3yvKA5Pk
	 gUwU6N9Sz3geZgEL6KgFJSodeN9x/GMvR0vQJWwljCsy/cHZ//DHgc8t6sARH6mQxt
	 mL1NdIZdFxojBVL7B9gD7CPZjqOWTyoHHH6kKR3xd7Hyevbc+3MziD9weIITwrdZ6P
	 7gcU+ZBh3bdZT6EOcQtcuDL9ukBvaWeBlKuPI27pE+PvT4pierYLMaYr0WxB8mcMvp
	 5O/6M7Pindvfw==
Subject: Re: [PATCH net-next v14 02/15] net: dsa: realtek: rtl8365mb: add chip
 family infrastructure
From: netdev-bot+sashiko@kernel.org
To: namiltd@yahoo.com
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, gusfmora@gmail.com, kuncy7@gmail.com,
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev,
 o.rempel@pengutronix.de
Date: Fri, 27 Nov 2026 03:00:19 +0000
Message-ID: <179574841941.3135.14226342893059359025@kernel.org>
In-Reply-To: <b2f42e59-b629-47dc-a61a-d87580516fdc@yahoo.com>
References: <b2f42e59-b629-47dc-a61a-d87580516fdc@yahoo.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] This patch removes the kernel-doc entries '@jam_table: chip-
  specific initialization jam table' and '@jam_size: size of the chip's…

--

net: dsa: realtek: rtl8365mb: add chip family infrastructure

This patch adds enum rtl8365mb_family and struct rtl8365mb_family_info,
which hold the data shared by all chips of one family (the family id and
the init jam table). struct rtl8365mb_chip_info now points to a
family_info instance, and all existing chips use RTL8365MB_FAMILY_C.
rtl8365mb_get_family_info() and rtl8365mb_is_d() are declared in a new
rtl8365mb.h.

> diff --git a/drivers/net/dsa/realtek/rtl8365mb.h b/drivers/net/dsa/realtek/rtl8365mb.h
> new file mode 100644
> index 0000000000000..7b0c7109378c6
> --- /dev/null
> +++ b/drivers/net/dsa/realtek/rtl8365mb.h

[ ... ]

> +struct rtl8365mb_jam_tbl_entry;
> +
> +struct rtl8365mb_family_info {
> +	enum rtl8365mb_family family;
> +	const struct rtl8365mb_jam_tbl_entry *jam_table;
> +	size_t jam_size;
> +};

[Severity: Low]
This isn't a bug, but should struct rtl8365mb_family_info have a
kernel-doc block?

The patch removes these lines from the struct rtl8365mb_chip_info
kernel-doc in rtl8365mb_main.c:

 * @jam_table: chip-specific initialization jam table
 * @jam_size: size of the chip's jam table

The jam_table and jam_size fields themselves move unchanged into
struct rtl8365mb_family_info. That struct has no kernel-doc, and the new
family member isn't documented either. struct rtl8365mb_extint and
struct rtl8365mb_chip_info in the same driver still document every
member.

The struct has no /** marker, so kernel-doc won't warn about it. Later
patches in the series add about 18 more members to this struct
(ext_config_forcemode, vlan_4k_read/write, vlan_port_get_pvid,
l2_entry_size, the l2_*_to_* converters and the qos_* hooks), and none of
them are documented by the end of the series.

Could a kernel-doc block be added here that keeps the removed @jam_table
and @jam_size descriptions, describes @family, and covers the members
added later in the series?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/874b29a3-f47f-4bf2-a0f6-2f9fea712f4c%40yahoo.com
