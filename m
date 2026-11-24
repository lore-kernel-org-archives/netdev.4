Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.169.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795555884;
	b=n8xmwPO26xnp/DZSkMPeYj5jGHA6MfYDL17kAAk5i1QgHhLmJlziEongC0lHhUy2vfWI
	 uqIM3q9NbQTZ593b9vRU5fWM1X9WvaWq3HYUmSFsnxI22fkN66IWwU6ULUrCZkuk8TO0a
	 TYOvPEBmqhO49UpKsBi7IDV0G8JeQt4Bf6cv2hXo8v83I+ZrAAHpEulm1UpPLoGkDHHQd
	 05h3oA/o9ak5p9eodJCe2aZaIyVdEhG0dAxCIedwFgwvfBQM0Y5cxnvF69jrlKuWRfBN6
	 IYfENeBqrx3S08m6Cc8xlmjvXjPduQCBENPaHwl5eb8mo2UHuffnU8ZMm2TuVeMaZ5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795555884;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=2ZZ0i6HlDHdHe4CdRACxk5+gA57bus4KuijYTBcB6nE=;
	b=YE3nONpTNMbekaZZfcEcbVWx4vcSD8lcQR7mOaHoqQfqnSEZeRnl2mImxTvQP8i/Ui7U
	 XR1b7LmQnQanBSj2RKvRWz0Vj8nQgbvViPYQRVywWPUGeRBKtuyc5wupFD0sVvj4PVLTi
	 ZpJgQBYT2GGUYU1ZrW5DxOYorCi86PjctmmUu0bhbT3aRz2Hv6FETScDLRR90HEfKlh/u
	 6KdmjAqMfDtNbUqB+gaM/iMDlbY2Gwo+i/d/Y7dz3cZrg0qFVbn4gznqjXug7kkBxwHbh
	 uQwh72YH+3KNXJq0+s8sRzykHf2SMuJd58rhvQxE1QoBSkK0AwPJjXjoA8TYtX5QtjA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=iav.lv;
	spf=pass smtp.mailfrom=iav.lv;
	dkim=pass header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=Xg0gjWbS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.169.15
Received: from sender-op-o15.zoho.eu (sender-op-o15.zoho.eu [136.143.169.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C0D606A683;
	Tue, 24 Nov 2026 21:31:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9C0D606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iav.lv
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iav.lv
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=Xg0gjWbS
ARC-Seal: i=1; a=rsa-sha256; t=1795555829; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=gFavRAac8duItiIcuykCC4U61BDDEiC8fP2KB+VUJuuLNRtEiTFH5vHKze6UuNxk3eOL63Wwbetql5b1pbTeENhh9U4bNVFQyggwysLatnKMx6S/2OEVimaIEE1ZHCEHkTvQUnVO28gfLVl6sdEYg5J/NXn5wjqjpd3QqbsmfjI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1795555829; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2ZZ0i6HlDHdHe4CdRACxk5+gA57bus4KuijYTBcB6nE=; 
	b=iDo5Tt4apH7dCuqFXUmkAkaL2RlWPK4dG6HvucfGlm3ZZB0yL607G7RFH8Qy3trdPw/dNa5IBzNPbcYthVo+cyLef86+BBPiz9LEHx6CSPGc83xV1qKZZExECgFSSykQdQ9gSDNJztSnyJvuccg5jbomyzle2QhdzX1ugMH6krM=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=Xg0gjWbSOrN3ih4nu1jb8196N6p51fu/BEXKP8u/Rt9ERiF00e1NNOkZCidAxfVQj1WAd+XEnTNTIhf7J0q2Hb1rwIfo/7ZtxrJo2l8QG6CU64eep+f5yKCQTTofb+0GcULk/4UpgZehAdaGO9pFh0FJZZR41XaDUwZewmqxGFw=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=2ZZ0i6HlDHdHe4CdRACxk5+gA57bus4KuijYTBcB6nE=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1795555827111698.0393064779806;
	Tue, 24 Nov 2026 22:30:27 +0100 (CET)
Date: Tue, 24 Nov 2026 23:30:25 +0200
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
Message-ID: <20261124-re-martin-g12a-mux-t7@iav.lv>
In-Reply-To: <CAFBinCALe-8oB5Mwpyx-B_7dKJ-WZcMCjycHv=xH+JasRBOaPw@mail.gmail.com>
References: <20261117-g12a-mux-data-path-v2-1-fc56db5973af@iav.lv>
 <CAFBinCALe-8oB5Mwpyx-B_7dKJ-WZcMCjycHv=xH+JasRBOaPw@mail.gmail.com>
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

On Tue, Nov 24, 2026 at 9:50 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
> I have just reviewed Lucas patch [0] which adds Ethernet support for the T7 SoC.
> He kept the internal MDIO mux path disabled by default, so boards
> using it will have to enable it.
> Have you tested that approach as well? If not: it would be great if
> you could investigate the pros/cons of your approach vs. Lucas'
> approach.

Not on hardware. By the code it works: mdio-mux registers only the
available child buses, and the g12a driver writes CNTL2 only from
switch_fn. With int_mdio disabled the internal bus never exists, so
CNTL2 only ever gets the external setting.

But that avoids the bug rather than fixes it. The MDIO source and the
data path are separate CNTL2 bits; the driver switched them together.
Disabling int_mdio only keeps that path from running, and only on
boards whose DT does it. The G12A/G12B/SM1/S4/C3 dtsi enable int_mdio,
and ten boards use the internal PHY relying on that. Changing the
default touches all of them, and existing DTBs keep the bug.

The driver change removes the coupling: the data path follows the PHY
the MAC attaches, with any DTB. For a new SoC like T7, int_mdio
disabled in the dtsi is ordinary DT practice, and the two combine. If
one has to pick, the driver change: it fixes the cause.

Igor
