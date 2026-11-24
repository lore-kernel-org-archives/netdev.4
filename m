Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795553232;
	b=zlueYe2A4jzGKtwDVN4qCIYhTQAu63YGgWpc1yYlppEdebsbF28knVo4yCZo9FXEQ7dU
	 isAAtLZU7Yed7sD53wunb0/e8ubJ9x83gfs6PeU3y2ShdTA04/BQWiVB3gkjeFjO+zx7T
	 jMHW55mZBIeoJhi1hWPFTnvBc7Gf7b/XE8txSLuMn0Qv1CiAVd32ywqKj2sqHBJtAZNxS
	 V2PJbM5kep0Z4Im1hQ8aESghHx5gbeHcMxabiPv/jlm9l8TCDA9PMRadDZ4CiCoPlTjVd
	 RhLh0JPLIK4ykqLSNku1ufdC7jBk2taHz3pM7MUbi9qOMf6Uv7TwXm25fkDFgqq+Zug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795553232;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/lbzr5VuUouDiq69BqZ6eFV3fJrAmKd5QRsGlHOj7D4=;
	b=QGwfmqKSvQkIO9b6zzgW7X514F7y/ZUMZhKdADQYeXq9/7Ul4XsL+dIGd1BzVbzWyQEo
	 E6i4qPvxfKRohesrZJ6JOYu1mC+hfuibJa/DOYT7JBjvCz8/aqqXWFvQup/Gj6z7Wp03E
	 ZUIFRnqq77PkmJ12XfimgMp+VZD9IgYazi2Z9JWhfIa3yzzSX43EvlksLnfHvi6vhMhol
	 4uTgXCYKMj959H/pOlxfpfvCLVYqB7s7U8QQJsWTMRmbEs4ICYXRKO/3uZLZg/DvU67oY
	 JYC5cRpVzFWsATLlDUHU3Oieh6ekL/x8xU+HUdTE7wY1ORI3mew5qG2PDh7Dr8he/lw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Q4iX0BR8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4095B606A33A
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 20:47:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4095B606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Q4iX0BR8
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b51389f58cso54575757b3.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 12:47:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795553231; cv=none;
        d=google.com; s=arc-20260327;
        b=fFuvlncZe33kG+iMleKTbSKAsyTMPTN5QSpFB581qm4iNTjdWmYtmiD5f5qMhMySw1
         zjBX6M+lBPUPWxwhBApnUMg5Hu10MGCBSZGYWSl8Hz1erPMqcw67HuXrZOxx/Bjmkeg4
         /hbhafwawykKR8n4D82tDr6XZBOsaHh1UYoUQKjTrgqlJIGnE9beamYAfGaMxecVOoFq
         DDGmcLKTIqvqShwp6fIs1FrH7LmtpdrApCKqwubkfXbqXWINeesUxrDtOjDJfCjU15in
         4rdkJ6MVlCTWNDPNw+GWl5vQejWZedFNMuyGTO/mn5GWsZ/1x73OaVFdV7a8HnEeZiO7
         bFsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/lbzr5VuUouDiq69BqZ6eFV3fJrAmKd5QRsGlHOj7D4=;
        fh=8eyo48shzprey0a0C0Oou1DAgD4iOCHQEc7VRpr3KVY=;
        b=RNN22nij7k1Nxk8CCiCMoiR9c5I/QZgwZ5jWOAyCWWIbIoHNhB+nPULJh5rNIcwYsf
         4c7T4nNYsOKYfgyZwV/lqrRrvANXewOxTrBJ4SwyKQzR99urtAqNqZSQn2JQrX0m63i0
         xAACLLYEuaMiMF7Y2mmqGKF6mGFG7eOmq7Bmq+Mi8nCuQ4k7b2xTYmsmG5f+nq3lSkUo
         7+U1JkzIZAnVHpra/dE/q3fV9LFwPTnpRMVefKV/VYHB7w0Q98e1hXJgzpF8HxzUEubS
         1fOWHuUYQ72KWSOPnW5z7vGSRkK5ewYINQl4U7fJEnuylk/1VI5tw0tsb5mBUN9bJwdB
         anuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795553231; x=1796158031; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/lbzr5VuUouDiq69BqZ6eFV3fJrAmKd5QRsGlHOj7D4=;
        b=Q4iX0BR8BJUhYWYquTncu3TaeCKrkudjb0ok+EmQyinm9YTQBUaKrl3kzdKa1BcyFM
         n5559g9SvmGhifoEikw4w+YFfXVjU0X59B0WlTE05El4jdxf2eHwwlFTmeH+mowecYjm
         VreCo6Q2SO3LoF5mP+jakPMSsIgYx/OTH5q3vs6Ee1nIyM3lhrCBxdgpl6cTw/eq1B1t
         yVVJEdp1qpQ5aacLGwpMjQZkGVZupGWwgX0pq2sKtwUxo/hOp9aBNqCdIIeJAFVjdnLE
         +frrvo1dePM2eQRnE+2dahRXJD9EUlfygtQagmRUKifdWLrLTu7/FhIMCRLDi0L6R3cf
         TjKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795553231; x=1796158031;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/lbzr5VuUouDiq69BqZ6eFV3fJrAmKd5QRsGlHOj7D4=;
        b=V6dbvri+/VtF3Rx1xp05JvPM+3P2tS/WZwQqW2LIdUJqVdee6GTJGj7NK/OCC5FjSV
         bDT8Ex4xuptSanrp9WLZTVGeW4Zzu7zuIZmw98iNiiqJg6W1r19JNccFlIdliD6zssfw
         iolXIfGSYS3EBCpEBHmD9GWEpXmzhxRpxnpEDlUBjR5JqlRC2qfGfXt8+VWfiPSpFFIs
         dI/yKavYAFtCBmhbzIT3oSfkHc5ROP1w9Vr1md+5wYe2JiLL+tbbjL28cU7Hml8gvpah
         xnJTexW3eNddStndJHE2nFf8RCApPtq3S36K0ctVIVAraQ8Z1v+jHN4v3ZijB/bEaW1z
         XR4Q==
X-Forwarded-Encrypted: i=1; AL+hErFxVl0wrjCu9fzCTmIC6rvoww82S9H97CAKqlTpZCFMJBV/mW6LqIsGsHP37v0/GiCtr6MVUw8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pf/ITWJCYfDPMmGrvGRVFhZSB6lljRyybxxGGZTI4MRPo4R91
	iYkDe4r4ENd2DJJUblq7xvmhQgM0J8+cCqFgMQKaCo8H1ODSfXGrdNk0e5URkb7EELU8ps6IhOt
	/+tsbbDXlr66W3QufK0PREVul/e8tJb4=
X-Gm-Gg: AZFdTZcPU9GLixchgldMP/pXLA2TBGFK8bkmAUPTRNIMPHchs1NauGuwtvHMpghKz2h
	6R7K3FagYrdRntXMsVi5431rXA19TFNIxZBEGb3RAcu8S3rYQ56eFBT19biS67Xwr0fkZlsH4IT
	MiNqtIrT1FVVtXBee33eEvjJApOi/yEJE2wZcMcoGNvr4gpNLyv7JtjqNQ87QugMKlQixhKQxvE
	e/dRSU+VZ5EwxHuCnwevNshc3eQaKpqDjdxAwjnwTrhrgIEP3nxXRXvXXdVcQLUIMh5Umnsy5p2
	wAcvLQhYSQ2G1KreuifmbHaiMGdDestLfBK+hKdUF+76WrSHHPjbh0nGwU5S7yFPsvo+ZfesvQU
	KjjxoFn35su1FlF/1BrXfp1l3ksZjE1CBKPEVmKkKcto4IoWm3tBXmu7ebMLXXTEQYEpx6Q==
X-Received: by 2002:a05:690c:6c8d:b0:8b3:2d65:2c72 with SMTP id
 00721157ae682-8b52047a894mr61098007b3.42.1795553231171; Tue, 24 Nov 2026
 12:47:11 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121213102.143130-1-tanure@linux.com> <20261121213102.143130-5-tanure@linux.com>
In-Reply-To: <20261121213102.143130-5-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Nov 2026 21:47:00 +0100
X-Gm-Features: Aa3M54piMjiC5eZa2JiYOkn7APdjKphVw0p4pBUTRqSLCMVNRfh1PWCBswFg3JY
Message-ID: <CAFBinCDVe5njTaO9xN-snXRQGKHDpsber4hi9P+Fq5SD2jMUEw@mail.gmail.com>
Subject: Re: [PATCH v8 4/4] arm64: dts: amlogic: t7: khadas-vim4: enable the
 ethernet port
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 21, 2026 at 10:31=E2=80=AFPM Lucas Tanure <tanure@linux.com> wr=
ote:
>
> The board carries a Realtek RTL8211F gigabit PHY on the external
> management bus, connected to the MAC over RGMII. Its address pins
> strap it to 1; it also answers on 0, the RTL8211F broadcast address,
> so the vendor tree lists 0.
>
> Enable the controller and the management bus multiplexer, hand the
> controller the ethernet pins and point it at the PHY. RGMII needs a
> delay on each of its two clocks. The board traces add none, so the PHY
> adds both, which is what rgmii-id asks of it.
>
> The PHY interrupt is on GPIOH_6, so link changes are reported, not
> polled. The reset is an RC network on the board, not a SoC pin: no
> reset line.
>
> Signed-off-by: Lucas Tanure <tanure@linux.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
