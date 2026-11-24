Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795556258;
	b=jCXC4Flqx1roCAV44Or6rO9Ftnp0XXS9VjOoIkX+jAo3g8GUSOMpZqJDIZfZOAfrt/VX
	 RHDd3uMKbccao8Pto+hIkqpUrFxQQfHxrjzs/m0Kwzk6S5HEvf/DeWq0EYgTi7QU0das4
	 /nzBv5n3XFCoRY/LLLESL4qQb0ANvTU1igvsXaf3/DM5K3UyScp0ezvGIVx/PVdVpFaY2
	 2L1RGzkHDxZfq8CDOxyHr0YXvfcMok/pVzZPchmj1K6b6Vb7tduze6AHpYzjMRy8cGxN8
	 LQvEZ8dQ2kH3z70WcuQ5M9kjTA1cHZxqcKJCVt/truClS33EOW1ZKBr5ZdyaeC3dC6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556258;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Fg3L3deHSkuexlMXiL0IKxngCsihbg1MRnR96egwqJQ=;
	b=yfaUvPNywAD6f+8sx2x3f50MD9dfmxpzQwssfqYIR0xz9YpTKvKSeFgwZLYN1KAYM2L7
	 oKXK2gv59gkIbllPSaDYHLMdiqCy0f3/vkuhUq7UYmFAj44G57t+XijurpUWAdPfT2GZJ
	 2l2LqinVBfwGqRAPYBQUo1lb9zGRD3FWROzNbkgOXZkyTVETHEFVpEb37KzWlGp7hXBq2
	 bc16g6Ju7NcewZAkx7mOEEMBqLTHdQG25QO/Gyd7XSE45os+E/vVFoOTuvFxbQRtU5x9X
	 3uoHHTLgPxkrY5upQe9bbykvlQ4q22bf9X4M8tYK6n+owBNxGGqAh/sMMNeKiG40mTA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b="sYJc/seu";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6765B606A332
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 21:37:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6765B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=sYJc/seu
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b4dd5cb4f6so34552087b3.2
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 13:37:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795556257; cv=none;
        d=google.com; s=arc-20260327;
        b=OMNouS4jR5fU33aZHjhOM0WeNEYb+d3qHXL9avvpnHt/x38uSArgkmSORhMdN5pCpW
         SnrkFxMOE21xXR1HhXhx72uq+Dpt+aNEUG1ryTnJH9FwYzHNEeSZlCJL+u/S5bSy5Aui
         AQZr6V63SeA/lybFa9UymBeJXZ8qkvPJ3e0xZDnK6YBBJYNPDXSVTPVsvenGN23mdKYR
         ZQA9t1cKJ7tDUiWDpL/6t+XBzeGF0da1MEKB24A20GywdodiBLEIU03FInhdqFwMeOqC
         b/hV7AyUFCN22KlLhu87CwKSphIXFjR6QqgL3GkqjTzaPHILcgVWCHQBkjyuhCIA57no
         xR8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fg3L3deHSkuexlMXiL0IKxngCsihbg1MRnR96egwqJQ=;
        fh=K9RSxmiOytJgRENtikmZIm69SmvhlXAwuCi6NWp549A=;
        b=E4j20CQXvImm6/6iorPobVEafH6ZjDW9noixZyXP1KrjvdzwU9y115xhiKf3HTd6Iz
         5t+Gyy6b26hKzmBzHdpHNIpQueJDkf7wCLdHTgiLL6N2vr+YKfeniIlpWkVRZ5nFImey
         VOo66N9PB7e2jEwMZKLEotl5zfEPPhBUbjc2SP6+sNrk7a1DmC62OJHIUfoqdyiAX0UV
         y44mgdFcwj1KSd73dKYgubkunQ8fdBdKTXMhyRdS41Terc1aFhrTnFv5bXue1jLyZhKq
         A4L4/TIQbC3Goc1NDOdO3Fr4bUnRjN9GTtdpRox5DkXPcxz1Q0W8+oD1px65HLWqsv9B
         BfSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795556257; x=1796161057; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fg3L3deHSkuexlMXiL0IKxngCsihbg1MRnR96egwqJQ=;
        b=sYJc/seuZAL5BO9cN9PEaJyyxuoxlHALCrc+VVOvetQXWeFw4ODR8D2TQ74t6c6+xD
         svNpcZ+X0cW0uHsPShiHJTaHRNuYtgUD1tBB+seV9uBUvkSE3sDkBF5eOIlEXUdDXM6f
         8zzcMRcWlNRWnzLJJpQYYRmqekd+YjguL8ZwQQQyDAPZZvF8yEMgKxuLVvocW1sUoE6Y
         UFFUI3ywaLLPmjOHdnIir+mUH+F7ShRNJ2QYb5HGE21mdde+5G8Y+nZS9oFOU7gRk9Yk
         qlz6rq4tOrhJeI3WQTkV2SAJJVkKbHGTTEnnWRv1YJlsTqee5TbYJNG/kPp/1nEKjAKu
         kWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556257; x=1796161057;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fg3L3deHSkuexlMXiL0IKxngCsihbg1MRnR96egwqJQ=;
        b=QFN0P7CHlPNj8qgqKF/2idVIi6+2ouCjEtdGraYBhp8SbMtiLBAsjgqf2OTtolPkjz
         X0OsaokPVtQFFdeND4EdU2bDWaomb5DUiLYwI2CwsqhvLev09kbSEwdZ+l50/q4lMtUH
         wVAbOdIjIRE3+bMqJoJVdLzqk+4XyOnTOFC0BiiwjagspCKuG41KbW9uTiG/3m0gZFU1
         F5PHHfDWMQ4IQcRTP4Klhz4eB4FvXaBj6UxIpB02zb2yHKS/kOxTHh2dzg7SwRZXYSJ1
         IpZ9n/5SfKmuT0XOMRiexPJeHCd8kFzcJyOyv5KRh0kqpPczH/46j5C5xmZw0B30t3S3
         /WbQ==
X-Forwarded-Encrypted: i=1; AL+hErER4SKTc/dWdfcu8uHwZQQUtoK2OTseV03Me/MiAUoF5DsayDvncT/z22t7HFdag08ZYCI58pU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Q6fGfwYIA2pmoAX3AOFpRykl2cXzGje94ua3ScMFEmmHP59SG
	f92Oy9fDmgwcjhYwFRT1areW0qyQJp97sJnLxGwdc83MX0Xca8dyO8dIzrgCVbHSvlndSayDBQT
	JhQEaqnIlRnzxNieetpIDuRBiat2kIqg=
X-Gm-Gg: AZFdTZc/B2ZLTOgnpL8FUXjaO7AAvI+p0MzqJvc1fUWeDcxOxYeiLVj8nhCtn3DVD0P
	wkB78+QS4Xcf3JdQAXC835W8AM70Z7W2SGRc9SpbftLhjx1zk51B6+WTVg1+BG207FM5io/Rpzh
	unEOrKYA0eG1OFxnLMxQm5WYQfR0lA4VSAhSKwhrded8MFOYW1VJ76yEfwNIZ4RA5JauwkKTynU
	LT/bPhNYGNCTnNdhPdMg40IXI7A2v6DqjovyA79s6mBkpXtKqXsKkbvCxAokXoHKPzB//uATXAR
	raTfm4WgJEZp+BCBLEn0nK8FFTo2KETVHKGg6JMtBCUhuZzyMVGbmuLg9Fydg6cLSPS20G+60es
	tIYqHHpc3lnSgnfE+kXT4epvdmdg1rS2Kg+8FlPYdxZOlt+OciEltweiO7iOlVU91+WEm1g==
X-Received: by 2002:a05:690c:3749:b0:8b4:d6de:975a with SMTP id
 00721157ae682-8b520442f78mr75631547b3.17.1795556257259; Tue, 24 Nov 2026
 13:37:37 -0800 (PST)
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
Date: Tue, 24 Nov 2026 22:37:26 +0100
X-Gm-Features: Aa3M54raaw5cpHc_7i460xpAtUuQL2U6TjCh0nslZW-bSHKd5TU4q_42SX4Pzaw
Message-ID: <CAFBinCAzSgCGfXb_Q3FuwEmPAEiHSxzVR_ceyqMNp+LEZ18u1g@mail.gmail.com>
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
[...]
> +                               int_mdio: mdio@1 {
> +                                       reg =3D <1>;
> +                                       #address-cells =3D <1>;
> +                                       #size-cells =3D <0>;
> +                                       status =3D "disabled";
Lucas, Igor (+Cc) has taken a closer look at the MDIO mux, see [0]
What he's saying is that (in my own words):
- status =3D "disabled" is unnecessary
- if you had problems without status =3D "disabled": Igor's patch should
fix it, can you please test it?


[0] https://lore.kernel.org/linux-amlogic/20261124-re-martin-g12a-mux-t7@ia=
v.lv/T/#m240f885979c7c3a84af26ee8b60d38f3092f0c0a
