Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794766119;
	b=I9w0iHXw3lWzeT17hcaJQojUiOzVxtxtSzKwt/x4f7pwWK5olTKVztpF+r0kKF4/Dmi/
	 OiR4UjtdU5tHKV9d4sfUFPHoQ7+/7r4tcepNM9hRH4+WxGbMXd5NFbBOrcEUQVCTwWJIQ
	 4NJYnmqOBLCKM5+2TPAZSYkU4wG57/oyKGQVRA8RrnlS0KG1hQUH0m5Y8UQYumdk+yddA
	 tRgPZzRly9Z/L4mAahBZFJTnpTBJ6gYRzWJfszl/h2sPaIphc63BJXb19uHUY0DaZ7b7M
	 TLcvGYsOnASbL5rlI1NZS1TdPnEen4n3oKRX0vSmA90c30NFyrDDnQ0Uioc5tojkyBw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794766119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AQ6SxbpYlEMvJGXsYYF4IK1woLYsWMG6CmUYzgyb/v8=;
	b=P4UXFKuJK2IMuzJVJbCyZTPD2GGMo8NQ6TvOqW0R8mde7h9PlHv/S/BVQEyk4ihI0JUI
	 nKJdgWqJrmJBKobAZxvlBr7XSo/rpUgGbifyyjThhCVuKRBIs6h45BGqMTS3kXON4tyBj
	 pzu1UCtLScKOXIdqQiq7mLd9e5/oIwd3+kvCerTDKltiFaLohHIRFl9PoBnN2XjRtRMe7
	 DyUyxOaPnTxBbTl9/LKJBV7ozK4rnO1lDopmka2Q106L4camp+jBd5caczjVj6tl6ZFLz
	 usGhuCQCLHnNftrIKWdcaN2RvJ1tCgnQ69mEdsBbhL6dt9TDBTVUBtoJPvTujwE9zqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=NJYwySQH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0F6606A323
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 18:08:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E0F6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=NJYwySQH
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-67db8985419so172946d50.1
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 10:08:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794766118; cv=none;
        d=google.com; s=arc-20260327;
        b=sB9c76yIo6CKUrhCWXhzzyRX96T/H7yc0xkAl8VPC6sEj7MTH6goHiVRkhdLoxqPHZ
         af7lmhpXYR26hWbxqtJUOXtWTjmTMJ6MosIGzTgPQlwQ3ABSPlAsCD226gKtWFb0dmpa
         WXk8zLcbM2HezFiRZ6Pq4LSrpwYFCNZlTcHYdWrLERDlWlbkR2sFXrfleJBidzHwjNaC
         Xvw1pgKVc/egP/OEdjn09RAVdnE0EZm4TPWdr1d2fnlppp7yNbIudqhxjNQhK4MGPgaJ
         VzMI0TP5CAdxlCMhUcQcVrVaWgaW3xxT/V8mrqRkM8uQMkxjrBRTXsOBQVQ7LOQUNxPm
         EZzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AQ6SxbpYlEMvJGXsYYF4IK1woLYsWMG6CmUYzgyb/v8=;
        fh=uV8AWE7TShIWz7lT0/Q0kv6qBl5NHQRDHczIC2U6478=;
        b=XLxUPkZvtyb5H6+D75iH8fs0QUkpJo9rhV4XLHlc06+rNbVC25uH21IgPft+WFX58w
         WgXru7LDS5K21zCNhy7EJAAdaSOhky4ppqn0ctaoSdcYVmg4aONn0MK9I0cvgQRXXj1w
         eFaOpb7MYOv0mgJjfz3hQ7lvsuIs2FWpdBxAVjn9MjJXdRXEFD3V/hv3pUBMOtw88yRi
         Rr/iV80h3cCQ5eYQvX5GwrwhU/YniuFQarkVQFuWXxCRGJC5H4iWdI0WdKCAdGSfJgIZ
         jMcx9Hxm5vKMPcVWo8X+Iqb/4/zfWzyHXKX6Vgl+vag6pjCCs9iu3fIV7evuf4ai/ond
         S3xw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794766118; x=1795370918; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AQ6SxbpYlEMvJGXsYYF4IK1woLYsWMG6CmUYzgyb/v8=;
        b=NJYwySQHOYs29DzAZoCW8KTTN4Hz5eL3gp2kthjrtMBJgUvZUdGP/E5why6wGsaU1T
         lMwanMmvalvECH+a+Rz1SKSkRFhICLIOqqH9YtPzk7oiK6IXTb2IZnVO65swhS4C1HpV
         FX51qZNZ+UnmtU2DHog4Zf7b/XL/rNNkUsklcrv8V65AQML5/oC/q8X6Z0VCPAkcN1P3
         CwNl0gLixQryZLXt0MUFVFo+fYZ64qmoeV9repPHSkLYAvTOXcuZPCjm8iWsAX0YReE0
         Z4zQa+WdwkOiCym1+HdcxVrGnXddJi9qjcShaxIi8T5T00Sh/qRgG6exViSshW0pt0lF
         IWGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794766118; x=1795370918;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AQ6SxbpYlEMvJGXsYYF4IK1woLYsWMG6CmUYzgyb/v8=;
        b=tvRc13eQMz6I6MWgbLy4qlIECAczaslbhrnbhyTDaAd81lczNwhwjDUsfH772sB/Tb
         dj2Q8A9/voU3gj1QBztJThzuG0fJiTaxgu7RR1ptNawAJnvBz68MLAAaM4dpKG5Yoaqr
         IR+Cbq+sG3QxU/huI56IbRtfaeLRqFNHSp2WcqMjk7ZAGQ20EDIAnagjvIZnIX8bp+d9
         O2+HHNuH9ZauAiyLezZcDKgq5AMTSQwUN8+o47aKKCz9LYfQpRWSpB9lp9J3Ic5hV4Nf
         tbNfweD6yV46c1OPMw0uTqKTO4SuMLxnRG6TCdJHtYUI2wM78umW/WrwXl0dMwOSzkCe
         nqFg==
X-Forwarded-Encrypted: i=1; AL+hErGnHLpqKjyuveK+fsxfIAl6JcDgjrcVkZuUXK5MupJRcne2abEHHvyjaGJpUv3Zpk5HDgSh/1E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+18jGagjZVSl/DuVS6l9rwwgpZizYv8SrV9wCP6EMGryXhtQFm
	v6uRIT0Xs6U16kN5gHH6bYVyj0tgNDL2jB3R9pSC6z2nSudf2o0gabkH6D48+y9gx3r1ikO7/Mt
	XvmuMS640Buer7n65xxc8Wu1EERFm76Y=
X-Gm-Gg: AYBFou0kUxwj//oruyvtnvuSgkOjr2WWFNLGgy3ZG9mA+uZiLaicnTcPGf2lArtZIhw
	srnCLJj8LkG9gVd/+vcfbBAS18PMxdWFh0SRoz9v3sTDhaHzvzZy6lrpBArfGM4wzCLje9s9TxX
	jtB0XzCEELWEbmShpvF2wwfbIULnJbUdj6Y/WHVqQNKPn1cYwW2+dsdyvpNsBwJ6QHOT/6uDsgI
	cVUZwxDsGDKG6RbBqrkksQQjngZiQ3S+Ym4xUPfx/gvh+rFubt9Im9Q6v6yeLMZraWW0kJg23ib
	S0rDZVBjT4lXml7+YTe2ikribNJGLRgivy6EHu7kgQ2SaYMDdeRBdIH0Oi3uo915pKWPKStDcp8
	GxcyUr5+FTQVpp3ymRadijr/btXrQslaCcC8TmOW3SLqZ4RLmRFMXDCKifHswfA36RXaCnw==
X-Received: by 2002:a05:690e:a4a:b0:67d:a6fc:6ba9 with SMTP id
 956f58d0204a3-67da6fc6d40mr1650517d50.106.1794766118350; Sun, 15 Nov 2026
 10:08:38 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113121852.334604-1-tanure@linux.com> <20261113121852.334604-8-tanure@linux.com>
In-Reply-To: <20261113121852.334604-8-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 19:08:27 +0100
X-Gm-Features: AclHuK_ca4Ke1rBatVDRggo6mUiIuil3NWD_1WvhT9IQ3QzVWOrT84nkfXuKy0g
Message-ID: <CAFBinCBZpruWYPrCWhRY146C9fd6ij2cOirJNORqAJFaiGZJ5Q@mail.gmail.com>
Subject: Re: [PATCH v7 7/7] arm64: dts: amlogic: t7: khadas-vim4: enable the
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

Hi Lucas,

On Fri, Nov 13, 2026 at 1:19=E2=80=AFPM Lucas Tanure <tanure@linux.com> wro=
te:
[...]
> +&ext_mdio {
> +       external_phy: ethernet-phy@0 {
> +               /* Realtek RTL8211FD-CG */
> +               reg =3D <0>;
We've been following this for a long time until someone found out that
RTL8211F has a broadcast feature.
Can you check the strapping registers (or simply see if the PHY
answers on address 1 as well)?
I'd appreciate it if you could update this patch so we can use this
approach as reference from now on.


Best regards,
Martin


[0] https://lore.kernel.org/all/bc8c7c6a-5d5f-4f7c-a1e2-e10a6a82d50e@lunn.c=
h/
