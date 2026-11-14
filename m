Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794688138;
	b=2bKR8RnWwW3EkbKK5c20WR9ScHeHvJ4EP04rJzhEjfwVytjzTv3vIRnDbRgLUBXOzRFZ
	 tUQ4N6suLJwqYAqWmfIxZpyqSR/9bWK8Mp5fWuT3DxtEhHbWU0p1oKcLBnJWaxlhsobG7
	 /24PcVZVhCHKuW7DyNbuy3L22LwgCaO7QRtRvEgIdS73P8BUkffq0gc1z2M5TXdZLvWcQ
	 zen48MPMVBB7VTZv7ER8B24Gg4wKaSGB870sV8Hf8dolsxQoCeJ3bKwWM0w95SY6bFZAD
	 UHo/mD9x/xJO0gXUUXRbLKO77D9OKm1RO52lv9vzMwvtxo/94JL70wGA0acAene+bzg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794688138;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=aDz2nWPFGIej9ad0t62RDC+6xG0n98E9SHtr+O+wOoY=;
	b=cllUfVEhA1M2OmCVM0h/bz2kV8ISIKi5ioNBz+OJo2rxEmkMGLC8XpB87gBwozrqHjwg
	 hFfPadOoxw/a7U6Uu5EYsKj91/U6lYmXSowk19UVvpBgJsWRTJYRJ17jC5IQe5OBlquNy
	 OE4bCi8xDbuyckUdXKSqErzj6LyQIZWuLRYQJC8WhwwJBw6Lx5KFC0ijkLzw4jbgb9N5Q
	 irfPYSFIeorBToK2/1WGKGDXu599SC5dBso0IjOmpmuhdIDQENLFF9O4Y1h5QK0oycw/w
	 bmJ5tCYoUDHYaGKy+hnjc0EWg46B2TV3/VTp30WuQdOqwgvWaTKbewYeu9VH6xVk2Yg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OGvTFcC2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C23606A32D
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 20:28:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76C23606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OGvTFcC2
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so352636166b.2
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 12:28:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794688137; cv=none;
        d=google.com; s=arc-20260327;
        b=l1edPQaOIkC/EBaYbTHGmix6fBclNpgGMlu2kgFmHJFDLoaNSkcQPmlIxgiVE6jUZP
         r5Aw9vqrNhQ4oSp28Rayx7oikczzNrl6PsLC9jTt6IDFEm40hrwYi4UOflN6dcYteuPO
         4aEGN3L4S6pNBp4urFmHfwO/TibEH4Wa9vtmpSG95+Ltu/WkJyjedFtpaljv2wplWCER
         +Z5lA5tJXCBhbrpaeqhWncSuWw91ZfI7t6jQG8+LftTKK1XdIkxzsWYCvR0XbgcHIEog
         udZCaUUzuNk0R702czMMEyhnvogCsCim/SdQ83ylMVGUtd6KBcX3/YPG6pR14V2ds0A6
         zddg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aDz2nWPFGIej9ad0t62RDC+6xG0n98E9SHtr+O+wOoY=;
        fh=KaoRW2pbCt5itf/StE0OhFhLyax+8paViJ1udeIggog=;
        b=FykdGtjeKuQmhPnYo13n+PrqsDrFJrGlInZx/jMG7r6J9QMMwOKCSmekBcTa+7RKTs
         dTo9rIF/CFeVXVMdbPh9nt15lmuOhcQQSv3YQpYLP8yWi88RJxFjyF+TG9NqNQ7VotUP
         nsoXepH6DNlHPdP6cLOve0bveA9h38I2Bmhb4BKF8W2+MuGs5f9Yq4NrvBwufKQMqXUk
         n58AdzF2hmVrwVvpG+wrIdDKEb0VxFZlC8P+SK6umOJxx5NgYM9dZAfUv88isSEeSONw
         KqAqH/2s53WRX7JCcBixVohszCE/Lmt7jdLhdeHlokx3DJeurBSUqz/fcih1hmbT+tns
         uhdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794688137; x=1795292937; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aDz2nWPFGIej9ad0t62RDC+6xG0n98E9SHtr+O+wOoY=;
        b=OGvTFcC2SIzje5Xue5Fb/wzdTxffK6gDD858vEmFDBIi92b8McWHfa47cn5eqFhXb6
         jGpjiP4i65KocuKeLoKTv32YPySZH5b8+Bvm6ggcgxujooudAIKW+ZuLaCMaBo+opoRP
         hOQwhcJoCuV4bE8pJO4tgDc9+TPWGtiiuHO5rVUYUXkKzyAvfnA5ZNui3EzpKf2SCV2o
         Na6pNgYy5N6gpbhjR84MRyHMO6NrycQM9+v0oiitQJPTnY+GryaKHIe5AfS4UXNKyMft
         TXRYVkzxNcCNS2ov40nwmefsYSmuzQl+VdkaNRxz0I/i2ea1MwO55D4Ketwo0ELFEERF
         57vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794688137; x=1795292937;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aDz2nWPFGIej9ad0t62RDC+6xG0n98E9SHtr+O+wOoY=;
        b=BQR1gIybDBHJUmghFCLfh5RXeNdT7pYRRXklhGeEObSh6L7Oqq6KUo58BW/31kQ7tC
         Xfzz8CbauIKUQhT+ijae1Xuluaepl/58IGJpnQZYer4/fUeRc2C2w9q0KSKrkhO68hBc
         58gInm1iXm337brXNbmgvPs8rOTPCQRbihi8blL64eWlAdioa2OIxOmN/I9s2QfjLPMe
         j/uqR5iCBTyQ4ORMbVsS9yixyp5xyDbkDHSt5HhpHQfaiePsDFzrfrfs4jLiumY75Pow
         52hc1uXOSOrIfhebtWnD8g3pQo9QImC4Q7KQMAOArY/tqqQxclFKicEq0V95JdQEE9HL
         +4lw==
X-Forwarded-Encrypted: i=1; AL+hErHaN2vDc8hrtt43kzFbci22Cj3yolFpCBsQ/jYxSIsEH8rH1Y8AIDgiK+MZmi5M15TIwX+S0R4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mBZQzTJqqli004dnk1K3ZLCGlrchAGdnT/6kvEWwCXZwi+Wc6
	RMR/XveCKe0NFVvggq6d1VCA8jlG/2p77sI10hrfSIPJ6sP9hiueyt+8omZt02mtA6uZQGHDNV8
	qdphm5lFM/K3lJpXrkuzlxqX0IzkuOdU=
X-Gm-Gg: AYBFou1feeR+xcziU+4UXhcEfb7nNNSpk1nLD/qm81GMHUUAKcwhewfTEa0cZYLL7zR
	WPeYge9FqQ3ort6Itvh1qgEEp9ajSnrOATWqrAlUqq+WtlbCpDn7q1Y3qvoNLK1z+H3xitJUo2M
	4hYP/S5NmNrT6hdqCowPWBHspwpTpbm4VYeobRsMMj1wxZ53xDAYNoJUspEunB4LVCiFxpa/P61
	7Yqm0eXNMrhPJNhlnyEfL65Kl92nq2G07Z22Y0rv02TXHhYA/w51ts0rckHHxfEuNhhqt51Mw9C
	v/FOv8PNiutiW1kweIybX+Y30txd6hqtNpy+NOyJPHxM0+kSlzOYemrS9+iFJk/LBgw5TGe1W2L
	XNPEslSG3GPJjYzelh4ZNn6zILY+ZEj8TKMAMAA==
X-Received: by 2002:a17:907:6d20:b0:c46:74f6:e149 with SMTP id
 a640c23a62f3a-c5096328142mr523687266b.16.1794688136716; Sat, 14 Nov 2026
 12:28:56 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-rtl8365mb-dcb-ingress-v2-0-f8e6fbdf8c99@pengutronix.de> <20261112-rtl8365mb-dcb-ingress-v2-10-f8e6fbdf8c99@pengutronix.de>
In-Reply-To: <20261112-rtl8365mb-dcb-ingress-v2-10-f8e6fbdf8c99@pengutronix.de>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Sat, 14 Nov 2026 17:28:43 -0300
X-Gm-Features: AclHuK88lPPnY4Qy1qmd3CQIsKdJzUoixh_uoF8kXKKLGiP0BSLaPyoFNYjqfgA
Message-ID: <CAJq09z4BGFMHTYdfTVtpZftJSnAX6w3Ox2GHPpKOahh9kbVnuQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2 10/10] net: dsa: realtek: rtl8365mb: report
 the DCB DSCP-to-priority map
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"

> Report the DSCP-to-priority map through dcbnl, so that "dcb app show"
> lists, on every port, the priority a DSCP value gets once the port
> trusts DSCP.
>
> The switch has one DSCP-to-priority table for all its ports, with
> exactly one priority per DSCP value. dcbnl, in contrast, configures DSCP
> priorities per port and allows several priorities for one DSCP value.
> DSA could mirror a change to every port (dscp_prio_mapping_is_global),
> but a request on one port would still change the classification of all
> ports. Keep the map read-only. The QoS baseline seeds it with the
> default mapping from ietf_dscp_to_ieee8021q_tt(). Requests to change a
> DSCP entry fail with -EOPNOTSUPP.
>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Reviewed-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
