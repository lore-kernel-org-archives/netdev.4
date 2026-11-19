Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795090978;
	b=TJHok1hR4ooA1KHOmEUwZ9f71xKyi0JB70Qpa20XsZbtWXbRmBhUrrXM/WCpaMmV9+kB
	 Z2bZYKcPk5n+3jmoj5sz1MvpBBrcxlCl7WlBT6RMgzFntJPPhRLAb3wN0sKCh7gkZfHsw
	 x413npzHk2ExLL5C+Z44t0LwqQLtXcAzz99Xo0XvGURORJBnRoJ1XaxTnaxvAzsvdxLtE
	 7HmYso5ZVdEemcM6ZJMHzaOxTKiVBJPI87osf66nzPaPRwx7xW2NC6GWnlMNjYVzf9Bzv
	 T2TjDi5QGiGD8SB1/B5H9CXoWkxE114HMICbibppmlZPm7tNtMjX595rjKplcKnqO9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795090978;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=SXp9CsGNZ9198vKxlERJhM6rRFDt3TB+h3sLDmsTvqY=;
	b=cn/U8uZ5DomSH71KiADVK2O7u6JYCXXfcjvPuy6VZGC84WPZ0OSFuaMxwsAklZFUq9lx
	 fr6cl/OgvcJdNPvRMPNcaY1cyparo4kk4IR8/55uR6iq+SdHudPXVxu1uuoPq1aPlvDw1
	 4Vq49A/J9+5kRvoKFUT0q+dCJPWHMxwcN3UZ4kTJHyAWcizIF9GEEsUhXhfxHHNqCGo5q
	 YO+HhsXEn6Z/i0GNTJWOkNdyug4FW0Y5Gen1E6AyLyBEgqaecQDNBLIxilulUArL47Qq3
	 pQzLbzHPy3kAxYKBz56/3xdUMxQRvixzZBJ4LlCKWYa3mfg8wDHOLY+chpCBV1kdGdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=nTyJfWrW;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98BF606A32A;
	Thu, 19 Nov 2026 12:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B98BF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=nTyJfWrW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=SXp9CsGNZ9198vKxlERJhM6rRFDt3TB+h3sLDmsTvqY=; b=nTyJfWrWs9J3Bu0dcnPPw1Xcqx
	ZO2GJv25OsuW9y9A57I18j8nIIfCDI7VHEQv86ieSX7TES3LM+hYTzU7SymfMmFvB9BdEeM2gqV6r
	HTu2YbhRKfMz6brmeSa/unjcrRJAO8UCQyFKRExx3QqpOLnpwcNSJh8UKqO1eKB4HF6JgbwH5FLi+
	1+ORZqXIYASY4NsdhOC8TfulyD9jNrTj8Qf6J7mKNhjp/n/mkfSC4HUK5YOykRaLQPupkehsn67LI
	osXstr2pmhNujJ5cis957d8XLpXXkoBMvjBCxBp+NSqHha4HCFUFTXaSeV9OZH3XtUCrjFersvJEL
	zfMJGMVQ==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Coia Prant <coiaprant@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, netdev@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Coia Prant <coiaprant@gmail.com>
Subject:
 Re: [PATCH net-next] net: stmmac: dwmac-rk: split gmac_clk_enable into
 enable/disable
Date: Thu, 19 Nov 2026 13:22:38 +0100
Message-ID: <Jocs6e4zRiOpvEViMS_OjA@sntech.de>
In-Reply-To: <20261117182502.3045841-2-coiaprant@gmail.com>
References: <20261117182502.3045841-2-coiaprant@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Dienstag, 17. November 2026, 19:25:03 Mitteleurop=C3=A4ische Normalzeit =
schrieb Coia Prant:
> As the great Linus Torvalds once said in
> Documentation/process/coding-style.rst:
>=20
>   "If you need more than 3 levels of indentation, you're screwed anyway,
>    and should fix your program."
>=20
> The gmac_clk_enable() function previously used a 'bool enable' parameter
> to handle both clock enabling and disabling. This resulted in deeply
> nested if/else blocks, which made the error handling and rollback paths
> cumbersome and prone to bugs.
>=20
> This complexity has led to bugs, such as the bulk clock leak fixed by
> commit 8db67bb6a1ff ("net: ethernet: stmmac: dwmac-rk: fix bulk clock lea=
k when the PHY clock fails").
>=20
> Split the function into two distinct helpers: gmac_clk_enable() and
> gmac_clk_disable(). This flattens the code, removes the boolean flag,
> makes the caller's intent much clearer, and simplifies the error
> unwinding logic.
>=20
> Additionally, this refactoring aids compiler inlining and CPU branch
> prediction (trust me). The reason is simple: no branch, no prediction.
> While the compiler might optimize it, there's no guarantee it will :P
>=20
> Signed-off-by: Coia Prant <coiaprant@gmail.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


