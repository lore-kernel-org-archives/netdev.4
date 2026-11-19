Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795108697;
	b=FkIpD7Y41IEYXlhL8x9ogBLfEkJ91JmOxY3Fry7NvLjd+jamBp3ZByOYSfk1AxpeDBR9
	 mnymxIzdg9xuFZQ38O95klIW62fsDrgjW7gsKvzDik9ALh7RUaAiHuNKv1kTvJbfSbC9c
	 9U+M0ORgIdtkIxofATpmTTD6Cz+h3Wh7v2Ko9v+oW/ZOFMG3bkdDTRcCYuDPX5bLmYmiw
	 qAiqUHMSCxEfR93Djap9pJaZ0mHpyGCHDD0Kg4QzRpTk20RoKDuLnfj2lrgA1zb5oKCGx
	 hI0IsFJxNmpEfbVYPjdQPmWwfudmhdUNKeJhlPZYpMxAOOPNyDNmzP672EXPARs32zg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108697;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=HsNd5mHeiYuhW66N7H8r1a49LBtgcNlCSKxp045xerY=;
	b=WfL4nxnrgjmD4ugdPlMCDVPPaobB7xqhgvwryUuYmxZoe4vW3kWmd96mlIktOwwglRNg
	 etBU7Kl5AUR/NU35bvSObhFOWG13frQaboTTDFZNk7RI07BmjxlQE7uNxcmLHZ5elUJka
	 mUtIgIWYiJmQUP+0UOLnDYaefAiqTNHvHbtjP2pe4fnbef9/4mm5tIWW1qmRX6Bij8ipg
	 Ntcf9oZT7PuaNNNPdxwoJw4gSqT+MITPvBr3S0AYDRdy4QsLJEQ3p9FHkSi70tFxmtnMQ
	 v1PsXFMXr0YSneuyVHJHQVl0KsH8dMOrWaypKDveK/ISkB2VKtIQB1VXA/lMgwsLYVw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q21WoWqm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.43
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A112606A325
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:18:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A112606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q21WoWqm
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7cc2bb73cd9so896096137.3
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 09:18:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795108696; cv=none;
        d=google.com; s=arc-20260327;
        b=h7CDnHd4o44oIHjygDvNPSD6sxop4OAzuFl8SolpoQAxsN/Ch9ObpTIEYTIccU1jec
         qvS/ChIxktuarzDHS9HYXyO9nGwCWCRXwij5UeViUNBiBVLCgbkBuwvCZfa4XZQLfzkz
         6/jCSdajlS9q+9wkX38Z25f93MRG8VhXON8eqG6UWfvQNctJf3q9r7IBQnB4O4PDnS1t
         Hfka4Q4Vtb2C0NE8/oF8lTLXROLxOzr05Cmc7ab57g5I70GqvDz/9Inh85aVWNkmIkJT
         smtWdn4zttrvB8kPSUQeCgPZaPoPeupV60+0jVJlOiBqgesGt2b9bRZfU/qYcmpBOUiK
         6Dhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HsNd5mHeiYuhW66N7H8r1a49LBtgcNlCSKxp045xerY=;
        fh=Od9nJU2cD85G8gfdHKAeRWPVwg8B+/mwHUzcZqW5IPo=;
        b=OXhYyiAeLbGLVT5oS9ah3phyCwN+y84aacHXCo8d8vGy9na0LxVzKC1z/3t7vGy82L
         7KsQzwsILFRE5OTikFDjCrSnRb/eM9DtmHQuSUvDDjSK6JtWixzmS+siefm7LtYmMKD/
         iwVzUCOorZV3OEgZKLH7ZJlW1LIMndM0YjyRNfqbk7WMwQMfPYPMkjVu8/pZjF3gITCu
         xsiNGsaRgP3KP+0IN9RixUh+7bHB1ayZttIjc/V1/WhrqurOBpxTAwuL3Cpka4mYiElp
         A2gUQivu3DSiEOLvKA98QhYogCeTO5KBsmRfi78YZvBsj9PKMdd95hgVXrBbuetVtbSL
         auZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795108696; x=1795713496; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HsNd5mHeiYuhW66N7H8r1a49LBtgcNlCSKxp045xerY=;
        b=q21WoWqm3KaqKAME4jgDJm3/zYzOlYi0imKDKyBs5lI6uOMaw1BM2BJDBU4uPFkl1O
         b2lUzitfcHhXmRRqGcyFXX7N/RtRcBhkzcQkp9/Q9/BoU0+SfB47nU4K+Aw6rog04ssc
         A78nT+0UdrSrCkz4ycyJCpIv0+qOZMi5dtW4dNGwJNKdfajIq0I8nqidE7cxD4y2Tfax
         V+kNILQ5ue7FEWK9b6R8tA99zZ+lnljIjZkYd2aVwdToKaNMtFqSSLWq6axdgM4PCfNt
         X1QGNetP2LkZKV88MLG0u3voVS+UWoDf6HPNh5ARLeg5QkB0gLP1m6DNaFSMWJQUqA0D
         DE5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108696; x=1795713496;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HsNd5mHeiYuhW66N7H8r1a49LBtgcNlCSKxp045xerY=;
        b=EbX5WQfWDXooND2dIh1fqFCR6DPh9EsOs0PBc7BHleNhy3+xYloZWKgozrVZGQI3M3
         3QnpZL/5Ip1vdT3KhdbM3JCOX2vTrubAXBhPQnlj0H9l336Ufy0gXmin2JOcA6A6jIZI
         38XylGklMkG52/DuPL7aKg5yl03Z/uCdDXINTINUC1Ig9FvPUB60Q15qlcJbCy3ekATt
         chqv+YEiHY0qPbE5aJqPZtEcC8yOz/jS+ReBbBobvN/01NGG3RJ1UeGu0tshrLyfAgXr
         4KxgW6QWOCQ8fxKr7jO4/PzSluk3Bq+OxyfeL+wYd+fwdiYiQ1/0JFb2G9TvJso8bKG9
         LvUQ==
X-Gm-Message-State: APuU4Z8FOgrcSM0nzYO58cgaFZsPbOjr/mYdeF6Kj93+F8bH+AysZ1Lu
	GF6ZqjUP1/T6CGzgY8C/TBsI/oM77Ky7izNa7sRnI1k6UrUynev0jR4T63OQyP9QmJxapphrt4W
	XyLQjigv3OkFDYb6EDuNHUnOD7YLnIZc=
X-Gm-Gg: AYBFou2o1xyzO9oteAZdJkhPPc6DMog9xiHrv1owhfiqNCJi8xVTlS6gGfYLr5f2rUh
	eN2lXU4ZlI9o3n9aGMU72Qesvrq58RB6K8YBt3ghb6l4A/4ANsgglANYrWJBbAu7FtWhP68lsPP
	hlCJzguNSp5V0dj6Xqv7TXdPcOnAa6AyCmfHhky232uveEfFnnNXsV0cxvrmTGWnyFOlMrIx3X3
	PNVRgcJbM3WYjF5lq2PJIUVDczpgo6UmxOOJrWQQhrA+xGRJM7ZV9rV4jeHY79HNSZvO4/pRtwy
	7Cdzlyz1CE8rBdF1NKdCW1LlNNIt2+rlHyt9b9wE4t2F+XVRgfg7drpqtVSZX1gOTid17oZZLpk
	vxUskDlCPlZPn1HfeDVpeTLAJJ1vK/k2FFsZWxpmTdIP7Gf7Y5YQe78QrjAUOj9HehC6mp1orLi
	IuYKLpwyMMCOVdomdeHKVw7U9qWaRV5XpBRMDf4p8i07h+8ZKqotn7BCE6jtaxZRvntBnJGTLCK
	SumbWcLTeAOe8ePyAAWoNsJi8+WeQ==
X-Received: by 2002:a05:6102:5813:b0:7b2:508e:3d57 with SMTP id
 ada2fe7eead31-7d72b3688c2mr101327137.4.1795108696380; Thu, 19 Nov 2026
 09:18:16 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f@gmail.com>
 <179497442968.3136.18415990643273213851@kernel.org>
In-Reply-To: <179497442968.3136.18415990643273213851@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 10:18:05 -0700
X-Gm-Features: Aa3M54poH74flJHm30nVUNh5kQyVyqEvjxxcHU_6uijb8f_Ea6AWdb-4l3_B2EM
Message-ID: <CADvTj4p9bBOTCk5xbiVMRtcv5gL3L8Nn2Umxm4i5VD_6jJBbNg@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Honor the RX checksum
 offload setting
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, maxime.chevallier@bootlin.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, wens@kernel.org, jernej.skrabec@gmail.com, 
	samuel@sholland.org, clabbe.montjoie@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 9:00=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
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
> - [Medium] Clearing EMAC_RX_DO_CRC (EMAC_RX_CTL0 bit 27) whenever
>   NETIF_F_RXCSUM is off may also turn off the MAC's Ethernet FCS=E2=80=A6
> - [Low] When RX checksum offload is turned back on, frames the sun8i MAC
>   received while EMAC_RX_DO_CRC was clear can be marked=E2=80=A6
>
> --
>
> net: stmmac: dwmac-sun8i: Honor the RX checksum offload setting
>
> Before this patch, sun8i_dwmac_rx_ipc_enable() always set
> EMAC_RX_DO_CRC. With the patch, it sets or clears the bit based on
> hw->rx_csum, so that turning off RX checksum offload through ethtool
> also turns off the hardware checksum engine.
>
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/driver=
s/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> > index 2ece7ba9dd73b..98cc7503bddeb 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> > @@ -705,7 +705,10 @@ static int sun8i_dwmac_rx_ipc_enable(struct mac_de=
vice_info *hw)
> >       u32 v;
> >
> >       v =3D readl(ioaddr + EMAC_RX_CTL0);
> > -     v |=3D EMAC_RX_DO_CRC;
> > +     if (hw->rx_csum)
> > +             v |=3D EMAC_RX_DO_CRC;
> > +     else
> > +             v &=3D ~EMAC_RX_DO_CRC;
>
> [Severity: Medium]
> Does clearing bit 27 of EMAC_RX_CTL0 also turn off the MAC's Ethernet
> FCS check, and not only the IP/L4 checksum engine?

It doesn't on H616. I sent 100 frames with a deliberately incorrect
FCS in each setting and checked that bit 27 changed. With normal
filtering, none produced an RX descriptor. With error forwarding
enabled, all 100 produced descriptors with RDES0_CRC_ERROR set in
both settings, and the driver discarded them. All 100 good-FCS
controls were received in both settings.

>
> The bit is named after the CRC:
>
>     #define EMAC_RX_DO_CRC BIT(27)
>
> The probe code says the hardware features were "copied from Allwinner
> drivers". That code sets this bit with the comment "Enable CRC & IPv4
> Header Checksum". The Allwinner manuals describe CHECK_CRC as "Calculate
> CRC and check the IPv4 Header Checksum".
>
> On this path, sun8i does not have the hardware strip the FCS.
> stmmac_rx() removes it in software without checking it:
>
>     /* ACS is disabled; strip manually. */
>     if (likely(!(status & rx_not_ls)))
>         len -=3D ETH_FCS_LEN;
>
> The only FCS check left is the hardware RDES0_CRC_ERROR bit, which
> ndesc_get_rx_status() turns into discard_frame.
>
> Suppose bit 27 does control CRC calculation. After "ethtool -K ethX rx
> off", the path is stmmac_set_features() -> hw->rx_csum =3D 0 ->
> sun8i_dwmac_rx_ipc_enable(). Frames with a corrupted FCS would then no
> longer set RDES0_CRC_ERROR. They would reach the stack as good frames,
> with the FCS silently stripped. That behaves like NETIF_F_RXALL rather
> than "RX checksum offload off".
>
> Is there a datasheet reference or a bad-FCS test showing that bit 27
> gates only the L3/L4 checksum? If the hardware ties the two checks
> together, a different approach may be needed. For example, keep bit 27
> set and, when rx_csum is 0, stop discarding frames whose only error is
> the IP or payload checksum.
>
> [Severity: Low]
> Can frames that arrive while EMAC_RX_DO_CRC is clear be marked as
> checksum-verified once RX checksum offload is turned back on?

Yes. In a separate test, frames with bad UDP checksums were already
in the RX ring when offload was turned back on. When NAPI processed
them, invalid datagrams reached the UDP socket in both the IPv4 and
IPv6 tests. The driver used the new offload setting for descriptors
filled under the old one. Changing the order of the register and
software flag updates would not fix that case.

>
> When "ethtool -K ethX rx on" runs, stmmac_set_features() publishes the
> software flag before the MMIO write that re-enables the engine:
>
> stmmac_set_features() {
>     ...
>     if (features & NETIF_F_RXCSUM)
>         priv->hw->rx_csum =3D priv->plat->rx_coe;
>     else
>         priv->hw->rx_csum =3D 0;
>     ...
>     stmmac_rx_ipc(priv, priv->hw);
>     ...
> }
>
> NAPI is not disabled, RX DMA is not stopped and the ring is not drained.
> Meanwhile, stmmac_rx() may run on another CPU and read the flag
> directly:
>
>     int coe =3D priv->hw->rx_csum;
>     ...
>     if (unlikely(!coe) || !stmmac_has_ip_ethertype(skb) ||
>         (status & csum_none))
>         skb_checksum_none_assert(skb);
>     else
>         skb->ip_summed =3D CHECKSUM_UNNECESSARY;
>
> sun8i uses normal descriptors. ndesc_get_rx_status() never returns
> csum_none, so nothing in the descriptor says whether the hardware
> actually checked a given frame.
>
> Any unchecked frame still in the RX ring would then be passed up as
> CHECKSUM_UNNECESSARY. That covers frames received before the writel()
> in sun8i_dwmac_rx_ipc_enable() and frames received just after it.
> Before this patch, the bit was never cleared, so this state could not
> happen on sun8i.
>
> Swapping the two writes would narrow the window, but it would not cover
> frames already in the ring. Would RX need to be quiesced or drained
> across this transition?
>
> >       writel(v, ioaddr + EMAC_RX_CTL0);
> >
> >       return 1;
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f%40gmail.com
