Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.217.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795197220;
	b=XBo67i5IjiHj3sZ0bt6on55OY2aFsVXFn+HwF2MxMKGlLbeFlCmtDLH9bnD+FRz/WciT
	 ByCjgfF9GV8H6o7mRRmqOz/+X+oLoRRb1qyTwzlObaxfFWjunIymWdZ7aPzOck18nyRTo
	 RBfeNNpUSXfAHLkg5Os/8Lif0dMr2Z5ZNRNWBto2RXAvulczQ80A73mS1vjPHtwIMlGp7
	 AvLHKcRtg4Tm6xjbzSD+pNt0CjoIQeBSM5ky9h20dIEG20KcLmRb5ya9hP3rbihxdTAEb
	 3JCtfqMsw4DJW8BhlR0kKbIvr2mU0u+NNoZ2PT6NRLquP+3IShM4OP3CqkYnmU4wQ6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=bYNDc5z2QkdyV1anAJ9Pub/lfkPevQWizYys7b38fWU=;
	b=or9nSNrKUAtEJP0YR+ABQXWWDmHf80GGwRG2FM4Hw3uyvocFQrW1XmM5rdXoQRnni1lB
	 URnyXz0akgDXowUjR/i6jbLS9vGewXPxlKhwuekvr9aVJL7qKgvaMzsekxJHttAFJn5Sv
	 TX4TzsH7BOgmZhcByuKc1zJ8IMJU3hbnAdQyi9SzpIKUhbMOgMQDmy/QDMikWN15PmCXG
	 5o0QIjp9NlzlRog0nPwHzk0CuXw7sjT/2+5T+TQRk/HUDH0qX6oTjnfSRCFclAi28KuRx
	 kLgNMv902pMJy5sV8HVUe64VKj/yP8SNtRYaz2/XSze3RqjfI/qKfy4LdQiEieWPNiA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qRQh76RI;
	arc=fail smtp.remote-ip=209.85.217.46
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48C0606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 17:53:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B48C0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qRQh76RI
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7d2e14babc8so737950137.2
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 09:53:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795197218; cv=none;
        d=google.com; s=arc-20260327;
        b=pjWpHThRRFl2DrFHowNViOvSc3ya1Rp+jtOVr29MrP3BfQzCXpanarHlOW+qnmQ77I
         GyMW7xFWD1a2V33RZ5o3IIOQnFw1AdpdieKL3MCkjArQ5grZ6eJd/ER5GQTQ9+Qtfurm
         ujG3mOGtGyjcUE423mgx1oQQHmHresdVQzsow4a/F2nQ2TE9fsMJcPGG4G707gXfPbMB
         1JfLJ/KUWtyd4ckqOkMZSrflCHPPO5ty+aJUkVuKQOxUgjC92WhHazQNvX/mYbRosnZj
         9ddFKw3tDmZz1EO1nxakyMU7nst25NW+2xfhv9iWvPlM7EMjhag0kGXkEyO967CLMvbk
         o3Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bYNDc5z2QkdyV1anAJ9Pub/lfkPevQWizYys7b38fWU=;
        fh=05eOZeQq1dklHwYnlzPboHTAdO5wQe3HKkoWoVqVPCo=;
        b=oc8ecCXg84PdAzVjEc5wszHuezkHeWg1e6cJ28rDMuhaxYuf5IdsL4C0dXSYXgIOyQ
         +ZYx2NJf5+fJuSUpxxjVOq876cm/N28dHpfhzeZvJR12XXzShC0S61O53fgQmryp5zeU
         6N6vjHFJjTuH8WJy0KOkqhav0YELVOgHB7i0jDOiCYgaUPvWPMDXFu1MxCKKvcn5GfPj
         cNJJjggc6wD0a6NvV2F9XHvdd6XTiiK5cm232UMdDkH4rW/aKh8o3NBDmXrytpAwxYYy
         eA711hlHsQf2pfsB8s8yeKYILSzFkLOqrvC2XFBPiQk7/DgXuMWcBAKZoza7+Eo4ryis
         yfQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795197218; x=1795802018; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bYNDc5z2QkdyV1anAJ9Pub/lfkPevQWizYys7b38fWU=;
        b=qRQh76RILQwRmEFSs3rWHw8IHTQJXPqoY/9s2sT4TOMlYgSWlLLKcMOQE6eeYWrhdM
         eJ4B/L+hLyirBm/XZCny3wCATWD1n6YnwVqeGghIcIFcFXI82VCnv4Rc1Azan29Foi+T
         EMeKIn9Dul26cw63ckPaK5em12z0dlUynEC5ucy56ye2i0vP6BdOQl2bSHZ3PTa2CmvE
         sMDKYwOWCpgZmOh50DWrOUITA/FMlYEKsNuzdlla2IwPQb9MnCWLcRUSSvs/LqZd6Zn5
         h8oQ/xsQCtzOFC06qETJPwUsoHhOShyhE1zbVCnu98psanR6v5OaQBB5qEVjNTIm5ady
         b63Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795197218; x=1795802018;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bYNDc5z2QkdyV1anAJ9Pub/lfkPevQWizYys7b38fWU=;
        b=bSnIxhq4+BafzqC3/69kO+6qx3nfi+XQdU/nLes/8ZwrD212KXnnuhPyux+nhGwd10
         jY7VoTb1hF2gPeKGfUt09WTrcb4L6mScF6Cg/Ra0O1skqypac3ha+qf8Py3uVuiv7krI
         BFmLCx3tJO2g91wMc6knLMsNMGxMYhoNbnxMsYPrYUI+QkU+p9+4+JF4HRTKIZFn4YpU
         tT0/zRMWRT/3p8zzObip9CZk2vBibkRsv4QhtTNDbI/cQomBy+ZqvUW3IGK+Z+Dk5k1T
         yTolan9Memb0BgZEJcyjMvg9sJkE1oScnAX8WgDgSusPQsQIzJzwnodHrRLU193WLfAx
         Dk4Q==
X-Gm-Message-State: APuU4Z/qcyIam0seqOdeL9lGQ2ufK5zNYmn5bZo2Luxi0X7M10Ur5NCf
	bUhEe+l1n1a9kV0jwEWgMVU2D86jKSXHNlWOdAr9ZzAjEMh7QDVOz4KRikIeWoiqBXL64jdNpr8
	6x3UPcMIFEbDmbKYGOPoHqdzV+jpalME=
X-Gm-Gg: AZFdTZfSRerA32QdEYfeVjRN+jS9FO6fSzYYyO8mo5n0DPt2AmHFoUnVVgNT4oVt3xR
	2cDHXQWLHfFbOg1n/fxci2nPV/Q7Dm0hU/lyM8VUTXckdocTnAV1o/BWNnFL2uuQfc3O3qkRtHK
	pZi2oevEAGcqKUjzea9v2JLENxJyXZmF3N0eJ6cPKgkDcXDkhW2uXXwitbDeMFPcvzIvzPn0pcV
	olqj0A5FmT3PnseFOZDmqm/V+um4kBTjrrg6DrjCDIwC5AXv7CeUtTL372P0khc/na734dsyml0
	eCoNYpswEnqYAPVUMZ6z7SYZOPoU3EI3jwVhMQ4sI7cmRTPXZaHK+2/aSd3aY6NDLUFGFHhovQo
	6tPuBzgAH1+X7ReoM8G+rkzdMAKk2XN1qXzON1nc3Hy4uvq4bt30bCDEMBCIi1feyOi3I7txVMQ
	fMpwPrcYeiH9rqyj6UR1n1rGYTDnW4sgraSpluuH8V76m/EJuI/NzZG54nPEyU9NfsDT+66DXgU
	NNjoDUyO/endbX1XSMG7g3y6+3p4Q==
X-Received: by 2002:a05:6102:a4d:b0:7cb:fd69:4155 with SMTP id
 ada2fe7eead31-7d72b3582d9mr2198831137.5.1795197218598; Fri, 20 Nov 2026
 09:53:38 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-submit-stmmac-rx-checksum-capability-v1-v2-1-059f9499c386@gmail.com>
 <179511723446.3136.5381192433185500992@kernel.org>
In-Reply-To: <179511723446.3136.5381192433185500992@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 10:53:27 -0700
X-Gm-Features: Aa3M54r9Ol27mWG1eqxOv22iaYVvbksTWo4-8sJ4NYAR7dV76pguE_MCDRLUKI0
Message-ID: <CADvTj4qRtmZPS6N_0tM5WuFNbm8BRpE3NjxiODNMTaNBytuUag@mail.gmail.com>
Subject: Re: [PATCH net v2] net: stmmac: preserve RX checksum capability when
 offload is disabled
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, maxime.chevallier@bootlin.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, peppe.cavallaro@st.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 12:40=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wr=
ote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 1 (1)
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] After this patch, stmmac_hw_setup()
>   (drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3725-3729) checks=E2=
=80=A6
> - [Low] The struct stmmac_ops comment for rx_ipc
>   (drivers/net/ethernet/stmicro/stmmac/hwif.h:322) still says "Enable=E2=
=80=A6
>
> Pre-existing issues:
> - [Low] This problem wasn't introduced by this patch, but
>   sun8i_dwmac_rx_ipc_enable()=E2=80=A6
>
> --
>
> net: stmmac: preserve RX checksum capability when offload is disabled
>
> This patch changes stmmac_hw_setup() so that a zero return from
> stmmac_rx_ipc() clears plat->rx_coe only when RX checksum offload was
> requested, meaning hw->rx_csum is non-zero. Before this, the RX COE
> capability was lost when the interface was reopened after RX checksum
> offload had been turned off with ethtool.
>
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 25894771e9e9f..e162976be2e6d 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -3723,7 +3723,7 @@ static int stmmac_hw_setup(struct net_device *dev=
)
> >       stmmac_safety_feat_configuration(priv);
> >
> >       ret =3D stmmac_rx_ipc(priv, priv->hw);
> > -     if (!ret) {
> > +     if (priv->hw->rx_csum && !ret) {
>
> [Severity: Medium]
> Can plat->rx_coe now stay unverified when RX checksum offload is off at
> every stmmac_hw_setup() since probe?

Yes. On GMAC, GMAC4 and XGMAC, zero is the expected readback when
offload is disabled. Clearing plat->rx_coe on that basis is what makes
a working feature disappear after the interface is reopened.

What v2 misses is the later live enable. stmmac_set_features() sets
hw->rx_csum from plat->rx_coe and ignores the readback. If the enable
bit stays clear, the RX path can mark an unchecked packet as
CHECKSUM_UNNECESSARY. I haven't seen the bit fail to latch on hardware,
but the driver should check it when enabling offload and leave software
checksum reporting off if the enable fails. The rx_ipc comment should
also say that these callbacks return whether the checker is enabled,
not whether the hardware supports it.

>
> For example, if "ethtool -K ethX rx off" runs before the first
> "ip link set up", the readback is never checked. plat->rx_coe then keeps
> whatever value the HW feature register or platform data reported.
>
> If RX checksum is later enabled while the interface is up,
> stmmac_fix_features() keeps NETIF_F_RXCSUM because rx_coe is not
> STMMAC_RX_COE_NONE. stmmac_set_features() then ignores the rx_ipc result:
>
> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_set_features() {
>         if (features & NETIF_F_RXCSUM)
>                 priv->hw->rx_csum =3D priv->plat->rx_coe;
>         else
>                 priv->hw->rx_csum =3D 0;
>         /* No check needed because rx_coe has been set before and it will=
 be
>          * fixed in case of issue.
>          */
>         stmmac_rx_ipc(priv, priv->hw);
>         ...
> }
>
> That comment assumes the stmmac_hw_setup() check has already run, and
> after this patch that is not guaranteed. Before this patch, any open
> with a zero readback cleared rx_coe. So once the interface had been
> opened, offload could not be enabled at runtime without a check.
>
> Some hardware may advertise RX COE while its IPC bit does not latch. On
> such hardware, hw->rx_csum would be non-zero while the MAC is not
> validating checksums. stmmac_rx() and stmmac_construct_skb_zc() would
> then mark IP frames CHECKSUM_UNNECESSARY based on hw->rx_csum:
>
> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_construct_skb_zc=
() {
>         ...
>         if (unlikely(!coe) || !stmmac_has_ip_ethertype(skb))
>                 skb_checksum_none_assert(skb);
>         else
>                 skb->ip_summed =3D CHECKSUM_UNNECESSARY;
>         ...
> }
>
> The zero-copy path does not look at descriptor status at all. Split
> header is also enabled from rx_csum > 0.
>
> This would last until the next stmmac_hw_setup() with a non-zero
> rx_csum, for example after down/up, resume or an MTU change.
>
> I could not find a specific part where the IPC bit fails to latch, so
> this depends on the hardware case that the stmmac_hw_setup() check
> exists for.
>
> Would it make sense to check the stmmac_rx_ipc() return in
> stmmac_set_features() when offload is enabled? Another option is to
> verify the capability once, whatever state was requested.
>
> [Severity: Low]
> This isn't a bug, but should the rx_ipc comment in struct stmmac_ops be
> updated to match the contract this check now depends on?
>
> drivers/net/ethernet/stmicro/stmmac/hwif.h:
>         /* Enable and verify that the IPC module is supported */
>         int (*rx_ipc)(struct mac_device_info *hw);
>
> The commit message says the callbacks program the state requested in
> hw->rx_csum and return whether IPC is enabled afterwards.
> dwmac1000_rx_ipc_enable(), dwmac4_rx_ipc_enable() and dwxgmac2_rx_ipc()
> behave that way. The hwif.h comment still reads as if a zero return
> means the IPC module is unsupported.
>
> sun8i_dwmac_rx_ipc_enable() already uses the other reading ("caution
> this function must return non 0 to work") and ignores hw->rx_csum.
>
> >               netdev_warn(priv->dev, "RX IPC Checksum Offload disabled\=
n");
> >               priv->plat->rx_coe =3D STMMAC_RX_COE_NONE;
> >               priv->hw->rx_csum =3D 0;
>
> [Severity: Low]
> This is a pre-existing issue, not one introduced by this patch, but the
> commit message says:
>
>   Keep calling rx_ipc when offload is disabled so that the hardware
>   is still programmed with the requested state.
>
> Does that hold for the sun8i EMAC used on H616? The commit message
> limits this claim to the GMAC, GMAC4 and XGMAC callbacks.
> sun8i_dwmac_rx_ipc_enable() ignores hw->rx_csum and never clears
> EMAC_RX_DO_CRC:

That's correct. The sun8i callback always returns 1, so it doesn't
trigger the capability loss fixed here. The separate sun8i patch [0]
keeps the hardware checker enabled in both modes and lets packets
whose only error is a bad IP or transport checksum reach the stack as
CHECKSUM_NONE. On that MAC, ethtool rx off controls whether the driver
reports a checksum as verified, not whether the MAC checks it.

[0] https://lore.kernel.org/r/20261120-submit-sun8i-rx-features-v1-v1-1-505=
8fecba6b3@gmail.com/

pw-bot: cr

>
> drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c:sun8i_dwmac_rx_ipc_enab=
le() {
>         ...
>         v =3D readl(ioaddr + EMAC_RX_CTL0);
>         v |=3D EMAC_RX_DO_CRC;
>         writel(v, ioaddr + EMAC_RX_CTL0);
>
>         return 1;
> }
>
> So on sun8i, "ethtool -K ethX rx off" leaves the EMAC checksum engine
> on.
>
> stmmac_rx() still treats these frames as CHECKSUM_NONE because coe is
> 0, so I could not find any frames being marked with the wrong checksum
> state. The problem is that the register state does not match the
> requested state.
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261117-submit-stmmac-rx-checksum-capability-v1-v2-1-059f9499c386%40gm=
ail.com
