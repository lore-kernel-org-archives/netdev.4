Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795526514;
	b=cHi4miLUZg74rJLhX1aQirxhOCxdWzXpoz05RJCBelB0dDcDJQ8xBX2Memz2jDXOGLJD
	 LCB0egk92xtcipXdk1trBveM+uhSozFWzIjC+2K0gjU5PANJr48vn2LClf6SJFkBM8BgB
	 2Wo/z+QBYQ5bAh5GIXnzIoHMGMHYjeKv/RkWrdMS9ooyjNjDfyggDDN/fwlptjoUWxJt5
	 yD/xa03OvWNR32+PijfUPFX1MT8+duoo4Qt6YRwoKnanWfDDqEXaSKD0NIHQasXw2At51
	 YwiqOk2bZE4tAgj+0lBOEYrFCbmIS+ohiJBwMKyvNUwM+ZGJ9iBO0iKbqhcu/kYTVkw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526514;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qWc2HfKuFPV2b6DSx9GtSUsihb4iBjVr4X6XL1Go0is=;
	b=LnMO5wKsjnih4rLFwz8zCS4FRG148xSjCy1f/1b3B+LAscJteGCpUW55G53oARil7Eg9
	 KqqjjWvJOzusnAsHzg3BXBzg4o5KIChc2DBEdsSYZehgXhsd5CSePbL7DjzMxe014EOWu
	 aeKm8X3zQiujoTSbaaifnI4qYZQ8jORTD9kx6Y38e3K/NE2FsFsE2D0EQPS2KhYtqv3pO
	 ITQbhxkM15FE1wKHd38l5czUviJOu944j792gaxvclBtDbgOTDU6tBABfZ/hKMRz5Gr9x
	 5q6WYImg6f8fa8WFxiku4Rs7rgM1wxYOflofR+BlUW8zDi3Tam7hceR5Ra9n0zz1ECg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WEv3O6VV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525FD606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 13:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 525FD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WEv3O6VV
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so3462892f8f.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 05:21:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795526513; cv=none;
        d=google.com; s=arc-20260327;
        b=j2ksTy8bKDxkbz7z2igOdwN8QlTg83ke8huDLhcwAl8Rmdx42QoxqLq5EY/1gipuQp
         yOzXt8tSFqBjZgBwo4ed6Bz+NSlQaFEzeqLGzCvF++IVB0jo0Px0qlQiiwBcigp7CwzZ
         qmLy9wlx8JhVNub7Q4y829KnsaPc5aZNGd057cKFWnj6UrTkWEZic1Vw3UCfdw+0TtjC
         X2uVgwnJ1XH8GYBD3l8aGTFxp1pPvUZrMDwrkDrvdRcyPFVXQEqdoUrmMZ2dTVJpktmQ
         R44AWcqJ4VXuwvtmyLwYC7J4kNtgjbrhikldy4n0tJfsTio0Rau8ZRbCd6WprT57302g
         1wNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qWc2HfKuFPV2b6DSx9GtSUsihb4iBjVr4X6XL1Go0is=;
        fh=a/UDB1O/00EBK4SVa00wdYHCdE09CGqeBxPI0+dhWjs=;
        b=Ir5tC2MkfEmowgXG89se/gJYWbm6cRcKQjUXGIIvi8vRKLcLIJoWzPW737pZq1MV8B
         jOC3wXDplhcAyJCjtJU1praplV4dyMPuHFsggSQ+2npuG8x49pm+Z6Lnl4eooTVht7X7
         Ym9tBZi0VKViAiGl2cHW48DctXLgiF1hOfsnUQJYKthqZz9uW+KEqVIEOxuoSKqxt/OH
         8yWRLY3Yh8NrSk2YmTU3Pk/vACQDfcn0wtnYYnDw5T1dMvV9/WnZ0K/0h51dX5fhnLVG
         0tAU4l6ETW9rBY6oSHjo97xKHykyv/wOyHDv7tc1Hx5mJZw8GkomzlILu/GBa9y3yfNP
         7v4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795526512; x=1796131312; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qWc2HfKuFPV2b6DSx9GtSUsihb4iBjVr4X6XL1Go0is=;
        b=WEv3O6VV7oAYfqb5Q3iVQEXrGnA8FwXHCw0b6VuIUa0b416bAe7OdpQroVS0h2sqaS
         4K0jtt5QtjsvOv3T446w22vPNRBpurgqzoyW1F/onU6UDhaYXey9n4igKtSR4/gLrjt2
         pXaLcFojoz+i7mBMPtQMMLfzNJFYQ8e7YTajLUCkBOrt7sRmLckAVPgSWKg+FEXBP5CP
         YNSdcE0kQXMSD+ixnDBklSEVoERKiaICnkebWLhPonu6rkY0XZAlT85LoVwsvzpJM1Ug
         jKFHxX9hsU0X5JpZhifBuCtDmCJm19amZuV0Zb5wTn301GWRWkjN07wHOJrQT/wGUij3
         JplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795526512; x=1796131312;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qWc2HfKuFPV2b6DSx9GtSUsihb4iBjVr4X6XL1Go0is=;
        b=iFqobJwfse9/ChVMS7gkBOR97EpPP7jpnGzKkT9chUvs4tWNOjQNTWMkCRKLJeh07S
         6ze4uhTyAYBma1eKZQS+DVtRFcJuM83mNlPqnMdh6BCAsT5td42ivlWcBmYqEG9ltmdA
         ESl8rXJVM01gXPbwHHP13I+50n47osLA2WYa796VD6/a1+xGs3KywGFjxDP8t3pBft7S
         iHvZsNcyFuELf7I/OCQolVCRFh/QG+v7FGwrlJbyAFXzIgZjRGuD8VWbIyLClyEupOb6
         zehvFGaqPPHAgrhkgpsn9Y9gf+qtNxZc7kWj6hzImfvhSWgJNhnImkAO7JLcceAUGOxv
         0cvQ==
X-Forwarded-Encrypted: i=1; AL+hErHQrzTdAP9gMtizzzPeMeCH4Uz6lI+0TyrYU5P4WQpk5S+aLB58XBz/o20yWDPcvhAeGterygk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rDICVXTxnjhb6ugnwsHEALK6lrKVruktv4raRikJn8JIiFASs
	vXrTiAAkXjXrZoU+qiH3w6DlqAlk85HJRyF2mlKVN95cF6ctdakQboZWy1M/2S1La3qVxM9Gv0d
	cgXlCi2/ojOq9MbzCgmhVayyuyoOl63U=
X-Gm-Gg: AZFdTZfOsMBkvrbrkEkZX4SOSLz6kBRr2V9QJr41zhbYVvHN+uTHzQWX4gAJIdBNAvC
	CH2iJI5Sp4r/BJt4Pu7+wNACFbX1UAU3XUXyTvNPjKdeI2+UAU25IJccv4JxZyA2ASUcFr1Lhky
	Bp53zZeKRxRURntmPg0fC+aHUKQFS9w/FNZfj8JQxNoiQ+W4vlj191IWjn+KKL1OYpMcG/SDfus
	b8SAQGwO0+ICy6pP3UBF05dux2PTg6bUalicaQZ8rGtNSax0qSHyY0eHO0fIbP+uo9GgAsh37CH
	7BXFW400V+r6mFUA9CSJaECc1IiSy8Xdw0MDeg7gGBKpyexBP2lMKe18hjCWuhTtp1GCVLMAXnb
	8BO9VlQdrdIHBacduAOpn1Ow9K/nBNofu1QX2ynHPzi/TpD8biRBQeU/6aVCzdWLGRU4m4VBnmO
	z33mMVoPWwSxi7LT5OMgzyjshp1Z3vjR7OCIc45MKvKpZ5TEeZ0/BLVxzWMZoQlWx/rQafWvnTQ
	vHt4p0=
X-Received: by 2002:a05:6000:41c9:b0:48d:fdd0:6ce8 with SMTP id
 ffacd0b85a97d-4abaab633bcmr28636444f8f.3.1795526512489; Tue, 24 Nov 2026
 05:21:52 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119185016.1789843-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <179546436704.3135.12593345717335656860@kernel.org>
In-Reply-To: <179546436704.3135.12593345717335656860@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 24 Nov 2026 13:21:26 +0000
X-Gm-Features: Aa3M54qYvwnStTQeBsV6jkU4pnj89Z8PUCLhVvQ2lAGOs1SaKPKt9ljNLbIFBQo
Message-ID: <CA+V-a8s722YOUnoErKDEiMd2KsZT5E5wkTvjJ1Zbeji1UPiSRg@mail.gmail.com>
Subject: Re: [PATCH net-next] net: stmmac: Advertise TX checksum offload only
 when supported
To: netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	prabhakar.csengg+renesas@gmail.com, biju.das.jz@bp.renesas.com, 
	fabrizio.castro.jz@renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 8:06=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The new advertisement gate in __stmmac_dvr_probe() trusts
>   plat->tx_coe.
> - [Low] The commit message presents this as a bug fix ('This can cause
>   DSA user ports to inherit checksum offload through vlan_features=E2=80=
=A6
>
> --
>
> net: stmmac: Advertise TX checksum offload only when supported
>
> With this patch, __stmmac_dvr_probe() adds NETIF_F_IP_CSUM and
> NETIF_F_IPV6_CSUM to hw_features only when plat->tx_coe is set.
> Previously they were always advertised. The goal is to stop DSA user
> ports from inheriting TX checksum offload through vlan_features when the
> conduit can't do it, for example in threshold DMA mode.
>
> > The driver unconditionally advertises TX checksum offload, even when
> > the hardware capability check disables it, such as when threshold DMA
> > mode is selected. This can cause DSA user ports to inherit checksum
> > offload through vlan_features despite the conduit not supporting it.
>
> [Severity: Low]
> This reads as a bug fix, but there's no Fixes: tag, and the message
> doesn't say what actually breaks. Is this meant for net or net-next?
>
> Before this patch the conduit's own dev->features was already correct.
> stmmac_fix_features() removes the TX checksum bits:
>
> stmmac_fix_features() {
>     ...
>         if (!priv->plat->tx_coe)
>                 features &=3D ~NETIF_F_CSUM_MASK;
>     ...
> }
>
> So only hw_features and vlan_features were wrong.
>
> For header-tagged DSA traffic, validate_xmit_skb()->skb_csum_hwoffload_he=
lp()
> on the conduit already falls back to software checksums. Also,
> stmmac_features_check() drops CSUM for non-IP ethertypes. In that case
> the only effect looks like wrong feature reporting.
>
> Wrong L4 checksums on the wire would come from trailer taggers that rely
> on the conduit (tag_trailer, tag_xrs700x). Is that the case this patch
> fixes, and could the message say so?
>
> There is also a change users can see in ethtool when tx_coe is false.
> tx-checksumming on the stmmac netdev now shows "off [fixed]" instead of
> "off [requested on]". Should the message mention that as well?
>
I'll update the commit message with a fixes tag and send a v2 for net.

Cheers,
Prabhakar

> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index f256244ce0d11..8cb1e3b4030e2 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -8224,8 +8224,9 @@ static int __stmmac_dvr_probe(struct device *devi=
ce,
> >       ndev->xdp_metadata_ops =3D &stmmac_xdp_metadata_ops;
> >       ndev->xsk_tx_metadata_ops =3D &stmmac_xsk_tx_metadata_ops;
> >
> > -     ndev->hw_features =3D NETIF_F_SG | NETIF_F_IP_CSUM | NETIF_F_IPV6=
_CSUM |
> > -                         NETIF_F_RXCSUM;
> > +     ndev->hw_features =3D NETIF_F_SG | NETIF_F_RXCSUM;
> > +     if (priv->plat->tx_coe)
> > +             ndev->hw_features |=3D NETIF_F_IP_CSUM | NETIF_F_IPV6_CSU=
M;
>
> [Severity: Medium]
> On cores without the DMA HW feature register, does plat->tx_coe reflect
> threshold DMA mode by the time this check runs?
>
> The threshold-mode override is applied only inside the hw_cap_support
> branch of stmmac_hw_init():
>
> stmmac_hw_init() {
>     ...
>         if (priv->hw_cap_support) {
>                 ...
>                 /* TXCOE doesn't work in thresh DMA mode */
>                 if (priv->plat->force_thresh_dma_mode)
>                         priv->plat->tx_coe =3D false;
>                 else
>                         priv->plat->tx_coe =3D priv->dma_cap.tx_coe;
>                 ...
>         } else {
>                 dev_info(priv->device, "No HW DMA feature register suppor=
ted\n");
>         }
>     ...
> }
>
> Older GMACs such as 3.40a don't have this register. There,
> dwmac1000_get_hw_feature() reads 0 and returns -EOPNOTSUPP, so the else
> branch runs and tx_coe keeps the value the platform set.
>
> For "snps,dwmac-3.40a", stmmac_probe_config_dt() sets that value
> statically:
>
>         if (of_device_is_compatible(np, "snps,dwmac-3.40a")) {
>                 ...
>                 plat->tx_coe =3D true;
>
> It reads "snps,force_thresh_dma_mode" for any compatible. Nothing makes
> the two settings agree.
>
> If both are set, stmmac_dma_operation_mode() checks force_thresh_dma_mode
> first:
>
>         if (priv->plat->force_thresh_dma_mode) {
>                 rxmode =3D tc;
>         } else if (priv->plat->force_sf_dma_mode || priv->plat->tx_coe) {
>
> The TX channels are then programmed in threshold mode with tx_threshold[]=
,
> while tx_coe stays true.
>
> In that setup the new check still adds NETIF_F_IP_CSUM and
> NETIF_F_IPV6_CSUM to hw_features, features and vlan_features. That is the
> DSA case the commit message describes. stmmac_fix_features() keeps the
> bits because it also checks only tx_coe. stmmac_xmit() then requests HW
> checksum insertion for CHECKSUM_PARTIAL skbs.
>
> The driver comment says TX COE doesn't work in threshold mode. If the
> hardware really skips it, won't those frames go out with only the
> pseudo-header partial checksum?
>
> No in-tree DT seems to combine dwmac-3.40a with
> snps,force_thresh_dma_mode (spear3xx.dtsi uses 3.40a without it). This
> may not be reachable with current in-tree users.
>
> Would it fix this to move the force_thresh_dma_mode check that clears
> tx_coe out of the hw_cap_support branch?
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261119185016.1789843-1-prabhakar.mahadev-lad.rj%40bp.renesas.com
