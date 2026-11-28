Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795825526;
	b=A24JkqQ/3+pbpiUWNRn/CofAjI5fI1miyAoWuRulwXbFTc9A4UHOAFV0ivdLcbl5CQsP
	 XWq79oUgi2ahCvBHdVxxE/yCmbdFTjABQGsGfSY7LUljaLc3dsTv49nkITnKv1czYDTtW
	 Hq9j3fxRxNnsMHNVI++atME9HKRpAQsrNWM/Dp6AiX4tTEZM191e7XR8I4CloW250AOfN
	 5xtAGnp9StBCNAArUvq7Knixzal+omsRRA4ANs5gdrTLPlAtCBziESW9AshYuEKsXL1Ps
	 oHV/m2DVAS4fzG0eatXbAufBlrduq8YlHYay7eoAHylukM+IVYB56U/ZCGV9/DvUT0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795825526;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=YVzZGMHFsCpWw9DLt07Oi79WZdtvsXKTtzFwTb7iIv4=;
	b=TWiMqLQfHLFNiPO+fw5L5aADr41vbUH6C40SQXDB2BEBvq4YuCH7z9+yxJamkafftQAl
	 drW0gJH8NW0q0XIw1iDZU8ZctU/QA+/55FoEp4r1LXSqEr1nbyY6uo5XxTxnDz6zQ4jh6
	 aNe0662XeGBVmxZ1NTjjCzzPVEhfOwDcNVshWkHV6ECs697dsuXk4ZOjEK7I9N1zvmeAM
	 qqtlBGtKZaymtwkmQPL1R66IW50eKESimFIkpA3jkvIBQRGseqYnQC4+BPp4cL223J6s7
	 hoBi7h+2MznZdrGQ8AN8X36fdkOwDTEhWfV385TzdLvIXsNYDZ+L9rfZNLsYukZ630g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="o4/JKeyx";
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C2F606A31C
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 00:25:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4C2F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=o4/JKeyx
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso4335681a12.0
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 16:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1795825525; x=1796430325; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YVzZGMHFsCpWw9DLt07Oi79WZdtvsXKTtzFwTb7iIv4=;
        b=o4/JKeyxZvWAmlls6sOGezQZfo+pc5koM/w/2D6FQ2blKV9F6TzJSevUEHwnB5BZ1W
         Qz63LowAmzPyeSB9z/mTUeMauz7u2gK9dpBItiLKFP6+nFWWMCyJJEyneux8kCfd6rvk
         AmCHsDH/wACGMgYbDcgccR5R4K4d/73q2cAowi3dS+u3fSmANS1QQBfDzahgyaJPeq9k
         v3MvFZOAl1gYtJ87iTmOFdKCO5H5SlIquQ9JhorcoHeRWqG16KgeywbhT9mtvoJSYPv5
         3kbu/TbJkUqUh0mgxtq71K0ACaYsTlpUtk20uuKOdTFR5M410gTj9eS/BZyJQj9Oy142
         VawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795825525; x=1796430325;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YVzZGMHFsCpWw9DLt07Oi79WZdtvsXKTtzFwTb7iIv4=;
        b=wEqn+p9dt6J54nxD+QO8a8yksj1Bgan+5boP/VLtzGRrw0NZNNCgepeIeRM3nxTL4F
         PL4TDW+xsHxzBqALmBbGaWpIIaGE2rzVXQrnjYXrjb5t8tuIT9NQASKFM2BSoHagmwhC
         1x2gGGulEZArHdiIqpJ6pJGoWmkBS3j1tA8qgg3oEo0oZChUx4TtIsILED/Rvqqh2hXP
         9Qk4J03dSYzrZQQD/0XkaK5gMAjpk2HIVOurDIWow6AFooJWUfZBmomHHwHkBYXXff/b
         Ke/qj7qzhoeXjnudDM12AqtdnVuLCC7uIk8Uwu//AHT/jkcS145XiwbkbsFkkmqS4AKL
         hK0Q==
X-Forwarded-Encrypted: i=1; AL+hErGsvRuQaY+mp/ZvM9PQunIseTUC/4p3tEvUL+adc5YSUlVX/Gh15n3tva2DDa11NM/9bDjo1ug=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HV0MK0D1/ytfzqjmKE73EkevlDeFenHlNCmMPJiIQytq5H5bd
	kTWy+3D1ptb/gkOMUeEWH2XNQlx20+T1krHzXxWDWnau6pfr2CzCDS99P1MCwWxxdBOwYYBf+aP
	9GpzZ
X-Gm-Gg: AZFdTZeGIlBvoKp/GybHu3V4z4ZFS1V19qxatLohdZF0VbbHAwHRQmQIT+WIKwGxFN9
	cLjxU2j146p69qMrWY30P450LYTxTmohyZJHXubreOh0qNrjwwUohPB7DGe+hJiUgeudcB/g2aI
	A2pxU+5kT0E9NRp4LSLnOxUZ1VDJDqAGyoz3Ks+dq2wLezbOOJyGrqGNam0Ca7YVQF+T+mocrIf
	dqEBHLHsbr0oA6B20SgI9gcQ33FY6RiV2h+2e+kBtEaeC9F2pJXySvKBfu7cXMbrzaJ/l7ZBTFw
	zsL3hKbJAxqg6a9aPsx0T4P+dIODQpmBEh+WzlMquYwGSBUdIGggv2AKjpIupydibPvttScseC5
	iWqccjb4e5fa+a5L7kbxIfo4+9Haj0cnwIzdmyrE2wz/zPXMPnT2qZ2DWn5UNwCTSq/UbQ7qJf9
	NWVtQs0HTpafQvJjZIFZlc4n4PEn3Wgf9hm1yDa4rwdY/Hk6KP5MvwxK8JDNDc3vmHa2/6f/AB2
	3zTvlLG0bdBbxQSHH1UDd0cplon0pSX7w/yF+i2aArkPz2N+QW68WbzEaWnkbyq6kF4ayyZXIjI
	XgS4cxGo+mF1MJ9JrrLcg83ZixSk+6KJ/byPKUCr0OJNA6/vxsVJLvczWyYVvfi5Z/U+oxY=
X-Received: by 2002:a17:90b:5346:b0:3b0:9976:c1c6 with SMTP id 98e67ed59e1d1-3b41c9bbe00mr24230807a91.66.1795825525070;
        Fri, 27 Nov 2026 16:25:25 -0800 (PST)
Received: from phoenix.local (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4b3c71192sm24507010a91.5.2026.11.27.16.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 16:25:24 -0800 (PST)
Date: Fri, 27 Nov 2026 16:25:23 -0800
From: Stephen Hemminger <stephen@networkplumber.org>
To: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Cc: vjardin@free.fr, David Ahern <dsahern@kernel.org>,
 netdev@vger.kernel.org, Matthieu Baerts <matttbe@kernel.org>
Subject: Re: [PATCH iproute2-next 2/3] ip: add the lisp link type
Message-ID: <20261127162523.0786b99f@phoenix.local>
In-Reply-To: <20261127-iproute2-lisp-v1-2-df8ea175bc06@free.fr>
References: <20261127-iproute2-lisp-v1-0-df8ea175bc06@free.fr>
	<20261127-iproute2-lisp-v1-2-df8ea175bc06@free.fr>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 27 Nov 2026 23:37:40 +0100
Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org> wrote:

> +	if (tb[IFLA_LISP_LOCAL])
> +		print_color_string(PRINT_ANY, COLOR_INET, "local", "local %s ",
> +				   format_host_rta(AF_INET,
> +						   tb[IFLA_LISP_LOCAL]));
> +
> +	if (tb[IFLA_LISP_LOCAL6])
> +		print_color_string(PRINT_ANY, COLOR_INET6, "local6",
> +				   "local %s ",
> +				   format_host_rta(AF_INET6,
> +						   tb[IFLA_LISP_LOCAL6]));
> +}

This type of construct will print the "local" and IP address in color which
is not how original authors of color logic wanted it. 
You need to use print_string(PRINT_FP, NULL, "%s", "local ") followed by print_color_string.
