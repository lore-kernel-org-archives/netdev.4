Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794953524;
	b=El8hxarHhHpsmTsP9vgGf5X2vtAaVRzAJ2joZ4SyduEGM7yLzxVg+hVtTvgQfa6wHmLD
	 h45+QqKwArjL1ynVU0x0wLq2Z6fujcR8bhGVvVR+klv+8CAdUUSoMwuWy6PQiOKr7APVW
	 ry/pudHaVoYXr823XhlBfpVwou1iuCB8Bri14cwakXBbkRaGmEdXSg9oze0fYucauyhWS
	 ly6Apjutt3TXjxSUzUrn0Viw+Nsqa1DQsyWLhugA2S1ZmTwVIXh8wmHcT88mQbC5eRBFt
	 /Jf5C7ethD/cFSVpXUM2KBx1lfAK7oqD5ixWbes8xJJ4m+UO3jy03QlFha0/JBdAnoA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953524;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=PvLBfcgdHrqGIkCbXq9P0ltK62QrqPFTCIKYFfNKE4Q=;
	b=zRPAR6iFm5Kqqo4casAalw8Prv0llaezsAZki+YYjWzc03oG5c1iDvQdYSAOxDtrxTt2
	 KmaIPOSWAse1mL4jN9ucfE8kYIPJQLyj034nW9SmUuoSPEZGAzmBctHqA4V2dtpGG9TxR
	 xyZWSDqBweEwJh5kz15nwyM2MQ1flSS4o5EnSieEwFxZixgFeQtqCOW8/cyXlph94cTzu
	 UtssccviEB1Bv8kSsByuNJpeN12ert3RNrLYufL2TbmPcyocbIRMEsVCPhVGBExD+MyWB
	 sx2DQ3ahFMGQwoF72PDaVMdMeFdYdIZ6j1crXr/iHM3bJno0XEx3qHBjTVy3YPrcRJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hq8ONukK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C19606A337
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 22:12:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56C19606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hq8ONukK
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-490f38e9688so132036f8f.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 14:12:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794953523; cv=none;
        d=google.com; s=arc-20260327;
        b=nQrrYjrqIUsj/etGnvCMP62EUbmL20HY8ZQRn+95q5lzgMUwHNoJWTWpS9l0mxBuP8
         W+bQD6kwKe867j+8MieQTfY3owUJwZRSbJMn/wGAk9trd/T5ZWP1jQ7Vkg1APrBjnWzS
         16vwB4kHUKBS4UgF42qTQ0897TgKGnooiFHGGQT/NkACVTefd75G/nwdlYa1CSTO81Zp
         E0kN6Zb+iK4GQMmk77JJ04u5cHb5GGsH47ivvv1r8CvlAYzIZEuMh9enqIy2XxiIi2VU
         ncYCfoiFaaj2gacM7qjaZS3yYGIYJIWosq4z+Yj1KUnwX2oCDby1NJ80ZrGyDvA1CGYD
         laYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PvLBfcgdHrqGIkCbXq9P0ltK62QrqPFTCIKYFfNKE4Q=;
        fh=sgMlnpPIkoatpKB1xJDHQICPZqesERPploa6LoXqXLk=;
        b=hCZtx7HgrxBCp7eepa1lS0rPHsOe5sp5AyA9KK9CtN24x28VaxQsvwbYTkrpvqbozs
         oHhHla1MAT7zcaxioi+FUo9XXSQDdZZ/UmMxZzIW/lMRtViCZvMkS1MFN5Ee6e9CBORw
         LY02qJF7Glz+bAV2dch1Jl8Dbdox3mPMCryRuIV/TJ+bYe6qXuKJauK8Lf5Df4mIcktp
         ZP0TMQ5b3b/IY7/ihAcQZbjd5a+MDZIlbnNdVoZAMq43Yol15KsLeWCER43iorX1vUCv
         gm5fZDV3LmE20HbAJuY4pB2JxaGQNxLNu6UbZilykZMr2GKudop4IZ/IdduzfvcB+3qW
         mFnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794953523; x=1795558323; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PvLBfcgdHrqGIkCbXq9P0ltK62QrqPFTCIKYFfNKE4Q=;
        b=hq8ONukKLl1zJE4LpOHxPIT/VttXbuTBBhhBzcxGS7ycwPbMFkFRgJyAdeS3B2eecT
         R/d5hhRTVquzEItdtaUB8g91yUCZGgiWJ2f6xqNz/yIs3IMNURBcbP1JKmOfP7+JNclP
         kRIsYdlfF9qLxardrWmKOKdZC5QlxaUzL/zNE/OrZf+UoWsPgY67eCwPo1aRoDeNnZ1a
         lvqwpwUCmH2ugE6cLq8ovECeZj38Y9+Ng5ddI4g4hVoPl4dQFVTJj1UqNmAaRtk+WJY5
         nh+ozLgpvU6b+MSPRUunMocuUvxcxt9qJmTPi2ziDxQ3/6WmCf/YGGfrHdsbo+hG5Kn8
         V4cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794953523; x=1795558323;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PvLBfcgdHrqGIkCbXq9P0ltK62QrqPFTCIKYFfNKE4Q=;
        b=yDgokMi1x4UVfANSmbdI10vRtC01zI9rjj6PgPbH7Bzf5mi1G+m0wVazpjumKX6+Pu
         C4bBvHSLw9C8y6GShhlZ0+wQz0G+iXqoAqcshZZ9YNwy5cmSP+Q9DwInfbotR26Sjxh3
         GeFfUAgcWzxfByuD7FKPZikVxzxkfKtCZcVlFbJr9B+6AdRXgoM3CTk62/JV+wh2/8Fj
         VOkRC45BZwtwWyGysfnqr/WlbxvNGClaxmDmcPmCIavBACmuvJsV3VG0mH0GlNeNJlJj
         n6fVp+SwkRyheeJSvSaN1EfdJmgl6IgFjv7Y6A4Mn6Initm/VU9RjwAIHFX7VdcXkrFa
         XqxA==
X-Gm-Message-State: APuU4Z8qxE9qG7mW2GXBGWyytUkZpE8zHaH+CM/1fhfeAckIsfjnTbhM
	rRsPTjjNAF4YTVrv55H8x533+dEPQbpiCm0hAyZLqz8LgktajSrHU0SyhWHwtEVcUXQHY9+fmG/
	CkTbDd1ASYFfSblahGB6R70j30HhRScV0Vg==
X-Gm-Gg: AZFdTZdSjZ5Y4X5FBkBgnvXX39lAiLU0OkLDwliluI3BQV09jgVYQ1esrFXJLigglOs
	9bPA0YhRti2lbuMlTBTWyuLB4/tvagttKeEHendurMyiyF6O9E/YnN2FfId4yfgOxY3o/QKBVbC
	RwWocuGELcwvq88zqTAdpgO/Y/WVUNda5Y9eiVzBERcMB3fcS3GjtVoFYhjamlel1+GgPT8sc8O
	l7zEpaeI6BGJGTQrm9K7ct+P/SWGWFazuoGRl9CGq81c73scZSC6a46rozR3q+WD7ZJyIOxayhT
	ywHTepUqOPJAZcS6sHwWv86QGgzUwUCib8TpgsBLPM+D7AB6SjeodkgpyWFEBzTSyh2svL9yfr5
	uecXZaN1bkK3y5aMlAfAPRZKcOlBp9Xh6QNNNw9gsQI40QRrLTSDpqqe+qAwzJvdQnE7/msoJFf
	oNgt67KfxHWLg2RhLyQe7WDRAdwp/5ldbJJzyiJu4bbQI1SL48RF9Agg==
X-Received: by 2002:a05:6000:47ca:b0:4a5:da3f:861e with SMTP id
 ffacd0b85a97d-4a63ab75484mr1051704f8f.23.1794953522542; Tue, 17 Nov 2026
 14:12:02 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179460249371.8819.4646491882671802455.stgit@ahduyck-xeon-server.home.arpa>
 <179495005990.3136.15414982968445441738@kernel.org>
In-Reply-To: <179495005990.3136.15414982968445441738@kernel.org>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Tue, 17 Nov 2026 14:11:26 -0800
X-Gm-Features: Aa3M54rliRn85WjiypMI1nkB2CSLR81qjJjQO5dW_13CqoruH3NujP6cDIcp3i8
Message-ID: <CAKgT0Ue4SA-XAWYmM+od+rZuVG8dnVviVJbGQjHf-iEyBHxzHA@mail.gmail.com>
Subject: Re: [net PATCH 2/6] fbnic: Do not accumulate HW stats from failed
 register reads
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, horms@kernel.org, kernel-team@meta.com, kuba@kernel.org, 
	pabeni@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 1:14=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 0 =C2=B7 Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] The fix is incomplete: `fbnic_pcs_rsfec_stat_rd32()` in
>   drivers/net/ethernet/meta/fbnic/fbnic_mac.c still adds failed reads=E2=
=80=A6
> - [Low] The commit message describes the failed-read symptom accurately
>   only for the 64-bit counters.
>
> --
>
> fbnic: Do not accumulate HW stats from failed register reads
>
> This commit changes the fbnic HW stats helpers so they skip updating the
> running totals once a failed register read has disabled CSR access. The
> check is added to fbnic_hw_stat_rd32(), fbnic_hw_stat_rd64(),
> __fbnic_mac_stat_rd64() and fbnic_mac_stat_rd32().
>
> > When a register read fails, as it does for every read once a DPC
> > containment event takes the link down, the fbnic_rd32 function returns
> > all ones and disables CSR access, so every later read also returns all
> > ones until the device is recovered. A stats read in that window adds th=
e
> > difference between all ones and the last value to the total, which
> > subtracts the counter's whole value since the last rebase.
>
> [Severity: Low]
> Does this description hold for the 32-bit counters?
>
> In fbnic_hw_stat_rd32() and fbnic_mac_stat_rd32() the delta is computed
> in u32:
>
>         stat->value +=3D new_reg_value - stat->u.old_reg_value_32;
>
> When new_reg_value =3D=3D 0xffffffff, this gives 0xffffffff - old. That v=
alue
> is zero-extended and added to the u64 stat->value. So the 32-bit counters
> (TMI/TTI/RPC/RXB drops, per-queue HW drops, 32-bit MAC stats) would jump
> forward by nearly 2^32 instead of dropping.
>
> Only the 64-bit helpers wrap the total downward, because fbnic_stat_rd64(=
)
> returns ~0ULL there. The code change looks correct for both widths. Could
> the commit message also mention the forward jump in the 32-bit counters?

If a follow-up is requested we can look at updating the commit
message. The thing to keep in mind is that there aren't that many 32b
registers for the interface, so the much more common visibility to the
issue is the issues seen with the 64b counters.

> > diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_mac.c b/drivers/net/=
ethernet/meta/fbnic/fbnic_mac.c
> > index 16271c717a5aa..2aacbf0a6af40 100644
> > --- a/drivers/net/ethernet/meta/fbnic/fbnic_mac.c
> > +++ b/drivers/net/ethernet/meta/fbnic/fbnic_mac.c
>
> [ ... ]
>
> > @@ -417,6 +421,10 @@ static void fbnic_mac_stat_rd32(struct fbnic_dev *=
fbd, bool reset, u32 reg,
> >       u32 new_reg_value;
> >
> >       new_reg_value =3D rd32(fbd, reg);
> > +     /* A failed read disables CSR access and returns all ones */
> > +     if (!fbnic_present(fbd))
> > +             return;
> > +
> >       if (!reset)
> >               stat->value +=3D new_reg_value - stat->u.old_reg_value_32=
;
> >       stat->u.old_reg_value_32 =3D new_reg_value;
>
> [Severity: High]
> Should fbnic_pcs_rsfec_stat_rd32() in this same file get the same check?
>
> It reads the clear-on-read FEC/PCS counters and never calls
> fbnic_present():
>
> drivers/net/ethernet/meta/fbnic/fbnic_mac.c:fbnic_pcs_rsfec_stat_rd32() {
>     ...
>         pcs_rsfec_stat =3D rd32(fbd, reg) & 0xffff;
>         pcs_rsfec_stat |=3D rd32(fbd, reg + 1) << 16;
>
>         /* RFSEC registers clear themselves upon being read so there is n=
o
>          * need to store the old_reg_value.
>          */
>         if (!reset)
>                 stat->value +=3D pcs_rsfec_stat;
> }
>
> After fbnic_rd32() clears uc_addr0, both reads return ~0U, so
> pcs_rsfec_stat ends up as 0xffffffff. These counters have no baseline to
> subtract. As a result, corrected_blocks, uncorrectable_blocks and every
> SymbolErrorDuringCarrier lane would grow by about 4G on each stats poll
> while the device is unreachable.
>
> One path that reaches it:
>
> fbnic_get_stats64()
>   fbnic_get_hw_stats()
>     __fbnic_get_hw_stats32()
>       fbnic_get_phy_stats32()   /* reset =3D=3D false */
>         fbnic_mac_get_fec_stats() / fbnic_mac_get_pcs_stats()
>           fbnic_pcs_rsfec_stat_rd32()
>
> The service task reaches it the same way through fbnic_get_hw_stats32(),
> and so does ethtool through fbnic_get_fec_stats().
>
> dev_get_stats() does not check netif_device_present(). A read of
> /proc/net/dev during a DPC/AER outage, or after fbnic_pm_suspend(), would
> therefore hit this path.
>
> fbnic_reset_hw_stats() calls these readers only with reset =3D=3D true. T=
hat
> skips the add but does not rewind stat->value, so the inflated totals
> would remain after recovery.
>
> Would adding the same "if (!fbnic_present(fbd)) return;" after the two
> reads in fbnic_pcs_rsfec_stat_rd32() close this gap?

Yeah, this probably does need the same fix. If possible I would prefer
to do this as a follow-on patch.
