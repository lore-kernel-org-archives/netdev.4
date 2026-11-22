Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795363898;
	b=pWVaYvWMUqRfmXG4Js8iKT1TB22pi+CV8JaDTuG3VVOkfdDSqha+ExUt0zEV/1wolSaG
	 uftRyYg80MaIxPs9LzjcBbxOjp1Tpdyy7qTO6V2vE1FH0aU6MyhiDjxgH/SmZ8ytalGgM
	 sK5toUveV58FMCdfFi8zAQ9BpOxV4EYFUB+pXP01/Qte1ZyquonqEjjve8pmP16l24VsD
	 Wh0cyqgzPD7cewpr871zDGOJHihD2yNu4fzRzHxqE5eS4h7EH25SSVjOithhIQbQBl8fH
	 lyCtJpD6LTvTVeaYZ/VxbYbfiM68c+uoEmOZEMm/4wmf1kIg6eg5PUCajZScxaQw3NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795363898;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xoSM2whVTu4UTAuG8+zo8K3wAspqxaXD2+SDMb67siY=;
	b=Wv8F4/nvo7aCqRLQAco55WRuNuc+boEKTYVusGQVvEyWx3M0CZ768+QvNeLLfJxS4CWc
	 OAbwFHDiAA7yx0vjKl0a3a+oNufZX23RBh65JKoTFwl5Yp0vdrKB5CgkfaYkYL4jWjjpa
	 ASP5s2MdPsOlHvwFB9ISat2CAvzqFdJAUQU6IVkp2z7I+/HzutgZJe9rXgKay+7nmmHPh
	 VCs6O1zVu4+odX/nrH9ohEUx3pzm9Ix2EuYTekdNjRAccwrhCHPr5bDVXEbN7zbDfO/rz
	 vcMVEp3BeTzu3A/kYkt1qUNt4exUXQvwYKLRtIAtJk6hUYC0pc21hwfw02VEp+IBpNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V1W1SOpl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F11D606A330
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 16:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V1W1SOpl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E57091F000C0
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 16:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795363897;
	bh=xoSM2whVTu4UTAuG8+zo8K3wAspqxaXD2+SDMb67siY=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=V1W1SOpl6ispkoEbY5OJ3BD57GahEkU7x0s+qMYooKRtP+pkj+LI/fjDilSwMJuF5
	 EfIvYV968qiZjOj6gYaLN+iCjVEwVmGowK7Hqz4rNkhgR++Kh11wy7AL8nGi289H5P
	 zlcGF9X6c9dsoqeKUvR02jQM6XYtVJDqmX2Gwy/w3edYMCASoknZpkjRiv8bF4Z9MH
	 vgSPYpvDlb5ogql3J4O2XmNTjjcC2mv+UeS9UwTnNAybLreBG7HKykVUGtlUpsGkGN
	 Il85Xj065cI/iv93GcftGuxdk5GqEs6y/i4q9m5K4yFBLRydrhVKFImQFuidJX+FsU
	 IScsXGwkhF0vw==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ab4354db11so24018261fa.1
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 08:11:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEjCK1gTe8XsUTU8KHlnfwuD7a33atqwoRoGyTkxD0NYID9Ia9Sz+JnvalU2bSeCaozD3703Xg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tYIggykWjRZ+UM2w1cWrNbeoj/T+m4byGXEKCkA0CDSLTSACx
	75AWTHd9uQ1UiLNNXMHadp0SBel7hMgNJHfMgWwIGl631wvxVp0fvWOw5ccCtu/ihl8hzCOP7c3
	PqyHv0i4Tx3ZL6m1ZeICJB+F8yGaW158=
X-Received: by 2002:a2e:8a94:0:b0:3a7:81c4:190b with SMTP id
 38308e7fff4ca-3ae7fa718bcmr22757351fa.25.1795363896396; Sun, 22 Nov 2026
 08:11:36 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122144926.284857-1-maxime.chevallier@bootlin.com> <20261122144926.284857-3-maxime.chevallier@bootlin.com>
In-Reply-To: <20261122144926.284857-3-maxime.chevallier@bootlin.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 23 Nov 2026 00:11:23 +0800
X-Gmail-Original-Message-ID: <CAGb2v66SzmeGNrBmTe-6NNoro-9u-ocuQS6DxE9fo4_-kfA81Q@mail.gmail.com>
X-Gm-Features: Aa3M54oHe6Y4v1aZei8vOvG0Mo7qT8EwWXl6UKG3x5zoZCEZ2BwDWFr9sA35sjE
Message-ID: <CAGb2v66SzmeGNrBmTe-6NNoro-9u-ocuQS6DxE9fo4_-kfA81Q@mail.gmail.com>
Subject: Re: [PATCH net-next 2/3] net: stmmac: dwmac-sun8i: emit pause frames
 when the RX FIFO fills
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Russell King <linux@armlinux.org.uk>, 
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, Nicolai Buchwitz <nb@tipi-net.de>, 
	thomas.petazzoni@bootlin.com, =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 10:49=E2=80=AFPM Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
>
> The TX flow control mechanism needs multiple things setup to actually
> work:
>
>  - The TX_FLOW_CTL_EN bit needs to be set in the TC_FLOW_CTL register,

typo, as Nicolai mentioned

>    this is already done
>
>  - The RX fifo thresholds needs to be set, to indicate when the MAC needs
>    to start sending pause frames based on the RX fifo occupancy, and
>    when it should stop.
>
> Let's configure the threshold the following way:
>
>  - Send pause frames when there's less than 2K left in the RX fifo
>  - Stop sending them when there's more than 4K left in the RX fifo.
>
> This was tested in Allwinner H2+ using the ethtool -t "flow control"
> selftest. On that SoC, the RX fifo is 16K.

The latest chips (A133, A523) only have 8K for the RX FIFO. I think
that still works.

> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c   | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/=
net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index c63f4d87de50..75c743dfe348 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2017 Corentin Labbe <clabbe.montjoie@gmail.com>
>   */
>
> +#include <linux/bitfield.h>
>  #include <linux/clk.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
> @@ -202,6 +203,11 @@ static const struct emac_variant emac_variant_h616_e=
mac1 =3D {
>  #define EMAC_RX_TH_64          (0x1 << 4)
>  #define EMAC_RX_TH_96          (0x2 << 4)
>  #define EMAC_RX_TH_128         (0x3 << 4)
> +#define EMAC_RX_FLOW_CTL_TH_ACT        GENMASK(21, 20)
> +#define EMAC_RX_FLOW_CTL_TH_DEACT      GENMASK(23, 22)
> +#define EMAC_RX_FLOW_CTL_TH_2K 0x1
> +#define EMAC_RX_FLOW_CTL_TH_4K 0x3
> +#define EMAC_RX_FIFO_FLOW_CTL  BIT(24)
>  #define EMAC_RX_DMA_EN  BIT(30)
>  #define EMAC_RX_DMA_START       BIT(31)
>
> @@ -766,6 +772,17 @@ static void sun8i_dwmac_flow_ctrl(struct mac_device_=
info *hw,
>                 v &=3D ~EMAC_RX_FLOW_CTL_EN;
>         writel(v, ioaddr + EMAC_RX_CTL0);
>
> +       v =3D readl(ioaddr + EMAC_RX_CTL1);
> +       v &=3D ~(EMAC_RX_FIFO_FLOW_CTL | EMAC_RX_FLOW_CTL_TH_ACT |
> +              EMAC_RX_FLOW_CTL_TH_DEACT);
> +       if (fc & FLOW_TX)
> +               v |=3D EMAC_RX_FIFO_FLOW_CTL |
> +                    FIELD_PREP(EMAC_RX_FLOW_CTL_TH_ACT,
> +                               EMAC_RX_FLOW_CTL_TH_2K) |
> +                    FIELD_PREP(EMAC_RX_FLOW_CTL_TH_DEACT,
> +                               EMAC_RX_FLOW_CTL_TH_4K);
> +       writel(v, ioaddr + EMAC_RX_CTL1);
> +
>         v =3D readl(ioaddr + EMAC_TX_FLOW_CTL);
>         if (fc & FLOW_TX)
>                 v |=3D EMAC_TX_FLOW_CTL_EN;
> --
> 2.56.1
>
>
