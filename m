Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795378817;
	b=HsfBEgeiUs4F3rwP/AnjFQvc0FihThaV2mtqzvWGLQS5jK6wHmDVUz6OQtXShiJle3Zk
	 2kgosbDFYdT4LpIL8gOR472beZngCXY9uj5XuCgdtTPmZUSkkRyFWFXawYhJ36hBb/KoK
	 lwzNU0fFx8qBXwubq7s7+lpEjUgv4I39EwT2XauOmh5tHHAKk4vP0WW5daR3Ejl/Whz4D
	 POhDr4E2M6L9U+jpMpbHR9aRpom+ylOjOkfLkr4odhYhEws2sQkMCsxlG8OWUB1Os4Zc0
	 HudTsGMyXosUvcA6bnXgtoukm+hNoghZVyB+D/CIXe5b9IpIjZL1Hb9ENSe84L0YGtQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378817;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kC307rNk6+C1niL7I+z7w4CvnqbVu1GxCYbOm7Tl96M=;
	b=yVS9VIboDOu7YYqT47PCso806+jmvgMRzEMCDGp+NvPIBVDFTgw5hNgh/Si+rwVSI/G0
	 qiUCv/xXm+/1fKOuW4C9MYfubQN6fsG2gfGAChT219qkTWNOfsdNVUn0a7uA1waIUWbg7
	 4pyPpDIAPv0rAxm0SxOQ3K8VdGIypL06lZ4inXz3We2+YGG1WW414c32twDab+uo5o2Rr
	 N/mw9lNGh95CG0GgxHTCyGrhyO9VqqJf+UUIVmCCzjOKNE/3QPw65x7yI1ncwfNAcryaZ
	 FfChLSXhIibubbXS0NNdHuUVQkM565tJghJ1jJ0Fc0Rl+cz2pJlbNJ4QkolgFIxSurg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xsgrvLte;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A18606A31D
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 20:20:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4A18606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xsgrvLte
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso1659189a12.0
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 12:20:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795378816; cv=none;
        d=google.com; s=arc-20260327;
        b=otQqfCcNNbl8oi1eptVswweNnYYqa5fHVOu2IBgMQrBzNdL6vncmPA22yG9K0sRio0
         FEb8R13cohlyNgMWhdhq/vaoFtcl+xlvhVDt8bWvUF40/ki2FJ4VMLsx1FPB/y1yV1Ja
         e3rJD5QJjYIgNjteiV7DFlpdReCJNpoPP/JhdCtOjyUSPnfeJNKotuPv5FRV4EgRcmDM
         tfZwLU6l4zsORVj9hvzjlDB3BFv0Y3n51HveRZbop0Z1RdWVXt6E1s60u3Wy3qwY4IK9
         XWE0T8zlsK3u9FwISkFkUwZ46vTNFDyuuVdy7lpiJEjuXhsmb3x2jZlPcVxKorHECF9B
         pspg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kC307rNk6+C1niL7I+z7w4CvnqbVu1GxCYbOm7Tl96M=;
        fh=cc9NnxxuerMt+5IRVjYmk4EpBMi562WVo+i749ojmhE=;
        b=cA6t/rkkXkPeNa3RKcxAtVL9LRa+6BGwPIXECqNdfrNMXmbePOyVwPSzbK1usNeZHZ
         i6dfE8RhsIHMZ5PJ4Gog4HIwtG38lrjmJs2ldUIUDbIWiEB/OH55kV+RLyMPOFeHrjV2
         RIgYxEKsOvDXOh8riPflHRBNyQhfHs3CYYuq6dKdE7fnGGcriw7f+fMX/qiBL0Ir87z1
         NiMWK2T7r2g39jmIE1PRIzPc9HvksG4N0BxMO3iNB9vwgadO738rpahmBg32qtX0Xh2W
         3EVFQUFB6ITyNl4uLdcu+uZyraox3jz1lj5TLF7RaZtLjs2WrmnydocR2skpnjlwzdtd
         jIBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378816; x=1795983616; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kC307rNk6+C1niL7I+z7w4CvnqbVu1GxCYbOm7Tl96M=;
        b=xsgrvLteeAUUvjJzZ5BZEvywpZJbedVUEn4pL+xUny4QNb2ce5CkYBrs49QaDiMDhn
         lwIwGhl2LPPKX5+lQ3nbRnhDsNAjDk2bGodR9NJDOkvu8qRxKS1mPeJBtkPEy//VRWCf
         vb8a0wNpJl+ez2af53JCGawfY0NgRPiGJAoT9kqVvHRlud29kDS6YiQCGoPOyo7pv9z3
         oxuOQWT/aKgqi5Hippc888/bWoTnlnIIs1WT9rcDTKmf2eVgfFyCgIKxtl0GnxRoZpUq
         Q3G5e+oTrsby+2XPOffYjbMpLiUD+TsfDgN6MTJppbgNx7JPgkGKELYH38RAXW0ZMvug
         mmXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378816; x=1795983616;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kC307rNk6+C1niL7I+z7w4CvnqbVu1GxCYbOm7Tl96M=;
        b=HJSKsjqdidkkzZ52J02Ym8+0wP8pe6IMZUrsFlJqxHu3OQijUcckhbiAQ7jDS/X/6y
         PLYqeq+qbWf9GkkkyEr8mQVZFkNS31MDtc8+uMNM7bdTjzdAy++OYY4fcjBiLdDZffYc
         ZkCguKtzedshV7gcwEK4JqY+isg56xTY5GiFTDAVDqAYrWZCqV4Wb2U7JRdAoQpJyRHI
         kGED+0MzaGq9VoipgklBtarVz5uAtFxrak4ON0wPwMGQrOfmhIuIva/mNYIZfPab1KdF
         BBDtyMtvB+l6wvrlCHJ60RTac37J1UUey20AtaZ1C6XSeNzmwxF0GbNf6ndGZils/UpE
         f0Eg==
X-Forwarded-Encrypted: i=1; AL+hErEgsTfzlwFIOJZamQ0nHdvBiBvLScHs7TVNHakxR4GbbEk57mdXJgjxVJgPNtlV8iJzKhFuJxM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VUXd0IrLM4XIhYYc2XfxkLne3zNPb1T6X8nNs5igcgGOhaJkn
	aBz5C5KCVK3q1dAdn84q1CXvPw2w+u6nH4YrV32QCSb+lVVlNsUEE6HXYlpBMbg2acQ0hfldRx8
	Jyb1OBKqML/bDxid2GkMkyROdUyCcKhE=
X-Gm-Gg: AZFdTZcK8rQhpYSnhaR/l+RUNsUo85KpyR05jhlE7gt2EebDpcsUdMCZPhBlMNFktKM
	N68sa+NBWYBZ0PSUAXz/Y3ap/1inPchI0aaYlZBAW0RVZQ7xCc1wIEbM83MDTMPjJD1dkOByY44
	pX1vhByo9r3E60mRyUmvR1Iu6k8a+BFkzPcMose2zPF//+3Cd0dV05JG6OT/9cLRIQiw7JxNnPr
	PQ0IODcy8PvoKWIyV9F/cF0YTtEXuU1EMRwwUJGrPaJWgD1XafWoJ2TPioGKV3PQDpvqYfLx7Et
	EKCJATKI4BxXJ9WmKyTe8gFVcKsDnxa4Be2U7m8+UUesXminCgD/LGg2KhU6FtBSXQmRsvHiluQ
	IhyiBAYObGUSOGV+5FedzBnFRAEPt8+q8BPYkJ4IYrB+Lztg8/poKsRLLNt9xPEXOOo9MsCg=
X-Received: by 2002:a17:90b:442c:b0:3a8:9b79:e6ea with SMTP id
 98e67ed59e1d1-3b41cb235cbmr8580615a91.59.1795378815937; Sun, 22 Nov 2026
 12:20:15 -0800 (PST)
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
 <9d8cdde77beedce76aaaa1c5a7a788dc@tipi-net.de>
In-Reply-To: <9d8cdde77beedce76aaaa1c5a7a788dc@tipi-net.de>
From: Sam Edwards <cfsworks@gmail.com>
Date: Sun, 22 Nov 2026 12:20:03 -0800
X-Gm-Features: Aa3M54o84M-uX2uQ_qZeHIKjUVqNqkyoSTJtgWDoyviNh_-BeSJ3m7iO-KDBvI8
Message-ID: <CAH5Ym4h8-1mc+DX0Si7XROeGn9M72bQC+ooM05Y7ZmgTo+ON4w@mail.gmail.com>
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

On Sun, Nov 22, 2026 at 10:01=E2=80=AFAM Nicolai Buchwitz <nb@tipi-net.de> =
wrote:
>
> Hi Anandu
>
> On 20.11.2026 08:49, Anandu Padinhare wrote:
>
> > [...]
>
> > @@ -6164,6 +6205,8 @@ static int stmmac_napi_poll_rx(struct napi_struct
> > *napi, int budget)
> >       u64_stats_update_end(&rxq_stats->napi_syncp);
> >
> >       work_done =3D stmmac_rx(priv, budget, chan);
> > +     if (unlikely(stmmac_rx_refill_needed(priv, chan)))
> > +             stmmac_rx_refill_timer_arm(ch);
>
> After a successful retry, doesn't this leave the last received frame in
> the ring until the next RX irq? Could the poll refill first?

Do you mean "first as well" or "first instead"? Because "instead" can
cause avoidable packet loss:
1) Initially, network is idle and ring is full of empty DMA buffers
2) A burst of exactly one ring's worth of packets arrives
3) The RX irq fires and stmmac_rx() attempts its refill-first (none
needed) then depletes the ring to the maximally-dirty state; the
refill timer is armed
4) During the 10ms timer period, more traffic arrives
5) The RX irq doesn't fire again because no additional DMA is
happening: there are no usable buffers in the ring. So we're forced to
wait out the timer.
6) Any packets during this time (beyond the RxFIFO's capacity) are
discarded by the hardware

But, "first as well" sounds good to me: before entering the main loop,
refill 1 buffer (if possible) just to ensure either the IRQ fires
again immediately (if the FIFO is holding onto another packet for us),
or the inaccessible ring slot is clean (if the FIFO is empty).

Cheers,
Sam

>
> > [...]
>
> Regards,
> Nicolai
