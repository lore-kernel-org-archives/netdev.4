Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795553211;
	b=OAhKKQQ2zYdfxK3HlOUJLuRXgtxhllmustfihggs1BVhzZcQhA9TPQtsmz4bI/fWugoq
	 Qzyc0eTaQmFdp8E4Ia2hoILbeWXjI3a8AvjMC5kM9ELRQp0Y6K/fyJyCEPxgZjTP8WaKf
	 HvAmol5izMNVfizgvCsXmRTQIkXFiH8xM12PGXmgDliFvVnPmud3dyPb0lakLWTKk6loT
	 2U/+HlBjKnzsS3ASxeS9U3Zt04j500pCz4bFrWG66LdeFg5og9aPtCibKAskC1rwQvaRj
	 Es6SyHWjl5gKfOmZaoNlP3JpzH5H6UGfNN7PLORO1HQF1a6CY+3pR94OMUXVPZL6sRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795553211;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zDNVDfs2PwxqSj0Kee0hW9NffVRwrghNSp33hY60Ag0=;
	b=uBApuBJuCj6GdgFNj6T0gVezvftz98GJuToI4j0MJMUGdEcFxZ144+pnRjSgbbiex6iq
	 YbUtAGaHk5dzvBk7XAg3QIWix4JeevEQFeOVV//XVsMuWYzc1a7liy/1VzJHgjwsVE+OZ
	 RC8VtFCe0DlBvO4GdSyTy35uCJBBuOwSV2YFv523AuyfELtaxtmCVhK95Cy4QGTbeXGky
	 +6xiHBbxfU++Rj+fF6MsdFDgr8McVQ9OQUi2mrhOS8eJ32CEDPJwKzk+wlAjVWx5SYH10
	 vsRyUJ/ly7IsNmB44yAx61+XMEXn7EFKoMJlLwJOeqHajyibLORCUa/DFr5FAk4l3ZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=GLPxPbid;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE11606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 20:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCE11606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=GLPxPbid
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b4e246acc2so35893027b3.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 12:46:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795553210; cv=none;
        d=google.com; s=arc-20260327;
        b=KvVNJcGnrupdEUIhxcdiMBINFo4Gd9R4fap1lRyoSFXD7t27e2WDFNmmBazCCdhAog
         0wNIk1MALDgsLBiaRBrNuIbdBsboAB5rYoJNCdeaeEKJaiVQUL7zLWnF90su4QTKCyT9
         5N79Yb2huXHzqABYvxpK2/k3rC9wKqwBR/M7K4XdGy/Vha9ehqleX8fRAJAm7GUBaUcT
         PYBqV6EBtEy4QBmVdCbMagNsofK9qORGLS69rrqK0Hx7VcP3ghAIQh00O8krulE8bvRg
         Kn1BndpcjCTAm/CLjEK6G08e6uUeqVAFHTK0CsFvMzb9tQGmdmkzhWb3t6MjrzrvEGtA
         /gKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zDNVDfs2PwxqSj0Kee0hW9NffVRwrghNSp33hY60Ag0=;
        fh=svTMSNB38UCJiXIN4t1wArB7Dfp4bVAjzEotfuIbAe4=;
        b=n9rcYxSOwBouuShPc6/wQcYcCo6oqB/Z9K3yuqaz1DPooiD5oPsIQgxchP3T7vo7SK
         4OmTkS3GcTnIwVuCHsQWDGTyGjiD5WB0+TrIFS6SNhy74VnfVjQS+AyhHSonXWjyFyQV
         OaKbNf94G/leC3TJ5KyoGCpxyA2rW8w5DkS/AUTE3psoNHWix1Qt1IPV8W6bJ/gtHaxD
         nEQ8vdSavgDQ17vCq8i7sX8lVOPm83tQGo2T0ry5EYeexbgtnqDfxsL64aMkz7rHA3g9
         sclyB+YIrpcryWBWSNB51bPMKHuGn63plyxg4u22MwSMFOB4143GOTeK+BiiaY60aJCN
         smvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795553210; x=1796158010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zDNVDfs2PwxqSj0Kee0hW9NffVRwrghNSp33hY60Ag0=;
        b=GLPxPbidss3ZjxqoA6dUrBKQsf6QpS4A2gR1m9gojSDw7SVtAKuSRUwYNvCRMEs+jG
         nBN0jqNDCwGYL7QqFGSylE2ayToGE1ORhbUOCm6a8i1C3iIJX8KgTq9pJiskUczU333B
         BU6N40yrS5xt1XSBSBbQLP2l/3m8StLo9HWeN3gqCubW3UnRJk+hNKuOFM0GlakhrQtd
         BD4j7uB1FL2ShtAp4PRnUXM6qL6yU0gIvZi/maIVBzDAymOKR2yU1xEIuuyt+1JS8alU
         nZkm2owPG/I9tRpSND59PntDJO2DqiQtU6o2hnlg6zV5MsaKXB9z3kBxjkJnTz4MdlJU
         r4Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795553210; x=1796158010;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zDNVDfs2PwxqSj0Kee0hW9NffVRwrghNSp33hY60Ag0=;
        b=VbSlMB+vv1nnvmXRYMgtZ6SjWA9nSLA4qG1xlys+vCM7bpleN2sRge+bUDJVFLbXYn
         We3thX5D0rgLXQU36pEmtIVv3JPbw++Ps/JIdpg8UmgbvaWL1qfbCaZ80ymIcZ4sgw0m
         lqOEnv5xUOtw1o5OLAEEJlyRrvEXiSrNCwwQiiWTcWYFI0cbvD7cOVXLt8mvdkDNJjMG
         7MUaXVwDnvVkdn5lyOOtHsfKZSNzdrBjBL8efldMmU99ih9dkKlCHpc2wA31/fMe4NXU
         IXh4HgC8AtNtXJE+J9kTNnLky3DnpfBH/QS5S26cCCI86MGXp1MdqxujUbQeLttQLlby
         uacw==
X-Forwarded-Encrypted: i=1; AL+hErHE3EhLTuz4tV1bQyB61TWUwWB9K4kdfCedg6i7nkRJEotuplq2ygVKNxRb139AuoxwEdb1H9Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/40KeYB1xaDEADugP1d0HzhhnlB6kNoxsrfrwguxOphTMo7qmN
	hgHHYw/3JYvjtsXVADrCj+uKF7WiHcgC3gnZjCHu/GuFrGUnFiIzBGwpBCfy3t3g+uYiPlQqGME
	UNZD8AyHvVOw/22ivXzszCdN3Ozw8unA=
X-Gm-Gg: AZFdTZeFRICUDHJm6HGgdYneWSmepgeXYyVV6WSRva+HkJe7oZFZNtGfd7QSKJqrv/j
	AuoDU/HRNaAIp3O2nrZd3fpKEgsL3SrKKwe1iztzgH1B0H/r9g0xMy+cMjvEcSzwcKMJUgmgvQ3
	tQ1N6fCe3H9YhD0qaGr9DL/ofyAmHnxrolikkvz4HNNbzbvquQLBgihBALFvrd8Fk3XjLq1rrPq
	843tn3+D1TX6CiAsNmkC6/yRjWsK+cf7U1OSV1a17LkokRW7zGcw54+eHYtmrX9KhCeRH1QaJpP
	U4I9c95iKrvbueN+DJcDA+IURdBsRD3ArHcntFAituRSo+9xFFTL+QNW+GLcJMCBQj2PX2KuhJz
	5owf9KVVDWb8TNDTRGOomgL8vTNxhuFfks6TR/y/migCUR9HmTiJEOMHB9CjQdKyyliGyNA==
X-Received: by 2002:a05:690c:4a02:b0:8b4:c1ef:7a62 with SMTP id
 00721157ae682-8b5204e0b7cmr63699017b3.49.1795553209755; Tue, 24 Nov 2026
 12:46:49 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121213102.143130-1-tanure@linux.com> <20261121213102.143130-4-tanure@linux.com>
In-Reply-To: <20261121213102.143130-4-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Nov 2026 21:46:39 +0100
X-Gm-Features: Aa3M54p-q6D_8aoLALfJ3nd02LBvNVydTGTGPe-SwdQ6NHwkSXTzPSzZ9Fj7tMI
Message-ID: <CAFBinCAB+CdP7ypZ3kZKKqFTqoAA5bdA9nUKkWX3fVit5LBNGw@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] arm64: dts: amlogic: t7: add the ethernet controller
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
> The SoC has a Synopsys gigabit MAC, glue registers for the interface
> type and clock timing, and a multiplexer that points the management bus
> at the on-chip 100M PHY or the external pins. None of it was described.
>
> The controller reaches memory through a pipeline stage with a gate
> nothing else claims, so it is switched off as unused. The
> glue registers share a clock with the multiplexer, which probes after
> the controller has programmed them: unless the controller holds that
> clock, the writes are lost and the port keeps the
> bootloader's delays.
>
> The multiplexer and the on-chip PHY bus start disabled: a board enables
> the multiplexer with the controller, and the on-chip bus only when it
> uses that PHY.
>
> Signed-off-by: Lucas Tanure <tanure@linux.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Also I checked sashiko's comments: those seem to show up because it
didn't see the patches in net-next (not sure if/how it should know)
