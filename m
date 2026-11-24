Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795553449;
	b=X8ygImB654o1MDEMgQVL1QtDX/P0tkttC0po0jI3LqLLeCTYZWqp7jN4MgmA3FGurc1Y
	 YoSF8VMfj8dNuFFkElt3cXcL3nHJI5YHboPCe9PXtYZdvH+lwAv1SRK01ATE19hcRiUnt
	 PbTNpyVqDd31htSxWPUFYeZfwWQfbc1hEC86KXovdWkVuHUNIbFjSQA2uMu50Dhx9/agZ
	 UfH9xdOK0i2i8oE/7jFpLTHSg/3cw/3Np2x7cbQy70tHQb23ZvdJi8qJ8f6tFE2ZiytUm
	 NrpiXAOGgUvVf2t37KaMd170YMunwAmfKPtHpmmZzkOOhzt2fw8LaHf4DDghdCYcl7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795553449;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DUElJOH9/l+/ko03UyVUdQyQrHZyxIkiDH011xj2Lsg=;
	b=nUF1JwnNoTIJDArc4Wf1FK49dMIpL8PxF2uMvWWvIjJj2mbAOG/j1Bm6ZcTKxBUaG3Y/
	 GTRGCPMcTa73qCP4/hFgcUZ8S/+bGVYgteNt7eJimSegFfhdOFb/n9nLxzKKMnoQcNbUj
	 g+a8XBiYL/hdABGgKOfVhhHHYhFBLE7cN2WPJ7dhNMwLYki3lnSZ2yospROtbf1zlw0mS
	 2uNLTZ7t9HUvNeZjgHu4BEYGvn5BIo8fs24QrezO53yibeB5GEjoFPxQcpDNJUI9U52dN
	 5Is6QtCF9CqVKdSYfAqUqelbAz8xKEIU6ezY4UM6W1d5KSMkPwYVb72ZeHoGoM585DQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=ESkkoTdj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF6E606A326
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 20:50:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AF6E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=ESkkoTdj
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b4e2ec4b42so27295267b3.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 12:50:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795553448; cv=none;
        d=google.com; s=arc-20260327;
        b=fgZdnCuejBeDrAnMxo9qO/A2Bau97xEsezueQRi7CILv4vElx43b66Jg4hO48YOZ+g
         qbZdA65rAeWFSmJ8ynwrAELz1QAvU0Li5tQX6g/bSXtg0HsWQRgzc6+BHmJb1WHIEE5R
         fQcyc9srDg53UURKauIl1ydgSqtsa3CNG5zeXJXwvdXmL6i0V5bbADu7BmNGB3MHPDW0
         V/OhSU00gPO5Lhtn5GRwPqTFdudocqdpCjafi8EPujE4AsETwhyKUpUfP74RZCXSijbm
         EmlBoxYYtfyw3kq+OjJHHMAtlsZML9VToKgWiPlyiEkhAOGUHvyWTyxnEjY02VpH63IG
         z+GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DUElJOH9/l+/ko03UyVUdQyQrHZyxIkiDH011xj2Lsg=;
        fh=z31X6lxPwib2MiMxWdoEycAREU3VTOwZY1xFB6jflWo=;
        b=qXfGXGp9IL+xpQ8Uvm76QC1udtCPfZSGsE1L3vfGDwJlHNzrnFxqgGmLxktAGWYLf6
         VFXEYpGKOpKkSTrc2+yqp5IdQBIW24sDkZ3DmXUGzaeSV7q3PwB1Ol0/7LBX2tHDTf+U
         gP4lBnVo8jIsRXrqMFicC8WxmMtM48+bZPfXM2JmBUyAMEm8RHtZGhHrs2mnPJCT6MuQ
         vZAA2XUs1Wb6/PACL9HMCd8gpt6FnahlfVM+BsRhhiU2k1BmvtF2jCsvPjgrILKSih4h
         9VeFEXm9jiCnhtO4w98X8G1KM2TWBZi+tR20/jJHy71ivITOuV1UWN5NNJMaiFg/Gkts
         9JGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795553448; x=1796158248; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DUElJOH9/l+/ko03UyVUdQyQrHZyxIkiDH011xj2Lsg=;
        b=ESkkoTdjbwmuFdjAfks9Lc+duJRqosDcUvfCEui/zJv26FMbm5Huy3zKeShC5aDRAh
         2K2WOrvfiXnnc6HpXf6tuOUk89LdpKhOA2e/r4vl+z+qCGbYfg1wHLUbyi8fM3zREajb
         zZC53UGAUMlLt77yEAG0Eg3aMM6euBGA7Ff2Ab8/qsdjQb0bqSbsSXNj26XO6S3z6iPt
         FzFr3Rlao3sSgf+V1rkWdPSS/bHGvujI0lCTFB5iN8Mx1MR/nSh6Hay1ei/Odci72sBE
         odfpXRYmBgWpYqt9roq3gJy6fiULArMr4+1loQL6IwHs1c6ScfKWAT17gdDE+cqQ0lAv
         7WQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795553448; x=1796158248;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DUElJOH9/l+/ko03UyVUdQyQrHZyxIkiDH011xj2Lsg=;
        b=l4Y2lg0UevaRzy/dCzvnMqBZ76+SmEoetDclPsqoQlx4sPYGKW8eJbTAyhXJG/1Yg2
         izfRHjyYjFgPnIYqZmRbN64eOs9ffWLdIvv+NPKB6eQgmiF6xlZs1ok/mDje8WMCeDwf
         uZmGNP2z8E7MsjK4hqLqfQ93yYBG7N+uYJyTMaN1f/2s8Ozkj7SoCkc23KfJK4xHBFYi
         49KuexJUPSzhTZJ2cUM2zPUZ6FbryLyWyRle73ljrvsjJMsbDtDb7V8p6NlAeqiO54BY
         y9Sl6nZE33pTAKZK9IJKA4EwNBMKv36sZz6LCpcO55m0iCgXTcc3smPjx+CvgwG2HBJg
         BJMg==
X-Forwarded-Encrypted: i=1; AL+hErHuVoiTmtYL+gLfYi4Hq5G74gWXD7sB0C7TrZME1xa44PHaiM3vNZl9yUh3rQ+I4LZdPpZsgp4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tgL5uSup3MM/92wo+EhcB7Yno4uUjQWzZwC72jA4Igp0vCRhf
	Fdxr7PMm7iu0L0cVIeX+PdnYtDajuNK4LNmz9GXSLw3QgIg/DEnyLE1G/eUb+rGr6wNO1zM5VHh
	/T+W72+100jFydXrZvDYfIyoMUDLMd9w=
X-Gm-Gg: AZFdTZeVjrZeVQ1+/YyU0fe0fJ6aoA+SNSdxmsWvsp6hkw9b7B0da1ozSSJZ6yGSfi+
	7T2VeAFfnvk0ard9MbkI3lph86hr6YGAYpt57HfLnHIZA2O0k7g0kMZsaCGpW4hHB+I16UWJK3N
	ibiWR++TMtW2aE1HXIXpu0W+vMtNf38XcE1Ty5JbH+0IGLTI0LUK9RsOHZhCR6W4xiUySqPbBYw
	ja0kyHZnbfSYsu26tUGfzaLrjkouQulgUoDO7BOLp6IwU5qNHZHbOZidhmoSDckP/r1C6ZIEpEx
	xTlEPi04GpCumJ/9mduDvt7crdfMv8V9uYFhpdplqYKw62kdHk6aTFauEXjgH5eHC8OM5nfRRHl
	atKbcBhTbPNpnFgzoXDZAmr4mKN+kCJw+jHzxXxEeY071ZSh7f4SKMEfoJXxxHXoT5haluRxZ5x
	dbB/06eOtNO5fYCx0=
X-Received: by 2002:a05:690c:9c02:b0:8b2:bb94:8cb2 with SMTP id
 00721157ae682-8b5204ac257mr64922377b3.35.1795553448224; Tue, 24 Nov 2026
 12:50:48 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-g12a-mux-data-path-v2-1-fc56db5973af@iav.lv>
In-Reply-To: <20261117-g12a-mux-data-path-v2-1-fc56db5973af@iav.lv>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Nov 2026 21:50:37 +0100
X-Gm-Features: Aa3M54qQgZtHIRJ2rEKu9YwpwMfEmR_bHT9xQyRDCd8xOxY9i9IjLVm41ypmXlU
Message-ID: <CAFBinCALe-8oB5Mwpyx-B_7dKJ-WZcMCjycHv=xH+JasRBOaPw@mail.gmail.com>
Subject: Re: [PATCH net v2] net: mdio: mux-meson-g12a: keep the MAC data path
 when switching MDIO
To: iav@iav.lv
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Igor,

On Tue, Nov 17, 2026 at 1:54=E2=80=AFAM Igor Velkov via B4 Relay
<devnull+iav.iav.lv@kernel.org> wrote:
>
> From: Igor Velkov <iav@iav.lv>
>
> Switching the mux to the internal MDIO bus writes SMI_SRC_MAC together
> with USE_INTERNAL and RX_CLK_EPHY to ETH_PHY_CNTL2. The last two move the
> MAC data path and RX clock to the internal PHY. On boards whose MAC uses
> an external PHY, any access to the internal PHY stops reception until an
> access to the external bus switches the mux back.
>
> phylib suspends and resumes the unattached internal PHY across system
> sleep. stmmac sets mac_managed_pm, and with Wake-on-LAN in the MAC
> phylink_resume() does not start the external PHY, so nothing switches
> the mux back. On ODROID-HC4 (RTL8211F), after suspend-to-RAM with WoL in
> the MAC and an RTC wakeup, ETH_PHY_CNTL2 stays at 0x260 and the MAC
> receives nothing while TX works.
>
> With the MAC on the external PHY, SMI_SRC_MAC alone is enough to read
> the internal PHY ID (0x0180/0x3301) while RX keeps running; adding
> USE_INTERNAL or RX_CLK_EPHY stops RX.
>
> Set the data path bits only when the PHY the MAC attaches sits on the
> internal bus. Look the PHY up with fwnode_get_phy_node(), as stmmac
> does, so phy-handle and the deprecated phy and phy-device all count.
>
> Fixes: 7090425104db ("net: phy: add amlogic g12a mdio mux support")
> Signed-off-by: Igor Velkov <iav@iav.lv>
sorry, I'm late to the party.

I have just reviewed Lucas patch [0] which adds Ethernet support for the T7=
 SoC.
He kept the internal MDIO mux path disabled by default, so boards
using it will have to enable it.
Have you tested that approach as well? If not: it would be great if
you could investigate the pros/cons of your approach vs. Lucas'
approach.


Best regards,
Martin


[0] https://lore.kernel.org/linux-amlogic/20261121213102.143130-1-tanure@li=
nux.com/T/#ma3b325147d6277c4d95dff83cf5bfcb75c1477d0
