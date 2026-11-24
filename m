Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795557150;
	b=xs/GIfbGnLA81MWyIZjwoFs3oNo2xqa7e9gI1V4jYTJbZ4haLdEp6IGX2IQptTD1m3hW
	 5nHipMHSskr7/mCcQ6pn/fFDBQoIBE6YQhNVG8gG+heUWCqqcsF+VbMXNpFyZ6Ucl2d+L
	 VLOd4Yuy3nt1qxfp5dBOEvk9RGGwI9MZconcZsOlhBMufUC6ILV7gbPdMBjzhqjdfswCQ
	 gca4tu+fTEkehqnF5APWqC60C4CxOhsAsoxpOMYRxgfBQO6LLIGgr5oVgb4ExGV5XA15K
	 mFs3AZTFB/nT4xm6umlaOxAAQ69HNv8rCLv+vAZj844yjLXuloEcvxLblHe3WTNEsww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Lf1Y3VuyPwvovOGVJHv+EhVFPSKZjC4cG/I119XVXRE=;
	b=jv3p0h7frJtyOVQJVubhKrzbHz2iNGDPTekhLzzl6V7rXZqK/f+oqkta87kcTssbC+u4
	 3lvlfLDRCIVn1G9XfmVWglX1bs1X1MTbiguCRNerO4kVKwGkdPHujPF7T9Z4CGBp3689o
	 aQzDWCS+Y+CTRJJt5UNaabfyiN6pZJGlFMBwSdzgVnImopHznAJpWt7DqbD6GEDZuWIHp
	 ePQPbHSOffBXdcEkvqfdWmFH36XNBX6ddM+QGGUq9PNaYeCwchwwhQj+YSyT4ur3LkdmY
	 4PcMQvUKW0/8xhWsI7Wshb1fEChKShRj0pqaoK9yfhDX9VdUihA/e7rGS38Gatr8HHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b="J4wgzj/q";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7301606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 21:52:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7301606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=J4wgzj/q
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b503e2a87bso54047257b3.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 13:52:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795557149; cv=none;
        d=google.com; s=arc-20260327;
        b=K8x2HgIX5xsQwKCG7JZbNYXQMzotwXfz/ZN84LDHp6vGGmAgiPEKv4cap2ZLvypTlm
         A6Zdxb5Wrw/g3dA34BVSkiqI2Af/756T8dJePPZKIsQcQJ20SQT9WkDpkGnkrmLa7vNU
         hv3cP7jBfrAhhIfoeeJyTuCr0le+v7FvyrLFsjQSjuC/sCDZkaVhOQiim0UllKYDU1xw
         zy3qDaXnH8IhByz6Lfz5IaGHxn4pSxOybXzz7oUO3dQb5/v6cFzxTYau7rySPX/tMOmF
         hjyBBlXoeJsHRKiPJDWiVb0GTNkIePwheMEGgmtbZ/kMvuLJ6f7Njwiq8Hb73ElKmO7I
         BfOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lf1Y3VuyPwvovOGVJHv+EhVFPSKZjC4cG/I119XVXRE=;
        fh=hzL3Mj7+d2GebBUSOSPhAPRZYwopgnekCNIaZlJ0Nsg=;
        b=WuZcnZFRz4kt0Du5qWMvrOXifYQwHTj0jd0Gc7uVZkuLOcclWSVo0YpIW82DqhCBDp
         98LVI7kKOMWXU6UkF9A0qVHS5CbZtW8p5s75H0+L8ayxGcygXIIvrx0x5livjuulqZpc
         FnabLySA5fvrpo4FhCpgoymDy5OYlUoNaHg6fQbolVoaK+4fTBkU+C3X2PUef6kbdqkw
         sOL9Y0L4xTNPZRRzTK+7rFeHyI/2BdyydWJuvtf9yVQ+E1RwSb/QZTAl0CYOaOLGH7L6
         tljByj6YCmyKpPNgDekJ+YrIrDBu/GRQlm73A8xi1mtxCdnQiIjUhqVZRwkBU1YYoBdH
         RxzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795557149; x=1796161949; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lf1Y3VuyPwvovOGVJHv+EhVFPSKZjC4cG/I119XVXRE=;
        b=J4wgzj/qUW8Te4tO+gJNuLHr8BgOSxIUEX95ONeC8vg1THoFDBuISwGqmHI9WndL7O
         ndUID7KHmeVBejDHTI4rs9Th0sTjRGOq7JZKOKGXOqcWwrG0VA9Jx1Y3ul4n1YXNROVp
         aA8gW/c19c3mgim/pLAvr+u5KeJ8AnsOO/OT7W6WFl3KRFiYKgHN8wVurPb5bpkXcRyh
         5jcXcpXhTk5ZIeAsP/tLcHmbvf9t0bypqi7VYnjWSQf8/LrHWP/8KvipCr31O1QlC4BI
         LSEEhZo6+y2x6dW8Dp/30D/7GTlnVoajqHXdbCpWPgx+OJXULngjCSg0k6ptM1KVIpxI
         6EDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557149; x=1796161949;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lf1Y3VuyPwvovOGVJHv+EhVFPSKZjC4cG/I119XVXRE=;
        b=u302YEYnlMxJOanVj4Wae4mGbkuKhLDGWRTIXc09wpDWbDKwpbANLtBIwiq2QH3Zq1
         nfYMe7wLP+mytxqSukxCmLiOvNhVuirR/OPKYx6bfrxQSnlyT5RxreLJjCOHpNm7gQh0
         I5h1FwC9/4WeKGJX0a+NTCLx1FnMOAGaPbVfEFRhHpUTVHs7TucHF8sai2N7YoRikYrF
         uapv0pvf1Md8JB6fEfeYAl6BLN/0QFWsrZfEjWZHRVg5K+6vkCSECTP8j2AFTWg4PWIX
         rZGIHniUMZdrBqn42lzOMjp+RcTKTeY2rusrc0VTI4gDpc5CiP4TmPu7z0LyhUrNOHeu
         hesQ==
X-Forwarded-Encrypted: i=1; AL+hErHRo5QdE11qqLWh3rHzkbojVDkthLXkx6M3Iqd6ZArI0J9jJb51hQsP4b0l9NsVOq5sFjpNHC0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Dxe7WiA34aW94AJ2ff+zNAUkvaL9O8P9vQ5Pvqvw9ohanMLJN
	fxdeMQwbzUyYqTsx2BhEnUr/3zESS2b6ioNVcizT3zAnVJ5fMn8wvc7aDL4gvnxDrwjRN9EWKx1
	jat6Ez/0YltRJJXz1IHartyWCQvx4xv0=
X-Gm-Gg: AZFdTZedAkJvQPPrL6U8rP6BgsFE7GErHv9QxTRJfuOy0U3x5To/5m9zLGxLtDVv0Ky
	UzeVWkmIWnLOZrLXmn7E2P8mCL/3m3do4Y3oaI7IRz+r9lnpy1lMLEZjhD62ZboEWlctu8q3B/e
	xIaVYpFko6yvl+T1wop6OMMD2RokcBmKQ1znA6Apm4EQjcyAugAbbSh/6UaVNTYnBpxOAH+BR5y
	Vr3FAJR/NvbNuivCK5JnpeIoLoDm8fF5zFP9JhqDqbxAxd8IZ0TP8XfktfwPCz+BD2PmVw3Cv8L
	vDd4KMPEDA1e28MXHioOEGhq4+u79RoxLUS85fuH2GPg18aVgx8P8L2Q4+418B4xSlRm2QsjMXU
	0qFVU0rHtQmKgrQsOpmujv84m35y1tf6ayzOKTPlRfSa1VfFBCD7CdS8zsjMmExjAvNVVlQ==
X-Received: by 2002:a05:690c:6d87:b0:88f:ccf7:25d9 with SMTP id
 00721157ae682-8b520504b49mr86018497b3.60.1795557148692; Tue, 24 Nov 2026
 13:52:28 -0800 (PST)
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
 <CAFBinCALe-8oB5Mwpyx-B_7dKJ-WZcMCjycHv=xH+JasRBOaPw@mail.gmail.com> <20261124-re-martin-g12a-mux-t7@iav.lv>
In-Reply-To: <20261124-re-martin-g12a-mux-t7@iav.lv>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Nov 2026 22:52:18 +0100
X-Gm-Features: Aa3M54pdaFD27QxQGunyvXHUItWwaVO9EDUyn4_5FJjuusCb-0isvsezb1c1rbA
Message-ID: <CAFBinCB3auaxcJ4wV+Q-KS4hBKfacrPpu_X9BAVBirAuMNbDvw@mail.gmail.com>
Subject: Re: [PATCH net v2] net: mdio: mux-meson-g12a: keep the MAC data path
 when switching MDIO
To: Igor Velkov <iav@iav.lv>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Lucas Tanure <tanure@linux.com>, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Igor,

On Tue, Nov 24, 2026 at 10:31=E2=80=AFPM Igor Velkov <iav@iav.lv> wrote:
>
> Hi Martin,
>
> On Tue, Nov 24, 2026 at 9:50 PM Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
> > I have just reviewed Lucas patch [0] which adds Ethernet support for th=
e T7 SoC.
> > He kept the internal MDIO mux path disabled by default, so boards
> > using it will have to enable it.
> > Have you tested that approach as well? If not: it would be great if
> > you could investigate the pros/cons of your approach vs. Lucas'
> > approach.
>
> Not on hardware. By the code it works: mdio-mux registers only the
> available child buses, and the g12a driver writes CNTL2 only from
> switch_fn. With int_mdio disabled the internal bus never exists, so
> CNTL2 only ever gets the external setting.
>
> But that avoids the bug rather than fixes it. The MDIO source and the
> data path are separate CNTL2 bits; the driver switched them together.
> Disabling int_mdio only keeps that path from running, and only on
> boards whose DT does it. The G12A/G12B/SM1/S4/C3 dtsi enable int_mdio,
> and ten boards use the internal PHY relying on that. Changing the
> default touches all of them, and existing DTBs keep the bug.
>
> The driver change removes the coupling: the data path follows the PHY
> the MAC attaches, with any DTB. For a new SoC like T7, int_mdio
> disabled in the dtsi is ordinary DT practice, and the two combine. If
> one has to pick, the driver change: it fixes the cause.
All of this sounds reasonable.
What caught my eye is that the code now reads strange: we have a mux
that we're following for half of the register values while another
part is fixed at probe time.

I don't know stmmac, phylib nor mdio-mux-meson-g12a enough to point
out an alternative solution.
So until someone comes up with a better plan you're patch and
description is the best we have.
