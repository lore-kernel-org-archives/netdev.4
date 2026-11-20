Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795184235;
	b=HxnVRsyXknC2gfBbQ6ix6odByIVAJgQNKa8ef3owSOkScof9RpeUSXR35NyQVsoB8v1R
	 jWbItwAeQNVVr8XoDVWrPThr4cR5BKhoD0u01ajdydU9nF8/rMNR/4JSaR7FAfT3iBmU2
	 00kHLykiXPlM39qlIezpxF2Rpyt+tl5VkQFSM/9QZJSobljuqGy++SE/E/ilv7o0yCtZ9
	 0WPnjGvKk9f6MR5uZuEQIBSmY2EBPIURcxaTaeZlX6FBrX0FgQHjCf+JvlNYfzncho+rh
	 n6ppWWmvIvyFaxWKJswRJR2lNZyZYvXAcbldlAt1+6A+0uhctcj7HwOANNCsB0BXL+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795184235;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=C5FCGt0bpvxUrLvI8/YA++RcbT6vnD8knFaWuY2tymg=;
	b=NqaeuhRhilBd9YMmdPw9KUHK/OznpetGh+DbYl2UtCAFBpNmNsL8vBOFN4sR+bNspLdQ
	 b0FXEL9IWplmxMyr+yeOfUXHRoBHtr84ft2Nuq318zRMwlVBdXK5adurLlXx7v4Ho25ry
	 9aGgIJmHMgsU2icz5tFAxg1hryney1DlSOc9AzXLvf4SWwEZ4xKmmdmR6sNGvtdyeTqIS
	 Dcz86TzlHX0K69FtnDQK7JIdupjrPjLwNsGybCSfPNpPHrUd+l4gWUFDWpg+kPeXyPM7a
	 NoS+34Bc/dtWhjAf3aDsj5gQA0Y1NiN3mos6C+5KTz8W1XNSfc+fOv7JQaizokHQ2SQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="YEK//hQ9";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099A8606A335
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 14:17:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 099A8606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YEK//hQ9
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-67da69e7c31so1010183d50.3
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 06:17:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795184233; cv=none;
        d=google.com; s=arc-20260327;
        b=jahi+KEZoytcQpNHSw/If23hroUyD3OOq8kzQuwKHvmUYDDkD1PiQWmvuUjgHrNsV5
         ID1K8KC26sEKJcc/rOx5LhjZVyPRriBwq+NPyNn/CXIo2Vs3VNsrObeluellm7nHmijS
         nR+BeBX5Oie9KHJDSYv6cZ0PItcgfl0/CLlyyicuxJDX3ZkvmyoQIO7wMHrjnnODY6aA
         R8CVHyiJtIJW4rxoEHsb2sfLSw5be99pKR/jVRGnkBPoKYhsaFmXaruLgTCL/lV7jwwi
         ieDzmSPE5bLATruMVfuRL3g5i3iRadtOd33ICnuxdbiBNM/3OM8ao/4yxWY47RMQvYu5
         FE0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=C5FCGt0bpvxUrLvI8/YA++RcbT6vnD8knFaWuY2tymg=;
        fh=kWgJLmGykh2BU5CfiQylrcTYFggsA5KkK8gcYlqAvHU=;
        b=YzeWbnEP6Zroq6Mvwa5SKbDQTIhcksN/l88jHVD6XLcTxL4qQzWbg/ybxMqvg3Jbrr
         VpVEk7DsyGYOsiG7NRdAQuEyWcwNJ5EtD54jMrgTivlfAVy7rQ656bEmeQG8BtV0e9Pv
         zHWxSjQcshUDWs1z5vMvdf193fHdnCStHpvkk+jn2g2KLLVPJU3oOmfxF0Hdokky9c+9
         ey9+bmcRr3VENONWUiHyTBcQFx6kDl5LC/Oz9HhrUow1JovXlAWKLh4lviE2EyeHz5hO
         b9uogFzLAUJ7z+zH8AJgbIGtFQChbeuGGpMq9B35wCUjsOQaLcbKGRW5TaGMgFFu6o52
         GWiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795184233; x=1795789033; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C5FCGt0bpvxUrLvI8/YA++RcbT6vnD8knFaWuY2tymg=;
        b=YEK//hQ92qCeZ5YrYBjb2Y0lt2w5g9sVAhL/Jj61VnRz3AJpV8PuQmEaJvbI77vLFw
         gpGszgrU+cXLj7Fn1XecdPJmCtbOpwDmEOAXKhnJrhfFagCVK+3FDXSAaWszoyjeQaR/
         IVCo4uQ0AOUchmGalWi45n/V810OBvQig/qq5GOVtgda5FM6dBYNUmOgihTtokLigO6e
         U678SjuuV8s449bwiw9o5SnXt5HlI1/34vBSdpoJxzQOWIRpeH5DHO6eSYwM4YUQir2t
         ju5DC3Nt0Kg3WXRMXg/V19NC0r6RB3Yh220Pc0Ml6+XfyUmUFCSHRqUnD0rK/xXppGCJ
         s1Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795184233; x=1795789033;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C5FCGt0bpvxUrLvI8/YA++RcbT6vnD8knFaWuY2tymg=;
        b=SzP8xoEOt1ob2G2l62gB5SO95AD/TsxCQbet9QONLG6S2M4t7qc9SSC42FgQ0TMe4U
         0Es7QZ1yOFvNdBAURKDsek4nbfo0YinwBo+xwI6y8itzPOUYFzFbn+OdEH3Zsthrpan3
         e94bD2ATWNlPgDlStSTjeIOgtjbMa5aSemREQMAxbtYY8ygXCYsrIOO/O0BvS6HDuFOO
         HJIDAncUA/E23Dr6LPfrmQ6A6L4A6e+MoNhYsZ/muGhE7m/itLnaysHZBUWBUi1wvbfK
         2iN55cqOW2c2L5AHlVnMGBBOQwd5LFwBqaOBPj4D2u2TyrjgIrF2khNLmw4qdSVL+r2k
         gatQ==
X-Forwarded-Encrypted: i=1; AL+hErEgOULLNyiPgRybEDQm4wLGPhvOq2j35+t5qLozFHUStcKFFOBvSnuEH6yZ6I6eB2BxXLhGokY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Tdgn3vS7OSO34+Uf95dXAvJsq7+LVaVrja/Muz2wFLtKDF4IR
	9373S2T2PxtBhNz0OtEWFB9fBfVsNJ+DfoVRSCq6r8CDe1WHxBB2V2O+MvbWKQJ+gHKWYNHk3NS
	RIGlOXUFBtbLaeQwQg4bQZ6Bw7jNPwOY=
X-Gm-Gg: AZFdTZfG1fRlZhJ+oG09NAcPHP61HhjV99IVQvXaEE8P9AT2yHe9mvKHqGtcQyG+MtL
	X4LssUOxw4zRh9W2cb2LcPSWdLOpc35pK78DZxb9PqzxeMmHb5EVoZZtOkx1MFufB2dVP96lcF4
	EXng33w8NEQTDj7h9PfBpSKxc6mZvyawsjBWFddPPh/7vLLp3eHZHHMQr051+xQ5p7Kfqj6FRse
	DxQeWKeFy5tzhvf4cy0bGH3mUgxS4Y1nL6gTN2mrCsVAx5qBLjdySEeige7XLDiB1KFiXEkuZrA
	ENdMhakYRqwWTcsFUINoeUg7XcRaJO0LJhzYgNinhWUuHWKORs5VWzfzknp1xT36SUp0qb4or4C
	TrgoNgVnu2U93X7iFIHqGzNyhL0Wjv+hiaG7IibnSaWb50UrW4rJrfN+1VmWSiqaX1QkQUQ09+e
	LO2Fbkwwmist2QhfIZbDM=
X-Received: by 2002:a05:690e:4810:b0:67b:e603:55d with SMTP id
 956f58d0204a3-67df45070bbmr813282d50.105.1795184232919; Fri, 20 Nov 2026
 06:17:12 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <bc42ae96-dc7e-4b6e-b9cc-64cde5dc51ce@yahoo.com> <2cc3faa1-c9a6-43d2-a3c2-7dccb12f0273@yahoo.com>
In-Reply-To: <2cc3faa1-c9a6-43d2-a3c2-7dccb12f0273@yahoo.com>
From: Gustavo Foletto Mora <gusfmora@gmail.com>
Date: Fri, 20 Nov 2026 11:17:02 -0300
X-Gm-Features: AclHuK_REKXiiGr1SmhEs4lE_lDxFUI6ludk8ibvCaBmHbvU5wmVfxm8YkH9nNQ
Message-ID: <CAK+kzgycrbHcEpXZhLTPXdWtCUh+WwoBA0mC7CaS2HO7nM81vQ@mail.gmail.com>
Subject: Re: [PATCH net-next v12 07/13] net: dsa: realtek: rtl8365mb: set and
 get vlan 4k for family D
To: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org, 
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	alvin.sipraga@analog.com, kuncy7@gmail.com, fabianotassotti@gmail.com, 
	gabonpivovich@gmail.com, contact@c127.dev
Content-Type: text/plain; charset="UTF-8"

On a TP-Link EX511 v2 (RTL8367S-VB, CPU port 6 over 1G SGMII to an
IPQ5018), on 6.18.44 with the rtl8365mb DCB QoS series from net-next and
v12 applied as is (the same code as v12-pre5 in OpenWrt PR #19644):

- Live vlan_filtering toggle on a bridge with a VLAN in use: IVL/SVL
  changes at once in both directions. After 1 -> 0 the hosts are learned
  without a VID, and static and group entries with VID 0 steer, drop and
  restrict as expected; after 0 -> 1 they are learned with the VID again,
  and entries with the VID behave as expected. Each toggle that flips the
  switch-wide state took 20 to 30 ms.
- The rollback added in v12 is an error path I could not provoke here.

The rest of the series passes my regression test on this board as with
v11: VLAN-aware and VLAN-unaware bridges, PVIDs, isolation, FDB and MDB
entries, flooding flags, load, no driver warnings and no port errors. The
QoS baseline programmed at setup did not change any of it; QoS itself was
not tested (CONFIG_DCB is not set in this build).

Tested-by: Gustavo Foletto Mora <gusfmora@gmail.com>

Thanks,
Gustavo
