Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795332424;
	b=Bei/y3+2LRtG0nmkldZNg9NKbcv0IExSI55Igsl7o1EST+HBJ0D+69vCeFURQu5JXVyK
	 FoPNijhJAq8IfHf4LOQfDUiVkDDYWjV/SFgQVBUE3Rzh5UvKopvMBPywO1Iu6oHA1NiyZ
	 0s4CXczyaXJwOvuloWTD0GVx2CEgAx2Q0wH0NgkN6skssYJSxW9LF0k+b/xFbO6mOuncd
	 Wi/VI2Y1xwdhStVFROuNhxzSaD7JJTZJ/yF8GA+UNjk7NAd9b48eRWLOM+Z6y4S73wRiV
	 Rala51wlt3gddYKL7eExy7McIm3UNvEHlKvZxfaIEZXPZSZctk/MDrlduaMkPqPnN0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795332424;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jRxJug/Y1WR98+oKDtwiqnL5a0+fWq49VTbpoM67nmI=;
	b=djlvEhV6zoZVYjOT/GuBSVJvPuTGclXxwclS0X+GYT4bUgAWjhZ6Y87AAdsKKOCTISDq
	 4IjUg1ZRc1/o0xRsRrzFvVzrLoOnv/kqQMonKiqQBjiSDH46WTqS206Q2SJfU7Fdt9IPz
	 UjZyg7Sc3HCSV8xi+Ge4gqVRaPnvuD/phFCQI7rxMue79jeLpljFB7ogRsc7OMLup19f9
	 qZ+MrOcYCYsktGs0yRN7NQcq0B0EcAK3f4uqx7sZ8LuOgyOIyiqdojRfHzSqjrfFwQfaI
	 HyFJ6Pq5rUJhssMOGH2rJU63qxlyzkI6U7FciZ17wjrCK/dmHshDpSfVtXrMHc1D5fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l0msyFkP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0383606A32A
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 07:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l0msyFkP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 935791F000C4
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 07:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795332424;
	bh=jRxJug/Y1WR98+oKDtwiqnL5a0+fWq49VTbpoM67nmI=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=l0msyFkPyB+xNT/EtiFWeLs3ZlxfKzwRdt825DqvyElIxKtc8QSgv8Gm6/P1g1kTw
	 TtaIaEVpGkNBqwVDgA8CDheK9igAP1RPCrYWCWupaT9HOcdpLf9pDTFQ+FuI0gnE4r
	 kTfuSrG9U37ogNPNorXhPNzXCA2UNeThZ9MfcL7Tkx/x8IjNuSoCmb7iUasrj0K715
	 CEYB60KH1+zTiUEJRQv9bjMP2OsOTrNvJ+JAEYJ4ghgyteF00pSuiL/96Y2nWjiXXc
	 jRlGDCIfMrnXI+VrWoZ8dANwfJKTEtAP5J4SZcuEySQ8tOTT4sVInouS8xiQED7JMR
	 ptgKd5NceEcVA==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3acd239776cso18935331fa.0
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 23:27:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErENuzeG/ocgxujZIFe4qhrequ+DynX8fE1Crwc2XqOZK6N8MebAHaFK+AebDgLteHohVUD11k4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VWHxzct+s3N8wvnKcC5HgjkkgHapXyDr4pInPk14UNZyignqK
	+l9iomBQIZoO56SQgJXR88hgzJU3Kq31MXyQZEeF7DaNBIWs10i0JbYheHkbZ6h7NnPZyDfk3Ue
	T+K4ld8UgIiLbKxgBQVTAXqNwbhvcYdc=
X-Received: by 2002:a2e:a98d:0:b0:3ae:7eee:15d2 with SMTP id
 38308e7fff4ca-3ae7fa63ad1mr24050091fa.18.1795332422005; Sat, 21 Nov 2026
 23:27:02 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121-sun8i-emac-mtu-limit-v1-1-22492842d318@gmail.com>
In-Reply-To: <20261121-sun8i-emac-mtu-limit-v1-1-22492842d318@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 22 Nov 2026 15:26:49 +0800
X-Gmail-Original-Message-ID: <CAGb2v65w3cVgxb_G38UgKEa4ErKLN4qiF05N3nmdJbmPeRRNBg@mail.gmail.com>
X-Gm-Features: Aa3M54rfrvVdNKa1udG-e9AkPOB_QrPlPhXGt3xZXT_wwKFSdTyEz2lu2p5fCqA
Message-ID: <CAGb2v65w3cVgxb_G38UgKEa4ErKLN4qiF05N3nmdJbmPeRRNBg@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Limit the MTU to one
 descriptor buffer
To: aiyengar1990@gmail.com
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	LABBE Corentin <clabbe.montjoie@gmail.com>, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Russell King <rmk+kernel@armlinux.org.uk>, Nicolai Buchwitz <nb@tipi-net.de>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 21, 2026 at 12:43=E2=80=AFPM Arun Iyengar via B4 Relay
<devnull+aiyengar1990.gmail.com@kernel.org> wrote:
>
> From: Arun Iyengar <aiyengar1990@gmail.com>
>
> Russell King pointed out in [1] that max_mtu ignores the 11-bit buffer
> size of normal descriptors. dwmac-sun8i always uses them in chain mode,
> so a frame must fit one buffer, but max_mtu is SKB_MAX_HEAD() (3712 on
> arm64). Sashiko asked in [2] for this to go in as a fix.
>
> On an H616 the RX DMA fills 2044 bytes of a buffer and
> ndesc_get_rx_status() drops a frame that spans two. On TX the MAC cuts
> a frame after 2048 bytes (TX_FRM_LEN_CTL is clear). At MTU 2033 no UDP
> datagram gets through in either direction.
>
> Limit the MTU so that a frame with two VLAN tags and the FCS fits 2044
> bytes (MTU 2018). MTU 2019-2026, which worked without VLAN tags, is now
> refused.

So what's the overall plan? Limit it first to make things work, get the
fix backported, and then fix jumbo frame (>2K) handling so it works
for any MTU value?

> Link: https://lore.kernel.org/r/E1vLJcL-0000000ExBL-0GFe@rmk-PC.armlinux.=
org.uk [1]
> Link: https://lore.kernel.org/r/20261112-sun8i-emac-jumbo-v2-2-aca0cf23cf=
17@gmail.com [2]
> Fixes: 9f93ac8d4085 ("net-next: stmmac: Add dwmac-sun8i")
> Cc: Russell King <rmk+kernel@armlinux.org.uk>
> Cc: Nicolai Buchwitz <nb@tipi-net.de>
> Cc: stable@vger.kernel.org
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
> Tested on an Orange Pi Zero2 (H616) on net/main with and without this
> patch (RX fill measured on v7.3.5). Claude (AI) helped write this patch;
> I reviewed and tested it.
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/=
net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 2ece7ba9dd73..1f4fa722529f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -6,6 +6,7 @@
>   */
>
>  #include <linux/clk.h>
> +#include <linux/if_vlan.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
>  #include <linux/mdio-mux.h>
> @@ -1208,6 +1209,7 @@ static int sun8i_dwmac_probe(struct platform_device=
 *pdev)
>         plat_dat->mac_setup =3D sun8i_dwmac_setup;
>         plat_dat->tx_fifo_size =3D 4096;
>         plat_dat->rx_fifo_size =3D 16384;
> +       plat_dat->maxmtu =3D 2044 - ETH_HLEN - 2 * VLAN_HLEN - ETH_FCS_LE=
N;
>
>         ret =3D sun8i_dwmac_set_syscon(&pdev->dev, plat_dat);
>         if (ret)
>
> ---
> base-commit: d5b89d55a322b632e2b465b392a4c1d9d338db9c
> change-id: 20261121-sun8i-emac-mtu-limit-66a936064965
>
> Best regards,
> --
> Arun Iyengar <aiyengar1990@gmail.com>
>
>
