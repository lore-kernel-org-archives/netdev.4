Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794765531;
	b=LNXDf/C3edMqTAseWFoHyvLvXx2AdPpJaoFdUNC6ud5mZu7I4NfCZyQiQqEL9Dv6gL1c
	 qO0dcIDiPPzaLCC3ul/GXIUJ0CDMoaxYlqCuSC+9/RW4lmu0+2bJE4awIcJy3TB4JJGfs
	 hYsrsF9D0CJIAR5ez3JTwAURkDDK61TaQCYTRvbaXQY2qjUVRJenOqs+LwyMqt5WJBLmQ
	 B7bhkQ9r7FxskRo2em301LRDBS5EYHVb413NHPzQYJFyTQwYEIe2erc7J1LbpGwxWUUha
	 3jXSQ1pJSwOQ7YKjsJfpsuCU+BhjbE592ez7XGlFKTSyTRd7WiuL2eMU/8pDHX65Y5A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794765531;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OWp2aJVNli7UAjXW6hoQg5j8XmpNfGNSR1QLPhqZgnU=;
	b=QMarJfrdgZjz9L1uV3OXS4yef9ibo8lLNbZBWHcaPxG/HZ3frjiyJLOsWWW9GquGo18g
	 LNYL4nGhCFy8vI1lfshNBQHQOQ+yrakBPn57IGQOl4dgxa1GynHJuAbh9rw0oJPRuDFfp
	 xUA6f6AtJFBcZWLzt1ZxSfV0SLtQDnDbaQHmmuf6ZFD7HzaO5jxIk9UxFZHCo2clnzQLf
	 XmNXUrm3PwS+4BPG/xSVJJSETqkbOK0M82TsMBCSPafAYBs+RcXonNPenOFELXxQYFcVg
	 CNFdfG0OJpyZmkkMxR1aFvovxzonCz6oYOs8egVSHzRS4qYIeH1uyGsMIZp5GGZR5eQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=XPWWAxNt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDDE606A327
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 17:58:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BDDE606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=XPWWAxNt
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-677d35fd1d2so2585262d50.1
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 09:58:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794765530; cv=none;
        d=google.com; s=arc-20260327;
        b=dWxl0b5oXtdkcCZiknoPoXAaUphFJReWasuI6X9/YGxksNFUEIe5V1evUTeNZE6oKa
         IZETDW9Th7T51ZMOlaWKfYvCkRoehRegm7Wxdnsku1yZ1lIUcgoHJIsBnt3sCl/gvA8Q
         HdjS6VWz/gY7UrpCI1PRl0lfL8wyZgOQR1CXeR2E40yqesyah2gnvNjp0hITCtGLpzZN
         QwZ0HxvDyL5hDuPYQZ0qcK9tDNCoFKXY+O7m+Py95wK7FkoSvuRZwFelCS+kfVUWR8xH
         48lghex/5c0YKyuofKmf4EXyZ/TUE94SYCbrSvNiiCkZjjRGj/QgIRE5Q40gYPUOkhEZ
         865A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OWp2aJVNli7UAjXW6hoQg5j8XmpNfGNSR1QLPhqZgnU=;
        fh=bapQX7SZZTiZA+lel+Lm0oAtouCkxIr+qzVT/S2shYk=;
        b=BHAg5i/1CNrCPAfw0mpDNDqqbhPqUpV9cv7ZFcW34VhC75qobgO6ca+q8Zes7R3yKk
         2nM4zvs8nTiGajiBjZAuJx/ic3GIF7Tn9htMlTfvFPZs33GRZ+lKmaDAYVxlHNoBvDKE
         KrddSsg3cMLARIEslC8U+mEBaIs6un4gcOIht2tKXtYLn+8t1c68auZQW356Z5D57t0/
         quLhp0qUUO6wyXK4BdcYXY1iKlGrpQ4HSe4R/Pf7FKiGbd+asfttt4XAd2l265Fy6YYX
         oMiFBQA5EJeSPtsi7xb4vklUPlkAN/YUqNTUcGjjlyvMAuO170ktKFqU7RxgdcGcXvg1
         IWRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794765530; x=1795370330; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OWp2aJVNli7UAjXW6hoQg5j8XmpNfGNSR1QLPhqZgnU=;
        b=XPWWAxNt+Env286Yntq/K2JIap4Kn9A0wPQ7tm/yBRaK2JVC2a85qlbNrRRwiFS1eq
         rzlJ7NnIsHBdv7DtFwG+MAWE+xYIoHbmECwek3wSKRZwEK/bzaGXXmHTCP8g0C1LOvMW
         izatP19yRmpsv1AhkVO39qy6GJ0EgyiQgGi2ZvAn2jKlJQJIMEOY2ZnQVQuxGKv5zuzj
         A3/3a/rmUeMo3ytH/gDnVwaYJcOlne0xmKIzCKyaKfdAHbpTcKSnUBrSP5+/WEGXMQ2z
         tP8EitL/OdpmKWF2Ugqu278BoaAGRT38R3Q+S5oEB0mOq5WaSQiQu1OdNuGvwTfLB/lE
         2V4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794765530; x=1795370330;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OWp2aJVNli7UAjXW6hoQg5j8XmpNfGNSR1QLPhqZgnU=;
        b=JaWYhmUGusEt5698OI5QxehOD79NkWFCGZF/Z4u+G3VEI05JQyfFAk5o4y8vIDxU5p
         Woi4ApOQ+xbt2OXyaM5aX+czd8/l+ESaP8hBcj7SMMPEmwZZQPJrOw6emagorpEI7ucc
         LEAGnSe8Bpqv9JHPV86uLs6QSB94hDBrO8MYdE21NRlKkqRedCsyVFpytRjOYiF3Uw+8
         6Evqo71CSvSnCLmWZtblGr41ftC3/biZf/iDm4rFBFJeDX+vTjCn2k1kv1yYShsyG4md
         d715D0gbh+J65ItZohPXVbwtINtC3PgkZT20G+SgwqH6cEjN9cLL6aJ9l5piX5b7rNSK
         ehqg==
X-Forwarded-Encrypted: i=1; AL+hErEqcNS2ZO4Ih8J5XDqL/H8WT7+OgQt4aR80xp29f8/N0haBjxa8h9PE/CNovxF+AnpjrhTzP6Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5B8JXso504Q80wSnaWVHLscUaGI2lgKiHbKtSLRzxlhIMqh88
	h8vYgbjfUS4Zj+4biPA1yD1ZMZz76pEeQ4RZcgwzjEg7ZmDWzg+luybgOGKi7pgVTlItCpmkUHw
	Ajc4yRkQDK7Ca9a37x2UA4rPQboYZW2g=
X-Gm-Gg: AYBFou2cNHflj6a+AA8wzQatZlYrlJAbbrcLKkHldkzHR7KqnjLJn56sCT0ckTiPvpx
	q9yzQ/PUG2pmMs5pGtypkqmKBR1RJpfRBYMtvX6lcIkYkbQwN0WOU/pdL2iW2s+BfPnyvW84jGo
	jbzjcxCuLpP2reAYF/mOO3AQ/jwCThRMN5ER22yJ0lHTRpdu4j7lkYXv7gaGr5DK8LX7feOrVNm
	rHBs8aaiJAb0vgFjrsTLAHUwba5RD73rTAfak/17IASoyWt8xIkI7Y+uNi2UEt1a4AlmH2FDtUq
	dm4tvHnBBQyRbRUivmcy8cssQbNoBx16n1wX9/VW28ElSPTAh9FOZTvzIaHFZZG6nBryX+l+71Q
	j3gHv0DCv+cjVqvrYLY60Zqbr0VgxBQNug/NuaNcziJrcAJz9lv0+phBkabO/cQp1RaSZmQc=
X-Received: by 2002:a05:690e:118f:b0:67d:9fef:d61a with SMTP id
 956f58d0204a3-67d9fefe1a1mr1954166d50.8.1794765530625; Sun, 15 Nov 2026
 09:58:50 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113121852.334604-1-tanure@linux.com> <20261113121852.334604-6-tanure@linux.com>
In-Reply-To: <20261113121852.334604-6-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 18:58:40 +0100
X-Gm-Features: AclHuK_i44pvTA9IYISQzdnNKpkNilY1KX3H0SN4TaP7nH1OVG2B38AEZw9Q2Eo
Message-ID: <CAFBinCBbL0F=2Wx66Ef11gUKHdz80vYrwjniMFRzeK-uiu5-rg@mail.gmail.com>
Subject: Re: [PATCH v7 5/7] arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
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
> The SoC brings its ethernet interface out on bank Z, but no pin groups
> were described, so a board had no way to hand those pins over to the
> MAC.
>
> Describe them as the two sets a board actually needs: the nine pins the
> interface always uses, and the five extra ones RGMII adds for its wider
> data path.
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Lucas Tanure <tanure@linux.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
