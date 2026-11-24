Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.169.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795559822;
	b=T2yq7ESVKb6+VeP0oICfJeapm0NVMvpT1xI9aJyJHk6nNd8f0f63+YN7R/Y0c0Z9bDMG
	 TeUU1C2GEIkKlgeq7BEtQBAJVul6hojQepZM6egjDoM0AldyK9uPVmavGClqtT6pLetmM
	 DdPN2TCgINW4XWvJL5Z+6x4yS/B3U8QTqhTBTPp8c3N6L9wz5SNiEZgWXu/Rz8kXQk08e
	 dfCsYcWto9uydWHCCDfXimSYPbl8vpIIl3glzmitvy91Hy/gAa1jVH2TUasrAhVydsXTu
	 mf2xk5RZR3tv3PuYfUB0pNnrBVFUmXQQI/9Uo0qMh/ZTNyxX7Jn/Oks1/uBLCXbP9Tg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795559822;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=+7yriBQmp4Pyg6LBithbao3yq/ei5DDnd+Y7B6DQccw=;
	b=VyPJGwDZrmWJkAX4Z4DZwf7J0oRc6CN3WSmOdW2BBsGoAlvRs/TKPn7PXg5OwkXUUA+P
	 WXWL2XNH2E+iwzS6KqUKBdmVLUc7+FWtbJdvZ6dclgg/6WAN6nilnAHSdudPQtYqXITvN
	 3NfeXQXpb0fR3V7sYeyKeWKcm1UEXNlQ2Bb85B9tf1SjtxEBZMellTPl/cWIXqMkMOm02
	 CXK5wZ2injArrqhd484pdvYc/F3XNqbbsFsrJtKYT0mnPqaNmgrYbKCnIeIpGgVTlVijl
	 6APEH1HWA/zP7ti4LoQKJ2pzqlBB1+lbW9bZt/k2zGLc/544mJeccMHp5c/7V0EAjTw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=iav.lv;
	spf=pass smtp.mailfrom=iav.lv;
	dkim=pass header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=bLuAcqiy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.169.15
Received: from sender-op-o15.zoho.eu (sender-op-o15.zoho.eu [136.143.169.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC62606A31E;
	Tue, 24 Nov 2026 22:37:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAC62606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iav.lv
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iav.lv
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=bLuAcqiy
ARC-Seal: i=1; a=rsa-sha256; t=1795559795; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=ewXRmMb/grqcXCqyajSzPlfeA/UDX7AMuaxljNmoIbgYjL/stoOVXyeBBylOGTuOruUI9LiFvufhL7vImnTZSuGrM69X45WAvVEw7Bocwd5nz/OWlroGXNWNb7BBDN2pxa+LHxAog2ZkivD/fjX/XsFGPMu6rVRj6XSL9Mkkqtw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1795559795; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+7yriBQmp4Pyg6LBithbao3yq/ei5DDnd+Y7B6DQccw=; 
	b=cKHptoyaaTagkSHXihPzIdff/Uc4akXknMvBVW7tuUk0MB9Izpmv2t9Jf/2BeCs7UjpyTtY0WGcfCF+fX95BQUVEg0SUh2tIO7+xeWLZ6F/fCTTREI0OHGjSPcUg7PiTyHkO+NWSxN+0LcTs7CJ7tcpK0AuW/Owamz3/44Qv7jc=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=bLuAcqiyejhD8ctiq+ItIKKiQyQISUabktWt5nEuDtTsq2FG8y0JqEBT9OuvSz0+reHdkXBXZQTdcSRa5c+ofBV+xuFYIOrfugTunuIb4RAkfvvCo1BZbh5rJxWS5mqBqm0XuQp2M54mC9kg9wREqicEJuTWDPeDl+RcUcR9oyg=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=+7yriBQmp4Pyg6LBithbao3yq/ei5DDnd+Y7B6DQccw=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1795559793494282.3032309807419;
	Tue, 24 Nov 2026 23:36:33 +0100 (CET)
Date: Wed, 25 Nov 2026 00:36:32 +0200
From: Igor Velkov <iav@iav.lv>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Lucas Tanure <tanure@linux.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 iav@iav.lv
Subject: Re: [PATCH net v2] net: mdio: mux-meson-g12a: keep the MAC data path when switching MDIO
Message-ID: <20261125-re-martin-g12a-mux-cleaner-plan@iav.lv>
In-Reply-To: <CAFBinCB3auaxcJ4wV+Q-KS4hBKfacrPpu_X9BAVBirAuMNbDvw@mail.gmail.com>
References: <20261117-g12a-mux-data-path-v2-1-fc56db5973af@iav.lv>
 <CAFBinCALe-8oB5Mwpyx-B_7dKJ-WZcMCjycHv=xH+JasRBOaPw@mail.gmail.com>
 <20261124-re-martin-g12a-mux-t7@iav.lv>
 <CAFBinCB3auaxcJ4wV+Q-KS4hBKfacrPpu_X9BAVBirAuMNbDvw@mail.gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Martin,

On Tue, Nov 24, 2026 at 10:52 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
> What caught my eye is that the code now reads strange: we have a mux
> that we're following for half of the register values while another
> part is fixed at probe time.

A cleaner plan, for the record: set the data path once at probe from
the board (USE_INTERNAL, RX_CLK_EPHY, and the ephy PLL when the MAC
uses the internal PHY), and let switch_fn flip only SMI_SRC_MAC. That
also covers the reverse case: today an access to the external bus
writes CNTL2 = 0 and stops the PLL, which would cut a MAC on the
internal PHY. No in-tree board triggers it: their ext_mdio is empty.

I did not do it that way: my boards (ODROID-HC4, N2) all use an
external PHY, so I cannot test the internal PHY side, and these boards
needed the fix. If someone has a board with the internal PHY, that
version can be tried.

Igor
