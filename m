Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795080001;
	b=YRUWfXbMncLf6dq06rEUdYa2qzUjKdj/0/iKuTKerUCz6tNUuu5DH/tWUKpIUwKV+lfS
	 /OtOpZMQJRuZx5oIi7tgWsvebz0bRrAM627vERIttDf3gXDO2FfapYx0NgWnudu0ujj2J
	 2DEM6Yx1ysyxV5erBMDDUgqhF6hv2+O34zhj7VUYjtz+SWS/m9KoAOarU9anGmu0pOlf5
	 HfrRJSO0vT0Wg7nxzvmMcJT3BVJpAkHDH7h5+FB8U5tg4B9/XT2ISGzYhFXi75QjKwDme
	 Soo14vKCSseJBmRPdXZjzK5+fR17zkJdNwLVetE4piS6nFAsEqdNwa/L9ekM9NqI2ew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795080001;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Ti7zYfewVTPLw6o7ketmyvxMhRKCPMrEBC1dAP5uxT4=;
	b=LapuB3yoL0DjJVxYl2HIha5siy94J8GvebCj0E6FaSSonoRtAcCEDe7ZXFTuGrHC4NpU
	 4GpecljywTRfGWw9Pt+91bgCHXkliy5Bosxiieb7xH6T/hjt4oAwEw95+4mspPb2LHVxz
	 FBUlerWMyMEV6jfaH0SVfp9Y3F/OJQWF6dVyu2IJrKLsoc4cQs2wRRlmaa52OV0OPxCOf
	 +QsvuyZB4zhvKbmzAe4uwE47AhAaqCc126lf30F3ijGXNkC3RzRsok9XHpMg0Frn+1pSg
	 CN87/SNKXXUkIvryVwFtL5SJ77ByblPZwiAAIK2zsYnSN/re+nBP0dl2QUeAvQlDyCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=EkOk1PBC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6A2606A334
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 09:20:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F6A2606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=EkOk1PBC
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c50d3ac6b51so143284966b.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 01:20:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795080000; cv=none;
        d=google.com; s=arc-20260327;
        b=EZKcyH3tgJbgonGNpEQENxU7A0Sf9LFk4YIvZ3H5lXExgkzO4y2+S1vSQ/RFpwuxG2
         1vJ4qieXjZ3Atwfio0ROaBJ3vIM7cTjmfx6Cm3teLCY65HH4LxAMZeFFUu0dMG3U+0a5
         MlySlGcTjnkZCGBVXxuUslzfNNYDlLAPe9+2sFJFUc8HVYg/C4l8lpYaX0Mc9W6+avrV
         pKTZxqX15hnUlY3eZdQMN9GGJVhUOMf0Q2wg+XAT0duBBvFp0AhF1VWn4miMO6In4kXD
         MOCL7p6jxTncKVmhcDuvS9O6tpg37zAnN4Cydw2dXkeFBtXl0g9F3iOBriDznWuvRxZ3
         51cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ti7zYfewVTPLw6o7ketmyvxMhRKCPMrEBC1dAP5uxT4=;
        fh=GtahiMwpG1iRUp2pQoPzbqdrGxhlmiMvw5wQ5FCwqtE=;
        b=gx2X8TMPX3JdiTX93yrdmdmhcdyf+fT+zF55+F9TQ1j76UJiaQVXh11q5Hff7wZKDg
         1TtPPGzeeMI9NBshNTLPslHgkb8YZ8oMHBEl6C1Rmd7uapVlvxksuRMdvlcnvuTMQtB3
         /1wO3PX2opEovpglTYtZ4xV2ujK+o5bOVlhZtfAKKmnV7zwEhpql+ERTYPEGtxgr1hRH
         oHC2UBRLuQMmT63yNl9b7UM/2ryXHUFzVE8v/bDQRaOJr0obBCiShmdnbHghzJ3v+qEt
         hs4IgYsZeiv1KuIUp36G5ji3bDqKtxvSouP1hDyca81fg8981uBKCdYTvv71PmWMuSVc
         E6uA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795080000; x=1795684800; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ti7zYfewVTPLw6o7ketmyvxMhRKCPMrEBC1dAP5uxT4=;
        b=EkOk1PBCMgiSWI/XNDC6j87bo/JDyXhwWSKT7KNf3tIjZn7tp6QFghruYqBhwrnaHh
         l4wZdzAJmlOIPC8iWaJ7ngwdy1HbOL4Kugu9fvqGhpQht29d9utB/pDKKBVFfYIxjL9F
         sES+ZEY7KLg3uU24NJyfI6VEygksoQOswuWcQMC5xFUMLihcDekPGXI9MN1T30wP1FbJ
         mDRuhnxif+ZSVfXF67RgfNJnpFou3Vy2qNQNa4NGt5Hb+iA7sJFxs2gbE4m3MIphzT3W
         Ul0e5Rdzoacx5eSgIzidb/z7WxKHv9yri14fD+yIxk+ztRXMK0nt2nRw65ZQklBNUFUw
         mc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795080000; x=1795684800;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ti7zYfewVTPLw6o7ketmyvxMhRKCPMrEBC1dAP5uxT4=;
        b=JDn8pH26lEs25LJ0qbjJVMyM5ak+mMgZRGiYQzyvIgao0qpIB6Zag9nDUR/LCHCYDY
         JSZzPXpgvfUUFbc59WTdhfwZ/OFwHhVftZI8ZZoqjvhHZCJ/UmER4t0wgyt0f7V5N+SJ
         VRhuQkWnyXi9zZZZ9P8ZeLsXgO6J+4Y5k2F5jTZ7kweqI90Y/+hjthJvEwiFwGF50fON
         y72dw1eoWNAu36nEpkpyK9kRTKLxAsU0kVGaMz9ESykORDuW96mIhLjKIAJkYdeW+lFk
         ZsTn6RHBqII/NEHNw1YSr9om80cXUNoWaUJZtAhe9y9yDR9qeJbcxSAuk93Ri5DUUBim
         bDEQ==
X-Forwarded-Encrypted: i=1; AL+hErFJS348/YaMZ+7+Zar91zc4GKozpy7Ke4zxkbj7IL8Jl4nuyhIItuICkW1nfhkk1Q5m0wlTHOs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OMvJQWwfo2LAR9+4JwAAIyCSz4cqd/PCYG423bjVWDRNeF/X6
	8H4e8flZiSFgPJfgfpgWj5eAeGr2dmZW7ucq3eAXWzeHcBXVB72xQvW2Lnp5sAABgiKrUjOFC8j
	HMBlDVf8siQRtBmovBVydaTqbvOiB1Swio++7ME5HMw==
X-Gm-Gg: AYBFou0IsbJsLV8EEQehFIfpQiX6TQZqMzV9IT/BLCntrMyWw+uTG2ItCc18kVZW84C
	hZHX4QG64yr/TrbrFsDwiCSnt4J/OManLC2JIiyur2EmtdlN86bxX8o0+SE+dRjE571SAK3xyjQ
	yksXCV0DpDnSzYGIJq7Q+VV8RhgsQet6ziA5PHfyQKO/snGHCkc3kLOR/XDqH1a0BvfwEa8Sd3H
	fgn7S6Ss5qWzh/ERO0HlqMmj1ne0XdzhvqN+Dii60ibm8aJq2u/OmSa1CAKlQByJESpVqVd95rY
	HGI7QM/5IuyeNG3TKlamsA6bXcuxZiwplSwndvu+758X5fku1Ug64vB1gazhuKPhybFjlv7fiWU
	zRyK32DfGKyFscJ2PLN4Pq7yEW1BRUeRqw0EZx5kax1iLjZ96f8o6s9N8QI0OUbsOJEEyYw==
X-Received: by 2002:a17:907:9692:b0:c40:9b35:ad91 with SMTP id
 a640c23a62f3a-c51318163ecmr59215466b.13.1795079999707; Thu, 19 Nov 2026
 01:19:59 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118184729.2302130-1-m-malladi@ti.com> <20261118184729.2302130-3-m-malladi@ti.com>
In-Reply-To: <20261118184729.2302130-3-m-malladi@ti.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Thu, 19 Nov 2026 10:19:48 +0100
X-Gm-Features: AclHuK8e8ffnAD8pzuAiTxnaJvnDKX5k-oyRRYloR7_BmjnaSSX9Hh_xNi7mzEk
Message-ID: <CAAofZF4XYd5z8X56DRARMxbu3t7QX48T7V69MPBw9TW1BQAmKg@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] net: ti: icssg-prueth: Add ethtool RX flow
 classification support
To: Meghana Malladi <m-malladi@ti.com>
Cc: kees+treewide@kernel.org, laixiangwu@cmss.chinamobile.com, 
	philippe.schenker@impulsing.ch, haokexin@gmail.com, devnexen@gmail.com, 
	horms@kernel.org, jacob.e.keller@intel.com, sdf@fomichev.me, 
	john.fastabend@gmail.com, hawk@kernel.org, daniel@iogearbox.net, 
	ast@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@kernel.org, 
	davem@davemloft.net, andrew+netdev@lunn.ch, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, srk@ti.com, 
	Vignesh Raghavendra <vigneshr@ti.com>, danishanwar@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Nov 18, 2026 at 7:50=E2=80=AFPM Meghana Malladi <m-malladi@ti.com> =
wrote:
> [...]
> +       mutex_lock(&emac->rxnfc.rxnfc_lock);
> +
> +       /* Check max rules */
> +       if (emac->rxnfc.rxnfc_rule_count >=3D ICSSG_RXNFC_MAX_RULES) {
> +               ret =3D -ENOSPC;
> +               goto unlock;
> +       }
>  [...]
> +
> +unlock:
> +       mutex_unlock(&emac->rxnfc.rxnfc_lock);
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(icssg_rxnfc_rule_add);

nit: instead of mutex_lock() you can use guard() [1]:

    guard(mutex)(&emac->rxnfc.rxnfc_lock)

and remove all the "goto unlock", returning directly. This handles the
automatic cleanup.

Same for other places where you're using mutex_lock() / mutex_unlock().

- [1] https://docs.kernel.org/core-api/cleanup.html

--=20

Marco Crivellari

SUSE Labs
