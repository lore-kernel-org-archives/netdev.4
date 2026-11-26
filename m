Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795693065;
	b=EOkn7ZPEBxIdrpTT7CPgjPmHOQiOnoVdkcqzJpbFzfOiMw+nw4udTdt2UMXdiMktqC+T
	 PISmSD9u5Upr1PaGfbkfQEXhAMWPSZl0mxV2d42BVZhSIiiVYaLvClG0zKzPBJZ9EulS1
	 u+EuWe3gV4jsVE41B1+GlbpQgUC/98qddLUNF7h/hYIwNxXrxzQtfCwpIXc9OgZCocgEq
	 +CzmKM4574OWfBUWlCr8lf2lWQMXyBPfg701t8sKtMJoF8eRhbX6DO73aDr4X47GzOysw
	 6OYdtwZ6e7EmviLIjutOC475kl4b2J9M8hhQoOvLbicX26863eBqxC2enntlXC5wiIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693065;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qCmzBhIKvk4P5rW4mA67073vDvcx4J8hkfIshuT1Mp8=;
	b=mNevaSpSLUcZaop1mSevRzR+qHawLAvB7d5ZUUIBJRG8p6zddZ61E6wCTkiPR2ZC4md0
	 sPTz0EgUsM9IJDArZNg3N2rHDCoDPURoVsX5t6eJhqQ/lTrvM7ACU1YKsT0UvoIiKsEq8
	 fzvv7Tm9r4Rl7sX3DAJzRT6uaf7xfWldlWG1q0HBgjCwg6/GrfEL/swvE3fHqIGE5jqXX
	 mOeeqyo3mpYPkG83uHpJmKR5A0IsjhGTvjXuOXichf+qPBHtWHrYFK5TG3Ic65UJXwwMn
	 L43rNUc7UePkttyVI/0KFCl3JYr+5RF6H6LSlmpGSmnnSyqCLb/dDvIYQUwUCQXAfJA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="IO6/OXbX";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476C5606A323
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 11:37:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 476C5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IO6/OXbX
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so5365757f8f.0
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 03:37:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795693064; cv=none;
        d=google.com; s=arc-20260327;
        b=dll09ECPPaaQlLdqh/3pnisdDXgaJiCAe/hE9Wwc5m56f/NX9lBm8QR7j9jfyrY2rd
         OoZdpDT1ra01IWti0Y3OWkhjFNXGE2RnKg5xjpqiJhgEaE75eFE63lWDpyFHxFv895uo
         PtWeA73s/35xJFAD5YX1BknoLI40DNXQ8MWIdrlEEqyQcTvl//KtQ6/5Ht7ZVnEQfO6Y
         81DcS6DD5xQiGzp1BqOBJjORp5YSlhd2Hd+NlSt2RLU/GwnLZM9ajuwVGOccX5zVVYzd
         PxcXwqrNwWl29grGwsNaXUQRhW5Zzi6LSa8DiCCDKU1fuMzaeAjhz4/0LXABG5fHpCm4
         UPbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qCmzBhIKvk4P5rW4mA67073vDvcx4J8hkfIshuT1Mp8=;
        fh=YAf2l5HkVB7OY/sMn/oCaa7zkJFiLJVFXUI2iHKtYI4=;
        b=C6My60gh12KG7SZN31EM0vfViGKTmzqxzKJhSOnHkj+aa8m7TzmK3BoxXLYwpGX3/q
         B8t/bXbT0aFRV7qx7bA/SmevaSVpoBZxUcXbBiddusohtT1OtKpHU4qNMRQjQ+MxUq7i
         TafoeMi5sWLEuwHpIzhFBbfPEDVT4n+0NOoTfuMxZeJ72juQjuHqJaEVoKm0Bs2pAXRa
         NxfpW5WQTJVyK9aaZjTlMkRH5r+avxk3EM2ez46hzMTjeUpcb3awYU/JnvSp5z+SpWJd
         QwOJLkcEjLJ1Tv0K0XLXUfW6xtTA+n72PZNrwyi3H0T1VWY7312NcIfEZ2TpWLU+2cuB
         dNEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795693064; x=1796297864; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qCmzBhIKvk4P5rW4mA67073vDvcx4J8hkfIshuT1Mp8=;
        b=IO6/OXbXushm5cEYgJH1WrUaxQGQf9E+eOlWsKatm/CsFtoMMLVjrNJBbc0Wb9fRM6
         lauQuigiVAT+QzVhV735jJMLSa/dZP+BoYoW25OcXJJ0Q1Atl7t8yhU/rhgOkJt3FXqu
         U3S4fMduckiIbcBbEdmr8bCdSjSXN4Ox95L2XIeFSyzMr+q3UDoTxbSg7GcWGwa+hXp3
         mCZU1ZOEaxtZtnPrXLmQTHqvEzhRyU/wj0h/rjesHXBvrQCYBRpyNS7hBEGyndqb6w6Q
         4xHvh2DaLIcbDjiits2BI35X42WevzpgEQy18F/jCvJX8KFXhbGJTEod5/6hP6q9KJba
         FgpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693064; x=1796297864;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qCmzBhIKvk4P5rW4mA67073vDvcx4J8hkfIshuT1Mp8=;
        b=iTtg0dFm/Yg41VPYEJo7x2xt/T6pHOtYwnn1mhvmCTIF51oc2BTPlWQ0WBkPn0VL1W
         Z6BRwszSlOAbWkeppFo06W2rWCOiWTLbiSW51/ydDGhmbBcOVSUOcG6YGU1OqBX+4rkC
         zMIkB9MhaJzoyH4mORr7YbWl+MKK6Et5fLmvY04W64yUxTlm0+yriBjwYJ5ckix5aA/o
         PO4MLyNsN8M6Z4Pf1GLIzxvhvLcEsCKACFz0a30kiUx+BELELDMKvwqSfNPCQJjzTeiM
         2fyaV/gJ+TB+uh0mCPlu6ioPBPAzn3qGNrhveWifA2fCyJvKe0VIA09U7tQjCePN3rT9
         FKAg==
X-Forwarded-Encrypted: i=1; AL+hErFqCAwSwx1MYQNDhFSxT+OxAuCBBIkmoaNRnt+2G2pjUb9QwrQiTZCOmG9VT9dFbtaIj352EFE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NhhX2TDyjs/Pu91/5/tAdQaNHHrqb7eMhsMiURu8HB0c3PDbJ
	7+kT1ZjvEbth34ZpqnO5dybfNb1yFQ82J7kEu7TCN1Le5gHIQwr84EhYXCHMxlWppr1j+sHiwo2
	IuDfVlrmRvNo8SPCzWVbe49a5pas1agg=
X-Gm-Gg: AZFdTZfqDw8gRazRgYaDqFtWdGIbmQ8v6Tprv0TDvoeA9rNT64o40AWbvVAEzeNiknj
	WEdvWS+7jN77bzDe40//wpbBiG+a1RR58LdjzynKk3WsfgLUeia8c4A4RWIlnmTG92KFRGNHzR4
	6kTCMqzOlQbB36nPc2I8sutMBxPFumMq4bL0D8Gb0ptEMcXHH8UhdHRNYaFsNXV3a5aeg5McrQt
	Qc6l/nNU4cxQI4dSrHmCOm+Ap/xZ/cYoSt2EKgWxz5T4PXApWxMzv3OFR5XjaCdNuSdZlXZk+e+
	pgcAGsXG6DVnTLJtSnowhnzoIpx7e0nrnFX1SO6PMZHmPHjcbPBHqfnr74KJXGXCqlfCDYvwoKC
	5e/peRgpPCpSfFOXdIZNUALva4bU9qkxon8uptOH2Vux2p+Ct1W8O9u7CQtZUJVS2nM2XDQ0DUc
	8kGXJOgM56o6fcoD2OvklyE7CIstVZw9emIl2je6SgqFNLAI5ZynBFBzGBWA==
X-Received: by 2002:a05:6000:4304:b0:4b7:6d41:f12d with SMTP id
 ffacd0b85a97d-4b76d608a13mr15756287f8f.27.1795693063407; Thu, 26 Nov 2026
 03:37:43 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124132802.2003605-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <179561342293.3135.3941627441868252725@kernel.org>
In-Reply-To: <179561342293.3135.3941627441868252725@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 26 Nov 2026 11:37:16 +0000
X-Gm-Features: Aa3M54qKq7za6CWkwIvxk1EuXc32uI-wo6A6tNrIs2BtzXEyjHAyjQeGf7f6308
Message-ID: <CA+V-a8vxYR56e1dxG-2ReYdLcsY4DsSS+GB7RqtbP+U+cEaV=g@mail.gmail.com>
Subject: Re: [PATCH net v2] net: stmmac: Advertise TX checksum offload only
 when supported
To: netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, vinschen@redhat.com, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	prabhakar.csengg+renesas@gmail.com, biju.das.jz@bp.renesas.com, 
	fabrizio.castro.jz@renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 1:30=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The fix does not cover the bugged_jumbo case, so DSA user
>   ports can still advertise TX checksum offload that the stmmac conduit=
=E2=80=A6
>
> --
>
> I found one possible regression: on bugged_jumbo cores, DSA user ports ca=
n still show TX checksum offload after the conduit has turned it off. The d=
raft reply for the list follows.
>
> net: stmmac: Advertise TX checksum offload only when supported
>
> This patch changes __stmmac_dvr_probe() to add NETIF_F_IP_CSUM and
> NETIF_F_IPV6_CSUM to hw_features only when priv->plat->tx_coe is set.
> The aim is to keep TX checksum flags that stmmac_fix_features() later
> clears out of vlan_features. DSA user ports inherit vlan_features.
>
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index a685ce4638f61..d32d3e7b1b8c6 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -8147,8 +8147,9 @@ static int __stmmac_dvr_probe(struct device *devi=
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
> Does this cover every case where the conduit drops TX checksum offload?
> stmmac_fix_features() has a second reason to clear these flags, and it
> depends on the MTU:
>
> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_fix_features() {
>     ...
>         if (priv->plat->bugged_jumbo && (dev->mtu > ETH_DATA_LEN))
>                 features &=3D ~NETIF_F_CSUM_MASK;
>     ...
> }
>
> In stmmac_probe_config_dt(), the snps,dwmac-3.40a compatible sets both
> tx_coe and bugged_jumbo. The snps,dwmac-3.610 and snps,dwmac-3.710
> compatibles set bugged_jumbo, and tx_coe comes from dma_cap.
>
> On those cores the new tx_coe check still passes. The checksum flags are
> then copied into vlan_features once, during probe, while the MTU is still
> 1500:
>
>         ndev->vlan_features |=3D ndev->features;
>
> When such a stmmac is a DSA conduit, the DSA setup raises its MTU:
>
> dsa_conduit_setup()
>   dev_set_mtu(dev, ETH_DATA_LEN + tag overhead)
>     stmmac_change_mtu()
>       netdev_update_features()
>         stmmac_fix_features()    /* clears NETIF_F_CSUM_MASK */
>
> This clears the checksum bits from conduit->features only. vlan_features
> is not updated afterwards.
>
> The user ports take their features from conduit->vlan_features in
> dsa_user_setup_tagger() and dsa_user_create():
>
>         user->features =3D conduit->vlan_features | NETIF_F_HW_TC;
>         ...
>         user_dev->vlan_features =3D conduit->vlan_features;
>
> Nothing in net/dsa appears to react to NETDEV_FEAT_CHANGE on the conduit.
>
> So could the user ports still advertise IP_CSUM and IPV6_CSUM while the
> conduit has them turned off? That looks like the same symptom the commit
> message says this patch removes:
>
Yes, this can still happen when bugged_jumbo clears the checksum
features after an MTU change. DSA user ports copy
conduit->vlan_features when they are created and don't update them
when the conduit's features change.

This patch only fixes the case where tx_coe is disabled. There, the
conduit never has TX checksum offload, but vlan_features still
advertised IP_CSUM and IPV6_CSUM from probe time. I'll reword the
commit message so it doesn't suggest the patch covers the bugged_jumbo
case.

A proper fix for bugged_jumbo would have DSA sync user port features
when the conduit's features change. That's a DSA change rather than an
stmmac one, and I don't have the affected hardware to test it.

Cheers,
Prabhakar

>   "DSA user ports inherit vlan_features and can therefore advertise TX
>   checksum offload even though the conduit cannot perform it."
>
> Packets should still be correct, because validate_xmit_skb() on the
> conduit falls back to software checksumming. The problem is limited to
> which features are reported.
>
> Would it make sense to also clear in vlan_features whatever
> stmmac_fix_features() clears, or to handle this on the DSA side, so that
> bugged_jumbo conduits are covered as well?
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261124132802.2003605-1-prabhakar.mahadev-lad.rj%40bp.renesas.com
