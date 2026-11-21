Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795296817;
	b=LTK2sV7hNHe9KkyhyzveOa7cWr4vBhZr70EZYqffEBGBNb0q+BKgAx9HUYD3cZALwnZ+
	 TnOO/1RlziZFI5ZiQBaqYHztuED/drR/Bq8YA+pz+jyfiJRDtLog6jretjIDzSLXemlFq
	 zrhjudibL/GTBVviqqf+uAyYCnevO8g/Z58UMfjd8SxnOcGHoJ882GE3KrnOKKN2MPqit
	 KITT8iWnlO0GG0k3mmszRDlRTyW2024Jt9TNnXdN88zRktXjCuGMudTxOSGkS85TCUJie
	 A3JfNY7xytWtTxJC1uufzAGn3+1vehbXwd6lIMkBhH6NJAM4jcyHOqrp1IHDkRM/juQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296817;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lxD5zixKw7Tr1W31Lc/kVqjisXnCxr4/jEW2jAJqxqY=;
	b=WnyNAzG5b5Diz6SYfDDmFbTeUKM3Eg2I5ynm/cF0Ublpwm+t2WnCSOi19S+K0OWwsWUA
	 39C346KQm1qYgifj02YFDwgQALN51dW1FZ7fAeFFjIxbMZcAI/E/Jye/AKeEAQRW3+dG1
	 dMRPBsTH0BVWrhCVkZfELG71dozGdrzbLpe/TLIKifpy2ZuoFMOEGhDouQgIw2l2jTUQ3
	 NCJBIXdP8fPQ11ERsuwUBfmk4s/uE6Oa3QWLw7EUqc8yeHD1J1UhIYaKifvMvhfiPHvRI
	 U+27OCoeV64x6fFGRl8xDo5aWsfTylYHrQoA8yOFWIrHXMKB/HkhVPbLX32HmP2G5Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092B2606A681
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 21:33:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 092B2606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8b68e59ab33so1662951b3a.2
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 13:33:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296816; x=1795901616;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lxD5zixKw7Tr1W31Lc/kVqjisXnCxr4/jEW2jAJqxqY=;
        b=seC6/46o46pmGBV8S8xmrDLK5CBmgvW/4Kygam18ZY3zmgFZXDuC7Gg/8LsqGlAMhh
         anwXNGxBSweU5XX8CDReyKJ+k1pP1EqZCiqPgUP49S37crUInxE6g+xwxvjrTvNprBis
         ZPm9uTrNyrqSRTvZzRQx6pZDPFWvoSehgheIgZy6R47yYu/GG9F9KxqQdmIhmllECaS+
         aF/Pi2pvGNpw1pwrkL5KT6s6KymTtzU5IrilOLNJiSMRHAmMng3XFuS2xnC6Advajjbe
         dpIrVAXBY0Vi7l8J20IVTYqxhbBmD8Mq7R2HSCoJSEz9ajRBv1ZLd06kfS+H1gmtXehs
         UkVg==
X-Forwarded-Encrypted: i=1; AL+hErGzTMN771XGbPwFTE/TSgTpJcyQvnoRXRPRt2lELCBeBuJzic1/SJbW6iHA1/wZrQl3GIQDi6c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IGQBmDsNuy/tI2N4MztBwX/OKccZjjquQrJ1wi41LTBNbu4SW
	TNqFI+Fvg4Q4kdwyJHqHLcWbFlkaIkTudEEjH/s1OSpMAwQJYk4+mvDOW6MO/CW9
X-Gm-Gg: AZFdTZdk28U/fuLGmx3UvE2TnU7dEzECyUNTdXZGs8Pq1vT3i77u58fgWdq2X4o1TkY
	20ypZyl0dM9VfzimvSIbWk5tM/98adhZeTXuYUsTZrNiQfTJ1LdanrBDvR54FOjhseoPlhIvdtf
	KUbgltA/iZ+nStFQlB3HbkK0fkyWtg2ixW5/grGGlvZi50f3/71MMV5ksC4F/nHr/W8/8ihh7mg
	O9qop5vKPaV8uwgiixNNo3psK59JBig0X9XBFB9LjaZ9S1NjABGBytOl9bjTa2phoECw2W0Y1Iz
	rILL5fiDGvBaaS/ZYUO/UAxyYPMYGEjPE21xxGH1KYmW9P9x4adDbCGmg2qGTn+DVwjMRszuRnb
	8eZ417dBSKU3MJrSgaz+Bc5ACnp+9jqfRglnLrtsDGSrrrNMOBPntHCEQXMmnSK1WZq1GTUI7Nc
	Iaz5TMA1N5kVH8l8FxNWwbIqH5AnYMvICrvYLLh56FD2W+SI8D2HCEQhEbFNDFZ+BV5SqR+WAfw
	StY6CJxfUipHIrYqsDlcWU9MnQvHpMXRq3Vh4E3hr0IjNWHOtH0i7PJ5Y3N6g0CGYV/P6JT7Egu
	FvNOOaQhGnf/9QAq1GaF1vBgzZ19ZMrxJ8OO49qf9bnR2r/cdPaJe7630UzBmqCDK6M8wHCJitB
	Q7QtwQEU8fWJOO/w4PL4peZuUyw6GsmFUtTxUphf0MslzY9RutpKeOP2xpQ==
X-Received: by 2002:a05:6a00:2987:b0:8b6:3e44:8aaf with SMTP id d2e1a72fcca58-8c87b4ee9c0mr6192564b3a.20.1795296816186;
        Sat, 21 Nov 2026 13:33:36 -0800 (PST)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com. [209.85.210.176])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c219sm3205824b3a.18.2026.11.21.13.33.35
        for <netdev@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 13:33:35 -0800 (PST)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8b66d1a08ccso1582214b3a.1
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 13:33:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHly8LVkAaunsDzeQ4u72hKZuaR9A3VS+LaH+j/MeRlp8RwvlWBQZshgsZfoceJJI0KCuSs1eE=@vger.kernel.org
X-Received: by 2002:a05:690c:7206:b0:8b4:e51a:c4f9 with SMTP id
 00721157ae682-8b52032b68dmr26349417b3.1.1795296389589; Sat, 21 Nov 2026
 13:26:29 -0800 (PST)
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
 <CAFBinCBZpruWYPrCWhRY146C9fd6ij2cOirJNORqAJFaiGZJ5Q@mail.gmail.com>
In-Reply-To: <CAFBinCBZpruWYPrCWhRY146C9fd6ij2cOirJNORqAJFaiGZJ5Q@mail.gmail.com>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Sat, 21 Nov 2026 21:26:17 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+3X8BGwj5ydk2TN3tDNLrrhgfKx1X1LQqjePYXJwqs5LA@mail.gmail.com>
X-Gm-Features: Aa3M54ryC1wrMtzkfpXZSCYbt8X4yrGmEQflHHmQnHyfNLikt3muwFhwFJm0PEo
Message-ID: <CAJX_Q+3X8BGwj5ydk2TN3tDNLrrhgfKx1X1LQqjePYXJwqs5LA@mail.gmail.com>
Subject: Re: [PATCH v7 7/7] arm64: dts: amlogic: t7: khadas-vim4: enable the
 ethernet port
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
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

On Sun, Nov 15, 2026 at 6:08=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Lucas,
>
> On Fri, Nov 13, 2026 at 1:19=E2=80=AFPM Lucas Tanure <tanure@linux.com> w=
rote:
> [...]
> > +&ext_mdio {
> > +       external_phy: ethernet-phy@0 {
> > +               /* Realtek RTL8211FD-CG */
> > +               reg =3D <0>;
> We've been following this for a long time until someone found out that
> RTL8211F has a broadcast feature.
> Can you check the strapping registers (or simply see if the PHY
> answers on address 1 as well)?

Checked both. The schematic (v13a, page 9) straps PHYAD[2:0] to 001:
RXCTL/PHYAD2 and RXCLK/PHYAD1 have 4.7K to GND, RXD3/PHYAD0 has 4.7K
to EVDDIO. So the PHY sits at address 1.

A scan from the running kernel agrees. It reads PHY ID registers 2
and 3 at all 32 addresses through SIOCGMIIREG, which goes through the
mux to the external bus:

  addr  0: 0x001c 0xc916
  addr  1: 0x001c 0xc916
  addr  2..31: 0xffff 0xffff

Address 1 is the strap. Address 0 is the RTL8211F broadcast address
(PHYAD0_EN in PHYCR1, on after reset). The vendor tree uses 0 and
only works because of that.

> I'd appreciate it if you could update this patch so we can use this
> approach as reference from now on.

v8 uses reg =3D <1>. The PHY attaches as mdio_mux-0.0:01, link at
1Gbps/Full, 941/944Mbit/s with iperf3, no error. The commit message
says where the address comes from and why 0 also worked.

Thanks,
Lucas

>
>
> Best regards,
> Martin
>
>
> [0] https://lore.kernel.org/all/bc8c7c6a-5d5f-4f7c-a1e2-e10a6a82d50e@lunn=
.ch/
