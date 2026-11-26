Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697371;
	b=FYq0b/yeMhP2R6vzwsDewBAAV20aPzij7HuZ1PA6yTXK+vvQAc6QxsddyO9gvf5NXhdk
	 dD54rKUyv+VFKdnzKUzafMUdUFXz60vBQPkcIuAj5js6L4j1lCfzFabdZtLtwuiMJCia/
	 Fkdkgt6FStB9EPML342xjPJT19sGIgcyy4d3q5KlPWM8vSzxWGvijqW/bqNyRmNlXVtMb
	 QNABUggfUGCc+VkJwgHaYygJPp5Hu3Xir762SBSt3zDZWctoh4yhdpdWxv6IjHqkVbmFl
	 VbsEIGKW3ys3kanPVj+GzGNde/C2C0U2h2qs9gQ8Gkf0OZ6fZuVUCxc5r73XcX3KgSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697371;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iCeQ/db20QjGcTEZMmDdadaK9BiQoJcNEDJPAm9EXfU=;
	b=RebPK0Ff4HPxGHWTyZlb6RWV//ycie812tWAolJZG2gW2q3g8/haS7ovVIF0S7uLyPV2
	 DWm5U7xakH1kapJIrbP9f6ZpcnjQ4j7YTqe2BEcl+qYU9ki9PWg3iBd7d8cOQTMvT3RbH
	 OR6qGRcdCtSnGNtD2cfTccFWqfgI1+bTqW7pogJ28KwB+EoK5IDefXxBTXCf+/SN/ovh5
	 +f82yiqGcBxGRvV0SA+q1Vv50zaGqc6JhUjNPGMf8cDOXpModrLYQkYwiW1Hg6FcP4Okz
	 6AqDYzZJvmfDGX0dRghd11G6u2wH2vQLw9snV0rwCvY8+SQEyd/+e8MbFt+FM+CIRuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401BC606A31E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 12:49:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 401BC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67be9601f31so6038631d50.3
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 04:49:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795697370; x=1796302170;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iCeQ/db20QjGcTEZMmDdadaK9BiQoJcNEDJPAm9EXfU=;
        b=oYJGsCQZQQRlR1/1AtsrTivcnqywOn62K0KlOGtC7zYXHD7+98E2tH3r8PiY1g+Jre
         HioyMO/c/uvA8TVF81qkdMDmc4ELrdcuBAumFM0OiA80dP62y6D3FQ4f+iBsZR8A3KHz
         8cMv7nTX7efh5HBXmbJ6pAuyaQOHrU++buKEg8cq6njcDfRGuPF8pn4/6dOiIc4G919m
         NnwnNYAMVoWKa8iYkglPuGZPsDdB6PL6OgGIA4xDqc1hLpBqeuLn50m/QidsitQ6d+/N
         +mDVahQkLBol7CkiBpeM29OghI2Deh8FGtAhadP/JKVXgXwuLQbNEP5ntMcPuXBETtBG
         Ni1g==
X-Forwarded-Encrypted: i=1; AL+hErFxuhiWuGD54D26xMqFIzcTuY1+Qoad/Jdbuy8TjZszLfC/LL0fz28wImYPF2XtIDBLd4cxxN4=@vger.kernel.org
X-Gm-Message-State: APuU4Z929bLF+MbdwxMKd0VJs2E4YrdRweccyHqNHlNJzgrwpRaCvFxP
	WrBqbbWoHhDt2D7QPE+ZGA8ei2BD/efWP4BrjtXDBevZWSz+0QdEKHFJH6wkj7B3Ecc=
X-Gm-Gg: AZFdTZdZF1KcxzM+pQ99kr5RtfrKb53NJzT13PdrV8bCW00R7iFE0tjHq6XrmJh8Po2
	gALbKnkBuYqwcjEpp6w89RrMRf9KHm7SeBK++NN9aAPByRFMSxfHX4lTDgRgf05AGzws4n/tt0o
	LWDBHo/yKeDGl/V2e8fvXz+BsfSt267P1fBiQUM6Xrm5LXM7PTpLuNKEt2D3iG3nzRQ7fG8F8dg
	5tRf0Q+rtswe1NtvbQqcl3s7BFms2uWwQ5Kkejx++Jj3HLezMATtManPSKHYZ3ntznaccRvDYtt
	OKBYY6e+3D6v7kecUXfWNsFOBzFXLenfVMvFlcsxqLScnlggAGbHFOkTPVW8DWnI4dLQxTvI+sB
	QI1GBCeZnyo1+5RDlniSMt4SJeskbFkzeg4/oQK7uv7tUZ7/VwQxpSMViIP4pBm0FoLYd5KoPWy
	DkiPo2fU1+t/Y4swDG325OTtCP67750nXkliH/c9qwAsGTglA8dJafiguOMZkeGsTX13FVSgWHw
	9a5NcRY8DPqlXPLZk8ogCfCMQOcegqSNGXJdjNWhWBpMxtFKemTs/pc580sIMzG70OwCNvTeF/G
	VOvGGFQ9NdvkXoy7064eVkdYbZOtlJ3qYeThxRaQVSXuQGBaC7DZzH27PYbh+sm1iQBn1ujj1Qp
	o17naMyZbfkVw9e5y32VKSGtsNYT7l2ilVC9Rwc+MZMqpMjwWZiC6jE42pw==
X-Received: by 2002:a05:690e:1442:b0:67d:c50e:5683 with SMTP id 956f58d0204a3-67df440dcc3mr7440639d50.33.1795697370299;
        Thu, 26 Nov 2026 04:49:30 -0800 (PST)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df31fa7afsm9787074d50.1.2026.11.26.04.49.29
        for <netdev@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 04:49:29 -0800 (PST)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b4e2fcc300so61019597b3.2
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 04:49:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFooIG7WJ6dFbjbDlHHDb4neTEZ0YZmrPSX/sUjaKECQEdxA9Y9MczRmCOWLQQFl2ygVFbPNk4=@vger.kernel.org
X-Received: by 2002:a05:690c:6c8d:b0:8b3:2d65:2c72 with SMTP id
 00721157ae682-8b52047a894mr79381047b3.42.1795697368796; Thu, 26 Nov 2026
 04:49:28 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121213102.143130-5-tanure@linux.com> <179561837863.3135.7453763060716815613@kernel.org>
In-Reply-To: <179561837863.3135.7453763060716815613@kernel.org>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Thu, 26 Nov 2026 12:49:17 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+3yLJbKUKh9ZqbJTm5QY+5jGedaST8aFJvHQvU6mu3oNg@mail.gmail.com>
X-Gm-Features: Aa3M54rVCY5vVqL26ka6o_i4OGggk-NPYkWlLazpuMdrAcDWKkBH6Cp6PaCVWDk
Message-ID: <CAJX_Q+3yLJbKUKh9ZqbJTm5QY+5jGedaST8aFJvHQvU6mu3oNg@mail.gmail.com>
Subject: Re: [PATCH v8 4/4] arm64: dts: amlogic: t7: khadas-vim4: enable the
 ethernet port
To: netdev-bot+sashiko@kernel.org
Cc: xianwei.zhao@amlogic.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, 
	khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, maxime.chevallier@bootlin.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 2:53=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The commit says it enables the Khadas VIM4 ethernet port.
>
> --
>
> arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port
>
> This patch enables the T7 ethernet MAC and the MDIO multiplexer on the
> Khadas VIM4. It also describes the RTL8211F RGMII PHY at address 1 on the
> external MDIO bus, with its interrupt on GPIOH_6. With phy-mode =3D
> "rgmii-id", the PHY adds both RGMII delays.
>
> > diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.=
dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> > index 0fa83362b4179..7b86ab2579aaa 100644
> > --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> > +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>
> [ ... ]
>
> > @@ -256,6 +257,28 @@ xtal: xtal-clk {
> >       };
> >  };
> >
> > +&ethmac {
> > +     status =3D "okay";
> > +     pinctrl-0 =3D <&eth_pins>, <&eth_rgmii_pins>;
> > +     pinctrl-names =3D "default";
> > +     phy-mode =3D "rgmii-id";
> > +     phy-handle =3D <&external_phy>;
> > +};
> > +
> > +&eth_phy {
> > +     status =3D "okay";
> > +};
>
> [Severity: Medium]
> Can any driver at this revision bind to the ethmac node this enables?

Yes. c4c851a3325e ("net: stmmac: dwmac-meson8b: add support for the
Amlogic T7"), in net-next since 2026-11-20, matches amlogic,t7-dwmac,
and 18029931478b documents it; the cover letter lists both. Tested on
this board on top of them: the PHY attaches at mdio_mux-0.0:01 and
iperf3 runs at 941/944 Mbit/s.

>
> The node in amlogic-t7.dtsi has:
>
> arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi:
>                 ethmac: ethernet@fdc00000 {
>                         compatible =3D "amlogic,t7-dwmac", "snps,dwmac-5.=
10a";
>
> The amlogic,t7-dwmac string appears only in amlogic-t7.dtsi. The Amlogic
> glue driver's match table, meson8b_dwmac_match[] in dwmac-meson8b.c, ends
> at g12a:
>
>         {
>                 .compatible =3D "amlogic,meson-g12a-dwmac",
>                 .data =3D &meson_g12a_dwmac_data,
>         },
>         { }
>
> dwmac_generic_match[] in dwmac-generic.c ends at snps,dwmac-4.10a, plus
> snps,dwmac and the snps,dwxgmac entries. Under drivers/, the only place
> that names snps,dwmac-5.10a is stmmac_gmac4_compats[] in
> stmmac_platform.c. That list detects the core version. It is not an
> of_match_table.
>
> If nothing probes ethmac, its mdio0 child bus is never registered. The
> eth_phy mux enabled just above binds through the amlogic,g12a-mdio-mux
> fallback and has mdio-parent-bus =3D <&mdio0>. So mdio_mux_init() would
> defer on every attempt:
>
> drivers/net/mdio/mdio-mux.c:mdio_mux_init() {
>     ...
>                 parent_bus =3D of_mdio_find_bus(parent_bus_node);
>                 if (!parent_bus) {
>                         ret_val =3D -EPROBE_DEFER;
>                         goto err_parent_bus;
>                 }
>     ...
> }
>
> Wouldn't that leave ext_mdio and external_phy unregistered, so that
> phy-handle never resolves?
>
> Also, nothing would program the PRG_ETH glue window, which is the second
> reg region at 0xfe024000. That window holds the RGMII mode select, the
> clkin0/clkin1 TX clock mux and the MAC-side delays.
>
> Nothing would claim the pipeline clock (CLKID_SYS_AMPIPE_ETH) either. The
> previous patch in the series, "arm64: dts: amlogic: t7: add the ethernet
> controller", says this gate is otherwise turned off as unused. It also
> says the port keeps the bootloader's delays unless the controller
> programs them.
>
> amlogic,meson-dwmac.yaml does not document amlogic,t7-dwmac, so
> dtbs_check would report the now-enabled node as undocumented.
>
> Does this patch depend on a separate glue driver and binding series? If
> so, could the commit message name that prerequisite, or could this patch
> be sent together with it?
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261121213102.143130-1-tanure%40linux.com
