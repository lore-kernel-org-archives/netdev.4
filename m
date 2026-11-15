Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794765377;
	b=qr4bi5j2C1VS4DNcW4lJWQe2o+COpVOykpXfPxkBjJLTw1pKN+JgBcmmpemWmxQ1mBYJ
	 s0t0wkvwQuDUlQfdihccVP9JS2taiEk9Ke4rOKQ/T3B2kRZoUGDm1uGmqsy44hI72muf1
	 dSQdT/bGTftwHwKQx4uP5QPtXmNy+s0GC9+AdTM+qn5ZhNeEG8i9h4IjpCiz7NADlhAI4
	 o9K57MIqh+U2Z6M2nvX8qUFk4ZYyCOfZrT7lDArSdLS33kSDQuj2/HEfaJfrTiJmvVr3e
	 0VO/PhuzGGXUqzh2rHUEYVfjwgzf/MhAxgs3fY/kO9n0kxeU5tYMWR9c7aTvVCqXmqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794765377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MsnquGLE3pqzvl2AB6wbuvaSxBLJ6UrFg4ezX2gSrs0=;
	b=CDMkcetzrECkugFoJZCJr3q9lkNI9V8PFCIrdqzQVjV6U+yk2Ph1boN7RYP5V9Dedv9Q
	 CTohucm/OaIU0897YAJDx5WuXf4sKSofx3xhdkP/Qx2lT0NB13QD7uJuTXiKyZyqhp4bk
	 kY3j8sgRIqzGCe2u+KYmyTW/IA6GD3nSHyNfMAMeHR1kDw5Vct9Up8cQR/d6Scnalhzaq
	 tQjVxlDCV1nIdI1nZkcMKeyP2RtTSOVRadYt1ZNNXBOqaH+dUgYMyFB/3qcAaEsxoDLDE
	 jhRbjwgZpdCwSNS03Z9Y7IeNf+eXoVbDNJBJHYsuG9FAbCSoEE3b0z7gxrzZEsJ2NAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=pas+8ePt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B5A606A31F
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 17:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5B5A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=pas+8ePt
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-6798eb0d190so1875654d50.3
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 09:56:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794765376; cv=none;
        d=google.com; s=arc-20260327;
        b=f+HiLBTJjhzZdEqZm5/ALdgwbSZX3TmN5KNewpmHnPhgCWtOGas+iklQvGeW4hVbgy
         LgudY6rXgjod7PkGol+5X3QeipguQD3OUqKo7LX7EBdP/dFTIX2auvxq6QMlO30pHcWs
         NY0onnWQ/MaHoEF4CfkBOCdtYx/O1hxDV9fHXOsPsRfdH+8rf23PFgJQNiUBVhwMS7yo
         x7ufCatgmqNqWd0jpDLUqFJeI7TdQ2pe9aeaO7SmaAOvhykcT1zVT1ouH3zXGzH6z/P9
         5z1ebzrtNaETAeg59nNyWC+eYigtGCNXDX8lPZWiyaKAkaZaeaL00fDqWsFnP4rrINVx
         4iiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MsnquGLE3pqzvl2AB6wbuvaSxBLJ6UrFg4ezX2gSrs0=;
        fh=4/20YvlcEGAZgJYZagbqy2dOsj1q2+iW1y2sk2GmgxQ=;
        b=WSCfrGEEwDDUmjgdQGWKNQIlmqsrN0yKbL2zSEepSRMetOEmbVtRjEYj5HcKirUVi5
         8vB9agOs8A/i2L7H66zQpxjfg4jwVSjZ9nWQnL8wjxwqWKhxjXSOGOGucX8LZUfxfRep
         x06y+TKezt04Go5N/inEZnPPwS+D+hyuuNPmR7SxPdz0fbbD5nZ4naFu/79TiKZZC9AF
         anYS0aHuKc4r49BX5mnRjGYukgzdfapoKnKXpRTL8L8LWLFC51FCEWT4dCzLT5r3fL32
         t6qI6hJS0ZtxikOnXAJr9WOR1zc/TSavTrr/gbYwSP/1xAAsFB5UaYbfI4y20p1gMJno
         IYnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794765376; x=1795370176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MsnquGLE3pqzvl2AB6wbuvaSxBLJ6UrFg4ezX2gSrs0=;
        b=pas+8ePtrT3q08eC33iGkr56u7NPfuFn8YpxQC393/ikNvaz7ESYVMC+rMU7CbJr0M
         +R8X0eulKHmx/G2309+RC0B+2JSRNqkHfj4tJCBBEFcdhDtMBoknquLrs/b/RUBGV4dm
         1Bw0o9Ch2AjP3P+3QJnA9+93mjfzMg4hoR44F0Q3QQlXSkq+p5DSWZwe83zJUHANf2Sk
         FahErFkpveX+kHbTOQ4tq9i9bFlGcKKtP7iqyv6ANpkMIhgMHxj1Q4OqTTmm6mWlcb5o
         mMkX1fgPByvBYyHkAI0DxttWhyPbpZLcytpFbirxj5ffC3D1ncK1rdgVnw3Et6tCa3a+
         McNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794765376; x=1795370176;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MsnquGLE3pqzvl2AB6wbuvaSxBLJ6UrFg4ezX2gSrs0=;
        b=onXWWdW6Do0eHA0etqRUYQBEzaQRgUnC3SypjCjATLissbxmpBudZBlhb+eytBjX/r
         1q5iq3JXHIN3ppdm2NgnPHVlbuQoWFM6bjehz63Hw+ap0lGc8GK9K4rWd59PoMYqbUUD
         1dE0lma3TuZHz/UDoqOrBV/4En7cXVFEglXpwcmAPZQmNIW6DtLRKqjtfuSHyHt27WCs
         tRA2Yms/m5oFYyupgbziPW6CCJR6Mp0j79fu8EDwn6oE/CHlzrK+y41BSIoxtZV2Gqw7
         gIKt3dhhTSy4NEHq4cjh6KscHD+YJ3VMwd9NndEFItOfn/J7jmSr63492QdPCbyYuswW
         33Iw==
X-Forwarded-Encrypted: i=1; AL+hErExJt4E55U9MyVxRjgtCs4i1tPL2sRdWg06BhbppqZpg8WnQTb9XWqfL6FpyqDiLVLot4N6sds=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ACoGmED+uzfPwhS3IoXkWVtS5BhaTk/jinlKJ4vnCqDowiURa
	yYSQxy93VDGxGWpMPhVmEFwKkyVjh1oq1+4kTzLmd9JxoqMbB8gxOyneIZNLP1SrG1OmxzWMCvJ
	OQIc48cARFUWgUUIbae3RrYYW9fX2kus=
X-Gm-Gg: AYBFou3aCyont5U4KTJvlljv7Xyvhkbg4mIrjdO1iapQjwI3THqJtrphawSZPlP/3p1
	UzrcGahB0gw2Rwh4GOegRgbjNSj/Cj1gg2TPB8P7Nf62j4rRSWp8O0MoLIJLeyqZvz/35VuN1zp
	MKn7vNPatoWr5b1w3led6zZCiST9LRQrW1MWM7h4IwFIDDozZM1kLOY0LT+rRSW59wLuRa27DKI
	f9zcU1Ba8XrHnw4OOgrSQ2tvhcXVO3gfYHqmdlrNSH5XNY2ttRXPdZ3caaqe3n3MPbl0CVnSoiB
	U/TP3Luuo7u559rM/K1aPbVn6IQ8W2/8rYKq5xJawRxyy0NXzF79At8Opxl0Qzr/zzn9rezJHNw
	7/ZaB+v1j6PL0nmGUUYRoMSzgpvFi+rBaquiwsDxLyrEfT0H3uSUMTdUqCINUSpYqN2OBXw==
X-Received: by 2002:a05:690e:4852:10b0:67b:abb9:3d15 with SMTP id
 956f58d0204a3-67d895d195dmr3505161d50.24.1794765375839; Sun, 15 Nov 2026
 09:56:15 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113121852.334604-1-tanure@linux.com> <20261113121852.334604-3-tanure@linux.com>
In-Reply-To: <20261113121852.334604-3-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 18:56:05 +0100
X-Gm-Features: AclHuK_UkljuS9ciZHxa_G9-g5ueKP83ug6GjLSD0viVWSMIsEbzxQPrFL8LXzo
Message-ID: <CAFBinCB+DkFDwXm9L+NYgtsUNR2F01xhJJnHN_8ydcRjcpNU3g@mail.gmail.com>
Subject: Re: [PATCH v7 2/7] dt-bindings: net: add amlogic,t7-dwmac
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

On Fri, Nov 13, 2026 at 1:18=E2=80=AFPM Lucas Tanure <tanure@linux.com> wro=
te:
>
> The T7 has the same ethernet glue as the G12A but needs two clocks of
> its own. The controller reaches memory through a pipeline stage with
> its own gate; nothing else claims it, so it is switched off as unused
> and transfers never finish. The glue registers share a gate with the
> MDIO multiplexer, which probes after the controller has programmed
> them: the writes are lost and the port keeps the bootloader's delays.
>
> With a newer core, a clock list of its own and delays that follow
> ethernet-controller.yaml, the T7 gets a binding of its own: the PHY
> adds the 2ns, and only the receive delay line offers fine tuning, so
> only rx-internal-delay-ps is valid here.
>
> Signed-off-by: Lucas Tanure <tanure@linux.com>
Looks good to me in general

[...]
> +      - description:
> +          APB clock of the glue registers PRG_ETH0 and PRG_ETH1.
> +          Without it, they read as zero and ignore writes.
Please give Chuan Liu a few days to clarify this clock input: [0]
It would be great if he could provide more details on it. If there's
no reply then I suggest going with Lucas' testing finding though
(which means that clock input is correct)


[0] https://lore.kernel.org/linux-amlogic/CAJX_Q+0seFwDvd6zksLnJjWYJJY1QcLc=
1gAjr=3DFN1p+aTdumpw@mail.gmail.com/
