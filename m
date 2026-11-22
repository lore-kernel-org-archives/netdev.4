Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795381365;
	b=e3aI4FCngvjLJDRmoEdI04krQKMr7qlYInEoLQ/93xyRBO9lRKmgIofj+y5WbCvkP5l/
	 VR7sxxs0tUN1tw9NKbVUa6l3fF3hRpxdqJrwNFw4rKoJKVxsaWoymLNW9eTWUltGsZ7rf
	 twCEYHI+TiA3x4d9LP3lvUm23J+gdjdiSyp475mQslJ2PKw2FSl7r8Z8dMdQYPEBdWWBC
	 XjztAH6ixXwntxcYKB3CWYVqvEGzMqLLA3G164f53KFpHIrNuN70NoccMA15fN3Mz5fmj
	 lXc/vZJHhFIkGo2ZevjNUtyNjfADOiv2GQnfqSKp+TjkITSag2tuNj1wAnX109pVZ2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795381365;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pn7AXOK0vv7XoUam0J0U7bLVZ6v8zi99slOsZ4hNcmM=;
	b=BX88TvsyJHON9Ro+YlZlcXwHsjyjFtdg84/S6BjtciKprKKwBbbWwTzkMpECr8zcF96e
	 6Sz145IVD+D/HnQ7vpYQBQ9mIlAAuOLRQZpSIzgD1ifXSdYzvDVaA/rCUl49++CIR6MZm
	 C7LECw2drmjnGvIHqhOFNr6NG1l9XyKEAThsjBNnFdEnKddPb0dlpxvqeoTByR5JF7P86
	 ETMwmM+bOH+9o+g92QaiY9XNbdwJTOY+pdx0Qnvf/GNeGStTtuyuXLtCPxh06RTrgIeuZ
	 znXE/cEDSvMjYYaIXsSmLu1KKgqfMurwrnrOTnjVVa2jmda5cYacOyrbHBt0joXG1BA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zlsBYq18;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D05D606A31A
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 21:02:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D05D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zlsBYq18
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso2926826a91.0
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 13:02:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795381364; cv=none;
        d=google.com; s=arc-20260327;
        b=OPd2D/b0JeOEeR5Wv6+3GzlC1RrYFIY0D5cazrA4zfkeZGb1W+oAYecOsIqfRoUNSZ
         aLGZB+8T3RJ3AdY13irV/d5FAFkdvCEi0Qz3QYNoFOnkBSzaw66NErfsNkCf/Hq1hSYv
         LQiZLWkrb/3pwCCwwRhvsCjcKAcEPn2h1UlLa1acLpFISHEs/DT9QasFud12feZJHRpS
         sSwc9ljRGa71Kmc8x5pPiqSlRpnjKkfQa/wlGlygbpZLHikhU31HdkjsHgVk4DMGCaGV
         ABkASIiiyxOfKUHOe3Ijlf9QaqvRXUrNvLAbAOANH0sjSmRWq93NKMwCwxb++m0w1MNG
         RFtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pn7AXOK0vv7XoUam0J0U7bLVZ6v8zi99slOsZ4hNcmM=;
        fh=ksgzLJa024l4a335zlC7K8HR5ZCdtOkdRWVqi6s5Y3o=;
        b=H/m65N2M7R3waasyyxMoO20erIoj4ROpfMjTv091HarmWzfbN8MRU12xv6FMx7TaNQ
         fO00aEBdG43MXqGttmtuHRDIiojXnmR/Kdq/sbZgQXsMvZFypCsmcc3eO2erxyWgHqkq
         5MMrLJDRCPm5WiJ3Vt/WNsirbMGxUd52kMPSWPqYi2vvnk9vfo+06hSMZ+NZG079xPQz
         DLgNW1oG7IFmptt25+PIpzTCNBlnUQsotT0JQ7/g9REvXhHCoUrwzeHzIhNgEHGuJHFM
         21LxcAjWhxFgVhkYMKp94o2L3EE3lX4bGIeBYvbaFZDl//J033g2YRs97gSpXoSixZwV
         k4hA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795381364; x=1795986164; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pn7AXOK0vv7XoUam0J0U7bLVZ6v8zi99slOsZ4hNcmM=;
        b=zlsBYq183P2jR915rVTxFxauPzMtvP/3QFSR94XstIUIk1+DQECZlj7+o2TCBTwO4Q
         OQ+ry/tgUEUfXH7JkwtfbQgmYmGWP+sWmdEcSi47N1Tf9NGyLKDKI6NiEk/Q7/eG18UF
         uovr7R4wYDgZC5HeOyVSSh6XTUW0oK4TTmdRi7p+bx2HychGJFIz3H99RjLd9/MX+YGH
         rOayRZIQj3i7bi+YFqt16rsfPngcVCvVhFZEC5s1UY/sU+1MrNWV3E2DSk8yo4uV3N8H
         EZug8sN4NQE4GBGoBtLRyflLwIrBc9/DDBx4x9SO7ZWe54jl2xq3Ob7I70FvrohJNZdU
         dkEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795381364; x=1795986164;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pn7AXOK0vv7XoUam0J0U7bLVZ6v8zi99slOsZ4hNcmM=;
        b=EiFE76iAYe7WeALKIPEQwheSJGjqeUP7zAmLIrT8eQBkUtbivD7nm/r+hX+HRPU6bB
         67Bz8HDeYxw62OaN6zjL3eg5kaxBlgca9kXMG2U4TGISAs/4DPgdr2JQRCLtM1OWM75t
         qO2eYXnwdIhO+mNL0GQc8+pLEybVe34o7iLeJM9zFPmbm9a4RLNd2dI41A6LDKVdmkQ4
         CZUbKdU6uS2Ac4zITbrRfNu2mCNCzkkxGbb3XnjC5XpFFItE1R6cw4WUiMhwV1MZy1Cd
         n4QOMo9gv4YLBauVZGN0LZ69bJrOP92TVgpJtk5306ptrqvm5Ad2iHC8ZxckZ+okRZCy
         EhbQ==
X-Forwarded-Encrypted: i=1; AL+hErFZPAAFcKKi4X8oFbx7xpBxnVngGitXixzONl/+5ru+W/2ptRO/HgLXrdfGgC1nMcy2hGJMAKU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Mb1g/xSAMxKM7ik2aKobQiD0HGIB1Zk5EjplnIREfU7nF80v4
	PjGtLLnyX5mzaqkyoV0G8Lft4afyD4KB1e8LtmuGQjIBGAp3qgK6SEUInTD4VMrksU83G2u3/BM
	9fqbnq62hDnnYAF/n7mRN+f7bVXsZd5M=
X-Gm-Gg: AZFdTZewdxjhPBC/DLtZ0GVC+iOua78OpCV/lIiUdQEvI6Zp3AR1STtSQmd7YZJFePx
	s2dS7ZVIhCHj/O6M8AYhU3ayuOtJuJA14SNpt0scpSlCL7AHzCFSJirzlSAwcwN1o34jpNWddYn
	ZL8q5peMONnLiFa2Uy3cjWxFUOwBRoaVRqZDev56+NmUaC450Vf8LTBJMEutRzlqw0oPbDCQ2Gt
	HDI2/41/M//VmI+am1G0nPT8Oi3g/z31YMPugWXyHAqyc4WaScs0ht1I5CyAPMm+OqSPcJ3mVGw
	YDTDTYzt4k2+4hKuy8ziYOvQP+8hM2FHe3mtGOFO5qYBAsF424bNW7OIKMjUSbFyzEtdtjHDz2x
	lk2rAHTL0mXmPCu5cCqjjbDgNhD7i4En22Jux7soPjTC3lAUJ1/5XlTBHGUybFdx+c7I7aw==
X-Received: by 2002:a17:90b:554e:b0:3ac:860e:1af9 with SMTP id
 98e67ed59e1d1-3b41c981a67mr6077104a91.41.1795381363876; Sun, 22 Nov 2026
 13:02:43 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <MA0PR01MB921746F36D90C7080287ACC9FD782@MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM>
 <9d8cdde77beedce76aaaa1c5a7a788dc@tipi-net.de> <CAH5Ym4h8-1mc+DX0Si7XROeGn9M72bQC+ooM05Y7ZmgTo+ON4w@mail.gmail.com>
In-Reply-To: <CAH5Ym4h8-1mc+DX0Si7XROeGn9M72bQC+ooM05Y7ZmgTo+ON4w@mail.gmail.com>
From: Sam Edwards <cfsworks@gmail.com>
Date: Sun, 22 Nov 2026 13:02:31 -0800
X-Gm-Features: Aa3M54oHW1FHI6GaA1OK0id-oEs8UcKMQfeywYsbJpKdYciL2E1UJ9KIq7wOQ5I
Message-ID: <CAH5Ym4jkX_tD58Gtd-mzruB+hqHK7s_9knNWh+gMqUjwuYyVPA@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: retry a failed RX refill from a timer
To: Nicolai Buchwitz <nb@tipi-net.de>
Cc: Anandu Padinhare <Anandu.Padinhare@electrifex.com>, maxime.chevallier@bootlin.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, David Wu <david.wu@rock-chips.com>, 
	stable@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 12:20=E2=80=AFPM Sam Edwards <cfsworks@gmail.com> w=
rote:
>
> On Sun, Nov 22, 2026 at 10:01=E2=80=AFAM Nicolai Buchwitz <nb@tipi-net.de=
> wrote:
> >
> > Hi Anandu
> >
> > On 20.11.2026 08:49, Anandu Padinhare wrote:
> >
> > > [...]
> >
> > > @@ -6164,6 +6205,8 @@ static int stmmac_napi_poll_rx(struct napi_stru=
ct
> > > *napi, int budget)
> > >       u64_stats_update_end(&rxq_stats->napi_syncp);
> > >
> > >       work_done =3D stmmac_rx(priv, budget, chan);
> > > +     if (unlikely(stmmac_rx_refill_needed(priv, chan)))
> > > +             stmmac_rx_refill_timer_arm(ch);
> >
> > After a successful retry, doesn't this leave the last received frame in
> > the ring until the next RX irq? Could the poll refill first?
>
> Do you mean "first as well" or "first instead"? Because "instead" can
> cause avoidable packet loss:
> 1) Initially, network is idle and ring is full of empty DMA buffers
> 2) A burst of exactly one ring's worth of packets arrives
> 3) The RX irq fires and stmmac_rx() attempts its refill-first (none
> needed) then depletes the ring to the maximally-dirty state; the
> refill timer is armed

Thinking about it more: the "unreachable packet" problem happens at
this point too, even with the "first as well" behavior.

Maybe the best way to resolve it is to adopt stmmac_rx_zc()'s behavior
of refilling during the loop?

> 4) During the 10ms timer period, more traffic arrives
> 5) The RX irq doesn't fire again because no additional DMA is
> happening: there are no usable buffers in the ring. So we're forced to
> wait out the timer.
> 6) Any packets during this time (beyond the RxFIFO's capacity) are
> discarded by the hardware
>
> But, "first as well" sounds good to me: before entering the main loop,
> refill 1 buffer (if possible) just to ensure either the IRQ fires
> again immediately (if the FIFO is holding onto another packet for us),
> or the inaccessible ring slot is clean (if the FIFO is empty).
>
> Cheers,
> Sam
>
> >
> > > [...]
> >
> > Regards,
> > Nicolai
