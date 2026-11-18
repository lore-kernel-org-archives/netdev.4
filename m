Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794972009;
	b=J6cDrV0UwXiN3WSqUWRVtBiSyE/YfDhXRK+vHQVj+E6efw1u1fjgHlPsl4+ktZl5/9jQ
	 s0e2nOtUei3C6gxTa2VYKN5UVAl7oV7Z3B8cmJFrFon0C43LIR8A8WKlsmSrrKr7d16Gi
	 duwBbxcoDG1Xae11SvBGcteghKSeUtCodb3kZjJZcRhhSy+/xbYTJlnNKgkA7LsYTLUQj
	 sNDptg2viRGv7tGo5/JVNvjsU6Jk1R4bXH9herz4wa8Ps8BTB2xKY5AS669f/xfnBQcUF
	 XZQT966whDhl241lw/sXMNQsLxm2GZB3aFQMLqqilYnnZYDuZvrkf87X84+tVCNaWMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794972009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=pMB2AXoRBZXKC3VHrDoIQ+zmQluYyx7XzY5w5JiTaps=;
	b=JPfP+kisYnpsrs6m8opAE6x7BmYItQh70h606nan0dL5+jFhp+xnetXjCHiQoN1aEnzl
	 ItpWjqAXZCjVzxaxxNRQ/Ebk6pfBAbFz5DFPddY/s4UmHUDXKlNAMWa4tYZpTGoDuvqwv
	 UQc6P2mV8WwezORV6xZCMTOJYuPeCca6GJ9Kh8NkzgNvGpX1oSdZzn5w/Zh2AJirKoxMw
	 pUSEYQaU7w430lZHnnnvz5opnRiw7mQcHPZTA5RBVTMjcRAmztFsIAQPxj7KaLjVYVa89
	 KfdFWbmPeElfoj9YVsxoRs07djmROrLwTWdkz/p1cRucQCu3wcemeeKOY2KwIi+Gb7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="X3Y/HxCV";
	arc=fail smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182A4606A32A
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 03:20:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 182A4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X3Y/HxCV
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3adfb0c9e3cso795301fa.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 19:20:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794972007; cv=none;
        d=google.com; s=arc-20260327;
        b=XrrAzls0cZpHyorBowKpB3ZB1sGWWpeeANAgS7VWp7jnGU/0+O7OHrkrG2WcGgXiPz
         fxNhnsQEd1pN9gpNDMjgB2yZizgqnbTjUiOpZ+Xb/VsWzS9nR6uXWl8FfYg0hXo3tn1C
         s436lXupiWwJuK9XK7IVOwXXEX4nxIS89G9qxzYqGoKJNh1Nif9O8pVDd4NuHZy+0z/Q
         yg3lwrmpn5GINV+/06cXSRQhPDEpn6DowFkPUr/pLxv5onMwAjH3N9sYyWcsZS/HfrHk
         QUrLQXqN/AftCmrFwcqUDgcZ9pPfI0CxPyLEcH3KVu43mSHBtT0ycxg+2ZOBgCRZHqmF
         Lc7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pMB2AXoRBZXKC3VHrDoIQ+zmQluYyx7XzY5w5JiTaps=;
        fh=7B5Kh7bLN3+DFmHLaK6D0uc01aA6hR3c8pETZ8IAd3Q=;
        b=rUjnBjaD+zv1fCtNg2IYNhI2P5j3tl9MYZhYvVz8G6xCG1oOgAkgVX16urO8uk2tNN
         GRHOUb9HUvD2afM1MfNbjvVyOHID7UFpEsJQbLs0GumsZVebGMo8NwvfUBIZz8zItiWV
         qjG5WdS1LxKtxGp1xwfilfhBupENVIiafXqgitEMJJy2hhIVx9FeAjdTh2sa5fYdHKvt
         1QZ5HtEjdbHammgD+r7odef1nG7gpF1XiMMpBBQs/UCj+hlaZ7QZv0g6qrFoSQp1o3X8
         4Iy0K6RjujQOVMGZKXbw0WRHFAjkYd+pHANRl5Ubvw6ckpYVozs5S0UitdZE13b+NDjj
         FbcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794972007; x=1795576807; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pMB2AXoRBZXKC3VHrDoIQ+zmQluYyx7XzY5w5JiTaps=;
        b=X3Y/HxCVuTDUx9R85me6PZFrQG3f6LP1OBab+7S650tm5I/Bx7iT6OnvrBLlqvrn0h
         FeQ5JF3Emc15x8HPS1OcLdNQfydjMdws6W2iPc6SwyLwlYfDP/htrwo6p3uvHPxkw8NX
         S0BshhB3KuCyrMgTzdDQNvX86Nx9bfpjvgLFdqz75Zn/Lk++erJBAaiNzW6clxFLYq4m
         Hp68Hp9XXiGpiuh4MdJ31GRsHi2QAvpG9q94q+Iqqo8U1Q2GyEsav8nf0fC1hrPgme60
         WgEn+kMsAIdjqgG75vsdrQxo2lsXwkQubAm9cVReEtG1iqZmz7Iq5pDAlrQlDK38KYnq
         0F3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794972007; x=1795576807;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pMB2AXoRBZXKC3VHrDoIQ+zmQluYyx7XzY5w5JiTaps=;
        b=g58R+dDsILTL3KujTytLD7YSlIrTTUs7NTwycXHEVuY5qzwhJ6ycdvf0TiMzdulrYL
         MInsG2LYiePG6yHEtV/k/civZXaRTOnGR8yrBdmv/AoPfH8LDWjzHUWjUO166TfJqSJo
         nQJ0MxunuSUVKMgLH9XkY91kAwcMb37L0SzAwOhfI29hiNJJTziXGtL4450o+kzmpbn+
         iHbPXBWxjZXkJLSFzrbdqtvhRGtizdkqhPckdzAPIz7EwK753whLvODPJyJtsyS02KeP
         K9dt7a3upHpOCyeMv9zCiyN5IiUPvJgeOWBD4EHpU1z+bFjIHwSou4SqiwGORQ0HkSxy
         Xu8g==
X-Forwarded-Encrypted: i=1; AL+hErHcXJYkbKQrjj+tdQP8qwcPjIkEU/0v44G1ZAvNcQkEECJ0+rP26MfIqhoUyqAUtxll/cL9el8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8c/9EUk/rdOUBaQtlmgiWhMtifRDWEolViTWcZNZewkPyd/Bfo
	g7z9mrQwwkeT2dpvGoHLXoQsNYH4Ca7ytDRLoTXUcMlk6LECRqGBOVymDwZoJHdjz8loP46xfAD
	9bO8oi1XL48JIvO4Mrq6Yc8d8o6PvPH8=
X-Gm-Gg: AYBFou2iytb24WEINErmd9AlaN1toYNHrmvKDgFrg2R5pFN+xdk67yVFhdYan9WIBJg
	xV+4dSielDk3WD8dbQdeJdWELPj6Rh9Gmhnok/LbzsQsSOQzTOl2TNZEK66gJq2GGA2npbqqRQE
	Xw7ESs5uz24o50ZfFaQirDo+KQYMdMPJV0/d1LIWTNSLATbHN4FmJQSr+C07Jtm1LP0Nh2uxOaw
	4FAQUumqabuU5fJR15lcjGCR/FVnz21XeGx0T2m2da5irE/yJO+4kcVKVXp+XvOCPx5VW599qhf
	/1vrEPzu1mJFbyUKyiZw6MKpJeK4BlFxUDClo5mJwf4CSNtm1vbFWS5Fw12KNWL/2KY3E+mb7Dc
	5t8pNp35BOxztsdg3tQsc0+MaQbjArxs2c8osKqL3e01y+lz56k9UjTJMpl/x5ycrBVoNy75BeT
	S/geXWoZ6mNiA8YUFA
X-Received: by 2002:a05:6512:1326:b0:5c1:4e17:1ed6 with SMTP id
 2adb3069b0e04-5c1aa2d9e10mr388793e87.6.1794972006813; Tue, 17 Nov 2026
 19:20:06 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113-b4-sun8i-emac-ephy-defer-v1-1-12a8591702fe@gmail.com>
 <179490321548.3136.12535368591168637116@kernel.org> <7b9a4fe1-a885-4ace-bad0-b819ac8b11b4@bootlin.com>
In-Reply-To: <7b9a4fe1-a885-4ace-bad0-b819ac8b11b4@bootlin.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Tue, 17 Nov 2026 19:19:55 -0800
X-Gm-Features: Aa3M54qlIUAd0hNudODtwjUM3vp3szpxLVn6rqxVCrMmIBzKBehn34SS0rG8Tt0
Message-ID: <CAEy9hNW=h41aoAaBQJzL80X4BgMM=xQe6Y4_sR6jw3RWBue0sA@mail.gmail.com>
Subject: Re: [PATCH net-next] net: stmmac: dwmac-sun8i: Defer probe when the
 EPHY clock is not ready
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: netdev-bot+sashiko@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, wens@kernel.org, 
	jernej.skrabec@gmail.com, samuel@sholland.org, clabbe.montjoie@gmail.com, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Maxime,

You and the bot are right: get_ephy_nodes() runs after stmmac_pltfr_probe()
has registered the netdev, so the deferral comes too late.

Yes, the internal and the external PHY are both behind the mux. stmmac
attaches the PHY at open, so today the mux is registered only after the
netdev is visible.

It was build-tested only, as the notes said; I have no H3, H5 or V3s board
with the internal PHY.

I will drop this patch and move the mux registration into the MDIO setup,
together with the probe and remove ordering that Chen-Yu raised on the mux
use-after-free patch.
