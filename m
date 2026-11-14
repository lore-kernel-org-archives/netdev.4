Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794687502;
	b=CrSbG5o1TgERUfexJPFEdIpHAmDJPYzOPQNzejfLG01xh9jb0IU/ANMcWrTfHcjP5K1q
	 JE1OTO7JLOxn1nBrsCXcHTESuRi33tuw7u6h5pskqX9afDsfuq+JuMGJuottKrSDNWkx6
	 ImN9H3JzRd++/XQuh2c48Cquuuf2eq20pPT384b/P7yADvqKOKdqKm3w4LzRCOpC/udw8
	 4HuQGhaZ09GHfcWBX+y5vW2WbYXuiobMGJK91yAk+cHZEv678dwv4I3uQwvEX6kyE+qUJ
	 WWs9ZZbXX2w1kJ+OxDwboRJxnC+6OJ3gcI+dPZ02dcViBEuR5jTf0A97QwrUwM/2PBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794687502;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=GaypDnBDTKD95UXTeMPBFIQBqq5jbEVqGZw6bocPJEE=;
	b=s3mkqRsw85g6BGeUtDiPYgWytYY2uKQSc6+AetQhMemreQoCj9VqxfszRtLZPc6d/Tzc
	 k/3m6NYR9BYxZ32zvww51+1SYBJ3w7XzBsulyCuWWDOO1Zo3/3Q3C+L4iSdtVh7SauVTt
	 XtrWul0x9+we/p/PbToUgo48t2FN1bKmQ/NXXnPU+ABXd2hAREgR5olx3HThztzAA+Ht3
	 DgL36NFz2M0LrRHRhShoi28hx4aOi1bzCChCELxlaqEmYfbg4C8IrSVjlNo6q1gMOXyHa
	 9oSaJ/+hYYqoabC1zQ2GftJ/fzrkfLgYnxtEJH5dBtX7jqAqlvGwSrrUc432tIMrOHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cnGtOWCL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32247606A329
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 20:18:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32247606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cnGtOWCL
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c50abd5b4fcso159835666b.1
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 12:18:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794687500; cv=none;
        d=google.com; s=arc-20260327;
        b=KDL/TFt34p9CAYXyR5jr82CxC/VM6HaASsT0CvfIDMkwdGg16ZpAUljQAmXFsQqHdo
         svZUbGG/h+JNTJTguIYcBfZKpAYfXw0DjgMrN3cMKx3+JEO96tkW6SJxyq3P0R328Rtw
         csW4PNxtz0xRUUOmdHjtbh+gKpthvFw0maJhaQXPuCH+N+ACQz6Vr2Yl9oMEyEtsbmFv
         Qxac/JLHPwZ8PsWPyuDLKWk8SOdvQw0zF9WGy8WetQKKEI3HtAMl+ypHG40VRU7jYG2K
         EvcqImRCutrroxqGWHtTl3inZoqIHyz/nBmo0NoJE+8Zb3lKYwctuGFqiQ23eF0CHGbU
         uP4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GaypDnBDTKD95UXTeMPBFIQBqq5jbEVqGZw6bocPJEE=;
        fh=MFZP0hGGkl7/1AC/1OtakGHQehqAhwugHggKPK/KAWI=;
        b=W989SqhnmoeE7qRQAC4UFmDehztwN7IUQ4SpN8Aa+F1FqHs3pHDSxgPHK2e8tDWzeb
         gXsJ7zo1bruLYg39JM9jmfbilkqg+FJikPKjElS2YRM3JQgljB2UIbkphQZ77yV4RoLn
         AzOe++Oegoq64KXZykO9jy6RY+R7wxfYjXDCZy8+jXSak3GNWA+injaKREcQcRdttH3B
         jTvWEEJTKI9M3bX+dHkv/Fr+8xyIvBnvn+vcEbdwth7IFYvFV2KLTX3Izm7OtMXTNVZZ
         19LWrfaEmtDSyntpnMQhkyCBqfJCzyEDK2V0YP55uoHH9SzVXS1P2UHrVvh3LzK+GtVD
         SLtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794687500; x=1795292300; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GaypDnBDTKD95UXTeMPBFIQBqq5jbEVqGZw6bocPJEE=;
        b=cnGtOWCLKkGNGDDLOokyNEL7hqSd9LGaqN3O4n0KqG/iwnvTXNoFg2Y30Hp0/r381K
         /dp8upiC9sSzj5PLtDq+7VKYFvUaAlYsnLw041g7oDNhSoNabCZIEcpY0lKVf/5lL0la
         5uHk5+GVu4ui5ZqAmPsltoVShG8ORUWR9GsUkx9VdL0vwJ2V34X9Xhe6JmJCwaXxBVi4
         d+NQOHNt5YOrcElf8IzqlK96RhPxyetufwTzX2/NEY+0qgBcHjxvxdvcfNv+7XLmg97s
         g0Nu58rHUf3EBJ6mwRGfLSzsjsq6RlVYHaK3JRwQzx8y0qyzqeXvDTusEssVKsJTBnfl
         INXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794687500; x=1795292300;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GaypDnBDTKD95UXTeMPBFIQBqq5jbEVqGZw6bocPJEE=;
        b=VHLqVFFhAwpc3a+ufUzkqMYzBTwQPBLsOSIlXUZewP7ukHcCO9cRwkIB1lK/wLwGGx
         bxyuVEqqVB/aj5rCK1k7ezncgvrGr2pA+zPsPrIHAtIwHSXKGWPcsmdmFRJrE66RrQrT
         CMKDa2NICOkZoJ70nUGSCgDeK8pJndzN/FIcxhPCKVFnjnVdJkhgrgDKNWE13MAInSxv
         am50kpwnQPN2CBDr/xNHSMUFHmBMbHkmwDNMnNCeSZcYPi2zYugZaisHHnM0p3HHzm5Z
         8ixcsgaH/JAVLTprHhApEHNh1wHO60PAvJdbe3jzXH5wQBZ66O5kDYCBypaRzzC8K7LQ
         VQaw==
X-Forwarded-Encrypted: i=1; AL+hErFQ2WiAb1JYiN1xqUEToxMyLSaMynAGtE2ubwHN3DUylzMbgh2KCbeGRnE9/+1pZ/M2TmTkJ3E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GQVqHm9BXTcoghug3PWBYsN+f3pPwJb95jF2pDrATq0Cc/Dkv
	+vewXwSDrF85+jJlKpTV48DVz8BmbTfVAqqpVPsve4PaQDoSqjitrsfemH2pKu1iku9WpMtgW5S
	KzIe/EX/y78eKyrG5m3CwL/DbqhRSR/Q=
X-Gm-Gg: AYBFou3LEGzioPbjWufKYzfMlN7wxDeyHYFxJIeN9seG9rgu1AikPbmDT3XzbQ9uGym
	5p0bd/GOXdd8XxSf4O4eSK032eGore0sq/NUX2vCISCOH4bu/7V9ZYErUf3m+lfD1zVR+x+/2F3
	eiFnb1Q4zpY/BsbYmY5TSyoqgAFwaBLBsadkQToxfISAuNR1bfOyWwtgDFaGwU/q76V9hQWDSyk
	9pcbyBeqHG3qA8n1SWy11eTodbt3Q+/U2EKnIxGshjdABStAYIysV8m5iohgk87EJZCj/8xJkhr
	xX6fvELigdP0hsCEPRDLU8DLopd2bYeD8XTrkGKXNMAaun+x7WVrXl0yI/B/v0Z9IIKuoJ6jk4P
	FfLLt1cmDjHdgsI8YXvFUHFP/59EWxnuP16HYA64uglFibsDdK+C14GHPdA==
X-Received: by 2002:a17:906:ee85:b0:c33:923b:ad66 with SMTP id
 a640c23a62f3a-c50963ce0c7mr470070966b.43.1794687500370; Sat, 14 Nov 2026
 12:18:20 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-rtl8365mb-dcb-ingress-v2-0-f8e6fbdf8c99@pengutronix.de> <20261112-rtl8365mb-dcb-ingress-v2-8-f8e6fbdf8c99@pengutronix.de>
In-Reply-To: <20261112-rtl8365mb-dcb-ingress-v2-8-f8e6fbdf8c99@pengutronix.de>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Sat, 14 Nov 2026 17:18:07 -0300
X-Gm-Features: AclHuK-OTaqwEXcyA-XPyp_4QonK-mUIP3PxcDYzpGXw4dF560qt63lIc3quSMY
Message-ID: <CAJq09z4Mvd5ZPHVFYkqPLuvv+XJyoPQ7Qnv09oEFU3j1JSrrCw@mail.gmail.com>
Subject: Re: [PATCH net-next v2 08/10] net: dsa: realtek: rtl8365mb: program
 the PCP of untagged frames
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"

> Program the PCP that the switch gives to untagged frames whenever the
> port default priority is set.
>
> With PCP trust, the switch classifies an untagged frame by this value.
> The value is 0 after reset, so untagged frames would be Best Effort
> whatever the port default priority is. PCP trust is added by "net: dsa:
> realtek: rtl8365mb: offload DCB apptrust".
>
> The switch also puts this value into the tag it adds on egress. So far,
> an untagged frame that left a VLAN-tagged port carried PCP 0. With a
> default priority set, it now carries that priority as its PCP. The
> standards require this:
>
> IEEE 802.1AC-2016, 13.1: "The priority parameter of the
> M_UNITDATA.indication shall take the value of the Default Priority
> parameter for the SAP on which the MA_DATA.indication was received."
>
> IEEE 802.1Q-2022, 6.9.4: "For untagged frames, the priority parameter
> signaled in the corresponding M_UNITDATA.indication is taken to be the
> received priority."
>
> IEEE 802.1Q-2022, 6.9.3: "The priority and drop_eligible parameters
> are encoded in the PCP field of the VLAN tag using the Priority Code
> Point Encoding Table for the Port". With the default priority
> regeneration (Table 6-4) and the 8P0D encoding (Table 6-2), the PCP
> equals the Default Priority.
>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Reviewed-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
