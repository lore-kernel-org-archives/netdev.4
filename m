Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795131192;
	b=1To5K6N4wR/F6S1AyiqJRcA5ONQGVnym2N8/GJcva58UtNZENZ/txponFBjeND/Fm8rX
	 eMjNfLaVitSGrJm1DJLCIi/SuWu+PNJGhT3rcppw6s/CG0V8aeYUBasW02o2+NmgVH9RN
	 EdwZIJDpgjatq74jF9xt0St/MKkF7Hb647P9NyTbOQv2zoCvS80HCYTtjA6PXP1U506l8
	 NakFI8Bhux4iRntcnKvxMSwEXHXasWoVA0MGWh9Fxa/9W6b1LlbZ5UA/NR0e2R7PTbtay
	 HFO7WDT5PXkv9gNYO2AX+rVPvr85Zq7Kt8Id6Nc7Jzle2013yuGNDHacpFrjkpv9lvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795131192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=db1dSJIcWvwP9jZk7KvLgI0rZAQDCeyNT1LeRTG4P5c=;
	b=d1CmZ3KO0ox0ne+R/DNC45ofgQ0zD2d7kxsLWOCCWLaG0tdjN8dAQZPw3zSBN2rMQuz5
	 eIKLUKctx3TdvdOejMSVZR+NBA2JVT43MfZhrc4iUj69yx3A0Gl2J95Lfw6JbsRG1HFZz
	 iQ4A0PgQsP3ftwvPVYK8HLdrCkiYXlgJj7aRNlwWEjqrQfyV9DcAi+Xk9t3OlhGjNEshq
	 3r85l23YQ6tPN8XONkFHkKi4ncF2hCJQGfsW8hbfeKYbQZeBHDQdfkmROQlqjqOQZsWVE
	 3yRvADjmfxg2+n581n6OHk6ZN3X7bAyjYH6QA3AOxaADqtW2NAEh+pT/ce928h5o9nA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sH7hxsVd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.48
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EA9606A326
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 23:33:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9EA9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sH7hxsVd
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7d2db6408cfso221494137.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 15:33:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795131191; cv=none;
        d=google.com; s=arc-20260327;
        b=d3K3AmHQqNzuB5GJCBX+H4PCtG0iOW8djd4DEqdGO5L9EHutTsoDzaYip69gmdrHz9
         7G1N89l7UnnFLkxZhYxrc5S0p5RLHz03Jy+X5qfnSM88e64weohQpQYYijSIhXrnxngz
         DEFdBjI0qzJo/UteNemPBTN0ovGqYlT71eG67Fy1bAqMRjfXm7pVnIgupNntAaXbK3FQ
         g+gqJk/lM3obk+R+SKBPXYeSgy+reijUlX1MJFwXvpUb9nWaGmJ26HgpwzkMSJQAb4BG
         P60oO7OK8o4Tuo6MvXgZclj4eJ0/ckN/7cEE0oYNawbNarqH/bLK9h7D3WQYZPNjiIdh
         sxhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=db1dSJIcWvwP9jZk7KvLgI0rZAQDCeyNT1LeRTG4P5c=;
        fh=Jnru1Gb72DcfmvZx2VqzsDEtr2uCZuWCx6FFwiya73M=;
        b=BpRnWLoiuzR7EBFoZcOay/GutpCybiC9OEc5I6aybq2nvFGduo4wo49StpmCuXeoY1
         x2fUPUys1xQjxyP8Y41ji2vIrDzf4ZBhvQg1HAVWzlDiS8NE3VkTfnC4fnLKoD7HUBpn
         8BtDa7EutvVZ6sYCF8Kc2swMy9UsWI+C53aN+8rczF1A/mKaSMh824zYUvbmGyVmWCMJ
         vdpd97H68Mbao16uP3TBut8dQeHKdJmDtrPAcgOFR27U3oBn/pTN4wD1zJtuu6Tjv/IH
         4lcC7/Nx3oNzhPioyuDL6JLm5OxqPQPVXbjbP4JrSz9B+HBkHH9Z9GwcwHlRKfbbH+Ug
         AJwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795131190; x=1795735990; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=db1dSJIcWvwP9jZk7KvLgI0rZAQDCeyNT1LeRTG4P5c=;
        b=sH7hxsVdU+p5G0+yBR4jmIxn0S8FWq9utTZC00fgEn64p6y7WBK4Kf2tUz56PpFo6s
         zr+hv7ZSfXSEvA5FGsTOcNHxLVcMylqjCuMDAU7aK6reHp1LUgxkVLxorED0bLTnwpTl
         uaxi5NT+HO5II2e+tNG0T6aaN9/sKItGAPMmnNAuPFiw9leSxrRSTilq+65VJvUn0ygD
         KJpZisCP+HT49RpXr4THvlGJEyfa0OOUipAO48JxZbdDr4Ai88DubgiikU+WlhG8Q1DK
         g1S/y6UXjeikGHyrPU7+DmNg4f/qFmKF1vpLhPtlPl6K7f1GyI30GSBRomM/ZGU977SX
         iciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795131190; x=1795735990;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=db1dSJIcWvwP9jZk7KvLgI0rZAQDCeyNT1LeRTG4P5c=;
        b=gwFASbaD0bQDdLEOE1A3fPUh+jbSejwLujN8czZ1DJb1Fs7QHPksjT0dDVrniuTG/V
         KXTw+d5BKoIFYAXGxo6SAoe8tFr4DJCP9HjIdvBLD1E3yu5Fh3RYy+tMicM2Hf+FHYSd
         v+6E9LS1+sbYcg3TeA/iD7O84WUfxEdNGwYB9k9s8AEUExvd0KNLlye5658LSdRMG15P
         sdLQGiHnkMBWVd1xykiinbOC+xIy+Nj1EGJU14xgZIdkaYkHLySrkJk2bDctZVtRkmw0
         piIxPjKsW9+hyyLLWaJAaGZhrbD42UjXqPN9a0wKQXfosBl1E2p09MjLUsM8xfip0eta
         fa5A==
X-Gm-Message-State: APuU4Z9eSlgSNQ5PBjVTA1z/MlAnR6EtB7r5y/fx0yBrMccQ16UQ5DYT
	/Gzevs8RB66QxtFq9RGTIEzTqr/UKc+2UFUs6EoA+jgupgOwVCEY7rz+q83xYa+Fg295tO8uy5k
	snI7bKgK0f/OSR0PGX7uIRhhAF5LkBuI=
X-Gm-Gg: AYBFou26hrt34rSC41KPHK1Y/AVfMc7EY17lDvuUgrqWpiyejTe7FkwrY0d2KfUwMnp
	0gJP7Ovk4rmzCxzn7jX6SeCVRMGdeCJnGx5wkEM6TgX/WXeJXWg/WtmKufHpMKC2WfV+14dXten
	BUw5+aec64Z3GsZSE0j5mPUdcdTG/dbhq6cSZsn5l0+BtKek1KczS7p24lW9gs/Ud1vOwkwoopg
	8RoDqtpV6Nl/w822Nfo21vrlBS5LhKoqNtpfV77khTrpLYlL9m+2/wHfeFNbx1z4U/FBDDpHFcd
	quMBu1wF352P5k+DlJBxT+IVbxH1G+VCiwDx9nEa7nJRXF6Oeh/5Dz7ZbCTNqXL53nQDpNVReq9
	AJvjU8ckLIAbXG9kKmsX5brq+NrwLBwUvnidXDBYFaecxOmZq6wN7L6hs/E4wnlg9423nSR8kRt
	fI9r4p6YKuFQZkdTuOGI2xUrlT/FRPHDAESAkIPmj1KQzgfgu5H23VLCmOCYt3uKNlQkX8GwKzP
	tKELh/dibBxX4ee86vGj8QhzSEfYg==
X-Received: by 2002:a05:6102:162c:b0:7d2:b199:6710 with SMTP id
 ada2fe7eead31-7d7394619edmr563227137.15.1795131190654; Thu, 19 Nov 2026
 15:33:10 -0800 (PST)
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
 <20261119144848.4ddd88cb@kernel.org>
In-Reply-To: <20261119144848.4ddd88cb@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 16:32:58 -0700
X-Gm-Features: Aa3M54pl4hlXRMcwBzZFHc9YCWzUYN6am3kufSQboJBVsJ7s6nPiZ-HbdhxnAag
Message-ID: <CADvTj4oJ6HDR2k6qVgefUX-h0TGh2n+AO5gx_dcJFzzWML+2UQ@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Honor the RX checksum
 offload setting
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, LABBE Corentin <clabbe.montjoie@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 3:48=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Sun, 15 Nov 2026 17:58:26 -0700 James Hilliard wrote:
> > stmmac_set_features() clears hw->rx_csum when RX checksum offload is
> > disabled, but sun8i_dwmac_rx_ipc_enable() unconditionally enables the
> > hardware checksum engine. The MAC therefore keeps dropping packets with
> > invalid IP or transport checksums before they reach the host, even afte=
r
> > ethtool reports RX checksumming as disabled.
>
> Rx checksumming only controls whether the _good_ packet indication /
> offload is communicated up the stack. The device should never drop
> packets due to a bad L4 checksum. Checksumming L4 is not much of a DoS
> vector. Oleksij was fixing this in other stmmac variants. I _think_ you
> should always clear this bit if it leads to packet drops.

The case I hit was `rx off`: on H616, ethtool reported RX checksumming
off, but the driver still set EMAC_RX_CTL0 bit 27. Clearing it let
packets with a bad UDP checksum reach the stack, where they failed
software validation. With `rx on`, the driver sets bit 27 both before
and after my patch, so the drops in that mode predate the patch.

H616 also has a separate control for forwarding error frames to DMA:
RX_ERR_FRM (EMAC_RX_CTL1 bit 3). With bit 27 set and normal filtering,
none of 100 packets with a bad UDP checksum reached an RX descriptor.
Setting RX_ERR_FRM let all 100 through to DMA in both the IPv4 and
IPv6 tests. The descriptors had the payload checksum error and error
summary bits set, but not the CRC error bit. The driver discarded
them on the error summary.

> (FCS is fine, bad FCS should only be passed up if RX_ALL is set,
> but sounds like your device has all checksums controlled by one bit?
> in which case we prefer to see all and let driver discard the bad FCS)

Ethernet FCS checking stays active on H616 with bit 27 clear. With
normal filtering, bad-FCS frames produced no RX descriptor in either
setting. With error forwarding enabled, all 100 bad-FCS frames had
RDES0_CRC_ERROR set in each setting, and the driver discarded them.

> If I completely misunderstand things we should at least get a respin
> to update the cover letter. The commit message talks about L4 offload,
> and rx_csum is L4 AFAIU but the bit is called CRC which deserves a
> mention somewhere IMVHO.

The H616 manual calls bit 27 CHECK_CRC and mentions the IPv4 header
checksum. What I should have made clearer is that the bit also affects
transport checksum checking, but clearing it doesn't disable Ethernet
FCS detection.

Would it make sense to address the `rx on` drops in a separate
follow-up along the lines of Oleksij's dwmac4 fix [0]? On sun8i that
would mean enabling error forwarding to DMA and passing packets whose
only error is an IP or transport checksum up as CHECKSUM_NONE, while
still discarding frames with a bad FCS or other fatal RX errors.

If we leave the checker enabled in both modes, `rx off` would only
control whether the driver reports a checksum as verified. In that
form the follow-up would replace the conditional bit-27 write rather
than depend on this patch.

[0] https://lore.kernel.org/r/20250818090217.2789521-4-o.rempel@pengutronix=
.de/

> --
> pw-bot: cr
